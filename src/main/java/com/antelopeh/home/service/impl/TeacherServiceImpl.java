package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.TeacherMapper;
import com.antelopeh.home.model.Teacher;
import com.antelopeh.home.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TeacherServiceImpl extends BaseServiceImpl<Teacher> implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    protected void setBaseMapper() {
        super.mapper = teacherMapper;
    }

    @Override
    public List<Teacher> selectAll() {
        return teacherMapper.selectAll();
    }

    @Override
    public int getCount() {
        return teacherMapper.getCount();
    }

    @Override
    public Integer getCountForSelect(Teacher stu) {
        return null;
    }
}
