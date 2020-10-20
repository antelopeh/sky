package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.RoleMenu;

import java.util.List;

public interface RoleMenuService extends BaseService<RoleMenu> {
    List<String> selectMenuByRoleCode(String roleCode);
}