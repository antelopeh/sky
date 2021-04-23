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
            <b class="title-name">申请详情：</b>
            <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
        </h1>
        <div class="query-form query-form-up" id="matchWrap">
            <form id="select_form" action="${rc.contextPath}/apply/rejectApply" method="POST" style="border:none;">
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
                            <input id="selectDate" name="applyTime" type="date" value="${_result_.applyTime?date}" style="width: 200px;height: 28px;font-size: 18px;color: black;margin:20px 0px 20px 10px"/>
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
                        <td colspan="6">
                            <textarea name="applyReason" class="form-control" rows="10" style="margin-left: 80px" maxlength="200" oninput="autoCountWords(this)"></textarea>
                            <div style="position: relative;left: 1000px;bottom: 20px">
                                <span class="num_count" style="color: red" id="numCount">0</span>
                                <span class="num_limit" style="color: red">/200</span>
                            </div>
                        </td>
                    </tr>
                    <tr class="up">
                        <td class="hint" colspan="1">
                            驳回理由：
                        </td>
                    </tr>
                    <tr class="up">
                        <td colspan="6">
                            <textarea name="rejectReason" class="form-control" rows="10" style="margin-left: 80px" maxlength="200" oninput="autoCountWords(this)"></textarea>
                            <div style="position: relative;left: 1000px;bottom: 20px">
                                <span class="num_count" style="color: red" id="numCount">0</span>
                                <span class="num_limit" style="color: red">/200</span>
                            </div>
                        </td>
                    </tr>
                    <#if operator.code == "admin">
                        <tr style="padding-top: 100px">
                            <td colspan="6" class="text-right">
                                <button class="btn btn-danger" type="button" onclick="rejectApply()">驳回</button>
                            </td>
                            <td colspan="6" class="text-right">
                                <button class="btn btn-green" type="button" onclick="agreeApply()">同意</button>
                            </td>
                        </tr>
                    </#if>
                    <input name="applyStatus" style="display: none" value="0">
                    </tbody>
                </table>
                <input type="hidden" name="id" value="${_result_.id}">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="uuid" value=""/>
            </form>
            <#if operator.code == "admin">
                <span class="fa fa-remove title-icon" style="margin-left: 100px;color: whitesmoke" onclick="cancelReason(this)"></span>
                <button class="btn btn-default editReason" type="button" onclick="editReason(this)">课程选择冲突</button>
                <button class="btn btn-default editReason" type="button" onclick="editReason(this)">理由不充分</button>
                <button class="btn btn-default editReason" type="button" onclick="editReason(this)">无权</button>
            </#if>
        </div>
    </div>
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</body>
<#include "layout/footer.ftl">

<script>

    $(document).ready(function () {
        $("[name='applyReason']").val("${_result_.applyReason}")
        autoCountWords($("[name='applyReason']")[0])

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

        //初始化申请对象select
        $("[name='applyObject']").find("option").each(function (){
            if ($(this).val() == "${_result_.applyObject}")
                $(this).prop("selected",true);
        })
    })

    window.onload = function() {
        //描绘待选的课时
        var array = "${_result_.applyLesson}".split(",")
        array.forEach((item,index,array)=>{
            $('.dropdown-menu.inner:eq(3) li').eq(item - 1).addClass("selected");
            $('.dropdown-menu.inner:eq(3) li').eq(item - 1).css("background","lightgreen");
            $('.dropdown-menu.inner:eq(3) li').eq(item - 1).find('.text').after('<span class="selectedLesson" style="color: red;padding-left: 350px;">待选择  </span>');
        })
        $("[name='applyLesson']").selectpicker ("val",array).trigger("change");


        //禁用已选的课时
        <#list LESSON as item>
            <#list item.timeStart..item.timeEnd as i>
                $('.dropdown-menu.inner:eq(3) li').eq(${i} - 1).find('.text').css('text-decoration','line-through');
                if ($('.dropdown-menu.inner:eq(3) li').eq(${i} - 1).find('.selectedLesson').length) {
                    $('.dropdown-menu.inner:eq(3) li').eq(${i} - 1).find('.selectedLesson').css("text-decoration", "line-through");
                    $('.dropdown-menu.inner:eq(3) li').eq(${i} - 1).find('.selectedLesson').after('<span style="color: red;">已被占用</span>');
                    //清空多选框的选中项，并提示无效的选中
                    $("[name='applyLesson']").selectpicker("deselectAll")
                    $("[name='applyLesson']").next().find("[class='filter-option pull-left']").css("color","red").html("无效的选中项")
                }else
                    $('.dropdown-menu.inner:eq(3) li').eq(${i} - 1).find('.text').after('<span style="color: red;padding-left: 350px;">已被占用</span>');
        $('.dropdown-menu.inner:eq(3) li').eq(${i} - 1).addClass('disabled');
            </#list>
        </#list>

    }

    function autoCountWords(obj){
        if(obj.value.length>200) {
            obj.value.substr(0, 200)
            return
        }
        $(obj).parent().find('.num_count').html(obj.value.length)
    }

    function rejectApply(){
        var url='${rc.contextPath}/apply/rejectApply'
        $.ajax({
            url: url,
            type: 'POST',
            async: false,
            data: $('#select_form').serialize(),
            success: function (data, textStatus) {
                if($.trim(data)=="SUCCESS") {
                    layer.alert("驳回成功！", {icon: 6, closeBtn: 0}, function (index) {
                        layer.close(index);
                        location.href = "${rc.contextPath}/apply/index"
                    });
                }
                else
                    layer.alert("操作失败，请重新申请！", {icon: 6, closeBtn: 0}, function (index) {
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

    function agreeApply(){
        var url='${rc.contextPath}/apply/agreeApply'
        $.ajax({
            url: url,
            type: 'POST',
            async: false,
            data: $('#select_form').serialize(),
            success: function (data, textStatus) {
                if($.trim(data)=="SUCCESS") {
                    layer.alert("审核通过！", {icon: 6, closeBtn: 0}, function (index) {
                        layer.close(index);
                        location.href = "${rc.contextPath}/apply/index"
                    });
                }
                else
                    layer.alert("操作失败，请重新申请！", {icon: 6, closeBtn: 0}, function (index) {
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

    function editReason(obj){
        $("[name='rejectReason']").val($("[name='rejectReason']").val() + "  " + $(obj).html())
        autoCountWords($("[name='rejectReason']")[0])
        $(obj).hide()
    }

    function cancelReason(obj){
        $(".editReason").show()
        $("[name='rejectReason']").val("")
        autoCountWords($("[name='rejectReason']")[0])
    }


</script>