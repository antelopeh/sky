<div id="content-outer">
    <div id="content">
        <h1 class="tab-pane-title">
            <span class="fa fa-search title-icon"></span>
            <b class="title-name">学生查询：</b>
            <span class="title-need" style="color:#dd4b39;font-size:16px;font-weight:bold;"></span>
        </h1>
        <div class="query-form query-form-up" id="matchWrap">
            <form id="select_form" action="${rc.contextPath}/msg/student" method="POST" style="border:none;width: 95%;">
                <table class="query-table" cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                    <tr class="up">
                        <td class="hint last">学生姓名：</td>
                        <td class="last">
                            <input type="text" class="form-control" name="stuName" id="stuName"  placeholder="请输入学生姓名">
                        </td>
                        <td class="hint last">学生学号：</td>
                        <td class="last">
                            <input type="text" class="form-control" name="stuNum" id="stuNum"  placeholder="请输入学生学号">
                        </td>
                        <td class="hint">
                            性别：</td>
                        <td>
                            <select class="form-control selecter" id="sex" name="sex" onChange="">
                                <option value="">--请选择--</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="up">
                        <td class="hint">
                            所处年级：
                        </td>
                        <td>
                            <select class="form-control selecter" id="grade" name="grade" onChange="">
                                <option value="">--请选择--</option>
                                <#list grade as item>
                                    <option value="${item.paramId}">${item.paramName}</option>
                                </#list>
                            </select>
                        </td>
                        <td class="hint">
                            所在院系：
                        </td>
                        <td>
                            <select class="form-control selecter" id="dept" name="dept" onChange="showClass(this.value)">
                                <option value="">--请选择--</option>
                                <#list deptList as item>
                                    <option value="${item.deptCode}">${item.deptName}</option>
                                </#list>
                            </select>
                        </td>
                        <td class="hint">
                            所在班级：
                        </td>
                        <td>
                            <select class="form-control selecter" id="clas" name="clas" onChange="">
                                <option value="">--请选择--</option>
                            </select>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                <input type="hidden" name="uuid" value=""/>
            </form>
            <div style="width: 5%;" >
                <button type="button" class="btn btn-block btn-danger btn-filter pt searchbtn"  onclick="search_button('/msg/stuList')" id="search_button" style="position: absolute;right: 36px;top: 60px;width: 90px;" >
                    <span class="fa fa-search">&#12288;查询</span>
                </button>
            </div>

            <div id="tableContainer" class="tableContainer">
                <#include "msg/student/stu_list.ftl">
            </div>

            <@ui.pagination_article />
        </div>
    </div>
</div>

<script>
</script>