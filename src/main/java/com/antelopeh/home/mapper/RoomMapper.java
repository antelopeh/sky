package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.Room;

import java.util.List;

public interface RoomMapper extends BaseMapper<Room> {
    List<Room> selectAll();
    List<String> selectFloor(String blockCode);
    List<Room> selectByBlock(Room room);
    String getCount();
    String getCountByBlock(Room room);
}