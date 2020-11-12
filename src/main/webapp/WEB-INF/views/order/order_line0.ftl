<style>
    td.ellipsis{overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp:2;}
</style>
<h1 class="tab-pane-title" style="padding-bottom: 20px">
    <span class="fa fa-search title-icon"></span>
    <b class="title-name">教室占用周表：</b>
    <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
</h1>
<div class="query-result">
    <table class="table table-bordered table-striped table-hover result-table text-center" role="grid" style="margin-bottom:10px;">
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
<script>
    <#--function openDetails(code) {-->
    <#--    var url='${rc.contextPath}/msg/studentDetails?code='+code;-->
    <#--    window.location.href = url;-->
    <#--}-->

    var count = "${_result_?size}";
    <#assign aDateTime = .now>
    <#list _result_ as item>
        $('tbody').find('tr').eq(${item.timeStart-1}).find('td').eq(${item.weekTime}).html('${item.remark?substring(5)}');
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
</script>