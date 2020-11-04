package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.DeptMapper;
import com.antelopeh.home.model.Dept;
import com.antelopeh.home.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DeptServiceImpl extends BaseServiceImpl<Dept> implements DeptService {

    @Autowired
    private DeptMapper deptMapper;

    @Override
    protected void setBaseMapper() {
        super.mapper = deptMapper;
    }

    @Override
    public List<Dept> selectClass(String dept) {
        return deptMapper.selectClass(dept);
    }

    @Override
    public List<Dept> selectDept() {
        return deptMapper.selectDept();
    }
}
