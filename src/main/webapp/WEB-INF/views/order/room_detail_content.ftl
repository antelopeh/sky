<div id="content-outer">
    <div id="content">
        <h1 class="tab-pane-title">
            <span class="fa fa-paper-plane title-icon"></span>
            <b class="title-name">教室详情：</b>
            <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
        </h1>
        <div class="query-form query-form-up" id="matchWrap">
            <form id="select_form" enctype="multipart/form-data" action="${rc.contextPath}/order/roomDetail" method="POST"
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
                            所在房间：
                        </td>
                        <td>
                            <input id="roomCode" name="" type="text" value="${_result_.blockCode}-${_result_.roomCode}" style="width: 200px;height: 28px;font-size: 18px;color: black;margin:20px 0px 20px 10px" readonly/>
                        </td>
                    </tr>
                    <tr class="up">
                        <td class="hint" colspan="1">
                            话筒：
                        </td>
                        <td colspan="1">
                            <select class="form-control selecter" id="haveMicrophone" name="haveMicrophone" value="" <#if operator.code != "admin">disabled</#if>>
                                <option value="">--请选择--</option>
                                <option value="0" <#if _result_.haveMicrophone = '0'>selected</#if>>没有</option>
                                <option value="1" <#if _result_.haveMicrophone = '1'>selected</#if>>有</option>
                                <option value="9" <#if _result_.haveMicrophone = '9'>selected</#if>>损坏</option>
                            </select>
                        </td>
                        <td class="hint" colspan="1">
                            投影仪：
                        </td>
                        <td colspan="1">
                            <select class="form-control selecter" id="haveProjector" name="haveProjector" value="" <#if operator.code != "admin">disabled</#if>>
                                <option value="">--请选择--</option>
                                <option value="0" <#if _result_.haveProjector = '0'>selected</#if>>没有</option>
                                <option value="1" <#if _result_.haveProjector = '1'>selected</#if>>有</option>
                                <option value="9" <#if _result_.haveProjector = '9'>selected</#if>>损坏</option>
                            </select>
                        </td>
                        <td class="hint" colspan="1">
                            幕布：
                        </td>
                        <td colspan="1">
                            <select class="form-control selecter" id="haveCurtain" name="haveCurtain" value="" <#if operator.code != "admin">disabled</#if>>
                                <option value="">--请选择--</option>
                                <option value="0" <#if _result_.haveCurtain = '0'>selected</#if>>没有</option>
                                <option value="1" <#if _result_.haveCurtain = '1'>selected</#if>>有</option>
                                <option value="9" <#if _result_.haveCurtain = '9'>selected</#if>>损坏</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="up">
                        <td class="hint" colspan="1">
                            补充信息：
                        </td>
                        <td colspan="3">
                            <textarea id="remark" name="remark" class="form-control" rows="10" style=""
                                      maxlength="200" <#if operator.code != "admin">readonly</#if>>${_result_.remark}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <#if operator.code == "admin">
                                <td colspan="6" class="text-right">
                                    <button class="btn btn-danger" type="button" onclick="updateRoom('${_result_.id}')">更新</button>
                                </td>
                        </#if>
                    </tr>
                    <input name="id" style="display: none" value="${_result_.id}">
                    </tbody>
                </table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="uuid" value=""/>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    function updateRoom(id){
        var url='${rc.contextPath}/order/updateRoom'
        $.ajax({
            url: url,
            type: 'POST',
            async: false,
            data: $('#select_form').serialize(),
            success: function (data, textStatus) {
                if ($.trim(data) == "SUCCESS") {
                    layer.alert("更新成功！", {icon: 6, closeBtn: 0}, function (index) {
                        layer.close(index);
                    });
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                layer.alert('系统错误：' + errorThrown);
            }
        })
    }
</script>