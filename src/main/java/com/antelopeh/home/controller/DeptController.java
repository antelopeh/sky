package com.antelopeh.home.controller;

import com.antelopeh.core.util.JsonUtils;
import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/dept")
public class DeptController {
    @Autowired
    private DeptService deptService;

    @RequestMapping(value = "/getClass", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getClass(HttpServletRequest request) {
        String dept= WebUtils.getParameter(request,"dept");
        if (dept != null) {
            return JsonUtils.toJson(deptService.selectClass(dept));
        }else {
            return "False";
        }
    }
}
