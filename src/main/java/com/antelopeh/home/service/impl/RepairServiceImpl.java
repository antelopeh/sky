package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.RepairMapper;
import com.antelopeh.home.model.Repair;
import com.antelopeh.home.service.RepairService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RepairServiceImpl extends BaseServiceImpl<Repair> implements RepairService {
    @Autowired
    private RepairMapper mapper;

    @Override
    protected void setBaseMapper() {
        super.mapper=mapper;
    }

    @Override
    public Repair selectByRoomCode(String roomCode) {
        return mapper.selectByRoomCode(roomCode);
    }

    @Override
    public Repair selectByPrimaryKey(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateByPrimaryKeySelective(Repair repair) {
        return mapper.updateByPrimaryKeySelective(repair);
    }
}
