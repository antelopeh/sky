$(function(){
	var token = $("#csrf_token").val();
	var header = $("#csrf_header").val();
	
	$.ajaxSetup({cache:false});
	$(document).ajaxStart(function() {
		$('.ct_loadingboxs').show();
	}).ajaxComplete(function(e, xhr, options) {
		$('.ct_loadingboxs').hide();
	}).ajaxError(function(e, xhr, options) {
		$('.ct_loadingboxs').hide();
	}).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	});

    $('#tabs').addtabs();
    
    // 重载框架！！
    window.Addtabs.resize();

    // 默认键盘操作操作
    function default_key(event){
    	// 回车键的处理
		if(event.keyCode==13){
			try{search_button();}catch(e){}
		}
		//ctrl+v处理
		
		/*if (86== event.keyCode && event.ctrlKey){
			alert($(event.target).val()); 
        }
			$(event.target).val().trim();*/
		// tabindex的处理	
    } 
    $(document).on("keydown", function(event){
		default_key(event);
	});
    //在文本框屏蔽鼠标右键
    $(document).ready(function(){   
    	  $('.form-control').bind("contextmenu",function(e){   
    	      return false;   
    	  });   
    	 }); 
    //改变剪切板内的值
    $(function($){
        $('.form-control').bind('paste',function(e){
            //选中框截取字符串
            if (window.getSelection) {
                if ($(this).selectionStart != undefined && $(this).selectionEnd != undefined) {
                    return $(this).value.substring($(this).selectionStart, $(this).selectionEnd);
                } else {
                    return "";
                }
            }
            //复制粘贴
            var pastedText = undefined;
            if (window.clipboardData && window.clipboardData.getData) { // IE
                pastedText = window.clipboardData.getData('Text');
                $(this).val($.trim($(this).val())+pastedText.trim());
                return false;
              } else {
                pastedText = e.originalEvent.clipboardData.getData('Text');//e.clipboardData.getData('text/plain');
                $(this).val($.trim($(this).val())+pastedText.trim());
                return false;
              }
        });
        		
    });

    //时间进展，加红色
    var time_index =  $(".step_list .time").size() -1 ;
    $(".step_list  .time").each(function(index){
        if($(".step_list .time").eq(time_index-index).find('p').eq(1).text()!="----"){
            $(".step_list .time").eq(time_index-index).addClass("cur");
            return false;
        }

    });
});


//$(function(){
//    $('td').zclip({
//        path: '/tower/resources/js/ZeroClipboard.swf',
//        copy: function(){//复制内容
//            return $(this).text().trim();
//            },
//        afterCopy:function(){/* 复制成功后的操作 */
//        	return $(this).text().trim();
//        }    
//    });
//});


function open_parent_tab(url,tabId,title){
	var tabbtn = parent.$(window.parent.document).find("#tab_none");
	$(tabbtn).attr("url",url);
	$(tabbtn).attr("data-addtab",tabId);
	$(tabbtn).text(title);
	tabbtn.trigger("click");
	$(tabbtn).hide();
}

function open_parent_tab_or_refrash_iframe(url,tabId,title){
    var iframe = parent.$(window.parent.document).find("#tab_"+tabId).find("iframe");
    if(iframe.length>0){
        iframe.attr('src', url);
        var tabbtn = parent.$(window.parent.document).find("#tab_none");
        tabbtn.trigger("click");
    }else{
        var tabbtn = parent.$(window.parent.document).find("#tab_none");
        $(tabbtn).attr("url",url);
        $(tabbtn).attr("data-addtab",tabId);
        $(tabbtn).text(title);
        tabbtn.trigger("click");
        $(tabbtn).hide();
    }
}

function refrash_iframe(tabId,url){
	var iframe = parent.$(window.parent.document).find("#tab_"+tabId).find("iframe");
	iframe.attr('src', url);
}

function refresh_iframe(obj){
  /*  var id = $('[id^=tab_tab_iframe_][class*=active]', window.parent.document).find('a').attr("aria-controls");
	$('#'+ id, window.parent.document).find("iframe")[0].contentWindow.location.reload(true);
    alert($('#'+ id, window.parent.document).find("iframe").attr("id"));*/
    var id = $('[id^=tab_tab_iframe_][class*=active]', window.parent.document).find('a').attr("aria-controls");
    $('#'+ id, window.parent.document).find("iframe")[0].contentWindow.location.reload(true);
}

$().ready(function(){
	
});

function my_ajax_file_upload(url, data, upload_callback, complete_callback, exception_callback){
    // $("#entry").parents('form').after('<div class="progress" style="width:100%;height:16px;border:0px;margin-bottom:0px;"><div class="bar" style="margin:0px auto;text-align:center;width:100%;background:yellow;border:0px;"><span class="percent">文件上传进度：0%</span></div></div>');
    if(!$("#entry").parents('form').next().hasClass('progress')) $("#entry").parents('form').after('<div class="progress" style="width:100%;height:16px;border:0px;margin-bottom:0px;"><div class="bar" style="margin:0px auto;text-align:center;width:100%;background:yellow;border:0px;"><span class="percent">文件上传进度：0%</span></div></div>');
    var progress = $('.progress'), percent = $('.percent'), bar = $('.bar');
    $("#entry").parents('form').ajaxSubmit({
        url : url,
        data : data,
        type: "post",
        dataType: 'json',
        beforeSend: function() { //开始上传
            progress.show();
            percent.html('0%'); //显示进度为0%
        },
        uploadProgress: function(event, position, total, percentComplete) {
            percent.html('文件上传进度：' + percentComplete + '%'); //显示上传进度百分比
            if(percentComplete == 100){
                percent.html('上传文件成功，开始导入数据！');
                bar.css('background', '#CCFF33');
                if(upload_callback){upload_callback()};
            }
        },
        success: function(data) {
            if(complete_callback){complete_callback(data)};
            clear_file_elem();
            progress.hide();
        },
        error:function(xhr){
            alert(xhr.responseText);
            if(exception_callback){exception_callback(xhr)};
            progress.hide();
        }
    });
}

//清空file控件选择信息
function clear_file_elem(){
    $('form').find('[type=file]').each(function(){
        $(this).after($(this).clone().val(''));
        $(this).parents('.file_boxs').children('input').val('');
        $(this).remove();
    });
}

function layer_confirm(title, msg, lcancel, lsubmit){
    layer.confirm( '<p style="text-align:center">'+msg+'</p>', {
    	title:title,
        btnAlign: 'c',
        skin:'layui-layer-excel-out',
        btn: ['取消','确定']
    }, function(index){
        layer.close(index);
        try{ lcancel(); }catch(e){};
    }, function(index){
        layer.close(index);
        try{ lsubmit(); }catch(e){};
    });
}

function layer_choice(title, msg, btn1, btn2, lcancel, lsubmit){
    layer.confirm( '<p style="text-align:center">'+msg+'</p>', {
        title:title,
        btnAlign: 'c',
        skin:'layui-layer-choice-out',
        btn: [btn1,btn2]
    }, function(index){
        layer.close(index);
        try{ lcancel(); }catch(e){};
    }, function(index){
        layer.close(index);
        try{ lsubmit(); }catch(e){};
    });
}

function layerOpen(url,width,hight,title){
    layer.open({
        type: 2,
        title: title,
        shadeClose: true,
        move:false,
        content: url,
        area: [width, hight],
        maxmin: true,
        scrollbar: false
    });
}


Date.prototype.Format = function(fmt)
{
    var o = {
        "M+" : this.getMonth()+1,                 //月份
        "d+" : this.getDate(),                    //日
        "h+" : this.getHours(),                   //小时
        "m+" : this.getMinutes(),                 //分
        "s+" : this.getSeconds(),                 //秒
        "q+" : Math.floor((this.getMonth()+3)/3), //季度
        "S"  : this.getMilliseconds()             //毫秒
    };
    if(/(y+)/.test(fmt))
        fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));
    for(var k in o)
        if(new RegExp("("+ k +")").test(fmt))
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
    return fmt;
}