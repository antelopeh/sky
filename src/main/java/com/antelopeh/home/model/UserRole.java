package com.antelopeh.home.model;

import java.io.Serializable;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

/**
 * user_role
 * @author 
 */
@Data
public class UserRole extends BaseModel {
    private Integer id;

    private String userCode;

    private String roleCode;

    private static final long serialVersionUID = 1L;
}