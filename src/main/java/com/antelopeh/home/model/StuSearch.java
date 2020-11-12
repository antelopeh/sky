package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

@Data
public class StuSearch extends BaseModel {

    private String stuName;

    private String stuNum;

    private String sex;

    private String grade;

    private String dept;

    private String clas;
}
