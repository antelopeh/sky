package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.Role;

import java.util.List;

public interface RoleMapper extends BaseMapper<Role> {
    List<Role> selectByRoleCode(String roleCode);
}
