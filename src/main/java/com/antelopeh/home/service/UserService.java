package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.DependsOn;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserService extends BaseService<User> {
    List<User> selectAll();
    int updateUser(User record,User example);
}
