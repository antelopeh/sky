<div id="content-outer">
    <div id="content">
        <h1 class="tab-pane-title">
            <span class="fa fa-search title-icon"></span>
            <b class="title-name">查看申请：</b>
            <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
        </h1>
        <div class="query-form query-form-up" id="matchWrap">
            <form id="select_form" action="${rc.contextPath}/apply/index" method="POST" style="border:none;width: 95%;">
                <table class="query-table" cellspacing="0" cellpadding="0" border="0" width="50%">
                    <tbody>
                    <tr class="hint">
                        <td class="hint">
                            申请时间：
                        </td>
                        <td>
                            <input id="selectDate" name="applyTime" type="date" value="" style="width: 200px;height: 28px;font-size: 18px;color: black;margin:20px 0px 20px 10px"/>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="uuid" value=""/>
            </form>
            <div style="width: 5%;" >
                <button type="button" class="btn btn-block btn-danger btn-filter pt searchbtn"  onclick="search_button('/apply/applyList')" id="search_button" style="position: absolute;right: 36px;top: 30px;width: 90px;" >
                    <span class="fa fa-search">&#12288;查询</span>
                </button>
            </div>

            <div id="tableContainer" class="tableContainer">
                <#include "apply/applyList.ftl">
            </div>

            <@ui.pagination_article />
        </div>
    </div>
</div>
