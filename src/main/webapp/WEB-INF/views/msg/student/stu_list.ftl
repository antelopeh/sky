<style>
    td.ellipsis{overflow:hidden;text-overflow:ellipsis;display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp:2;}
</style>
<div class="query-result">
    <table class="table table-bordered table-striped table-hover result-table text-center" role="grid" style="margin-bottom:10px;">
        <colgroup>
            <col width="30%">
            <col width="30%">
            <col width="20%">
            <col width="10%">
            <col width="10%">
        </colgroup>

        <thead  class="header">
        <tr role="row">
            <th>班级</th>
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th></th>
        </tr>

        <tbody>
            <#list _result_ as item>
                <tr role="row">
                    <td style="vertical-align: middle;">${item.className}</td>
                    <td style="vertical-align: middle;">${item.code}</td>
                    <td style="vertical-align: middle;">${item.name}</td>
                    <#if item.sex =='0'>
                        <td style="vertical-align: middle;">男</td>
                    <#else >
                        <td style="vertical-align: middle;">女</td>
                    </#if>
                    <td style="vertical-align: middle"><a onclick="openDetails('${item.code}');" style="cursor:pointer;">查看详情</a></td>
                </tr>
            </#list>
        </tbody>
    </table>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/resources/css/showContent.css" />
    <input type="hidden" id="hiddenList" value="/msg/stuList"/>
    <input type="hidden" id="itemCount" value="${_count_}"/>
</div>
<script>
    function openDetails(code) {
        var url='${rc.contextPath}/msg/studentDetails?code='+code;
        window.location.href = url;
    }
</script>