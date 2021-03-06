<#include "layout/header.ftl">
<script>
    $(function(){
        $('body').css('padding','0');
    })
</script>
<style>
    button.btn.dropdown-toggle.btn-default::after{border-top: 0px}
    .query-table td{padding:10px 5px; padding-bottom:0px;}
</style>

<body class="hold-transition skin-blue sidebar-mini" style="padding:10px 15px 0px 15px;background: black">
<#assign operator=Session["_SESSION_OPERATOR_"]>
<#include "layout/top.ftl">

<div id="content-outer">
    <div id="content">
        <h1 class="tab-pane-title">
            <span class="fa fa-paper-plane title-icon"></span>
            <b class="title-name">申请教室：</b>
            <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
        </h1>
        <div class="query-form query-form-up" id="matchWrap">
            <form id="select_form" action="${rc.contextPath}/order/getList" method="POST" style="border:none;">
                <table class="query-table" cellspacing="0" cellpadding="0" border="0" width="100%">
                    <colgroup>
                        <col width="16.5%">
                        <col width="16.5%">
                        <col width="16.5%">
                        <col width="16.5%">
                        <col width="16.5%">
                        <col width="16.5%">
                    </colgroup>
                    <tbody>
                    <tr class="up">
                        <td class="hint">
                            所在幢系：
                        </td>
                        <td>
                            <select class="form-control selecter" id="blockCode" name="applyBuild" onChange="showRoom(this.value)">
                                <option value="">--请选择--</option>
                                <#list block as item>
                                    <option value="${item.blockCode}">${item.blockName}</option>
                                </#list>
                            </select>
                        </td>
                        <td class="hint">
                            所在层数：
                        </td>
                        <td>
                            <select class="form-control selecter" id="roomCode" name="applyFloor" onChange="showRooms($('#blockCode').val(),this.value)">
                                <option value="">--请选择--</option>
                            </select>
                        </td>
                        <td class="hint">
                            所在房间：
                        </td>
                        <td>
                            <select class="form-control selecter" id="rooms" name="applyRoom" onChange="">
                                <option value="">--请选择--</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="up">
                        <td class="hint">
                            申请时间：
                        </td>
                        <td>
                            <input id="selectDate" name="applyTime" type="date" value="${date?date}" style="width: 200px;height: 28px;font-size: 18px;color: black;margin:20px 0px 20px 10px"/>
                        </td>
                        <td class="hint">
                            申请课时：
                        </td>
                        <td colspan="3">
                            <select style="width: 500px" class="form-control selectpicker" id="lesson" name="applyLesson" multiple>
                                <#list 1..12 as i>
                                        <option value="${i}">第${i}课时</option>
                                </#list>
                            </select>
                        </td>
                    </tr>
                    <tr class="up">
                        <td class="hint">
                            申请对象：
                        </td>
                        <td>
                            <select style="width: 500px" class="form-control selectpicker" id="object" name="applyObject">
                                <option value="">请选择</option>
                                <option value="0">个人</option>
                                <option value="1">社团组织</option>
                                <option value="2">教师</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="up">
                        <td class="hint" colspan="1">
                            申请缘由：
                        </td>
                    </tr>
                    <tr class="up">
                        <td class="hint" colspan="1"></td>
                        <td colspan="5">
                            <textarea name="applyReason" class="form-control" rows="10" maxlength="200" oninput="autoCountWords(this)"></textarea>
                            <div style="position: relative;left: 800px;bottom: 20px">
                                <span class="num_count" style="color: red" id="numCount">0</span>
                                <span class="num_limit" style="color: red">/200</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="text-right">
                            <button class="btn btn-danger" type="button" onclick="submitApply()">申请</button>
                        </td>
                    </tr>
                    <input name="applyStatus" style="display: none" value="0">
                    </tbody>
                </table>
                <input type="hidden" name="applyLessons" value="">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="uuid" value=""/>
            </form>
        </div>
    </div>
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</body>
<#include "layout/footer.ftl">

<script>
    $(document).ready(function () {
        //更改多选框的默认值
        $("[name='applyLesson']").find("option").each(function (){
            if (this.index >= ${startTime} && this.index <= ${endTime}){
                this.selected = true;
                if ($("[name='applyLessons']").val().length)
                    $("[name='applyLessons']").val( $("[name='applyLessons']").val() + "," + this.value)
                else
                    $("[name='applyLessons']").val(this.value)
            }
        })

        $("#lesson").selectpicker({width: "515px"});//单独设置bootstrap中select的宽度，使其不因选中项宽度过大而被强行撑开
        //更改第一个下选框的选项
        var html = "<option value=''>--请选择--</option>";
        <#list block as item>
            html = html + '<option value="${item.blockCode}">${item.blockName}</option>';
        </#list>
        $("#blockCode").html(html);
        $("#blockCode").selectpicker('refresh');

        <#if _example_.roomCode?length gt 0>
        //更改大楼默认选中项
            $('.btn-group:first li').each(function () {
                    if ($(this).find('.text').html().substring(0, 1) == '${_example_.roomCode?substring(0,1)}') {
                        $(this).addClass('selected');
                        $('#blockCode').val('${_example_.roomCode?substring(0,1)}');
                        $('select').val('${_example_.roomCode?substring(0,1)}');
                        $($('.filter-option')[0]).html($(this).find('.text').html());
                        showRoom('${_example_.roomCode?substring(0,1)}');
                    }
            });

            //更改层数默认选中项
            $('.btn-group:eq(1) li').each(function () {
                if ($(this).find('.text').html().substring(2, 3) == '${_example_.roomCode?substring(2,3)}') {
                    $(this).addClass('selected');
                    $('#roomCode').val('${_example_.roomCode?substring(2,3)}');
                    $($('.filter-option')[1]).html($(this).find('.text').html());
                    showRooms('${_example_.roomCode?substring(0,1)}', '${_example_.roomCode?substring(2,3)}');
                }
            });

            //更改教室默认选中项
            $('.btn-group:eq(2) li').each(function () {
                if ($(this).find('.text').html().substring(0, 3) == '${_example_.roomCode?substring(2)}') {
                    $(this).addClass('selected');
                    $('#rooms').val('${_example_.roomCode?substring(2)}')
                    $('#rooms').attr('value','${_example_.roomCode?substring(2)}室');
                    $($('.filter-option')[2]).html($(this).find('.text').html().substring(0, 3) + '室');
                }
            })
        </#if>
    })

    window.onload = function() {
        //禁用已选的课时
        <#list _result_ as item>
            <#list item.timeStart..item.timeEnd as i>
                $('.dropdown-menu.inner:eq(3) li').eq(${i} - 1).find('.text').css('text-decoration','line-through');
                $('.dropdown-menu.inner:eq(3) li').eq(${i} - 1).find('.text').after('<span style="color: red">已被占用</span>');
                $('.dropdown-menu.inner:eq(3) li').eq(${i} - 1).addClass('disabled');
            </#list>
        </#list>
    }

    function autoCountWords(obj){
        if(obj.value.length>200) {
            obj.value.substr(0, 200)
            return
        }
        $('.num_count').html(obj.value.length)
    }

    function submitApply(){
        var url='${rc.contextPath}/order/submitApply'
        $.ajax({
            url: url,
            type: 'POST',
            async: false,
            data: $('#select_form').serialize(),
            success: function (data, textStatus) {
                if($.trim(data)=="SUCCESS") {
                    layer.alert("提交成功！", {icon: 6, closeBtn: 0}, function (index) {
                        layer.close(index);
                        location.href = "${rc.contextPath}/order/index"
                    });
                }
                else
                    layer.alert("提交失败，请重新申请！", {icon: 6, closeBtn: 0}, function (index) {
                        layer.close(index);
                        location.reload()
                    });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert('系统错误：' + errorThrown);
            }
        })
        // location.reload()
    }
</script>