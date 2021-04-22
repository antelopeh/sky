package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.ApplyInfo;
import com.antelopeh.home.model.Message;
import com.antelopeh.home.model.Repair;

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

    void sendExamine(ApplyInfo applyInfo, String userCode);

    void sendRepair(Repair repair, String userCode);
}
