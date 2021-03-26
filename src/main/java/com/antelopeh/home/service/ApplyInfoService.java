package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.ApplyInfo;

import java.util.List;

public interface ApplyInfoService extends BaseService<ApplyInfo> {
    List<ApplyInfo> selectByExample(ApplyInfo example);
    int countByExample(ApplyInfo example);
    ApplyInfo selectByPrimaryKey(Integer id);
    int updateByPrimaryKey(ApplyInfo record);
    int updateByPrimaryKeySelective(ApplyInfo record);
}
