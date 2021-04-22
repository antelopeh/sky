<style>
    td.ellipsis{overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp:2;}
    button.btn.dropdown-toggle.btn-default::after{border-top: 0px}
</style>
<h1 class="tab-pane-title" style="padding-bottom: 20px">
    <span class="fa fa-search title-icon"></span>
    <b class="title-name">教室占用周表：</b>
    <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
</h1>
<div class="query-result">
    <table id="tab" class="table table-bordered table-striped table-hover result-table text-center" role="grid" style="margin-bottom:10px;">
        <colgroup>
            <col width="12.5%">
            <col width="12.5%">
            <col width="12.5%">
            <col width="12.5%">
            <col width="12.5%">
            <col width="12.5%">
        </colgroup>

        <thead  class="header">
        <tr role="row">
            <th></th>
            <th>周日</th>
            <th>周一</th>
            <th>周二</th>
            <th>周三</th>
            <th>周四</th>
            <th>周五</th>
            <th>周六</th>
        </tr>

        <tbody>
        <#list 1..12 as i>
            <tr role="row">
            <td style="vertical-align: middle;">第${i}课时</td>
            <#list 1..7 as j>
                <td style="vertical-align: middle;"></td>
            </#list>
            </tr>
        </#list>
        </tbody>
    </table>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/resources/css/showContent.css" />
    <input type="hidden" id="hiddenList" value="/order/order_line0"/>
    <input type="hidden" id="itemCount" value="${_count_}"/>
</div>

<div id="calendar" style="position:fixed;right: 0;top:100px;left:auto;bottom:200px;width:335px;height: 335px;background:#262728;margin-right: 0px">
            <form id="select_form" action="${rc.contextPath}/order/getList" method="POST" style="border:none;width: 95%;margin-top: 20px">
                <table class="query-table" cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                    <tr class="up">
                        <td class="hint">
                            所在幢系：
                        </td>
                        <td>
                            <select class="form-control selecter" id="blockCode" name="blockCode" onChange="showRoom(this.value)">
                                <option value="">--请选择--</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="hint">
                            所在层数：
                        </td>
                        <td>
                            <select class="form-control selecter" id="roomCode" name="roomCode" onChange="showRooms($('#blockCode').val(),this.value)">
                                <option value="">--请选择--</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="hint">
                            所在房间：
                        </td>
                        <td>
                            <select class="form-control selecter" id="rooms" name="rooms" onChange="">
                                <option value="">--请选择--</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="hint">

                        </td>
                        <td>
                            <button class="btn btn-green" type="button" onclick="return applyLesson()">申请</button>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <input type="hidden" name="result" value="">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="uuid" value=""/>
            </form>
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

<script>
    <#--function openDetails(code) {-->
    <#--    var url='${rc.contextPath}/msg/studentDetails?code='+code;-->
    <#--    window.location.href = url;-->
    <#--}-->

    $(document).ready(function () {
        //更改第一个下选框的选项
        var html = "<option value=''>--请选择--</option>";
        <#list block as item>
            html = html + '<option value="${item.blockCode}">${item.blockName}</option>';
        </#list>
        $("#blockCode").html(html);
        $("#blockCode").selectpicker('refresh');

        if ('${_example_.roomCode}'.length>0) {
        //更改大楼默认选中项
            $('.btn-group:first li').each(function () {
                if ($(this).find('.text').html().substring(0, 1) == '${_example_.roomCode?substring(0,1)}') {
                    $(this).addClass('selected');
                    $('select').val('${_example_.roomCode?substring(0,1)}');
                    $($('.filter-option')[0]).html($(this).find('.text').html());
                    showRoom('${_example_.roomCode?substring(0,1)}');
                }
            });

            //更改层数默认选中项
            $('.btn-group:eq(1) li').each(function () {
                if ($(this).find('.text').html().substring(2, 3) == '${_example_.roomCode?substring(2,3)}') {
                    $(this).addClass('selected');
                    $('select').val('${_example_.roomCode?substring(2,3)}');
                    $($('.filter-option')[1]).html($(this).find('.text').html());
                    showRooms('${_example_.roomCode?substring(0,1)}', '${_example_.roomCode?substring(2,3)}');
                }
            });

            //更改教室默认选中项
            $('.btn-group:eq(2) li').each(function () {
                if ($(this).find('.text').html().substring(0, 3) == '${_example_.roomCode?substring(2)}') {
                    $(this).addClass('selected');
                    $('select').val('${_example_.roomCode?substring(2)}室');
                    $($('.filter-option')[2]).html($(this).find('.text').html().substring(0, 3) + '室');
                }
            })
        }
    })


    <#list _result_ as item>
        $('tbody').find('tr').eq(${item.timeStart-1}).find('td').eq(${item.weekTime}).html('${item.remark?split(':')[1]}');
        if (${item.timeStart} != ${item.timeEnd})
        {
            if (${item.timeEnd} - ${item.timeStart} > 1){//遍历超过两个的单元格
                var num = ${item.timeEnd} - ${item.timeStart} + 1;
                for (var i = 0; i < ${item.timeEnd} - ${item.timeStart}; i++){//删除多余的单元格
                    var ritem = ${item.timeStart} + i + 1;
                    $('tbody').find('tr').eq(ritem-1).find('td').eq(${item.weekTime}).remove();
                }
                $('tbody').find('tr').eq(${item.timeStart}-1).find('td').eq(${item.weekTime}).attr('rowspan', num);
            }else {//遍历两个单元格
                var num = ${item.timeEnd} - ${item.timeStart} + 1;
                $('tbody').find('tr').eq(${item.timeEnd}-1).find('td').eq(${item.weekTime}).remove();
                $('tbody').find('tr').eq(${item.timeStart}-1).find('td').eq(${item.weekTime}).attr('rowspan', num);
            }
        }
    </#list>

    var key = 0;
    var arrPos = new Array();
    $(document).ready(function(){
        $("#tab").mousemove(function(e){
            var x = e.clientX, y = e.clientY;
            if (arrPos.length > 0) {
                if ( 1==key && e.target.tagName =="TD")
                {
                    $(e.target).css("background","grey").addClass("selected");
                }
            }
        });
        $("#tab").mousedown(function(e){
            $("td.selected").each(function (){
                $(this).css("background","").removeClass("selected");
            })
            var x = e.clientX, y = e.clientY;
            arrPos.push(Array(x,y));
            $("[name='result']").html("X:"+x+";Y:"+y)
            key=1;
        });
        $("#tab").mouseup(function(e){
            arrPos=new Array();
            key=0;
        });
    })


    $("table").bind('selectstart', function(ev) {
        switch (ev.target.cellIndex) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
                return false;
            default:
                return true;
        }
    })

    // $("table").bind('selectstart', function(ev) {
    //     switch (ev.target.parentElement.rowIndex){
    //         case 0:
    //             return false;
    //         default:
    //             switch (ev.target.cellIndex){
    //                 case 0:
    //                     return false;
    //                 default:
    //                     return true;
    //             }
    //     }
    // })

    for (var i = 0; i < 12; i++){
        for (var j = 1; j <= 7; j++){
            if ($('tbody tr').eq(i).find('td').eq(j).html() === '') {
                $('tbody tr').eq(i).find('td').eq(j).addClass('applyOne');
                <#--$('tbody tr').eq(i).find('td').eq(j).click(function(){-->
                <#--    var url='${rc.contextPath}/order/orderRoom?baseDate=${_example_.dateTime?string ["YYYY-MM-dd"]}&weekTime=' + $(this).parent().find('td').index(this)+'&roomCode=${_example_.roomCode}&startTime=' + $(this).parent().parent().find('tr').index($(this).parent());-->
                <#--    window.location.href = url;-->
                <#--})-->
            }
        }
    }

    function applyLesson(){
        var length = $("td.selected").length
        if (length) {
            var url = '${rc.contextPath}/order/orderRoom?baseDate=${_example_.dateTime?string ["YYYY-MM-dd"]}&weekTime=' + $("td.selected:eq(0)").parent().find('td').index($("td.selected:eq(0)")[0]) + '&roomCode=${_example_.roomCode}&startTime=' + $("td.selected:eq(0)").parent().parent().find('tr').index($("td.selected:eq(0)").parent())  + '&endTime=' + $("td.selected").eq(length-1).parent().parent().find('tr').index($("td.selected").eq(length-1).parent());
            window.location.href = url;
        }else {
            layer.alert("未选课程",{icon: 6, closeBtn: 0},function (index){
                layer.close(index);
            })
            return false
        }
    }
</script>