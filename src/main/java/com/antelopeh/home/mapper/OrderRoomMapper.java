package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.OrderRoom;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface OrderRoomMapper extends BaseMapper<OrderRoom> {
    List<OrderRoom> selectByCode(@Param("blockCode") String blockCode, @Param("roomCode") String roomCode);
    List<OrderRoom> selectBydate(@Param("roomCode") String roomCode, @Param("date") String date);
    List<OrderRoom> selectByweek(@Param("roomCode") String roomCode, @Param("date") String date);
    List<OrderRoom> selectResult(OrderRoom example);
    int insert(OrderRoom example);
}