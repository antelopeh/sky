$(document).ready(function () {
    init_article_pagination();
})

function init_article_pagination() {
    do_submit_bug();
    page_article_select_callback(0);

}

// 分页信息回调函数
function page_article_select_callback(new_current_page, containers) {
    var path = $('#select_form').attr('action');
    var condition = $('#select_form').serialize();
    var param = "start_row="+new_current_page * featch_pager_rows_data()+"&pagr_row="+featch_pager_rows_data();
    var rownum=featch_pager_rows_data();
    $('#page').val(new_current_page + 1);
    param = param + "&" + condition;
    var requestMethod = "GET";
    if($("#select_form").attr('method') == "POST"){
        requestMethod = "POST";
    }
    if(requestMethod == "POST"){
        param = convertToObject(param);
    }
    goPage(path,param,rownum);
}

function goPage(path,param,rownum){
    if ($('#hiddenList').val() != "" && $('#hiddenList').val() != undefined){
        $.ajax({
            url: $('#context_path').val() +$('#hiddenList').val(),
            data: param,
            type: "POST",
            async: false,
            success:function (data,textStatus) {
                $('#tableContainer').html(data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert('系统错误：' + errorThrown);
            }
        })


        $('#page_count').html($('#count').val());
        $('#rows').val(rownum);
        $('#jpager').pagination({
            max_entries: $('#count').val(),
            items_per_page: $('#rows').val(),
            current_page: $('#page').val() - 1,
            num_display_entries: 5,
            num_edge_entries: 1,
            load_first_page: false,
            next_text: "后一页",
            prev_text: "前一页",
            //record_text:"共{0}页/总计{1}条记录",
            callback: page_article_select_callback
        });
    }
}


// 获取查询每页行数
function featch_pager_rows_data(){

    if($('#rows').length>0){
        return $('#rows').val();
    }else{
        if($("#pageCount").val()){
            return $("#pageCount").val();
        }
        var a =  window.screen.height;
        var b = window.screen.width;
        if (false && (a==864&&b==1536 || a==1080&&b==1920)){
            $("#rows").attr("value",'12');
            return "12";
        }
        return "10";
    }


}


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

        if ($('#sex')){
            var html = "<option value=''>--请选择--</option>";
            html = html + "<option value='0'>男</option>"
                + "<option value='1'>女</option>";
            $('#sex').html(html).selectpicker('refresh');
        }
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

function showClass(dept) {
    var html = "<option value=''>--请选择--</option>";
    if($('#dept').val() === null || $('#dept').val() ===''){
        $('#clas').html(html);
    }else{
        $.ajax({
            url: $("#context_path").val() + '/dept/getClass',
            data: {dept:dept},
            dataType: "json",
            type: "POST",
            async: false,
            success: function (data) {
                    if ($.trim(data) != "False"){
                        for (var i = 0; i < data.length; i++){
                            html = html + "<option value='" + data[i].deptCode + "'>" + data[i].deptName + "</option>";
                        }
                        $("#clas").html(html);
                        $('#clas').selectpicker('refresh');
                    }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert('系统错误：' + errorThrown);
            }
        });
    }
}

function showRoom(bolckCode) {
    var html = "<option value=''>--请选择--</option>";
    $.ajax({
        url:$("#context_path").val() + '/room/getRoom',
        data:{blockCode:bolckCode},
        dataType: "json",
        type: "POST",
        async: false,
        success: function (data) {
            if($.trim(data)!="False"){
                for (var i = 0; i < data.length; i++){
                    html = html + "<option value='" + data[i] + "'>" + "第 " + data[i] + " 层" + "</option>";
                }
                $("#roomCode").html(html);
                $('#roomCode').selectpicker('refresh');
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            layer.alert('系统错误：' + errorThrown);
        }
    })
}

function showRooms(blockCode,floor) {
    var html = "<option value=''>--请选择--</option>";
    $.ajax({
        url:$("#context_path").val() + '/room/getRooms',
        data:{blockCode:blockCode ,floor:floor},
        dataType: "json",
        type: "POST",
        async: false,
        success: function (data) {
            if($.trim(data)!="False"){
                for (var i = 0; i < data.length; i++){
                    html = html + "<option value='" + data[i].roomCode + "'>" + data[i].roomCode  + " 室" + "</option>";
                }
                $("#rooms").html(html);
                $('#rooms').selectpicker('refresh');
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            layer.alert('系统错误：' + errorThrown);
        }
    })
}

function showLesson(lessons) {
    for (var i = 0; i < lessons.length; i++)
        $('.dropdown-menu.inner:eq(3) li').eq(lessons[i] - 1).find('.text').css('text-decoration','line-through');
}

// submit的单元素提交模式
function do_submit_bug(){
    $("form").each(function(){
        $(this).append('<input type="text" value="不要删除这个input，只有在form里不只有一个input的情况下，在input里按回车才不会提交表单" style="display:none" />')
    });
}

/**
 * 将格式为： key=value&key=value 的字符串转化为js对象
 * @param {Object} params
 */
function convertToObject(params){
    var obj = {};
    var keyValues = params.split('&');
    var flag = false;
    for(var i=0; i<keyValues.length; i++){
        var keyVal = keyValues[i].split('=');
        if (obj.hasOwnProperty(keyVal[0])) {
            if( obj[keyVal[0]] instanceof Array ) {
                // if( typeof(obj[keyVal[0]]) === 'array') {
                obj[keyVal[0]].push(decodeURIComponent(keyVal[1]?keyVal[1]:""));
            }else{
                if(obj[keyVal[0]]!=decodeURIComponent(keyVal[1]?keyVal[1]:"")){
                    var value = [];
                    value[0]=(obj[keyVal[0]]);
                    value[1]=( decodeURIComponent(keyVal[1]?keyVal[1]:""));
                    obj[keyVal[0]] =  value;
                    flag = true;
                }
            }
        }else{
            obj[keyVal[0]] = decodeURIComponent(keyVal[1]?keyVal[1]:"");
        }
    }

    if(flag){
        //传统方式序列化参数
        //当提交的参数是数组(e.g. {name:[value,value,value]} ),如果是false的话,则提交时会是"name[]=value&name[]=value"
        //如果设置成true,则提交时会是"name=value&name=value"
        jQuery.ajaxSettings.traditional = true;
    }
    return obj
}

function getUrlVars() {
    var vars = [],
        hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for (var i = 0; i < hashes.length; i++) {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}

function search_button(url) {
    var param = $('#select_form').serialize();
    if ($('.pagination .current:not(.prev)').length > 0)
        param = param + '&start_row='+($('.pagination .current:not(.prev)').html()-1) * featch_pager_rows_data()+'&pagr_row='+featch_pager_rows_data();
    else
        param = param + '&start_row=0'+'&pagr_row='+featch_pager_rows_data();

    $.ajax({
        url: $('#context_path').val() +url,
        data: param,
        type: "POST",
        async: false,
        success:function (data,textStatus) {
            $('#tableContainer').html(data);
            $('#count').val($('#itemCount').val());
            $('#pageLeft .count').html('&nbsp;&nbsp;总计：'+$('#itemCount').val()+'条记录')
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            layer.alert('系统错误：' + errorThrown);
        }
    })


    $('#jpager').pagination({
        max_entries: $('#count').val(),
        items_per_page: $('#rows').val(),
        current_page: $('#page').val() - 1,
        num_display_entries: 5,
        num_edge_entries: 1,
        load_first_page: false,
        next_text: "后一页",
        prev_text: "前一页",
        //record_text:"共{0}页/总计{1}条记录",
        callback: page_article_select_callback
    });
}

function refresh_search(){
    $('.pagination a:eq(1)').click();//在刷新前将页数重置为1
    $('.searchbtn')[0].click();
}

//清空file控件选择信息
function clear_file_elem(){
    $('form').find('[type=file]').each(function(){
        $(this).after($(this).clone().val(''));
        $(this).parents('.file_boxs').children('input').val('');
        $(this).remove();
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