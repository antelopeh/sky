package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.RoleMenuMapper;
import com.antelopeh.home.model.RoleMenu;
import com.antelopeh.home.service.RoleMenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class RoleMenuServiceImpl extends BaseServiceImpl<RoleMenu> implements RoleMenuService {

    @Autowired
    private RoleMenuMapper roleMenuMapper;

    @Override
    protected void setBaseMapper() {
        super.mapper=roleMenuMapper;
    }

    @Override
    public List<String> selectMenuByRoleCode(String roleCode) {
        List<String> menus = new ArrayList<>();
        for (RoleMenu roleMenu : roleMenuMapper.selectMenu(roleCode)){
            menus.add(roleMenu.getMenuCode());
        }
        return menus;
    }
}
