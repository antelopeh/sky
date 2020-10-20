/*
* Copyright 2016 asiainfo Co. Ltd.  All rights reserved.
* 
* 项目名称 : sdp_zjgw
* 创建日期 : Jun 20, 2016 8:57:51 PM
* 修改历史 : 
*     1. [Jun 20, 2016  8:57:51 PM]创建文件 by WYC
*/
package com.antelopeh.core.base.model;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

/**
 * 添加类/接口功能描述。
 *
 *
 */
@Setter
@Getter
public class BaseModel implements Serializable{

	// 添加变量功能描述。
	private static final long serialVersionUID = -5531773630520088938L;
	
	protected Integer start_row;

	protected Integer pagr_row;
	
	protected String OrderByClause;

	protected String importBatchIdNotEquals;

}

	