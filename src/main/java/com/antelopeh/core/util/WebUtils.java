package com.antelopeh.core.util;

import com.antelopeh.home.common.Constants;
import com.antelopeh.home.common.Operator;
import com.antelopeh.home.model.TabLogin;
import org.apache.commons.lang3.StringUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;
import java.util.Map;

/**
 * 网页开发工具类。
 *
 *
 */
public class WebUtils {

	/**
	 * 属性信息获取。
	 *
	 * @param request 请求对象
	 * @param name 请求名
	 * @return 返回数据
	 *
	 */
	public static Object getAttribute(HttpServletRequest request, String name) {
		return request.getAttribute(name);
	}

	/**
	 * 属性信息获取。
	 *
	 * @param request 请求对象
	 * @param name 请求名
	 * @return 返回数据
	 *
	 */
	public static String getParameter(HttpServletRequest request, String name) {
		return request.getParameter(name);
	}

	/**
	 * 属性信息获取。
	 *
	 * @param request 请求对象
	 * @param name 请求名
	 * @return 返回数据
	 *
	 */
	public static String getAttributeAndParameter(HttpServletRequest request, String name) {
		String result = (String) getAttribute(request, name);
		if (StringUtils.isEmpty(result)) {
			return getParameter(request, name);
		}
		return result;
	}

	/**
	 * 属性信息获取。
	 *
	 * @param request 请求对象
	 * @param name 请求名
	 * @return 返回数据
	 *
	 */
	public static String getParameterAndAttribute(HttpServletRequest request, String name) {
		String result = getParameter(request, name);
		if (StringUtils.isEmpty(result)) {
			return (String) getAttribute(request, name);
		}
		return result;
	}

	/**
	 * 属性信息获取。
	 *
	 * @param request 请求对象
	 * @param name 请求名
	 * @return 返回数据
	 *
	 */
	public static String[] getParameterValues(HttpServletRequest request, String name) {
		return request.getParameterValues(name);
	}

	/**
	 * 属性信息获取。
	 *
	 * @param request 请求对象
	 * @return 返回数据
	 *
	 */
	protected static ApplicationContext getApplicationContext(HttpServletRequest request) {
		return WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
	}

	/**
	 * request获取bean信息。
	 *
	 * @param request 请求对象
	 * @return 返回数据
	 *
	 */
	@SuppressWarnings("unchecked")
	public static <T> T getBean(HttpServletRequest request, String name) {
		return (T) getApplicationContext(request).getBean(name);
	}

	/**
	 * request获取bean信息。
	 *
	 * @param request 请求对象
	 * @param t 参数
	 * @return 返回数据
	 *
	 */
	public static <T> T getBean(HttpServletRequest request, Class<T> t) {
		return getApplicationContext(request).getBean(t);
	}

	// 添加变量功能描述。
	private static final String LIKE = "%";

	/**
	 * 添加方法功能描述。
	 *
	 *
	 */
	public static String wapper(String data) {
		return wapperR(wapperL(data));
	}

	/**
	 * 添加方法功能描述。
	 *
	 *
	 */
	public static String wapperL(String data) {
		if (StringUtils.isNotEmpty(data)) {
			return LIKE.concat(data);
		}
		return LIKE;
	}

	/**
	 * 添加方法功能描述。
	 *
	 *
	 */
	public static String wapperR(String data) {
		if (StringUtils.isNotEmpty(data)) {
			return data.concat(LIKE);
		}
		return LIKE;
	}

	//session
	public static Operator getOperator(HttpServletRequest request) {
		Object operator = request.getSession().getAttribute(Constants._SESSION_OPERATOR_);
		if (operator != null) {
			return (Operator) operator;
		}
		return null;
	}

	public static Map<String, List<String>> getMenuMap(HttpServletRequest request){
		Map<String, List<String>> menuMap = (Map<String, List<String>>) request.getSession().getAttribute(Constants._MENU_MAP_);
		return menuMap;
	}

	public static void setOperator(HttpServletRequest request, Operator operator) {
		request.getSession().setAttribute(Constants._SESSION_OPERATOR_, operator);
	}
	public static void setMenuMap(HttpServletRequest request, Map<String, List<String>> menuMap) {
		request.getSession().setAttribute(Constants._MENU_MAP_, menuMap);
	}
	public static void setTabLogin(HttpServletRequest request, TabLogin tabLogin) {
		request.getSession().setAttribute(Constants._TAB_LOGIN, tabLogin);
	}
	public static void removeOperator(HttpServletRequest request) {
		request.getSession().removeAttribute(Constants._SESSION_OPERATOR_);
	}

	public static void removeTabLogin(HttpServletRequest request) {
		request.getSession().removeAttribute(Constants._TAB_LOGIN);
	}

	public static String loadJSON (String url) {
		StringBuilder json = new StringBuilder();
		try {
			URL httpUrl = new URL(url);
			HttpURLConnection conn  = (HttpURLConnection)httpUrl.openConnection();
			conn.setRequestProperty("contentType", "UTF-8");
			conn.setConnectTimeout(5 * 1000);
			conn.setRequestMethod("GET");
			InputStream inStream = conn.getInputStream();


			BufferedReader in = new BufferedReader(new InputStreamReader(inStream,"UTF-8"));
			String line;
			while((line=in.readLine())!=null){
				json.append(line);
			}
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json.toString();
	}
}
