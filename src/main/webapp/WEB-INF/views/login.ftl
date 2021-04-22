<#include "layout/header.ftl">
<script>
    $(function () {
        $('body').css('padding', '0');
    })
</script>

<style>
    li {
        display: inline-block;
    }
    .announcement{
        position: absolute;top: 100px;left: 350px;right: 350px;min-height: 800px;padding: 10px 10px 10px 10px;background-color: rgba(38,39,40,0.5);
    }
    .announcementTitle{
        margin-top: 280px;margin-left: 250px;
    }
    .announcementTitle span{
        color: whitesmoke;
    }
    .announcementContent{margin-left: 250px;}
    .welcomeIconList li{width: 100px;}
</style>

<body class="hold-transition skin-blue sidebar-mini" style="padding:10px 15px 0px 15px;background: black">
<#assign operator=Session["_SESSION_OPERATOR_"]>
<#include "layout/top.ftl">
<div id="content-outer">
    <div class="announcement">
        <div class="announcementTitle"><span style="margin-right:10px;">>></span><span
                    style="font-size: 18px;">欢迎使用教室管理系统</span> <span
                    class="font-red" style="font-size: 16px">V2.0</span>:
        </div>
        <div class="announcementContent">
            <p style="font-size:15px;line-height:45px;margin-bottom:10px;color: whitesmoke">
                用户您好，当前系统正处于Beta测试期，如遇到功能问题，请及时联系技术管理员反馈。
            <ul class="welcomeIconList" style="white-space: nowrap;">
                <li style="margin-left: 15%"><img src="${rc.contextPath}/resources/img/welcome_mail.png" width="60%"
                                                  style="max-width:72px;" alt=""></li>
                <li><img src="${rc.contextPath}/resources/img/welcome_weChat.png" width="60%"
                         style="max-width:72px;" alt=""></li>
                <li><img src="${rc.contextPath}/resources/img/welcome_refresh.png" width="60%"
                         style="max-width:72px;" alt=""></li>
                <li><img src="${rc.contextPath}/resources/img/welcome_location.png" width="60%"
                         style="max-width:72px;" alt=""></li>
                <li><img src="${rc.contextPath}/resources/img/welcome_calendar.png" width="60%"
                         style="max-width:72px;" alt=""></li>
            </ul>
        </div>
    </div>
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</body>
<#include "layout/footer.ftl">
