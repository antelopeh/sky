package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.StuSearch;
import com.antelopeh.home.model.Student;

import java.util.List;

public interface StudentService extends BaseService<Student> {
    public List<Student> selectAll(StuSearch stu);
    public List<Student> selectStu(StuSearch stu);
    public int getCount();
    public Integer getCountForSelect(StuSearch stu);
}
