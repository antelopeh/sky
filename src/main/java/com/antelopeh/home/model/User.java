package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

@Data
public class User extends BaseModel{
    private Integer id;
    private String userCode;
    private String userPwd;
    private String userNickname;
    private String userName;
    private String userEmail;
    private String userTel;
    private String titleImage;
}
