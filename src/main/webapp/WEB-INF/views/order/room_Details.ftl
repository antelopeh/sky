<#include "layout/header.ftl">
<script>
    $(function(){
        $('body').css('padding','0');
    })
</script>

<body id="stuMsg" class="hold-transition skin-blue sidebar-mini" style="padding:10px 15px 0px 15px;background: black">
<#assign operator=Session["_SESSION_OPERATOR_"]>
<#include "layout/top.ftl">

<#include "order/schedule_line.ftl">
<input type="hidden" id="hiddenList" value="/order/orderLine"/>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</body>
<#include "layout/footer.ftl">