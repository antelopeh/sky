package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;
import org.springframework.data.annotation.Id;

@Data
public class User extends BaseModel{
    @Id
    private Integer id;
    private String userCode;
    private String userPwd;
    private String userNickname;
    private String userName;
    private String userEmail;
    private String userTel;
    private String titleImage;
    private String status;
}
