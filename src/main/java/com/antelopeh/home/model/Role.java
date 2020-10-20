package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

import java.io.Serializable;

/**
 * role
 * @author 
 */
@Data
public class Role extends BaseModel {
    private Integer id;

    private String roleCode;

    private String roleName;

    private Integer roleStatus;

    private String remark;

    private static final long serialVersionUID = 1L;
}