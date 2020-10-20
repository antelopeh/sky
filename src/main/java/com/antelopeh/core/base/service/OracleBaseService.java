package com.antelopeh.core.base.service;

import java.util.List;
import java.util.Map;

public interface OracleBaseService {
	int count();
	
	List<String> selectByPage(Map<String, String> map);
}
