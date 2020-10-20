package com.antelopeh.home.common;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Map;

@Getter
@Setter
public class Operator implements Serializable {

    private static final long serialVersionUID = 2660789256083607109L;

    private String code;
    
    private String name;

    private String Passwd;

    private String wechat;

    private String province;

    private String region;

    private String county;

    private String email;

    private String phone;

    private String titleimage;
    
    private Map<String,String> roleMap;

}
