package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.OrderRoomMapper;
import com.antelopeh.home.model.OrderRoom;
import com.antelopeh.home.service.OrderRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderRoomServiceImpl extends BaseServiceImpl<OrderRoom> implements OrderRoomService {

    @Autowired
    private OrderRoomMapper orderRoomMapper;

    @Override
    protected void setBaseMapper() {
        super.mapper=orderRoomMapper;
    }

    @Override
    public List<OrderRoom> selectByCode(String blockCode, String roomCode) {
        return orderRoomMapper.selectByCode(blockCode,roomCode);
    }

    @Override
    public List<OrderRoom> selectBydate(String roomCode, String date) {
        return orderRoomMapper.selectBydate(roomCode,date);
    }

    @Override
    public List<OrderRoom> selectByweek(String roomCode, String date) {
        return orderRoomMapper.selectByweek(roomCode, date);
    }

    @Override
    public List<OrderRoom> selectResult(OrderRoom example) {
        return orderRoomMapper.selectResult(example);
    }


}
