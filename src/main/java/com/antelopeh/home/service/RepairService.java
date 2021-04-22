package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.Repair;

public interface RepairService extends BaseService<Repair> {
    Repair selectByRoomCode(String roomCode);

    Repair selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Repair repair);
}
