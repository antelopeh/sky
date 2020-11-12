package com.antelopeh.home.model;

import lombok.Data;

import java.io.Serializable;
import java.util.Date;

/**
 * order_room
 * @author 
 */
@Data
public class OrderRoom implements Serializable {
    private Integer id;

    private String roomCode;

    private String user;

    private Date dateTime;

    private Integer timeStart;

    private Integer timeEnd;

    private Integer isForLesson;

    private Integer isForOrganization;

    private String lessonCode;

    private String organizationCode;

    private String operator;

    private String remark;

    private String status;

    private String weekTime;

    private static final long serialVersionUID = 1L;

}