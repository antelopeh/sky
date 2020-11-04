package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.Dept;

import java.util.List;


public interface DeptMapper extends BaseMapper<Dept> {
    List<Dept> selectClass(String dept);
    List<Dept> selectDept();
}
