package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.UserRoleMapper;
import com.antelopeh.home.model.UserRole;
import com.antelopeh.home.service.UserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserRoleServiceImpl extends BaseServiceImpl<UserRole> implements UserRoleService {

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Override
    protected void setBaseMapper() {

    }

    @Override
    public String selectRoleCode(String userCode) {
        return userRoleMapper.selectRoleCode(userCode);
    }
}
