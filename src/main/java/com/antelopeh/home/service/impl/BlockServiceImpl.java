package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.BlockMapper;
import com.antelopeh.home.model.Block;
import com.antelopeh.home.service.BlockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BlockServiceImpl extends BaseServiceImpl<Block> implements BlockService {

    @Autowired
    private BlockMapper blockMapper;

    @Override
    protected void setBaseMapper() {
        super.mapper=blockMapper;
    }

    @Override
    public List<Block> selectAll(){
        return blockMapper.selectAll();
    }
}
