package com.antelopeh.home.controller;

import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.common.Constants;
import com.antelopeh.home.common.Operator;
import com.antelopeh.home.model.ApplyInfo;
import com.antelopeh.home.model.Message;
import com.antelopeh.home.service.MessageService;
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
@RequestMapping("/message")
public class MessageController {

    @Autowired
    private MessageService messageService;

    @RequestMapping("index")
    public ModelAndView index(HttpServletRequest request, HttpServletResponse response, Model model) {
        Operator operator = WebUtils.getOperator(request);
        Message message = new Message();
        message.setUserCode(operator.getCode());
        model.addAttribute(Constants.SELECT_COUNTS,messageService.countByExample(message));
        model.addAttribute(Constants.SELECT_PAGE,"1");
        Message example = new Message();
        example.setSendUserCode(operator.getCode());
        List<Message> result = messageService.selectByExample(example);
        model.addAttribute(Constants.SELECT_RESULT,result);
        model.addAttribute("menuMap", WebUtils.getMenuMap(request));
        return new ModelAndView("message/messageInfo");
    }

    @RequestMapping("/messageList")
    @ResponseBody
    public ModelAndView getmessageList(HttpServletResponse response, HttpServletRequest request, Model model) {
        Operator operator = WebUtils.getOperator(request);
        Message message = new Message();
        message.setUserCode(operator.getCode());
        model.addAttribute(Constants.SELECT_RESULT,messageService.selectByExample(message));
        return new ModelAndView("message/messageList");
    }

    @RequestMapping("/details")
    public ModelAndView getmessageDetails(HttpServletRequest request, Model model, int id){
        Message example = new Message();
        example.setId(id);
        Message message = messageService.selectByExample(example).get(0);
        model.addAttribute(Constants.SELECT_RESULT,message);
        return new ModelAndView("message/mess_details");
    }

    @RequestMapping("/readMsg")
    @ResponseBody
    public String readMsg(HttpServletRequest request, Model model, int id){
        Message message = new Message();
        message.setId(id);
        message.setStatus(1);
        messageService.updateByPrimaryKeySelective(message);
        return "SUCCESS";
    }
}
