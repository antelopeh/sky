<#assign operator=Session["_SESSION_OPERATOR_"]>
<div id="content-outer">
    <div id="content">
        <h1 class="tab-pane-title">
            <span class="fa fa-smile-o title-icon"></span>
            <b class="title-name">创建新用户：</b>
            <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
        </h1>
        <div class="input-form">
            <div class="input-form-left">
                <table class="input-table info-table" cellspacing="0" cellpadding="0" border="0" width="100%">
                    <colgroup>
                        <col width="20%">
                        <col width="30%">
                        <col width="20%">
                        <col width="30%">
                    </colgroup>
                    <form action="${rc.contextPath}/msg/insertOne" id="select_form" class="nodisplay" method="post">
                        <tr class="up">
                            <td class="hint">用户姓名：</td>
                            <td><input type="text" class="form-control isChinese" name="userName" id="userName"
                                       placeholder=""></td>
                            <td class="hint">用户身份：</td>
                            <td><input type="text" class="form-control" name="userRole" id="userRole" placeholder="">
                            </td>
                        </tr>
                        <tr>
                            <td class="hint">用户账号：</td>
                            <td><input type="text" class="form-control isCode" name="userCode" id="userCode"
                                       placeholder=""></td>
                            <td class="hint">用户密码：</td>
                            <td><input type="password" class="form-control" name="userPwd" id="userPwd"
                                       value="Sky@2020"></td>
                        </tr>
                        <tr class="up">
                            <td class="hint">手机号码：</td>
                            <td><input type="text" class="form-control isMobile" name="userTel" id="userTel"
                                       placeholder=""></td>
                            <td class="hint">用户邮箱：</td>
                            <td><input type="text" class="form-control isMobile" name="userEmail" id="userEmail"
                                       placeholder="" required></td>
                        </tr>
                        <tr>
                            <td colspan="6" class="text-right">
                                <button class="btn btn-danger" type="submit" onclick="createOne()">新增</button>
                            </td>
                        </tr>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="hidden" name="uuid" value=""/>
                    </form>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="${rc.contextPath}/resources/plugins/jquery/jquery.validate.min.js" ></script>
<script type="text/javascript" src="${rc.contextPath}/resources/plugins/jquery/additional-methods.min.js" ></script>
<script type="text/javascript" src="${rc.contextPath}/resources/plugins/jquery/messages_zh.js" ></script>

<script>
    $().ready(function () {
        jQuery.validator.addMethod("isMobile", function (value, element) {
            var length = value.length;
            var mobile = /^1[3|4|5|7|8][0-9]{9}$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "请正确填写您的手机号码");

        // 判断中文字符
        jQuery.validator.addMethod("isChinese", function (value, element) {
            return this.optional(element) || /^[\u4e00-\u9fa5]+$/.test(value);
        }, "只能包含中文字符");

        // 判断ID
        jQuery.validator.addMethod("isCode", function (value, element) {
            return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
        }, "只能包含英文字符和数字");
        $("#select_form").validate({
            submitHandler: function (form) {
                $.ajax({
                    url: $("#context_path").val() + "/msg/insertOne",
                    data: $("#select_form").serialize(),
                    type: "POST",
                    async: false,
                    success: function (data, textStatus) {
                        if ($.trim(data) == "SUCCESS") {
                            layer.alert("添加成功！");
                        }
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        layer.alert('系统错误：' + errorThrown);
                    }
                });
                return false;
            }
        });
    });


</script>