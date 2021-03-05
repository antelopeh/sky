package com.antelopeh.home.controller;

import com.antelopeh.core.base.controller.BaseController;
import com.antelopeh.core.util.DecriptUtils;
import com.antelopeh.core.util.JsonUtils;
import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.common.Constants;
import com.antelopeh.home.common.Operator;
import com.antelopeh.home.model.User;
import com.antelopeh.home.service.RoleMenuService;
import com.antelopeh.home.service.UserRoleService;
import com.antelopeh.home.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/system")
public class SystemController extends BaseController {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private RoleMenuService roleMenuService;

    @RequestMapping("/modify")
    public ModelAndView modifyPerson(HttpServletRequest request, HttpServletResponse response, Model model){
        Operator operator = WebUtils.getOperator(request);
        return new ModelAndView("system/modify");
    }

    @RequestMapping("changePwd")
    @ResponseBody
    public String changePwd(HttpServletRequest request, HttpServletResponse response, User example) throws Exception {
        Operator operator = WebUtils.getOperator(request);
        example.setUserName(operator.getName());
        example.setUserEmail(operator.getEmail());
        example.setUserCode(operator.getCode());
        example.setUserPwd(DecriptUtils.encodeMD5(example.getUserPwd()));
        List<User> result = userService.select(example);
        if (result == null || result.size() != 1) {
            return JsonUtils.toJson("FAILURE:原密码错误或者用户信息失败！");
        }
        User record = new User();
        record.setUserPwd(DecriptUtils.encodeMD5(WebUtils.getParameter(request, "password1")));
        userService.updateUser(record, example);
        return JsonUtils.toJson(Constants.SUCCESS);
    }
}
