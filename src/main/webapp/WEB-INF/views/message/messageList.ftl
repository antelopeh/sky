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
                    <#if item.status == 0>
                        <td style="vertical-align: middle"><a onclick="" style="cursor:pointer;">未读</a></td>
                    <#else>
                        <td style="vertical-align: middle"><a onclick="" style="cursor:pointer;">已读</a></td>
                    </#if>
                <#elseif messType == 1>
                    <td style="vertical-align: middle;">审核</td>
                    <#if operator.code == "admin">
                        <#if item.status == 0>
                            <td style="vertical-align: middle"><a onclick="openDetails('${item.thirdId}','${item.id}');" style="cursor:pointer;">未读</a></td>
                        <#else>
                            <td style="vertical-align: middle"><a onclick="openDetails('${item.thirdId}');" style="cursor:pointer;">已读</a></td>
                        </#if>
                    <#else>
                        <#if item.status == 0>
                            <td style="vertical-align: middle"><a onclick="openDetails('${item.thirdId}','${item.id}');" style="cursor:pointer;">待处理</a></td>
                        <#else>
                            <td style="vertical-align: middle"><a onclick="openDetails('${item.thirdId}');" style="cursor:pointer;">已处理</a></td>
                        </#if>
                    </#if>
                <#else>
                    <td style="vertical-align: middle;">维修</td>
                    <#if operator.code == "admin">
                        <#if item.status == 0>
                            <td style="vertical-align: middle"><a onclick="openRepair('${item.thirdId}','${item.id}');" style="cursor:pointer;">未读</a></td>
                        <#else>
                            <td style="vertical-align: middle"><a onclick="openRepair('${item.thirdId}');" style="cursor:pointer;">已读</a></td>
                        </#if>
                    <#else>
                        <#if item.status == 0>
                            <td style="vertical-align: middle"><a onclick="openRepair('${item.thirdId}','${item.id}');" style="cursor:pointer;">待查看</a></td>
                        <#else>
                            <td style="vertical-align: middle"><a onclick="openRepair('${item.thirdId}');" style="cursor:pointer;">已查看</a></td>
                        </#if>
                    </#if>
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
        if (id)
            $.post('${rc.contextPath}/message/readMsg?id='+id);
        var url='${rc.contextPath}/apply/applyDetails?id='+thirdId;
        window.location.href = url;
    }

    function openRepair(thirdId, id){
        if (id)
            $.post('${rc.contextPath}/message/readMsg?id='+id);
        var url='${rc.contextPath}/order/repairMsg?id='+thirdId;
        window.location.href = url;
    }
</script>