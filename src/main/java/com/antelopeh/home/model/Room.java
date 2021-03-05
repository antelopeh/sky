package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

@Data
public class Room extends BaseModel {
    private Integer id;

    private String roomCode;

    private String blockCode;

    private String floor;

    //幕布
    private String haveCurtain;

    //投影仪
    private String haveProjector;

    //话筒
    private String haveMicrophone;

    private String status;

    private static final long serialVersionUID = 1L;
}