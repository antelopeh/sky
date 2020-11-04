package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.SysParametersMapper;
import com.antelopeh.home.model.SysParameters;
import com.antelopeh.home.service.SysParametersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SysParametersServiceImpl extends BaseServiceImpl<SysParameters> implements SysParametersService {

    @Autowired
    private SysParametersMapper sysParametersMapper;

    @Override
    protected void setBaseMapper() {
        super.mapper=sysParametersMapper;
    }

    @Override
    public List<SysParameters> seletGrade() {
        SysParameters params = new SysParameters();
        params.setStatus("1");
        params.setParamDesc("Grade");
        List<SysParameters> result = sysParametersMapper.selectGrade(params);
        return result;
    }
}
