/*bootstrap-addtabs*/
function closeRefresh(isClose){
  var parentDocument = $(window.parent.document),
      target = parentDocument.find('#tablist>li.active'),
      target = target.hasClass('tabdrop')?target.find('li.active'):target,
      refresh = null;
      if (target.prev().length) {
        refresh = target.prev();
      }else{
        refresh = target.parent('.tabdrop').prev();
      }
      //整页刷新
      //parentDocument.find('#'+refresh.attr('id').slice(4)).children('iframe')[0].contentWindow.location.reload(true);

      //按钮刷新
      parentDocument.find('#'+refresh.attr('id').slice(4)).children('iframe').contents().find("#search_button").trigger('click');

      //关闭tab

      isClose&&target.children('.tab-close').trigger('click');
}

/* btnId 为需要点击的按钮ID 使用前提是子页面的ID字符串中包含父页面的id */
function refreshParentBtn(btnId){
    var parentDocument = $(window.parent.document);
    target = parentDocument.find('#tablist>li.active');
    target = target.hasClass('tabdrop')?target.find('li.active'):target;
    var nowId = target.attr('id');
    refresh=target.siblings();//获取所有的兄弟节点

    $.each(refresh,function(i,j){
        //i为元素的索引，从0开始,j为当前处理的元素对象
        var parentId = $(j).attr('id')+"_";
        if(nowId.indexOf(parentId) >= 0) obj=$(j);
    });

    //alert(obj.attr('id'));
    parentDocument.find('#'+obj.attr('id').slice(4)).children('iframe').contents().find("#"+btnId).trigger('click');
}

//多个父页面刷新
function refreshParentBtnExt(btnId){
    var parentDocument = $(window.parent.document);
    target = parentDocument.find('#tablist>li.active');
    target = target.hasClass('tabdrop')?target.find('li.active'):target;
    var nowId = target.attr('id');
    refresh=target.siblings();//获取所有的兄弟节点

    $.each(refresh,function(i,j){
        //i为元素的索引，从0开始,j为当前处理的元素对象
        var parentId = $(j).attr('id')+"_";
        if(nowId.indexOf(parentId) >= 0) {
            obj=$(j);
            parentDocument.find('#'+obj.attr('id').slice(4)).children('iframe').contents().find("#"+btnId).trigger('click');
        }
    });
}