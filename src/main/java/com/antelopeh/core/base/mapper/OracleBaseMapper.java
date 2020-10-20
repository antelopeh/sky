package com.antelopeh.core.base.mapper;

import java.util.List;
import java.util.Map;

public interface OracleBaseMapper {
	
	int count();
	
	List<String> selectByPage(Map<String, String> map);
}
