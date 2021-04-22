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
            <th>编号</th>
            <th>姓名</th>
            <th>分院</th>
            <th>性别</th>
        </tr>

        <tbody>
            <#list _result_ as item>
                <tr role="row">
                    <td style="vertical-align: middle;">${item.code}</td>
                    <td style="vertical-align: middle;">${item.name}</td>
                    <td style="vertical-align: middle;">${item.deptName}</td>
                    <#if item.sex =='0'>
                        <td style="vertical-align: middle;">男</td>
                    <#else >
                        <td style="vertical-align: middle;">女</td>
                    </#if>
                </tr>
            </#list>
        </tbody>
    </table>
    <link rel="stylesheet" type="text/css" href="${rc.contextPath}/resources/css/showContent.css" />
    <input type="hidden" id="hiddenList" value="/msg/teacherList"/>
    <input type="hidden" id="itemCount" value="${_count_}"/>
</div>
<script>
    function openDetails(code) {
        <#--var url='${rc.contextPath}/msg/studentDetails?code='+code;-->
        <#--window.location.href = url;-->
    }
</script>