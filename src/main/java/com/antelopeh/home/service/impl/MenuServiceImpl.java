package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.MenuMapper;
import com.antelopeh.home.model.Menu;
import com.antelopeh.home.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MenuServiceImpl extends BaseServiceImpl<Menu> implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    protected void setBaseMapper() {
        super.mapper=menuMapper;
    }

    @Override
    public String selectMenuByCode(String menuCode) {
        return menuMapper.selectMenuByCode(menuCode);
    }

    @Override
    public String selectUrlByCode(String meunCode) {
        return menuMapper.selectUrlByCode(meunCode);
    }

    @Override
    public String selectUrlByName(String menuName) {
        return menuMapper.selectUrlByName(menuName);
    }


}
