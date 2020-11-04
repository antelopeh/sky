package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * sys_parameters
 * @author 
 */
@Data
public class SysParameters extends BaseModel {
    private Integer paramId;

    private String paramValue;

    private String paramName;

    private String paramDesc;

    private Integer sort;

    private Date creatorTime;

    private String remark;

    private String status;
}