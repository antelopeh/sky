package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface MenuService extends BaseService<Menu> {
    String selectMenuByCode(String menuCode);
    String selectUrlByCode(String meunCode);
    String selectUrlByName(String menuName);
}