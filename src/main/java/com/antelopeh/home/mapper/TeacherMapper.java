package com.antelopeh.home.mapper;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.home.model.Teacher;

import java.util.List;

public interface TeacherMapper extends BaseMapper<Teacher> {
    List<Teacher> selectAll();
}
