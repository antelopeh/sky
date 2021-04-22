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
            <b class="title-name">教室报修：</b>
            <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
        </h1>
        <div class="query-form query-form-up" id="matchWrap">
            <form id="select_form" enctype="multipart/form-data" action="${rc.contextPath}/order/getList" method="POST" style="border:none;">
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
                        <td  colspan="1">
                            <select class="form-control selecter" id="repairObj" name="repairObj">
                                <option value="">--请选择--</option>
                                <option value="1">话筒</option>
                                <option value="2">投影仪</option>
                                <option value="3">幕布</option>
                                <option value="0">其他</option>
                            </select>
                        </td>
                        <td class="hint"></td>
                        <td class="hint"></td>
                        <td class="hint">
                            上传照片：
                        </td>
                        <td class="base_content">
                            <input type="file" name="repairImg"  onchange="show(this)">
                        </td>
                    </tr>
                    <tr class="up">
                        <td class="hint" colspan="1">
                            补充信息：
                        </td>
                        <td colspan="3">
                            <textarea id="repairMess" name="repairMess" class="form-control" rows="10" style="" maxlength="200" oninput="autoCountWords(this)"></textarea>
                            <div style="position: relative;left: 440px;bottom: 20px">
                                <span class="num_count" style="color: red" id="numCount">0</span>
                                <span class="num_limit" style="color: red">/200</span>
                            </div>
                        </td>
                        <td class="hint" colspan="1">
                            图片预览：
                        </td>
                        <td class="base_content" colspan="1">
                            <img class="img-responsive" onclick="openPicture(this.src)" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="text-right">
                            <button class="btn btn-danger" type="button" onclick="submitRepair()">提交</button>
                        </td>
                    </tr>
                    <input name="applyStatus" style="display: none" value="1">
                    <input name="roomCode" style="display: none" value="${roomCode}">
                    </tbody>
                </table>
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

        $("#lesson").selectpicker({width: "515px"});//单独设置bootstrap中select的宽度，使其不因选中项宽度过大而被强行撑开
        //更改第一个下选框的选项
        var html = "<option value=''>--请选择--</option>";
        <#list block as item>
        html = html + '<option value="${item.blockCode}">${item.blockName}</option>';
        </#list>
        $("#blockCode").html(html);
        $("#blockCode").selectpicker('refresh');

        <#if roomCode?length gt 0>
        //更改大楼默认选中项
        $('.btn-group:first li').each(function () {
            if ($(this).find('.text').html().substring(0, 1) == '${roomCode?substring(0,1)}') {
                $(this).addClass('selected');
                $('#blockCode').val('${roomCode?substring(0,1)}');
                $('select').val('${roomCode?substring(0,1)}');
                $($('.filter-option')[0]).html($(this).find('.text').html());
                showRoom('${roomCode?substring(0,1)}');
            }
        });

        //更改层数默认选中项
        $('.btn-group:eq(1) li').each(function () {
            if ($(this).find('.text').html().substring(2, 3) == '${roomCode?substring(2,3)}') {
                $(this).addClass('selected');
                $('#roomCode').val('${roomCode?substring(2,3)}');
                $($('.filter-option')[1]).html($(this).find('.text').html());
                showRooms('${roomCode?substring(0,1)}', '${roomCode?substring(2,3)}');
            }
        });

        //更改教室默认选中项
        $('.btn-group:eq(2) li').each(function () {
            if ($(this).find('.text').html().substring(0, 3) == '${roomCode?substring(2)}') {
                $(this).addClass('selected');
                $('#rooms').val('${roomCode?substring(2)}')
                $('#rooms').attr('value','${roomCode?substring(2)}室');
                $($('.filter-option')[2]).html($(this).find('.text').html().substring(0, 3) + '室');
            }
        })
        </#if>
    })

    function openPicture(pic) {
        if(pic) {
            $("#imgInModalID").attr("src", pic);
            $("#showImage_Form").modal();
        }
    }

    function autoCountWords(obj){
        if(obj.value.length>200) {
            obj.value.substr(0, 200)
            return
        }
        $(obj).parent().find('.num_count').html(obj.value.length)
    }

    function submitRepair(){
        var url='${rc.contextPath}/order/submitRepair'

        if ($("#rooms").val() && !$("[name = 'roomCode']").val()){
            $("[name = 'roomCode']").val($("#blockCode").val()+"-"+$("#rooms").val())
        }
        if (!$("[name = 'roomCode']").val()){
            layer.alert("未选教室！",{icon: 6, closeBtn: 0},function (index){
                layer.close(index);
            })
            return
        }
        if (!$("[name='repairImg']")[0].files[0]){
            layer.alert("请上传照片！",{icon: 6, closeBtn: 0},function (index){
                layer.close(index);
            })
            return
        }
        if (!$("#repairObj").val()){
            layer.alert("请选择设备！",{icon: 6, closeBtn: 0},function (index){
                layer.close(index);
            })
            return
        }
        var formData = new FormData();
        formData.append('file', $("[name='repairImg']")[0].files[0]);  //添加图片信息的参数
        formData.append('repairObj',$("#repairObj").val());
        formData.append('repairMess',$("#repairMess").val());
        formData.append('roomCode',$("[name='roomCode']").val());
        formData.append('applyStatus',$("[name='applyStatus']").val());
        $.ajax({
            url: url,
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (data, textStatus) {
                if($.trim(data)=="SUCCESS") {
                    layer.alert("提交成功！", {icon: 6, closeBtn: 0}, function (index) {
                        layer.close(index);
                        location.href = "${rc.contextPath}/order/index"
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
    }

    function show(obj) {
        var img = $(obj).parent().parent().next().find(".img-responsive:eq(0)");
        if (obj.files.length > 0) {
            var file = obj.files[0];
            var reader = new FileReader();
            // Set preview image into the popover data-content
            reader.onload = function (e) {
                img.attr('src', e.target.result);
                img.addClass("img-show");
                img.attr("name", "img-show-" + Date.now().toString(36));
            }
            reader.readAsDataURL(file);
        } else {
            img.removeAttr("src");
            img.removeClass("img-show");
            img.removeAttr("name");
        }

    }
</script>