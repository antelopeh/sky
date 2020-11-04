package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.SysParameters;

import java.util.List;

public interface SysParametersMapper extends BaseMapper<SysParameters> {
    List<SysParameters> selectGrade(SysParameters sysParameters);
}
