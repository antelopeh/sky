package com.antelopeh.home.controller;

import com.antelopeh.core.base.controller.BaseController;
import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.common.Constants;
import com.antelopeh.home.common.Operator;
import com.antelopeh.home.model.ApplyInfo;
import com.antelopeh.home.model.OrderRoom;
import com.antelopeh.home.service.ApplyInfoService;
import com.antelopeh.home.service.BlockService;
import com.antelopeh.home.service.OrderRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
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
}
