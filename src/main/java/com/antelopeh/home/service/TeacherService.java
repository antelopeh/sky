package com.antelopeh.home.service;

import com.antelopeh.core.base.service.BaseService;
import com.antelopeh.home.model.Teacher;

import java.util.List;

public interface TeacherService extends BaseService<Teacher> {
    List<Teacher> selectAll();
}
