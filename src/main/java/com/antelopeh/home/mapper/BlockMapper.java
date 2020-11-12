package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.Block;

import java.util.List;

public interface BlockMapper extends BaseMapper<Block> {
    List<Block> selectAll();
}