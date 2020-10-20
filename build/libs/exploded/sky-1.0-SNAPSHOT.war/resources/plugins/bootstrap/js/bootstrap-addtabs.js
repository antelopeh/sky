/**
 * Website: http://git.oschina.net/hbbcs/bootStrap-addTabs
 *
 * Version : 0.6
 *
 * Created by joe on 2016-2-4.
 */
$.fn.addtabs = function (options) {
    obj = $(this);
    Addtabs.options = $.extend({
        content: '', //直接指定所有页面TABS内容
        close: true, //是否可以关闭
        monitor: 'body', //监视的区域
        iframeUse: true, //使用iframe还是ajax
        iframeHeight: $(document).height() - 47, //固定TAB中IFRAME高度,根据需要自己修改
        method: 'init',
        callback: function () { //关闭后回调函数
        }
    }, options || {});


    $(Addtabs.options.monitor).on('click', '[data-addtab]', function () {
        Addtabs.add({
            id: $(this).attr('data-addtab'),
            title: $(this).attr('title') ? $(this).attr('title') : $(this).text().replace('--','').replace('-',''),
            content: Addtabs.options.content ? Addtabs.options.content : $(this).attr('content'),
            url: $(this).attr('url'),
            ajax: $(this).attr('ajax') ? true : false
        });
    });

    obj.on('click', '.tab-close', function (e) {
        var id = $(this).siblings("a").attr("aria-controls");
        Addtabs.close(id);
    });

};

window.Addtabs = {
    options:{},
    resize:function(){
   	 	$(window).resize(function () {
            Addtabs.drop();
            setTimeout(function () {
	   	 		var id = $('[id^=tab_tab_iframe_][class*=active]').find('a').attr("aria-controls");
	   	    	if($('#'+ id).find("iframe").contents().find("body")[0]){
	   	    		//console.log($('#'+ id).find("iframe").contents().find("body").outerHeight(true));
                    var f = $('#' + id).find("iframe"),
                        l = f.contents().find('.input-form-left').eq(0),
                        lh = l.height(),
                        fh = f.contents().find("body").outerHeight(true)+2,
                        wh = $(window).height() - 45;
                    if(l.length == 0){
                        if(fh>wh){
                            f.height(f.contents().find("body").outerHeight(true)+1);
                        }else{
                            f.height($(window).height() - 47);
                        }
                    }else{
                        var rh = f.contents().find('.input-form-right').eq(0).height();
                        //alert(lh+'/'+rh+'/'+fh+'/'+wh)
                        if(rh<wh&&lh<wh){
                            f.height($(window).height() - 47);
                        }else if(rh>wh&&rh>lh){
                            f.height(fh+rh-lh);
                        }else if(lh>wh&&lh>rh){
                            f.height(fh);
                        }else{
                            return false;
                        }
                    }

	   	    		//console.log($($('#'+ id).find("iframe").prop('contentWindow').document).height());
	   	    		//$('#' + id).find("iframe").height($($('#'+ id).find("iframe").prop('contentWindow').document).height());
	   	    		// $('#'+ id).find("iframe").iFrameResize({
		   	    		//resizedCallback : function(messageData){ console.log('外层：' + messageData.iframe.id +' Height: '   + messageData.height + ' Width: '      + messageData.width +' Event type:' + messageData.type);}
		   	    	//});
	   	    	}
	   	    }, 100);
   	    
   	    });
    },
    sload: function(){
	  var id = $('[id^=tab_tab_iframe_][class*=active]').find('a').attr("aria-controls");
	  if($('#'+ id).find("iframe").contents().find("body")[0]){
		  //console.log('加载完成' + $('#'+ id).find("iframe").contents().find("body").outerHeight(true));
	      //$('#' + id).find("iframe").height($('#'+ id).find("iframe").contents().find("body").outerHeight(true) + 10);
	  }
    },
    frefresh: function(id){
    	$('#'+ id).find("iframe")[0].contentWindow.location.reload(true);
        Addtabs.resize();
    },
    refresh: function(opts, id){
    	  //创建新TAB的内容
        var content = $('<div>', {
            'class': 'tab-pane',
            'id': id,
            'role': 'tabpanel'
        });
        //是否指定TAB内容
        if (opts.content) {
            content.append(opts.content);
        } else if (Addtabs.options.iframeUse && !opts.ajax) {//没有内容，使用IFRAME打开链接
            content.append(
                $('<iframe>', {
                    'class': 'iframeClass',
                    'height': Addtabs.options.iframeHeight,
                    'frameborder': "no",
                    'width': "100%",
                    'border': "0",
                    'src': opts.url,
                    'onload': 'Addtabs.sload()'
                })
            );
        } else {
            $.get(opts.url, function (data) {
                content.append(data);
            });
        }
        obj.find("#tab-content").append(content);
    },
    add: function (opts) {
        var id = 'tab_' + opts.id;
        obj.find('#tablist .active').removeClass('active');
        obj.find('#tab-content .active').removeClass('active');
        //如果TAB不存在，创建一个新的TAB
        if (!$("#" + id)[0]) {
            //创建新TAB的title
            var title = $('<li>', {
                'role': 'presentation',
                'id': 'tab_' + id
            }).append(
                $('<a>', {
                    'href': '#' + id,
                    'aria-controls': id,
                    'role': 'tab',
                    'data-toggle': 'tab',
                    'ondblclick': 'Addtabs.frefresh(' + '\"'+ id + '\")'
                }).html(opts.title)
            ).append('<span class="tab-close">×</span>');
            
            Addtabs.refresh(opts, id);
            //加入TABS
            if (obj.find('#tablist .dropdown').length) {
                obj.find('#tablist .dropdown').append(title);
            }else{
                obj.find('#tablist').append(title);
            }            
        }else{
           // Addtabs.close(opts.id);
           // Addtabs.refresh(opts, id);
        }

        //激活TAB
        $("#tab_" + id).addClass('active');
        $("#" + id).addClass("active");
        Addtabs.drop();
    },
    close: function (id) {
        //如果关闭的是当前激活的TAB，激活他的前一个TAB
        if (obj.find("#tablist li.active").not('.tabdrop').attr('id') == "tab_" + id) {
            var target = null,
                tPrev = $("#tab_" + id).prev(),
                tNext = $("#tab_" + id).next(),
                dPrev = $("#tablist .tabdrop").prev();
            if (tPrev.length) {
              target = tPrev.attr('id').slice(4);
              tPrev.addClass('active');
            }else if(dPrev.length){
              target = dPrev.attr('id').slice(4);
              dPrev.addClass('active');
            }else{
              target = tNext.attr('id').slice(4);
              tNext.addClass('active');
            }
            $("#" + target).addClass('active');
        }
        //关闭TAB
        $("#tab_" + id).remove();
        $("#" + id).remove();
        Addtabs.drop();
        Addtabs.options.callback();
    },
    drop: function () {
        element = obj.find('#tablist');
        //检测是否已增加
        if (!$('.tabdrop').html()) {
          //创建下拉标签
          var dropdown = $('<li>', {
            'class': 'dropdown pull-right hide tabdrop'
            }).append(
                $('<a>', {
                    'class': 'dropdown-toggle',
                    'data-toggle': 'dropdown',
                    'href': '#'
                }).append(
                    $('<i>', {'class': "glyphicon glyphicon-align-justify"})
                ).append(
                    $('<b>', {'class': 'caret'})
                )
            ).append(
                $('<ul>', {'class': "dropdown-menu"})
            )
           element.append(dropdown);
        } else {
            dropdown = element.find('.tabdrop');
        }
        //检测是否有下拉样式
        if (element.parent().is('.tabs-below')) {
            dropdown.addClass('dropup');
        }
        var collection = 0;

        //检查超过一行的标签页
        element.find(dropdown).before(dropdown.find('li')).end()
            .find('>li')
            .not('.tabdrop')
            .each(function () {
                if (this.offsetTop > 0 || element.width() - $(this).position().left - $(this).width() < 60) {
                    dropdown.find('ul').append($(this));
                    collection++;
                }
            });

        //如果有超出的，显示下拉标签
        if (collection > 0) {
            dropdown.removeClass('hide');
            if (dropdown.find('.active').length == 1) {
                dropdown.addClass('active');
            } else {
                dropdown.removeClass('active');
            }
        } else {
            dropdown.addClass('hide').removeClass('active');
        }
    }
}
