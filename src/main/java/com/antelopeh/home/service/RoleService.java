package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.Role;
import org.springframework.stereotype.Service;

import java.util.List;

public interface RoleService extends BaseService<Role> {
    List<Role> selectByRoleCode(String roleCode);
}