<div id="content-outer">
    <div id="content">
        <h1 class="tab-pane-title">
            <span class="fa fa-search title-icon"></span>
            <b class="title-name">查看消息：</b>
            <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
        </h1>
        <div class="query-form query-form-up" id="matchWrap">
            <form id="select_form" action="${rc.contextPath}/message/index" method="POST" style="border:none;width: 95%;">
                <table class="query-table" cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                    <tr class="hint">
                        <td class="hint">
                            接收时间：
                        </td>
                        <td>
                            <input id="sendTime" name="sendTime" type="date" value="" style="width: 200px;height: 28px;font-size: 18px;color: black;margin:20px 0px 20px 10px"/>
                        </td>
                        <td class="hint">
                            消息内容：
                        </td>
                        <td>
                            <input id="messContent" name="messContent" type="text" value="" style="width: 200px;height: 28px;font-size: 18px;color: black;margin:20px 0px 20px 10px"/>
                        </td>
                        <td class="hint">
                            发送人：
                        </td>
                        <td>
                            <input id="messContent" name="messContent" type="text" value="" style="width: 200px;height: 28px;font-size: 18px;color: black;margin:20px 0px 20px 10px"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="uuid" value=""/>
            </form>
            <div style="width: 5%;" >
                <button type="button" class="btn btn-block btn-danger btn-filter pt searchbtn"  onclick="search_button('/message/messageList')" id="search_button" style="position: absolute;right: 36px;top: 30px;width: 90px;" >
                    <span class="fa fa-search">&#12288;查询</span>
                </button>
            </div>

            <div id="tableContainer" class="tableContainer">
            </div>
            <input type="hidden" id="hiddenList" value="/message/messageList"/>

            <@ui.pagination_article />
        </div>
    </div>
</div>
