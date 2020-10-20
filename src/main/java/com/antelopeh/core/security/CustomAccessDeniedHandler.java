package com.antelopeh.core.security;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandlerImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 权限认证模块异常处理。
 * 
 *
 */
public class CustomAccessDeniedHandler extends AccessDeniedHandlerImpl {

    /**
     * 添加override说明。
     * 
     * @see org.springframework.security.web.access.AccessDeniedHandlerImpl#handle(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, org.springframework.security.access.AccessDeniedException)
     */
    @Override
    public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException) throws IOException, ServletException {
        boolean ajax = ajaxRequest(request);
        if (ajax) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/403");
            dispatcher.forward(request, response);
            super.handle(request, response, accessDeniedException);
        } else if (!response.isCommitted()) {
            super.handle(request, response, accessDeniedException);
        }
    }

    /**
     * 添加方法功能描述。
     * 
     * @param request
     *            请求参数
     * @return 是否为AJAX请求
     *
     */
    private boolean ajaxRequest(HttpServletRequest request) {
        String header = request.getHeader("X-Requested-With");
        return StringUtils.equalsIgnoreCase("XMLHttpRequest", header);
    }

}
