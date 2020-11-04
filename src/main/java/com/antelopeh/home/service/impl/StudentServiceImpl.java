package com.antelopeh.home.service.impl;

import com.antelopeh.core.base.service.impl.BaseServiceImpl;
import com.antelopeh.home.mapper.StudentMapper;
import com.antelopeh.home.model.StuSearch;
import com.antelopeh.home.model.Student;
import com.antelopeh.home.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImpl extends BaseServiceImpl<Student> implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Override
    protected void setBaseMapper() {
        super.mapper = studentMapper;
    }

    @Override
    public List<Student> selectAll(StuSearch stu){
        return studentMapper.selectAll(stu);
    }

    @Override
    public List<Student> selectStu(StuSearch stu) {
        return studentMapper.selectStu(stu);
    }

    @Override
    public int getCount(){
        return studentMapper.getCount();
    }

    @Override

    public Integer getCountForSelect(StuSearch stu){
        return studentMapper.getCountForSelect(stu);
    }
}
