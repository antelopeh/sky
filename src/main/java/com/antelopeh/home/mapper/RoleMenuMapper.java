package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.RoleMenu;

import java.util.List;

public interface RoleMenuMapper extends BaseMapper<RoleMenu> {
    List<RoleMenu> selectMenu(String roleCode);
}
