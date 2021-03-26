<style>
    td.ellipsis{overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp:2;}
</style>
<div class="query-result">
    <table class="table table-bordered table-striped table-hover result-table text-center" role="grid" style="margin-bottom:10px;">
        <colgroup>
            <col width="50%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="10%">
        </colgroup>

        <thead  class="header">
        <tr role="row">
            <th>标题</th>
            <th>发送人</th>
            <th>发送日期</th>
            <th>类型</th>
            <th>操作</th>
        </tr>

        <tbody>
        <#list _result_ as item>
            <tr role="row">
                <td style="vertical-align: middle;">${item.messTitle}</td>
                <td style="vertical-align: middle;">${item.sendUserCode}</td>
                <td style="vertical-align: middle;">${item.sendTime?string("MM-dd")}</td>
                <#if messType == 0>
                    <td style="vertical-align: middle;">公告</td>
                <#else>
                    <td style="vertical-align: middle;">审核</td>
                </#if>
                <#if item.status == 0>
                    <td style="vertical-align: middle"><a onclick="openDetails('${item.thirdId}','${item.id}');" style="cursor:pointer;">未读</a></td>
                <#else>
                    <td style="vertical-align: middle"><a onclick="openDetails('${item.thirdId}');" style="cursor:pointer;">已读</a></td>
                </#if>
            </tr>
        </#list>
        </tbody>
    </table>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/resources/css/showContent.css" />
    <input type="hidden" id="hiddenList" value="/message/messageList"/>
    <input type="hidden" id="itemCount" value="${_count_}"/>
</div>
<script>
    function openDetails(thirdId, id) {
        $.post('${rc.contextPath}/message/readMsg?id='+id);
        var url='${rc.contextPath}/apply/applyDetails?id='+thirdId;
        window.location.href = url;
    }
</script>