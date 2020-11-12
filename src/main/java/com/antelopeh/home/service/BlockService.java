package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.Block;

import java.util.List;

public interface BlockService extends BaseService<Block> {
    List<Block> selectAll();
}
