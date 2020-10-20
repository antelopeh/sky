<script type="text/javascript" src="${rc.contextPath}/resources/plugins/bootstrap-select/bootstrap-select.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/plugins/ztree/js/jquery.ztree.all-3.5.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/js/defaults-zh_CN.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/plugins/layer/layer.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/js/app.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/js/demo.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/js/global.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/tab/js/popper.min.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/tab/js/poca.bundle.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/tab/js/default-assets/active.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/js/common.js"></script>
<script type="text/javascript" src="${rc.contextPath}/resources/js/refresh.js"></script>
<#include "layout/loading.ftl">
<input type="hidden" id="context_path" value="${rc.contextPath}"/>
<input type="hidden" id="csrf_token" value="${_csrf.token}"/>
<input type="hidden" id="csrf_header" value="${_csrf.headerName}"/>
<input type="hidden" id="csrf_name" value="${_csrf.parameterName}"/>
</html>