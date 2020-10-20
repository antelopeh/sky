package com.antelopeh.home.model;

import java.io.Serializable;
import java.util.Date;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

/**
 * menu
 * @author 
 */
@Data
public class Menu extends BaseModel {
    private Integer id;

    private String menuCode;

    private String menuName;

    private String menuPcode;

    private String menuUrl;

    private Integer menuSort;

    private String menuStatus;

    private Date updateTime;

    private String remark;

    private static final long serialVersionUID = 1L;
}