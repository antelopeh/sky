package com.antelopeh.home.model;

import java.io.Serializable;
import java.util.Date;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

/**
 * role_menu
 * @author 
 */
@Data
public class RoleMenu extends BaseModel {
    private Integer id;

    private String roleCode;

    private String menuCode;

    private Date updateTime;

    private String remark;

    private Integer status;

    private static final long serialVersionUID = 1L;
}