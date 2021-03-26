package com.antelopeh.home.controller;

import com.antelopeh.core.base.controller.BaseController;
import com.antelopeh.core.util.ObjectUtils;
import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.common.Constants;
import com.antelopeh.home.common.Operator;
import com.antelopeh.home.model.ApplyInfo;
import com.antelopeh.home.model.Message;
import com.antelopeh.home.model.OrderRoom;
import com.antelopeh.home.model.Room;
import com.antelopeh.home.service.*;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.*;
import java.util.Calendar;
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
    private MessageService messageService;

    @Autowired
    private OrderRoomService orderRoomService;

    @Autowired
    private ApplyInfoService applyInfoService;

    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Model model){
        model.addAttribute(Constants._MENU_MAP_, WebUtils.getMenuMap(request));
        model.addAttribute("block", blockService.selectAll());
        model.addAttribute(Constants.SELECT_COUNTS,roomService.getCount());
        model.addAttribute(Constants.SELECT_RESULT, roomService.selectAll(new Room()));
        return new ModelAndView("order/index");
    }

    @RequestMapping("getList")
    public ModelAndView getList(HttpServletRequest request, HttpServletResponse response, Model model , Room room){
        if(ObjectUtils.isObjectFieldEmpty(room)) {
            model.addAttribute(Constants.SELECT_COUNTS, roomService.getCount());
            model.addAttribute(Constants.SELECT_RESULT, roomService.selectAll(room));
        }
        else {
            model.addAttribute(Constants.SELECT_COUNTS, roomService.getCountByBlock(room));
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
    public ModelAndView applyRoom(HttpServletRequest request, HttpServletResponse response, Model model, String date, String roomCode) throws ParseException {
        if (StringUtils.isNotBlank(roomCode)){
            if(StringUtils.isBlank(date)) {
                SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
                date=df.format(new Date());//格式化当前日期
            }
            List<OrderRoom> result= orderRoomService.selectByweek(roomCode,date);
            model.addAttribute("block", blockService.selectAll());

            OrderRoom example = new OrderRoom();
            example.setRoomCode(roomCode);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");//注意月份是MM
            example.setDateTime(simpleDateFormat.parse(date));

            model.addAttribute(Constants.EXAMPLE,example);
            model.addAttribute(Constants.SELECT_RESULT,result);
            return new ModelAndView("order/order_line0");
        }
        return new ModelAndView("layout/error/exception");
    }

    @RequestMapping("orderRoom")
    public ModelAndView orderRoom(HttpServletRequest request, HttpServletResponse response,Model model, String baseDate, String roomCode) throws ParseException {
        String weekTime = WebUtils.getParameter(request, "weekTime");
        model.addAttribute(Constants._MENU_MAP_, WebUtils.getMenuMap(request));
        model.addAttribute("block", blockService.selectAll());

        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        if (weekTime != null) {
            if (!weekTime.equals("1"))
                calendar.add(Calendar.DAY_OF_YEAR, dayFormat(Integer.parseInt(weekTime)) - WEEKDAY(baseDate));
            else
                calendar.add(Calendar.DAY_OF_YEAR, dayFormat(Integer.parseInt(weekTime)) - WEEKDAY(baseDate) - 7);//避免日期为周日时显示下周日
        }
        else
            calendar.add(Calendar.DAY_OF_YEAR, 0);
        Date date = calendar.getTime();
        model.addAttribute("date",date);

        OrderRoom example = new OrderRoom();
        example.setRoomCode(roomCode);
//        example.setTimeStart(startTime + 1);
        example.setDateTime(date);
        model.addAttribute(Constants.EXAMPLE, example);
        model.addAttribute(Constants.SELECT_RESULT, orderRoomService.selectResult(example));

        return new ModelAndView("order/orderRoom");
    }

    @ResponseBody
    @RequestMapping("submitApply")
    public String submitApply(HttpServletRequest request, HttpServletResponse response, Model model, ApplyInfo applyInfo) {
        String[] applyLessons = WebUtils.getParameterValues(request,"applyLesson");
        applyInfo.setApplyLesson(StringUtils.join(applyLessons,","));
        Operator operator = WebUtils.getOperator(request);
        applyInfo.setApplyPerson(operator.getCode());
        int result = applyInfoService.insert(applyInfo);
        //发送审核结果消息
        Message example = new Message();
        example.setStatus(0);
        example.setMessType(1);
        example.setUserCode("admin");
        example.setThirdId(applyInfo.getId().toString());
        example.setMessTitle("申请使用教室，教室:"+applyInfo.getApplyBuild()+"-"+applyInfo.getApplyRoom()+"，课时:"+applyInfo.getApplyLesson());
        example.setSendUserCode(operator.getName());
        example.setSendTime(new Date());
        messageService.insertSelective(example);
        if (result == 1)
            return "SUCCESS";
        else
            return "FAILED";
    }

    /*
    将日期转化为周几
     */
    public int WEEKDAY(String baseDate) throws ParseException {
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date date = format.parse(baseDate);
        Instant instant = date.toInstant();
        ZoneId zoneId = ZoneId.systemDefault();
        LocalDate localDate = instant.atZone(zoneId).toLocalDate();
        DayOfWeek day = localDate.getDayOfWeek();
        switch (day){
            case MONDAY:
                return 0;
            case TUESDAY:
                return 1;
            case WEDNESDAY:
                return 2;
            case THURSDAY:
                return 3;
            case FRIDAY:
                return 4;
            case SATURDAY:
                return 5;
            case SUNDAY:
                return 6;
        }
        return -1;
    }

    /*
    将前端的周几转化为后端认定的周几
     */
    public int dayFormat(int weekTime){
        switch (weekTime){
            case 1:
                return 6;
            case 2:
                return 0;
            case 3 :
                return 1;
            case 4:
                return 2;
            case 5 :
                return 3;
            case 6:
                return 4;
            case 7:
                return 5;
        }
        return -1;
    }
}
