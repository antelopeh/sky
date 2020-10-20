/*
 * Copyright 2004, 2005, 2006 Acegi Technology Pty Limited Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing permissions and limitations under the License.
 */

package org.springframework.security.web.authentication;

import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.util.Assert;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Processes an authentication form submission. Called {@code AuthenticationProcessingFilter} prior to Spring Security 3.0.
 * <p>
 * Login forms must present two parameters to this filter: a username and password. The default parameter names to use are contained in the static fields {@link #SPRING_SECURITY_FORM_USERNAME_KEY} and {@link #SPRING_SECURITY_FORM_PASSWORD_KEY}. The
 * parameter names can also be changed by setting the {@code usernameParameter} and {@code passwordParameter} properties.
 * <p>
 * This filter by default responds to the URL {@code /login}.
 *
 * @author Ben Alex
 * @author Colin Sampaleanu
 * @author Luke Taylor
 * @since 3.0
 */
public class UsernamePasswordAuthenticationFilter extends AbstractAuthenticationProcessingFilter {
    // ~ Static fields/initializers
    // =====================================================================================

    public static final String SPRING_SECURITY_FORM_USERNAME_KEY = "username";

    public static final String SPRING_SECURITY_FORM_PASSWORD_KEY = "password";

    public static final String SPRING_SECURITY_FORM_UUID_KEY = "uuid";

    public static final String SPRING_SECURITY_FORM_SESSIONID_KEY = "userCodeSessionID";

    public static final String SPRING_SECURITY_FORM_ACCESS_KEY = "access";

    private String usernameParameter = SPRING_SECURITY_FORM_USERNAME_KEY;

    private String passwordParameter = SPRING_SECURITY_FORM_PASSWORD_KEY;

    private String uuidParameter = SPRING_SECURITY_FORM_UUID_KEY;

    private String sessionidParameter = SPRING_SECURITY_FORM_SESSIONID_KEY;

    private String accessParameter = SPRING_SECURITY_FORM_ACCESS_KEY;

    private boolean postOnly = true;

    // ~ Constructors
    // ===================================================================================================

    public UsernamePasswordAuthenticationFilter() {
        super(new AntPathRequestMatcher("/login", "POST"));
    }

    // ~ Methods
    // ========================================================================================================

    public Authentication attemptAuthentication(HttpServletRequest request, HttpServletResponse response) throws AuthenticationException {
        if (postOnly && !request.getMethod().equals("POST")) {
            throw new AuthenticationServiceException("Authentication method not supported: " + request.getMethod());
        }

        String username = obtainUsername(request);
        String password = obtainPassword(request);
        String uuid = obtainUuid(request);
        String sessionid = obtainSessionid(request);
        String access = obtainAccess(request);

        if (username == null) {
            username = "";
        }

        if (password == null) {
            password = "";
        }

        if (uuid == null) {
            uuid = "";
        }

        if (access == null) {
            access = "";
        }

        if (sessionid == null) {
            sessionid = "";
        }

        username = username.trim();

        UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(username, password, uuid, sessionid, access);

        // Allow subclasses to set the "details" property
        setDetails(request, authRequest);

        return this.getAuthenticationManager().authenticate(authRequest);
    }

    protected String obtainUuid(HttpServletRequest request) {
        return request.getParameter(uuidParameter);
    }

    protected String obtainSessionid(HttpServletRequest request) {
        return request.getParameter(sessionidParameter);
    }

    protected String obtainAccess(HttpServletRequest request) {
        return request.getParameter(accessParameter);
    }
    /**
     * Enables subclasses to override the composition of the password, such as by including additional values and a separator.
     * <p>
     * This might be used for example if a postcode/zipcode was required in addition to the password. A delimiter such as a pipe (|) should be used to separate the password and extended value(s). The <code>AuthenticationDao</code> will need to
     * generate the expected password in a corresponding manner.
     * </p>
     *
     * @param request
     *            so that request attributes can be retrieved
     * @return the password that will be presented in the <code>Authentication</code> request token to the <code>AuthenticationManager</code>
     */
    protected String obtainPassword(HttpServletRequest request) {
        return request.getParameter(passwordParameter);
    }

    /**
     * Enables subclasses to override the composition of the username, such as by including additional values and a separator.
     *
     * @param request
     *            so that request attributes can be retrieved
     * @return the username that will be presented in the <code>Authentication</code> request token to the <code>AuthenticationManager</code>
     */
    protected String obtainUsername(HttpServletRequest request) {
        return request.getParameter(usernameParameter);
    }

    /**
     * Provided so that subclasses may configure what is put into the authentication request's details property.
     *
     * @param request
     *            that an authentication request is being created for
     * @param authRequest
     *            the authentication request object that should have its details set
     */
    protected void setDetails(HttpServletRequest request, UsernamePasswordAuthenticationToken authRequest) {
        authRequest.setDetails(authenticationDetailsSource.buildDetails(request));
    }

    /**
     * Sets the parameter name which will be used to obtain the username from the login request.
     *
     * @param usernameParameter
     *            the parameter name. Defaults to "username".
     */
    public void setUsernameParameter(String usernameParameter) {
        Assert.hasText(usernameParameter, "Username parameter must not be empty or null");
        this.usernameParameter = usernameParameter;
    }

    /**
     * Sets the parameter name which will be used to obtain the password from the login request..
     *
     * @param passwordParameter
     *            the parameter name. Defaults to "password".
     */
    public void setPasswordParameter(String passwordParameter) {
        Assert.hasText(passwordParameter, "Password parameter must not be empty or null");
        this.passwordParameter = passwordParameter;
    }

    /**
     * Defines whether only HTTP POST requests will be allowed by this filter. If set to true, and an authentication request is received which is not a POST request, an exception will be raised immediately and authentication will not be attempted.
     * The <tt>unsuccessfulAuthentication()</tt> method will be called as if handling a failed authentication.
     * <p>
     * Defaults to <tt>true</tt> but may be overridden by subclasses.
     */
    public void setPostOnly(boolean postOnly) {
        this.postOnly = postOnly;
    }

    public final String getUsernameParameter() {
        return usernameParameter;
    }

    public final String getPasswordParameter() {
        return passwordParameter;
    }

    public String getUuidParameter() {
        return uuidParameter;
    }

    public void setUuidParameter(String uuidParameter) {
        this.uuidParameter = uuidParameter;
    }

    public String getSessionidParameter() {
        return sessionidParameter;
    }

    public void setSessionidParameter(String sessionidParameter) {
        this.sessionidParameter = sessionidParameter;
    }

    public String getAccessParameter() {
        return accessParameter;
    }

    public void setAccessParameter(String accessParameter) {
        this.accessParameter = accessParameter;
    }

}