package com.antelopeh.core.base.mapper;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* 添加类/接口功能描述。
*
*
*/

public interface BaseMapper<T> {

	/**
	* 添加方法功能描述。
	* 
	* @param record
	* @return
	*
	*/
	int count(T record);

	/**
	* 添加方法功能描述。
	* 
	* @param record
	* @return
	*
	*/
	int delete(T record);
	
    /**
    * 添加方法功能描述。
    * 
    * @param record
    * @return
    *
    */
    int insert(T record);

	/**
	* 添加方法功能描述。
	* 
	* @param record
	* @return
	*
	*/
	List<T> select(T record);

	/**
	* 添加方法功能描述。
	* 
	* @param record
	* @param example
	* @return
	*
	*/
	int update(@Param("record") T record, @Param("example") T example);

	/**
	 * 添加方法功能描述。
	 *
	 * @param list
	 * @return
	 * @author HETONG
	 */
	int insertListInt(@Param("list") List<T> list);

}