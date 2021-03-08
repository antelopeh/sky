<style>
    td.ellipsis{overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp:2;}
</style>
<div class="query-result">
    <table class="table table-bordered table-striped table-hover result-table text-center" role="grid" style="margin-bottom:10px;margin-left: 60px;">
        <colgroup>
            <col width="10%">
            <col width="10%">
            <col width="10%">
            <col width="20%">
            <col width="40%">
            <col width="10%">
        </colgroup>

        <thead  class="header">
        <tr role="row">
            <th>申请教室</th>
            <th>申请时间</th>
            <th>申请对象</th>
            <th>申请课时</th>
            <th>申请缘由</th>
            <th></th>
        </tr>

        <tbody>
        <#list _result_ as item>
            <tr role="row">
                <td style="vertical-align: middle;">${item.applyBuild}-${item.applyRoom}室</td>
                <td style="vertical-align: middle;">${item.applyTime?string("MM-dd")}</td>
                <td style="vertical-align: middle;">${item.applyPerson}</td>
                <td style="vertical-align: middle;">${item.applyLesson}</td>
                <td style="vertical-align: middle;">${item.applyReason}</td>
                <td style="vertical-align: middle"><a onclick="openApplyDetails('${item.id}');" style="cursor:pointer;">查看详情</a></td>
            </tr>
        </#list>
        </tbody>
    </table>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/resources/css/showContent.css" />
    <input type="hidden" id="hiddenList" value="/apply/applyList"/>
    <input type="hidden" id="itemCount" value="${_count_}"/>
</div>
<script>
    function openApplyDetails(code) {
        var url='${rc.contextPath}/apply/applyDetails?id='+code;
        window.location.href = url;
    }
</script>