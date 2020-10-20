package com.antelopeh.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/msg")
public class MsgController{

    @RequestMapping("/teacher")
    public ModelAndView teacher(){
        return new ModelAndView("msg/teacher/selectMsg");
    }
}
