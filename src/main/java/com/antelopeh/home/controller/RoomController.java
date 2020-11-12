package com.antelopeh.home.controller;

import com.antelopeh.core.util.JsonUtils;
import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/room")
public class RoomController {
    @Autowired
    private RoomService roomService;

    @RequestMapping(value = "/getRoom", produces = "text/html;charset=utf-8")
    @ResponseBody
    public String getRoom(HttpServletRequest request){
        String blockCode= WebUtils.getParameter(request,"blockCode");
        if (blockCode != null) {
            return JsonUtils.toJson(roomService.selectFloor(blockCode));
        }else {
            return "False";
        }
    }
}
