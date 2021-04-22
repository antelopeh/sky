<#include "layout/header.ftl">
<h1 class="tab-pane-title">
    <span class="fa fa-commenting-o title-icon"></span>
    <b class="title-name">图片上传</b>
    <ul class="title-status-ope">
        <#--<li><a href="javascript:void(0)" class="fa fa-plus addOne"></a></li>-->
        <#--<li><a href="javascript:void(0)" class="fa fa-wrench"></a></li>-->
        <#--<li><a href="javascript:void(0)" class="fa fa-trash-o"></a></li>-->
    </ul>
</h1>
<div class="input-form" style="padding-right: 0;">
    <#include "layout/picture/picture_upload_left.ftl">
    <#include "layout/picture/picture_upload_right.ftl">
</div>
<script type="text/javascript" src="${rc.contextPath}/resources/picture/picture_upload.js"></script>
<#include "layout/footer.ftl">