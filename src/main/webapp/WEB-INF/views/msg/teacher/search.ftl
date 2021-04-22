<div id="content-outer">
    <div id="content">
        <h1 class="tab-pane-title">
            <span class="fa fa-search title-icon"></span>
            <b class="title-name">教师查询：</b>
            <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
        </h1>content-outer
        <div class="query-form query-form-up" id="matchWrap">
            <form id="select_form" action="${rc.contextPath}/msg/teacherList" method="POST" style="border:none;width: 95%;">
                <table class="query-table" cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                    <tr class="up">
                        <td class="hint last">教师姓名：</td>
                        <td class="last">
                            <input type="text" class="form-control" name="name" id="name"  placeholder="请输入教师姓名">
                        </td>
                        <td class="hint last">教师编码：</td>
                        <td class="last">
                            <input type="text" class="form-control" name="code" id="code"  placeholder="请输入教师编码">
                        </td>
                        <td class="hint">
                            所在院系：
                        </td>
                        <td>
                            <select class="form-control selecter" id="deptName" name="deptName">
                                <option value="">--请选择--</option>
                                <#list deptList as item>
                                    <option value="${item.deptCode}">${item.deptName}</option>
                                </#list>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="uuid" value=""/>
            </form>
            <div style="width: 5%;" >
                <button type="button" class="btn btn-block btn-danger btn-filter pt searchbtn"  onclick="search_button('/msg/teacherList')" id="search_button" style="position: absolute;right: 36px;top: 10px;width: 90px;" >
                    <span class="fa fa-search">&#12288;查询</span>
                </button>
            </div>

            <div id="tableContainer" class="tableContainer">
                <#include "msg/teacher/teacher_list.ftl">
            </div>

            <@ui.pagination_article />
        </div>
    </div>
</div>

<script>
</script>