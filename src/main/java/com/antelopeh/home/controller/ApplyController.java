package com.antelopeh.home.controller;

import com.antelopeh.core.base.controller.BaseController;
import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.common.Constants;
import com.antelopeh.home.common.Operator;
import com.antelopeh.home.model.ApplyInfo;
import com.antelopeh.home.model.Message;
import com.antelopeh.home.model.OrderRoom;
import com.antelopeh.home.service.ApplyInfoService;
import com.antelopeh.home.service.BlockService;
import com.antelopeh.home.service.MessageService;
import com.antelopeh.home.service.OrderRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/apply")
public class ApplyController extends BaseController {

    @Autowired
    private BlockService blockService;

    @Autowired
    private OrderRoomService orderRoomService;

    @Autowired
    private ApplyInfoService applyInfoService;

    @Autowired
    private MessageService messageService;

    @RequestMapping("index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Model model) {
        model.addAttribute(Constants.SELECT_COUNTS,applyInfoService.countByExample(new ApplyInfo()));
        model.addAttribute(Constants.SELECT_PAGE,"1");
        Operator operator = WebUtils.getOperator(request);
        ApplyInfo example = new ApplyInfo();
        example.setApplyPerson(operator.getCode());
        for(String key : operator.getRoleMap().keySet()){
            if (key.equals("0")) {
                example.setApplyPerson(null);
            }
        }
        List<ApplyInfo> result = applyInfoService.selectByExample(example);
        model.addAttribute(Constants.SELECT_RESULT,result);
        model.addAttribute("menuMap", WebUtils.getMenuMap(request));
        return new ModelAndView("apply/applyInfo");
    }

    @RequestMapping("/applyList")
    @ResponseBody
    public ModelAndView getApplyList(HttpServletRequest request, HttpServletResponse response, Model model, ApplyInfo applyInfo){
        Operator operator = WebUtils.getOperator(request);
        ApplyInfo example = new ApplyInfo();
        example.setApplyPerson(operator.getCode());
        for(String key : operator.getRoleMap().keySet()){
            if (key.equals("0")) {
                example.setApplyPerson(null);
            }
        }
        List<ApplyInfo> result = applyInfoService.selectByExample(example);
        model.addAttribute(Constants.SELECT_RESULT,result);
        model.addAttribute(Constants.SELECT_COUNTS,applyInfoService.countByExample(applyInfo));
        return new ModelAndView("apply/applyList");
    }

    @RequestMapping("/applyDetails")
    @ResponseBody
    public ModelAndView getApplyDetails(HttpServletRequest request, HttpServletResponse response, Model model ,Integer id) {
        ApplyInfo info = applyInfoService.selectByPrimaryKey(id);
        model.addAttribute(Constants.SELECT_RESULT,info);
        model.addAttribute("block", blockService.selectAll());
        String roomCode = String.join("-",info.getApplyBuild(),info.getApplyRoom());
        OrderRoom example = new OrderRoom();
        example.setRoomCode(roomCode);
//        example.setTimeStart(startTime + 1);
        example.setDateTime(info.getApplyTime());
        model.addAttribute(Constants.EXAMPLE, example);
        model.addAttribute("LESSON", orderRoomService.selectResult(example));
        return new ModelAndView("apply/applyDetails");
    }

    @RequestMapping("/rejectApply")
    @ResponseBody
    public String rejectApply(HttpServletRequest request, HttpServletResponse response, Model model, ApplyInfo applyInfo) {
        applyInfo.setApplyStatus(2);
        int result = applyInfoService.updateByPrimaryKey(applyInfo);
        if (result > 0)
            return "SUCCESS";
        else return "FAILED";
    }

    //事务性回滚,更新和新增一方失败则回滚
    @Transactional(rollbackFor = Exception.class)
    @RequestMapping("/agreeApply")
    @ResponseBody
    public String agreeApply(HttpServletRequest request, HttpServletResponse response, Model model, ApplyInfo applyInfo) {
        try {
            applyInfo.setApplyStatus(1);
            int result = applyInfoService.updateByPrimaryKeySelective(applyInfo);
            applyInfo = applyInfoService.selectByPrimaryKey(applyInfo.getId());

            //将数据转换到Order_Room表中
            Operator operator = WebUtils.getOperator(request);
            OrderRoom orderRoom = new OrderRoom();
            orderRoom.setUser(applyInfo.getApplyPerson());
            orderRoom.setRoomCode(String.join("-", applyInfo.getApplyBuild(), applyInfo.getApplyRoom()));
            String[] lessons = applyInfo.getApplyLesson().split(",");
            orderRoom.setTimeStart(Integer.parseInt(lessons[0]));
            orderRoom.setTimeEnd(Integer.parseInt(lessons[lessons.length - 1]));
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(applyInfo.getApplyTime());
            int i = calendar.get(Calendar.DAY_OF_WEEK) - 1;
            if (i < 0)
                i = 0;
            orderRoom.setWeekTime(String.valueOf(i));
            orderRoom.setDateTime(applyInfo.getApplyTime());
            orderRoom.setStatus("1");
            orderRoom.setRemark(applyInfo.getApplyReason());
            orderRoom.setOperator(operator.getCode());
            int result0 = orderRoomService.insert(orderRoom);

            //发送审核结果消息
            Message example = new Message();
            example.setStatus(0);
            example.setMessType(1);
            example.setThirdId(applyInfo.getId().toString());
            example.setUserCode(applyInfo.getApplyPerson());
            example.setMessTitle("您的教室申请已通过，教室:"+applyInfo.getApplyBuild()+"-"+applyInfo.getApplyRoom()+"，课时:"+applyInfo.getApplyLesson());
            example.setSendUserCode(operator.getName());
            example.setSendTime(new Date());
            messageService.insertSelective(example);
        }catch (Exception e) {
            return "FAILED";
        }
            return "SUCCESS";
    }
}
