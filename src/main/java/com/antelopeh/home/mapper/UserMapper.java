package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

public interface UserMapper extends BaseMapper<User> {
    List<User> selectAll();
//    List<User> selectByExample(User user);
//    boolean insertUser(User user);
}
