package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.UserRole;


public interface UserRoleService extends BaseService<UserRole> {
    String selectRoleCode(String userCode);
}