package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

@Data
public class Room extends BaseModel {
    private Integer id;

    private String roomCode;

    private String blockCode;

    private String status;

    private static final long serialVersionUID = 1L;
}