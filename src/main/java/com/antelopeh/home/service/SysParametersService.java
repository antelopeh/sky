package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.SysParameters;

import java.util.List;

public interface SysParametersService extends BaseService<SysParameters> {
    List<SysParameters> seletGrade();
}