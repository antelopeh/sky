package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.ApplyInfoMapper;
import com.antelopeh.home.model.ApplyInfo;
import com.antelopeh.home.service.ApplyInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplyInfoServiceImpl extends BaseServiceImpl<ApplyInfo> implements ApplyInfoService {
    @Autowired
    private ApplyInfoMapper mapper;

    @Override
    protected void setBaseMapper() {
        super.mapper = mapper;
    }

    @Override
    public List<ApplyInfo> selectByExample(ApplyInfo example) {
        return mapper.selectByExample(example);
    }

    @Override
    public int countByExample(ApplyInfo example) {
        return mapper.countByExample(example);
    }

    @Override
    public ApplyInfo selectByPrimaryKey(Integer id) {
        return mapper.selectByPrimaryKey(id);
    }
}
