package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.StuSearch;
import com.antelopeh.home.model.Student;

import java.util.List;

public interface StudentMapper extends BaseMapper<Student> {
    List<Student> selectAll(StuSearch stu);
    List<Student> selectStu(StuSearch stu);
    Integer getCount();
    Integer getCountForSelect(StuSearch stu);
}
