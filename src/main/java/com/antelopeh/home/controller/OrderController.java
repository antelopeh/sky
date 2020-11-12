package com.antelopeh.home.controller;

import com.antelopeh.core.base.controller.BaseController;
import com.antelopeh.core.util.MyStringUtils;
import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.common.Constants;
import com.antelopeh.home.model.Block;
import com.antelopeh.home.model.OrderRoom;
import com.antelopeh.home.model.Room;
import com.antelopeh.home.service.BlockService;
import com.antelopeh.home.service.OrderRoomService;
import com.antelopeh.home.service.RoomService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController extends BaseController {

    @Autowired
    private BlockService blockService;

    @Autowired
    private RoomService roomService;

    @Autowired
    private OrderRoomService orderRoomService;

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Model model){
        model.addAttribute(Constants._MENU_MAP_, WebUtils.getMenuMap(request));
        model.addAttribute("block", blockService.selectAll());
        model.addAttribute(Constants.SELECT_COUNTS,roomService.getCount());
        model.addAttribute(Constants.SELECT_RESULT, roomService.selectAll());
        return new ModelAndView("order/index");
    }

    @RequestMapping("getList")
    public ModelAndView getList(HttpServletRequest request, HttpServletResponse response, Model model , Room room){
        if(MyStringUtils.isObjectFieldEmpty(room)) {
            model.addAttribute(Constants.SELECT_COUNTS,roomService.getCount());
            model.addAttribute(Constants.SELECT_RESULT, roomService.selectAll());
        }
        else {
            model.addAttribute(Constants.SELECT_COUNTS,roomService.getCountByBlock(room));
            model.addAttribute(Constants.SELECT_RESULT, roomService.selectByBlock(room));
        }
        return new ModelAndView("order/room_list");
    }

    @RequestMapping("roomDetail")
    public ModelAndView roomDetail(HttpServletRequest request, HttpServletResponse response, Model model , Room room){
        model.addAttribute(Constants._MENU_MAP_, WebUtils.getMenuMap(request));
        model.addAttribute(Constants.SELECT_RESULT,orderRoomService.selectByCode(room.getBlockCode(),room.getRoomCode()));
        return new ModelAndView("order/room_Details");
    }

    @RequestMapping("orderLine")
    @ResponseBody
    public ModelAndView orderLine(HttpServletRequest request, HttpServletResponse response, Model model, String date, String roomCode){
        if (StringUtils.isNotBlank(roomCode)&&StringUtils.isNotBlank(date)){
            roomCode=roomCode.split(" ")[1];
            List<OrderRoom> result= orderRoomService.selectBydate(roomCode,date);
            if (result.isEmpty())
                return null;
            model.addAttribute(Constants.SELECT_RESULT,result);
            return new ModelAndView("order/order_line");
        }
        return new ModelAndView("layout/error/exception");
    }

    @RequestMapping("apply")
    @ResponseBody
    public ModelAndView applyRoom(HttpServletRequest request, HttpServletResponse response, Model model, String date, String roomCode){
        if (StringUtils.isNotBlank(roomCode)){
            if(StringUtils.isBlank(date)) {
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
                date=df.format(new Date());//格式化当前日期
            }
            List<OrderRoom> result= orderRoomService.selectByweek(roomCode,date);
            model.addAttribute(Constants.SELECT_RESULT,result);
            return new ModelAndView("order/order_line0");
        }
        return new ModelAndView("layout/error/exception");
    }
}
