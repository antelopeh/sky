package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.UserRole;

public interface UserRoleMapper extends BaseMapper<UserRole> {

    String selectRoleCode(String userCode);
}
