<style>
    td.ellipsis{overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp:2;}
</style>
<div class="query-result">
    <table class="table table-bordered table-striped table-hover result-table text-center" role="grid" style="margin-bottom:10px;">
        <colgroup>
            <col width="15%">
            <col width="15%">
            <col width="30%">
        </colgroup>

        <thead  class="header">
        <tr role="row">
            <th>所在幢系</th>
            <th>教室编号</th>
            <th></th>
        </tr>

        <tbody>
        <#list _result_ as item>
            <tr role="row">
                <#if item.blockCode?matches('[0-9]')>
                    <td style="vertical-align: middle;">${item.blockCode}号实验室</td>
                <#else>
                    <td style="vertical-align: middle;">${item.blockCode}幢教学楼</td>
                </#if>
                <td style="vertical-align: middle;">${item.roomCode}室</td>
                <td style="vertical-align: middle"><a onclick="openDetails('${item.blockCode}','${item.roomCode}');" style="cursor:pointer;">查看使用详情</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/resources/css/showContent.css" />
    <input type="hidden" id="hiddenList" value="/order/getList"/>
    <input type="hidden" id="itemCount" value="${_count_}"/>
</div>
<script>
    <#--function openDetails(blockCode,roomCode) {-->
    <#--    var url='${rc.contextPath}/order/roomDetail?blockCode='+blockCode+'&roomCode='+roomCode;-->
    <#--    window.location.href = url;-->
    <#--}-->
    function openDetails(blockCode,roomCode) {
        var url='${rc.contextPath}/order/apply?roomCode='+blockCode+'-'+roomCode;
        $.ajax({
            url: url,
            type: 'POST',
            async: false,
            success: function (data, textStatus) {
                $('#content').html(data);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert('系统错误：' + errorThrown);
            }
        })
    }
</script>