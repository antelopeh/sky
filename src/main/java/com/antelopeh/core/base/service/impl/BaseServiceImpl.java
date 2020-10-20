package com.antelopeh.core.base.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.antelopeh.core.base.mapper.BaseMapper;
import com.antelopeh.core.base.service.BaseService;

/**
 * 添加类/接口功能描述。
 *
 *
 */
public abstract class BaseServiceImpl<R> implements BaseService<R> {

	// 添加变量功能描述。
	@Autowired
	protected BaseMapper<R> mapper;

	/**
	 * 添加方法功能描述。
	 *
	 *
	 */
	protected abstract void setBaseMapper();

	/**
	 * 添加override说明。
	 *
	 * @see com.antelopeh.core.base.service.BaseService#select(java.lang.Object)
	 */
	public List<R> select(R record) {
		return mapper.select(record);
	}

	/**
	 * 添加override说明。
	 *
	 * @see com.antelopeh.core.base.service.BaseService#insert(java.lang.Object)
	 */
	public int insert(R record) {
		return mapper.insert(record);
	}

	/**
	 * 添加override说明。
	 *
	 * @see com.antelopeh.core.base.service.BaseService#update(java.lang.Object, java.lang.Object)
	 */
	public int update(R record, R example) {
		return mapper.update(record, example);
	}

	/**
	 * 添加override说明。
	 *
	 * @see com.antelopeh.core.base.service.BaseService#delete(java.lang.Object)
	 */
	public int delete(R record) {
		return mapper.delete(record);
	}

	/**
	 * 添加override说明。
	 *
	 * @see com.antelopeh.core.base.service.BaseService#delete(java.lang.Object)
	 */
	public int count(R record) {
		return mapper.count(record);
	}

	/**
	 * 添加override说明。
	 *
	 * @see com.antelopeh.core.base.service.BaseService#insertListInt(List)
	 */
	public int insertListInt(List<R> list){
		return mapper.insertListInt(list);
	}

}
