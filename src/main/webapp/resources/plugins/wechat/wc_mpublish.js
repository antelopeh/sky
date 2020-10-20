$.fn.summerfun = function() {
    //富文本编辑器插件
    $(this).each(function() {
        $(this).summernote({
            lang: 'zh-CN',
            minHeight: '300px',
            fontNames: ['微软雅黑', '宋体', '黑体', '仿宋', '新宋', '楷体', 'Arial', 'Arial Black', 'Helvetica', 'Times New Roman'],
        });
    })
}
$(function() {
    //高度控制
    var winh = $(window).height();
    var itop = $('.wc_editBoxs>.tab-content').offset();
    $('.wc_editBoxs>.tab-content').height(winh - itop.top - 50);
    $(window).resize(function() {
        var winh = $(window).height();
        $('.wc_editBoxs>.tab-content').height(winh - itop.top - 50);
    })
    //类型
    $('.ct_rcSelectboxs li>a').on('click', function() {
        var ah = '<i class="iconSelected"></i>';
        if ($(this).siblings('input:radio').prop('checked') == false) {
            $(this).parents('.ct_rcSelectboxs').find('a').removeClass('active').find('.iconSelected').remove();
            $(this).addClass('active').children().prepend(ah);
        } else if ($(this).siblings('input:radio').prop('checked') == true) {
            return false;
        }
        if ($(this).siblings('input:checkbox').prop('checked') == false) {
            $(this).addClass('active').children().prepend(ah).children('.iconSelected').addClass('checkb');
        } else if ($(this).siblings('input:checkbox').prop('checked') == true) {
            $(this).removeClass('active').find('.iconSelected').remove();
        }
    })
//图文消息
    //编辑查看更多
    $('.editText').on('click', '.tran_control', function(e) {
        e.preventDefault();
        if ($(this).hasClass('turn') == false) {
            $(this).addClass('turn');
            $(this).siblings('.moreBoxs').slideDown(100);
        } else {
            $(this).removeClass('turn');
            $(this).siblings('.moreBoxs').slideUp(200);
        }
    })
    $('.summernote').summerfun();
    //微信消息tab
    $('.wm_controlBoxs .wm_add').on('click', function() {
        var l = $(this).siblings('.wm_control').length;
        if (l <= 7) {
            var path = $(this).parents('.preview').siblings('.editText').children('.wc_message').eq(0);
            $('body').append(path.clone());
            //清除数据
            var midway = $('body').children('.wc_message');
            midway.hide().find('input').val('');
            midway.hide().find('textarea').val('');
            //midway.hide().find('.wordNum').val('');
            midway.attr('id', 'wm_control' + (l + 1) + '')
            midway.find('.file_s').attr('name', 'covePic' + (l + 1) + '')
            if (midway.find('.tran_control').hasClass('turn') == true) {
                midway.find('.moreBoxs').removeAttr('style');
                midway.find('.tran_control').removeClass('turn');
            }
            midway.removeClass('active').find('.summernote').siblings('.note-editor').remove();
            midway.find('.summernote').summerfun();
            midway.find('.wordNum').children('i').text('0')
            //$('.wm_control.wm_first').find('.glyphicon-trash').hide();
            //增加TAB
            $(this).before($('<a>', {
                'class': 'wm_control',
                html: $(this).siblings('.wm_first').html(),
                'href': '#wm_control' + (l + 1) + '',
                'aria-controls': 'wm_control' + (l + 1) + '',
                'title': '第' + (l + 1) + '篇图文'
            }))
            $(this).prev('.wm_control').find('img').removeAttr('src')//清除
            $(this).prev('.wm_control').find('.title').children().text('标题')//清空标题
            $(this).prev('.wm_control').addClass('wm_last').siblings('.wm_control').removeClass('wm_last');
            //$(this).prev('.wm_control').find('.glyphicon-trash').show();
            path.parent().append(midway.detach());
            path.parent().animate({
                'scrollTop': 0
            }, 200);
            if (l == 7) {
                $(this).hide();
            }

        }
    })
    //tab
    $('.wm_controlBoxs').on('click', '.wm_control', function(e) {
        e.preventDefault();
        var hid = $(this).attr('href');
        $(this).addClass('active').siblings().removeClass('active');
        $(hid).slideDown(200).addClass('active').siblings().slideUp(300).removeClass('active');
        $(hid).parents('.editText').animate({
            'scrollTop': 0
        }, 200);
    })
    //鼠标上移
    $('.wm_controlBoxs').on({
        mouseenter: function() {
            var thL = $(this).siblings('.wm_control').length;
            if(thL>=1){
                $(this).find('.coverOp').show();
            }
        },
        mouseleave: function() {
            $(this).find('.coverOp').hide();
        }
    }, '.wm_control')
    //删除
    $('.wm_controlBoxs').on('click', '.glyphicon-trash', function(e) {
        e.stopPropagation();
        var thaL = $(this).parents('.wm_controlBoxs').children('.wm_control').length;
        if (thaL > 1) {
            var thfa = $(this).parents('.wm_control');
            var thIndex = thfa.index();
            var thL = thfa.siblings('.wm_control').length;
            var thID = thfa.attr('href')
            if (thfa.next().hasClass('wm_control')) {
                if (thfa.hasClass('active') == true) {
                    thfa.next('.wm_control').addClass('active').click();
                }
                if(thIndex==0){
                    thfa.next('.wm_control').addClass('wm_first');
                    thfa.find('.glyphicon-trash').hide();
                    thfa.next('.wm_control').find('.glyphicon-trash').show();
                }
                for (var i = thIndex; i <= thL; i++) {
                    thfa.siblings('.wm_control').eq(i).attr({
                        'href': '#wm_control' + (i + 1) + '',
                        'aria-controls': 'wm_control' + (i + 1) + '',
                        'title': '第' + (i + 1) + '篇图文'
                    })
                    $(thID).siblings('.wc_message').eq(i).attr('id', 'wm_control' + (i + 1) + '');
                }
            } else {
                if (thfa.hasClass('active') == true) {
                    thfa.prev('.wm_control').addClass('active').click();
                }
            }
            if(thIndex==thL){
                thfa.prev('.wm_control').addClass('wm_last');
            }
            thfa.remove();
            $(thID).remove();
            if (thL == 7) {
                $('.wm_add').show();
            }
        } else {
            e.preventDefault();
        }
    })
    //下移
    $('.wm_controlBoxs').on('click', '.glyphicon-arrow-down', function(e) {
        e.stopPropagation();
        e.preventDefault();
        var thL = $(this).parents('.wm_controlBoxs').children('.wm_control').length;
        if (thL > 1) {
            var thfa = $(this).parents('.wm_control');
            var thIndex = thfa.index();
            var thID = thfa.attr('href')
            thfa.attr({
                'href': '#wm_control' + (thIndex + 2) + '',
                'aria-controls': 'wm_control' + (thIndex + 2) + '',
                'title': '第' + (thIndex + 2) + '篇图文'
            });
            thfa.next('.wm_control').attr({
                'href': '#wm_control' + (thIndex + 1) + '',
                'aria-controls': 'wm_control' + (thIndex + 1) + '',
                'title': '第' + (thIndex + 1) + '篇图文'
            })
            //第一个
            if (thIndex == 0) {
                thfa.next('.wm_control').addClass('wm_first');
                //thfa.next('.wm_control').find('.glyphicon-trash').hide();
                thfa.removeClass('wm_first');
                //thfa.find('.glyphicon-trash').show();
            }
            if (thIndex == thL-2) {
                thfa.addClass('wm_last').siblings().removeClass('wm_last');
            }
            //改id
            $(thID).attr('id', 'wm_control99999');
            $('#wm_control99999').next('.wc_message').attr('id', 'wm_control' + (thIndex + 1) + '');
            $('#wm_control99999').attr('id', 'wm_control' + (thIndex + 2) + '');
            thfa.insertAfter(thfa.next('.wm_control'));
            $(thID).insertBefore($(thID).prev('.wc_message')); //id决定调换id位置会有变化
        }
    })
    //上移
    $('.wm_controlBoxs').on('click', '.glyphicon-arrow-up', function(e) {
        e.stopPropagation();
        e.preventDefault();
        var thL = $(this).parents('.wm_controlBoxs').children('.wm_control').length;
        var thfa = $(this).parents('.wm_control');
        var thIndex = thfa.index();
        var thID = thfa.attr('href')
        thfa.attr({
            'href': '#wm_control' + (thIndex) + '',
            'aria-controls': 'wm_control' + (thIndex) + '',
            'title': '第' + (thIndex) + '篇图文'
        });
        thfa.prev('.wm_control').attr({
            'href': '#wm_control' + (thIndex + 1) + '',
            'aria-controls': 'wm_control' + (thIndex + 1) + '',
            'title': '第' + (thIndex + 1) + '篇图文'
        })
        //第一个
        if (thIndex == 1) {
            thfa.addClass('wm_first');
            //thfa.find('.glyphicon-trash').hide();
            thfa.prev('.wm_control').removeClass('wm_first');
            //thfa.prev('.wm_control').find('.glyphicon-trash').show();
        }
        if (thIndex == thL-1) {
            thfa.removeClass('wm_last').prev('.wm_control').addClass('wm_last');
        }
        //改id
        $(thID).attr('id', 'wm_control99999');
        $('#wm_control99999').prev('.wc_message').attr('id', 'wm_control' + (thIndex + 1) + '');
        $('#wm_control99999').attr('id', 'wm_control' + (thIndex) + '');
        thfa.insertBefore(thfa.prev('.wm_control'));
        $(thID).insertAfter($(thID).next('.wc_message'));
    })

//图片上传
    $('.imgS').change(function() {
        var is=$(this).get(0);
        var path=$(this).parent();
        url = $.getImgURL(is);
        if(url==false){
            alert('选择文件错误,图片类型必须是(gif,jpeg,jpg,bmp,png)中的一种')
        }else{
            if(!path.next().hasClass('imgShow')){
                path.after('<img class="imgShow"/>');
                path.next('.imgShow').after($('<a>',{'class':'links','href':'javascript:void(0)','id':'imgDelete','onclick':'imgDelete(this)'}))
            }
            path.next('.imgShow').attr('src', url);
        }
        if(url==false||url==null){
            path.show();
        }else{
            path.hide();
        }
    })
})
//上传图片删除
var imgDelete=function(obj){
    $(obj).siblings('img').remove();
    $(obj).siblings('label').show().children('input:file').val('');
    $(obj).remove();
}
//微信图片
var changeImg=function(iobj) {
    var iid='#'+$(iobj).parents('.wc_message').attr('id');
    url = $.getImgURL(iobj);
    if(url==false){
        alert('选择文件错误,图片类型必须是(gif,jpeg,jpg,bmp,png)中的一种');
    }else{
        $("[href='"+iid+"']").find('img').attr('src',url);
    }
}