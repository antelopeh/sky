<div id="content-outer">
    <div id="content">
        <h1 class="tab-pane-title">
            <span class="fa fa-search title-icon"></span>
            <b class="title-name">申请教室：</b>
            <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
        </h1>
        <div class="query-form query-form-up" id="matchWrap">
            <form id="select_form" action="${rc.contextPath}/order/getList" method="POST" style="border:none;width: 95%;">
                <table class="query-table" cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                    <tr class="hint">
                        <td class="hint">
                            所在幢系：
                        </td>
                        <td>
                            <select class="form-control selecter" id="blockCode" name="blockCode" onChange="showRoom(this.value)">
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
                            <select class="form-control selecter" id="roomCode" name="roomCode" onChange="">
                                <option value="">--请选择--</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="up">
                        <td class="hint">
                            是否有幕布：
                        </td>
                        <td>
                            <select class="form-control selecter" id="haveCurtain" name="haveCurtain" onChange="">
                                <option value="">--请选择--</option>
                                <option value="1">有</option>
                                <option value="0">无</option>
                                <option value="9">待维修</option>
                            </select>
                        </td>
                        <td class="hint">
                            是否有投影仪：
                        </td>
                        <td>
                            <select class="form-control selecter" id="haveProjector" name="haveProjector" onChange="">
                                <option value="">--请选择--</option>
                                <option value="1">有</option>
                                <option value="0">无</option>
                                <option value="9">待维修</option>
                            </select>
                        </td>
                        <td class="hint">
                            是否有话筒：
                        </td>
                        <td>
                            <select class="form-control selecter" id="haveMicrophone" name="haveMicrophone" onChange="">
                                <option value="">--请选择--</option>
                                <option value="1">有</option>
                                <option value="0">无</option>
                                <option value="9">待维修</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="uuid" value=""/>
            </form>
            <div style="width: 5%;" >
                <button type="button" class="btn btn-block btn-danger btn-filter pt searchbtn"  onclick="search_button('/order/getList')" id="search_button" style="position: absolute;right: 36px;top: 60px;width: 90px;" >
                    <span class="fa fa-search">&#12288;查询</span>
                </button>
            </div>

            <div id="tableContainer" class="tableContainer">
                <#include "order/room_list.ftl">
            </div>

            <@ui.pagination_article />
        </div>
    </div>
</div>

<script>
</script>