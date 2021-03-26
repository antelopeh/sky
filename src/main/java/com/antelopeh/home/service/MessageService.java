package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.Message;

import java.util.List;

public interface MessageService extends BaseService<Message> {

    int deleteByPrimaryKey(Integer id);

    int insert(Message record);

    List<Message> selectByExample(Message record);

    int countByExample(Message record);

    int insertSelective(Message record);

    Message selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Message record);

    int updateByPrimaryKey(Message record);
}
