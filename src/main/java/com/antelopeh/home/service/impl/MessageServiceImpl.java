package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.MessageMapper;
import com.antelopeh.home.model.Message;
import com.antelopeh.home.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl extends BaseServiceImpl<Message> implements MessageService {
    @Autowired
    private MessageMapper mapper;

    @Override
    protected void setBaseMapper() {
        super.mapper = mapper;
    }

    @Override
    public int deleteByPrimaryKey(Integer id) {
        return mapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Message> selectByExample(Message record) {
        return mapper.selectByExample(record);
    }

    @Override
    public int countByExample(Message record) {
        return mapper.countByExample(record);
    }

    @Override
    public int insertSelective(Message record) {
        return mapper.insertSelective(record);
    }

    @Override
    public Message selectByPrimaryKey(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Message record) {
        return mapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Message record) {
        return mapper.updateByPrimaryKey(record);
    }
}
