package com.antelopeh.core.base.service;

import java.util.List;

/**
* 添加类/接口功能描述。
*

*/
public interface BaseService<R> {

	/**
	* 添加方法功能描述。
	* 
	* @param exmple
	* @return
	*/
	List<R> select(R exmple);

	/**
	* 添加方法功能描述。
	* 
	* @param record
	* @return
	*/
	int insert(R record);

	/**
	* 添加方法功能描述。
	* 
	* @param record
	* @param example
	* @return
	*/
	int update(R record,R example);

	/**
	* 添加方法功能描述。
	* 
	* @param record
	* @return
	*/
	int delete(R record);

	/**
	 * 添加方法功能描述。
	 *
	 * @param record
	 * @return
	 */
	int count(R record);

	/**
	 * 添加方法功能描述。
	 *
	 * @param list
	 * @return
	 * @author HETONG
	 */
	int insertListInt(List<R> list);

}
