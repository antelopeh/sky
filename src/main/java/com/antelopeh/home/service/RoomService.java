package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.Room;

import java.util.List;

public interface RoomService extends BaseService<Room> {
    List<Room> selectAll(Room room);
    List<String> selectFloor(String blockCode);
    List<Room> selectByBlock(Room room);
    String getCount();
    String getCountByBlock(Room room);
}
