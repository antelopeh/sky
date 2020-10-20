package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Data
public class TabLogin extends BaseModel {
    private Long id;

    private String userId;

    private Date loginTime;

    private Date outTime;

    private String onlineTime;
    
    private String loginType;
    
    private String loginIp;
    
    private String loginAddress;
    
    private String remark;
    
    private String num;
    
    private String sessionId;

    private static final long serialVersionUID = -781098152618497227L;
//修改
    private String loginMonth;

    private String region;


}