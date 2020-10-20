package com.antelopeh.core.base.controller;

import com.antelopeh.core.util.WebUtils;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 添加类/接口功能描述。
 * 
 *
 */
public abstract class BaseController {

	// 方便controller处理，直接使用
	/**
	 * 添加方法功能描述。
	 * 
	 * @param request
	 * @param name
	 * @return
	 *
	 */
	@SuppressWarnings("unchecked")
    public <T> T getBean(HttpServletRequest request, String name) {
		return (T) WebUtils.getBean(request, name);
	}

	// 方便controller处理，直接使用
	/**
	 * 添加方法功能描述。
	 * 
	 * @param request
	 * @param t
	 * @return
	 *
	 */
	public <T> T getBean(HttpServletRequest request, Class<T> t) {
		return WebUtils.getBean(request, t);
	}

	/**
	 * 添加方法功能描述。
	 * 
	 * @param binder
	 *
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@Data
	@NoArgsConstructor
	@AllArgsConstructor
	protected class JsonResult {

		public JsonResult(Boolean success, String message){
			this.success = success;
			this.message = message;
		}

		public JsonResult(Boolean success, Object data){
			this.success = success;
			this.data = data;
		}

		private Boolean success = false;

		private String message;

		private Object data;
	}

}
