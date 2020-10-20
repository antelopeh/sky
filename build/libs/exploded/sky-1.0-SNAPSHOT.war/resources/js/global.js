/*bootstrap-select*/
$(function() {
  $('select.selecter').selectpicker({style:'selectBtn'});
})

/*bootstrap-datetimepicker*/
$(function() {
      $('.form-datetime').datetimepicker({
    language: 'zh-CN',
    format: 'yyyy-mm-dd',
    autoclose: true,
    startView:2,
    minView: 3,
    todayHighlight: 1,
    endDate:"2037-01-01",
    defaultViewDate:0,
    pickerPosition: "bottom-left",
    container:"body"
  });
  if ($('.input-daterange').length) {
    $('.input-daterange input').each(function() {
      $(this).datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd',
        autoclose: true,
        minView: 2,
        todayHighlight: 1,
        pickerPosition: "bottom-right",
        container:"body"
      });
    });
    $('.input-daterange input[name="start"]').datetimepicker().on('changeDate', function(ev){
      $(this).parent().children('input[name="end"]').datetimepicker('setStartDate', ev.date);
    });
    $('.input-daterange input[name="end"]').datetimepicker().on('changeDate', function(ev){
      $(this).parent().children('input[name="start"]').datetimepicker('setEndDate', ev.date);
    });
  }
  $('.form-datetime input:disabled').parent().addClass('form_dtdisabled');
  $('.form-datetime').find('.input-group-addon').click(function() {
    var a = $(this).siblings('input').attr('disabled');
    if (a == 'disabled') {
      $(this).parent().datetimepicker('remove');
    }
  })
//  点击激活当前时间
  var date=new Date();
  var year=date.getFullYear();
  var month=date.getMonth()+1;
  if (month.toString().length == 1) {
    month = '0' + month;
  }
  var day=date.getDate();
  var mydate=year+'-'+month+'-'+day;
  $('.form-datetime .form-control,.form-datetime .input-group-addon:last-child').one('click',
    function(){
      if($(this).parent().children('input').val()==0)
      {
        $(this).parent().children('input').val(mydate);
      }
      
    } 
  )
})

/*select drop,search show*/
$(function(){
  //select drop
  $('.sGroupdrop .dropdown-header').on('click',function(){
    var a=$(this).attr('data-optgroup');
    var path=$(this).siblings('li[data-optgroup='+a+']');
    if(path.css('display')=='none'){
      $(this).addClass('dropShow');
      path.show();
    }else{
      $(this).removeClass('dropShow')
      path.hide();
    }
  })
  //search show
  $('.sGroupdrop .bs-searchbox>.form-control').on('keydown',function(){
    var path=$(this).parent().siblings('.dropdown-menu').find('.dropdown-header');
    if(path.hasClass('dropShow')){
      return;
    }else{
      path.click();
    }
  })
})