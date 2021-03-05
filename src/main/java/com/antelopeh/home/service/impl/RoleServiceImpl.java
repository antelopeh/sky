package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.RoleMapper;
import com.antelopeh.home.model.Role;
import com.antelopeh.home.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role> implements RoleService {
    @Autowired
    private RoleMapper roleMapper;

    @Override
    protected void setBaseMapper() {
        super.mapper = roleMapper;
    }

    @Override
    public  List<Role> selectByRoleCode(String roleCode){
        return roleMapper.selectByRoleCode(roleCode);
    }
}
