package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.Dept;

import java.util.List;

public interface DeptService extends BaseService<Dept> {
    List<Dept> selectClass(String dept);
    List<Dept> selectDept();
}