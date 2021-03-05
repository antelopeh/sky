<#assign operator=Session["_SESSION_OPERATOR_"]>
<div id="content-outer">
    <div id="content">
        <h1 class="tab-pane-title">
            <span class="fa fa-search title-icon"></span>
            <b class="title-name">个人设置：</b>
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
                    <tr class="up">
                        <td class="hint">用户姓名：</td>
                        <td>${operator.name}</td>
                        <td class="hint">用户账号：</td>
                        <td>${operator.code}</td>
                    </tr>
                    <tr>
                        <td class="hint">
                            用户身份：
                        </td>
                        <#list operator.roleMap?keys as key>
                            <td>${operator.roleMap["${key}"]}</td>
                        </#list>
                        <td class="hint">
                            手机号码：
                        </td>
                        <td>${operator.phone}</td>
                    </tr>
                    <tr class="up">
                        <td class="hint">用户密码：</td>
                        <td colspan="3"><span style=vertical-align:middle;">已设置</span><span class="fa fa-check-circle icon-ok"></span>
                            <button class="btn btn-default" type="button" onclick='open_modify_passwd_page();' id="btn_modify_passwd">修改密码</button>
                        </td>
                    </tr>
                </table>
                <form action="${rc.contextPath}/system/changePwd" id="form-passwd" class="nodisplay" method="post">
                    <table class="input-table info-table hint-red" cellspacing="0" cellpadding="0" border="0" width="100%" style="text-align:center;border:1px #ccc dotted;">
                        <colgroup>
                            <col width="20%">
                            <col width="17%">
                            <col width="10%">
                            <col width="17%">
                            <col width="17%">
                            <col>
                        </colgroup>
                        <tr>
                            <td class="hint">原密码：</td>
                            <td><input type="password" class="form-control" name="userPwd" id="userPasswd" placeholder="请输入原密码"></td>
                            <td class="hint">新密码：</td>
                            <td><input type="password" class="form-control" name="password1" id="password1" placeholder="请输入新密码"></td>
                            <td><input type="password" class="form-control" name="password2" id="password2" placeholder="请再次输入新密码"></td>
                            <td style="text-align:left;"><button class="btn btn-danger" type="button" onclick="submit_modify_passwd_page();">确认提交</button></td>
                        </tr>
                    </table>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    function submit_modify_passwd_page(){
        if($('[name=userPasswd]').val() == ''){
            layer.alert('原密码必须输入！');
            return;
        }
        if($('[name=password1]').val() == ''){
            layer.alert('新密码必须输入！');
            return;
        }
        if($('[name=password2]').val() == ''){
            layer.alert('确认密码必须输入！');
            return;
        }
        if($("#password1").val()!=$("#password2").val()){
            layer.alert("新密码不一致，请重新输入！");
            $('[name^=password]').val('');
            return;
        }
        if($('[name=password1]').val() == $('[name=userPasswd]').val()){
            layer.alert('新旧密码输入一致，无需修改！');
            return;
        }
        var pPattern = /^.*(?=.{8,16})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[~!@#$%^&*()-+_]).*$/;
        if(!pPattern.test($("#password1").val())){
            layer.alert('密码过于简单，要求密码由8-16个字符组成且口令必须使用大小写字母、数字以及~!@#$%^&*()-+_等特殊字符的组合。');
            return;
        }

        $.post('${rc.contextPath}/system/changePwd', decodeURIComponent($('#form-passwd').serialize()), function(result,status,xhr){
            if(result.indexOf('SUCCESS') != -1){
                layer.alert('密码修改成功，请重新登录系统！');
                $('#form-passwd').hide();
                $('#btn_modify_passwd').html('修改密码');
                $('[name^=password]').val('');
                $('[name=userPasswd]').val('');
            }else{
                layer.alert('密码修改失败！\n原因：' + result.split(':')[1]);
            }
        });
    }

    function open_modify_passwd_page(){
        if($.trim($('#btn_modify_passwd').html())=='修改密码'){
            $('#form-passwd').show();
            $('#btn_modify_passwd').html('取消修改');
        }else{
            $('#form-passwd').hide();
            $('#btn_modify_passwd').html('修改密码');
        }
    }
</script>
</script>