package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.RoomMapper;
import com.antelopeh.home.model.Room;
import com.antelopeh.home.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl extends BaseServiceImpl<Room> implements RoomService {

    @Autowired
    private RoomMapper roomMapper;

    @Override
    protected void setBaseMapper() {
        super.mapper=roomMapper;
    }

    @Override
    public List<Room> selectAll(Room room) {
        return roomMapper.selectAll(room);
    }

    @Override
    public List<String> selectFloor(String blockCode) {
        return roomMapper.selectFloor(blockCode);
    }

    @Override
    public List<Room> selectByBlock(Room room) {
        return roomMapper.selectByBlock(room);
    }

    @Override
    public String getCount(){
        return roomMapper.getCount();
    }

    @Override
    public String getCountByBlock(Room room){
        return roomMapper.getCountByBlock(room);
    }

}
