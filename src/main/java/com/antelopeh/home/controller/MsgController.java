package com.antelopeh.home.controller;

import com.antelopeh.core.util.MyStringUtils;
import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.common.Constants;
import com.antelopeh.home.model.Dept;
import com.antelopeh.home.model.StuSearch;
import com.antelopeh.home.model.Student;
import com.antelopeh.home.model.Teacher;
import com.antelopeh.home.service.DeptService;
import com.antelopeh.home.service.StudentService;
import com.antelopeh.home.service.SysParametersService;
import com.antelopeh.home.service.TeacherService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/msg")
public class MsgController{

    @Autowired
    private DeptService deptService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private SysParametersService sysParametersService;

    @RequestMapping("/teacher")
    public ModelAndView teacher(HttpServletRequest request, HttpServletResponse response, Model model){
        model.addAttribute("menuMap", WebUtils.getMenuMap(request));
        model.addAttribute(Constants.SELECT_RESULT,teacherService.selectAll());
        return new ModelAndView("msg/teacher/selectMsg");
    }
    @RequestMapping("/student")
    public  ModelAndView student(HttpServletRequest request, Model model, StuSearch stu){
        List<Dept> deptList = deptService.selectDept();
        model.addAttribute(Constants.SELECT_COUNTS,studentService.getCount());
        model.addAttribute(Constants.SELECT_PAGE,"1");
        model.addAttribute(Constants.SELECT_RESULT,studentService.selectAll(stu));
        model.addAttribute("grade",sysParametersService.seletGrade());
        model.addAttribute("deptList",deptList);
        model.addAttribute("menuMap", WebUtils.getMenuMap(request));
        return new ModelAndView("msg/student/selectMsg");
    }
    @RequestMapping("stuList")
    @ResponseBody
    public ModelAndView stuList(HttpServletRequest request, HttpServletResponse response, Model model, StuSearch stu){
        if(MyStringUtils.isObjectFieldEmpty(stu)) {
            model.addAttribute(Constants.SELECT_COUNTS,studentService.getCount());
            model.addAttribute(Constants.SELECT_RESULT, studentService.selectAll(stu));
        }
        else {
            model.addAttribute(Constants.SELECT_COUNTS,studentService.getCountForSelect(stu));
            model.addAttribute(Constants.SELECT_RESULT, studentService.selectStu(stu));
        }
        model.addAttribute("stuSearch",stu);
        return new ModelAndView("msg/student/stu_list");
    }
    @RequestMapping("/studentDetails")
    public ModelAndView studentDetails(Model model, String code){
        Student student = new Student();
        student.setCode(code);
        model.addAttribute(Constants.SELECT_RESULT,studentService.select(student));
        return new ModelAndView("msg/student/stu_detail");
    }
}
