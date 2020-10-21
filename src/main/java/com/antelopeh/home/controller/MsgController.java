package com.antelopeh.home.controller;

import com.antelopeh.core.util.WebUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/msg")
public class MsgController{

    @RequestMapping("/teacher")
    public ModelAndView teacher(HttpServletRequest request, HttpServletResponse response, Model model){
        model.addAttribute("menuMap", WebUtils.getMenuMap(request));
        return new ModelAndView("msg/teacher/selectMsg");
    }
}
