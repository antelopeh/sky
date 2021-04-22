<#include "layout/header.ftl">
<script>
    $(function () {
        $('body').css('padding', '0');
    })
</script>
<style>
    button.btn.dropdown-toggle.btn-default::after {
        border-top: 0px
    }

    .query-table td {
        padding: 10px 5px;
        padding-bottom: 0px;
    }
</style>

<body class="hold-transition skin-blue sidebar-mini" style="padding:10px 15px 0px 15px;background: black">
<#assign operator=Session["_SESSION_OPERATOR_"]>
<#include "layout/top.ftl">

<div id="content-outer">
    <div id="content">
        <h1 class="tab-pane-title">
            <span class="fa fa-paper-plane title-icon"></span>
            <b class="title-name">教室报修：</b>
            <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
        </h1>
        <div class="query-form query-form-up" id="matchWrap">
            <form id="select_form" enctype="multipart/form-data" action="${rc.contextPath}/order/getList" method="POST"
                  style="border:none;">
                <table class="query-table" cellspacing="0" cellpadding="0" border="0" width="100%">
                    <colgroup>
                        <col width="16.6%">
                        <col width="16.6%">
                        <col width="16.6%">
                        <col width="16.6%">
                        <col width="16.6%">
                        <col width="16.6%">
                    </colgroup>
                    <tbody>
                    <tr class="up">
                        <td class="hint">
                            所在幢系：
                        </td>
                        <td>
                            <select class="form-control selecter" id="blockCode" name="" onChange="showRoom(this.value)">
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
                            <select class="form-control selecter" id="roomCode" name="" onChange="showRooms($('#blockCode').val(),this.value)">
                                <option value="">--请选择--</option>
                            </select>
                        </td>
                        <td class="hint">
                            所在房间：
                        </td>
                        <td>
                            <select class="form-control selecter" id="rooms" name="" onChange="">
                                <option value="">--请选择--</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="up">
                        <td class="hint" colspan="1">
                            损坏设备：
                        </td>
                        <td colspan="1">
                            <select class="form-control selecter" id="repairObj" name="repairObj" value="${_result_.repairObj}">
                                <option value="">--请选择--</option>
                                <option value="1" <#if _result_.repairObj = '1'>selected</#if>>话筒</option>
                                <option value="2" <#if _result_.repairObj = '2'>selected</#if>>投影仪</option>
                                <option value="3" <#if _result_.repairObj = '3'>selected</#if>>幕布</option>
                                <option value="0" <#if _result_.repairObj = '0'>selected</#if>>其他</option>
                            </select>
                        </td>
                        <td class="hint"></td>
                        <td class="hint"></td>
                        <td class="hint"></td>
                        <td class="hint"></td>
                    </tr>
                    <tr class="up">
                        <td class="hint" colspan="1">
                            补充信息：
                        </td>
                        <td colspan="3">
                            <textarea id="repairMess" name="repairMess" class="form-control" rows="10" style=""
                                      maxlength="200" readonly>${_result_.repairMess}</textarea>
                        </td>
                        <td class="hint" colspan="1">
                            图片预览：
                        </td>
                        <td class="base_content" colspan="1">
                            <img class="img-responsive" src="${rc.contextPath}/resources/img/${_result_.repairImg}"/>
                            <input name="repairImg" style="display: none" value="${_result_.repairImg}">
                        </td>
                    </tr>
                    <tr>
                        <#if operator.code == "admin">
                            <#if _result_.repairStatus == 0>
                                <td colspan="6" class="text-right">
                                    <button class="btn btn-danger" type="button" onclick="return applyRepair()">确认</button>
                                </td>
                            <#else>
                                <td colspan="6" class="text-right">
                                    <button class="btn btn-danger" type="button" onclick="return applyRepair()">已确认</button>
                                </td>
                            </#if>
                        <#else>
                            <#if _result_.repairStatus == 0>
                                <td colspan="6" class="text-right">
                                    <button class="btn btn-green" type="button" onclick="" disabled>待确认</button>
                                </td>
                            <#else>
                                <td colspan="6" class="text-right">
                                    <button class="btn btn-green" type="button" onclick="" disabled>已确认</button>
                                </td>
                            </#if>
                        </#if>
                    </tr>
                    <input name="id" style="display: none" value="${_result_.id}">
                    <input name="repairStatus" style="display: none" value="${_result_.repairStatus}">
                    <input name="roomCode" style="display: none" value="${_result_.roomCode}">
                    </tbody>
                </table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="uuid" value=""/>
            </form>
        </div>
    </div>
</div>
</body>

<#include "layout/footer.ftl">
<script>
    $(document).ready(function () {

        $("#lesson").selectpicker({width: "515px"});//单独设置bootstrap中select的宽度，使其不因选中项宽度过大而被强行撑开
        //更改第一个下选框的选项
        var html = "<option value=''>--请选择--</option>";
        <#list block as item>
        html = html + '<option value="${item.blockCode}">${item.blockName}</option>';
        </#list>
        $("#blockCode").html(html);
        $("#blockCode").selectpicker('refresh');

        <#if _result_.roomCode?length gt 0>
        //更改大楼默认选中项
        $('.btn-group:first li').each(function () {
            if ($(this).find('.text').html().substring(0, 1) == '${_result_.roomCode?substring(0,1)}') {
                $(this).addClass('selected');
                $('#blockCode').val('${_result_.roomCode?substring(0,1)}');
                $('select').val('${_result_.roomCode?substring(0,1)}');
                $($('.filter-option')[0]).html($(this).find('.text').html());
                showRoom('${_result_.roomCode?substring(0,1)}');
            }
        });

        //更改层数默认选中项
        $('.btn-group:eq(1) li').each(function () {
            if ($(this).find('.text').html().substring(2, 3) == '${_result_.roomCode?substring(2,3)}') {
                $(this).addClass('selected');
                $('#roomCode').val('${_result_.roomCode?substring(2,3)}');
                $($('.filter-option')[1]).html($(this).find('.text').html());
                showRooms('${_result_.roomCode?substring(0,1)}', '${_result_.roomCode?substring(2,3)}');
            }
        });

        //更改教室默认选中项
        $('.btn-group:eq(2) li').each(function () {
            if ($(this).find('.text').html().substring(0, 3) == '${_result_.roomCode?substring(2)}') {
                $(this).addClass('selected');
                $('#rooms').val('${_result_.roomCode?substring(2)}')
                $('#rooms').attr('value','${_result_.roomCode?substring(2)}室');
                $($('.filter-option')[2]).html($(this).find('.text').html().substring(0, 3) + '室');
            }
        })
        </#if>
    })

    window.onload = function() {
        $("[name='repairObj']").val('${_result_.repairObj}');
        $("[name='repairObj']").selectpicker('refresh');
    }

    function applyRepair() {
        var url = '${rc.contextPath}/order/applyRepair';
        if ($("#rooms").val() && !$("[name = 'roomCode']").val()){
            $("[name = 'roomCode']").val($("#blockCode").val()+"-"+$("#rooms").val())
        }
        if (!$("[name = 'roomCode']").val()){
            layer.alert("未选教室！",{icon: 6, closeBtn: 0},function (index){
                layer.close(index);
            })
            return
        }
        $.ajax({
            url: url,
            type: 'POST',
            data: $("#select_form").serialize(),
            success: function (data, textStatus) {
                if ($.trim(data) == "SUCCESS") {
                    layer.alert("已确认！", {icon: 6, closeBtn: 0}, function (index) {
                        layer.close(index);
                        location.href = "${rc.contextPath}/order/index"
                    });
                } else {
                    layer.alert("操作失败，请重新申请！", {icon: 6, closeBtn: 0}, function (index) {
                        layer.close(index);
                        location.reload()
                    });
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert('系统错误：' + errorThrown);
            }
        })
    }
</script>