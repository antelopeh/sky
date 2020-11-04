package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

@Data
public class Student extends BaseModel {

    private Integer id;

    private String code;

    private String name;

    private String sex;

    private String identityCode;

    private String className;

    private String nation;

    private String politics;

    private String enterTime;

    private String birthTime;

    private String isInland;

    private String address;

    private String userCode;

    private String status;

    public Student() {
        this.setStart_row(0);
        this.setPagr_row(10);
    }
}
