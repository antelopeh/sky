package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

import java.util.Date;

@Data
public class Teacher extends BaseModel {

    private Integer id;

    private String code;

    private String name;

    private String sex;

    private String identityCode;

    private String deptName;

    private String nation;

    private String politics;

    private Date birthTime;

    private String address;

    private String userCode;

    private String status;

}
