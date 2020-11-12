package com.antelopeh.home.controller;

import com.antelopeh.core.filter.MySessionContext;
import com.antelopeh.core.util.ConsoleUtils;
import com.antelopeh.core.util.JsonUtils;
import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.common.Constants;
import com.antelopeh.home.common.Operator;
import com.antelopeh.home.mapper.UserMapper;
import com.antelopeh.home.model.User;
import com.antelopeh.home.model.UserRole;
import com.antelopeh.home.service.MenuService;
import com.antelopeh.home.service.RoleMenuService;
import com.antelopeh.home.service.UserRoleService;
import com.antelopeh.home.service.UserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class HomeController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private RoleMenuService roleMenuService;

    @Autowired
    private MenuService menuService;

    private MySessionContext mySessionContext=MySessionContext.getInstance();

    @RequestMapping("/index")
    public ModelAndView index() {
        return new ModelAndView("index");
    }

    @RequestMapping("/register")
    @ResponseBody
    public ModelAndView register(HttpServletRequest request,HttpServletResponse response,Model model,User user){
        if (StringUtils.isNotEmpty(user.getUserCode())&&StringUtils.isNotEmpty(user.getUserPwd()))
            userService.insert(user);
        else
            return new ModelAndView("register");
        return new ModelAndView("index");
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest request,HttpServletResponse response,Model model, User user){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        ConsoleUtils.debug("授权用户", authentication.getName());
        user.setUserCode(authentication.getName());
        List<User> users=userService.select(user);
        User Tuser=users.size()>0?users.get(0):null;
        HttpSession session=request.getSession();
        if (Tuser != null ) {
            if (StringUtils.isBlank(Tuser.getTitleImage()))
                Tuser.setTitleImage("/resources/img/default-user.png");
            else
                Tuser.setTitleImage("/resources/img/"+Tuser.getTitleImage());
            WebUtils.setOperator(request,operator(Tuser));

            getMenuMap(request,Tuser.getUserCode());
            model.addAttribute(Constants._MENU_MAP_, WebUtils.getMenuMap(request));

            Cookie cookie=new Cookie("skySession",Tuser.getUserCode()+"-"+session.getId());
            cookie.setPath("/");
            cookie.setMaxAge(24*60*60);
            String url= request.getServerName();
            cookie.setDomain(url);
            response.addCookie(cookie);
            model.addAttribute("user", Tuser);
        }
        return new ModelAndView("login");
    }

    private void getMenuMap(HttpServletRequest request,String userCode) {
        String roleCode = userRoleService.selectRoleCode(userCode);
        List<String> menuCode;
        if (StringUtils.isNotBlank(roleCode)){
            menuCode = roleMenuService.selectMenuByRoleCode(roleCode);
            Map<String, List<String>> MenuMap=new LinkedHashMap<>();
            Map<String, List<String>>map=new HashMap<>();
            List<String> MenuList = new ArrayList<> ();
            List<String> MenuTitleList = new ArrayList<> ();
            for (String menu : menuCode) {
                if (menu.length() <= 2) {
                    MenuTitleList.add(menu);
                    map.put(MenuTitleList.get(MenuTitleList.size()-1),new ArrayList<String>());
                }
            }
            for (String menu : menuCode){
                if (menu.length() > 2)
                    map.get(menu.substring(0,2)).add(menuService.selectMenuByCode(menu));
            }
            for (String key:map.keySet()){
                MenuMap.put(menuService.selectMenuByCode(key),map.get(key));
            }

            //根据权限得到菜单
            WebUtils.setMenuMap(request,MenuMap);
        }
    }

    @RequestMapping("/all")
    @ResponseBody
    public String getAllUser(){
        List<User> users=userService.selectAll();
        return JsonUtils.toJson(users);
    }

    @RequestMapping("logout")
    public ModelAndView logout(HttpServletRequest request,HttpServletResponse response, Model model, User user) {
        HttpSession session=request.getSession();
        mySessionContext.delSession(session);
        return new ModelAndView("redirect:/");
    }

    @RequestMapping("/403")
    public ModelAndView error_403() {
        return new ModelAndView("layout/error/403");
    }


    private Operator operator(User Tuser) {
        Operator operator=new Operator();
        operator.setName(Tuser.getUserName());
        operator.setCode(Tuser.getUserCode());
        operator.setPasswd(Tuser.getUserPwd());
        operator.setEmail(Tuser.getUserEmail());
        operator.setTitleimage(Tuser.getTitleImage());
        return operator;
    }
}
