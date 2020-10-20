package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.Menu;

import java.util.List;

public interface MenuMapper extends BaseMapper<Menu> {
    String selectMenuByCode(String menuCode);
    String selectUrlByCode(String menuCode);
    String selectUrlByName(String menuName);
}
