package com.antelopeh.home.model;

import com.antelopeh.core.base.model.BaseModel;
import lombok.Data;

@Data
public class Block extends BaseModel {
    private Integer id;

    private String blockCode;

    private String blockName;

    /**
     * 大楼类型:
  1.教学楼
  2.实验楼
     */
    private String blockType;

    private String status;

    private static final long serialVersionUID = 1L;

}