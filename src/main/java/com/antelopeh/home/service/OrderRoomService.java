package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.OrderRoom;

import java.util.List;

public interface OrderRoomService extends BaseService<OrderRoom> {
    List<OrderRoom> selectByCode(String blockCode, String roomCode);
    List<OrderRoom> selectBydate(String roomCode, String date);
    List<OrderRoom> selectByweek(String roomCode, String date);
    List<OrderRoom> selectResult(OrderRoom example);
    int insert(OrderRoom example);
}
