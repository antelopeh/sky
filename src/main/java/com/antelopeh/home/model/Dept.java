package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

/**
 * dept
 * @author 
 */
@Data
public class Dept extends BaseModel {
    private Integer id;

    private String deptCode;

    private String deptName;

    private String deptFullname;

    private String deptPcode;

    private String deptStatus;

}