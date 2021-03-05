package com.antelopeh.home.controller;

import com.antelopeh.core.base.controller.BaseController;
import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.common.Operator;
import com.antelopeh.home.model.ApplyInfo;
import com.antelopeh.home.service.ApplyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/apply")
public class ApplyController extends BaseController {

    @Autowired
    private ApplyInfoService applyInfoService;

    @RequestMapping("/getList")
    public ModelAndView getApplyList(HttpServletRequest request, HttpServletResponse response, Model model){
        Operator operator = WebUtils.getOperator(request);
        ApplyInfo example = new ApplyInfo();
        example.setApplyPerson(operator.getCode());
        for(String key : operator.getRoleMap().keySet()){
            if (key.equals("0")) {
                example.setApplyPerson(null);
            }
        }
        List<ApplyInfo> result = applyInfoService.selectByExample(example);
        return null;
    }
}
