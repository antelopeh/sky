package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.UserMapper;
import com.antelopeh.home.model.User;
import com.antelopeh.home.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    protected void setBaseMapper() {
        super.mapper=userMapper;
    }

    @Override
    public List<User> selectAll() {
        return userMapper.selectAll();
    }

}
