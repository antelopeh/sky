package com.antelopeh.core.security;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomerDaoAuthenticationProvider extends DaoAuthenticationProvider {

    private String uuid;

    private String sessionid;

    private String access;

    protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
        if (StringUtils.isEmpty(uuid)) {
            super.additionalAuthenticationChecks(userDetails, authentication);
        }
        if (StringUtils.isEmpty(sessionid)) {
            super.additionalAuthenticationChecks(userDetails, authentication);
        }
        if (StringUtils.isEmpty(access)) {
            super.additionalAuthenticationChecks(userDetails, authentication);
        }
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getSessionid() {
        return sessionid;
    }

    public void setSessionid(String sessionid) {
        this.sessionid = sessionid;
    }


    public String getAccess() {
        return access;
    }

    public void setAccess(String access) {
        this.access = access;
    }

}
