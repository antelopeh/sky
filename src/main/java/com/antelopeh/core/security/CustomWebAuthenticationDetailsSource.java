package com.antelopeh.core.security;

import com.antelopeh.core.spring.SpringContextUtil;
import com.antelopeh.core.util.DecriptUtils;
import com.antelopeh.core.util.WebUtils;
import com.antelopeh.home.model.User;
import com.antelopeh.home.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationDetailsSource;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * spring-security安全接口处理。
 *
 */
@Component("customWebAuthenticationDetailsSource")
public class CustomWebAuthenticationDetailsSource implements AuthenticationDetailsSource<HttpServletRequest, WebAuthenticationDetails> {


    @Autowired
    UserService userService;

    /**
     * @see org.springframework.security.authentication.AuthenticationDetailsSource#buildDetails(Object)
     */
    @Override
    public WebAuthenticationDetails buildDetails(HttpServletRequest context) {
        String username = WebUtils.getParameter(context, "userCode");
        String password = WebUtils.getParameter(context, "userPwd");

        if (StringUtils.isEmpty(password)) {
            context.getSession().removeAttribute("userCode");
            context.getSession().removeAttribute("userPwd");
            //setIncrKey(key, context);
            throw new AuthenticationServiceException("密码不能为空！");
        }else{
            if(password.length()>16)
                throw new AuthenticationServiceException("密码长度超出限制，请检查！");
        }
        context.getSession().setAttribute("userPwd", password);

        // 3、处理密码问题（提前自行校验）
        User model = new User();
        model.setUserCode(username);
        model.setUserPwd(DecriptUtils.encodeMD5(password));
        List<User> result= userService.select(model);
        if (result.size() > 0){
            context.getSession().setAttribute("userCode",username);
            context.getSession().setAttribute("userPwd",password);
        }
        return null;
    }
}
