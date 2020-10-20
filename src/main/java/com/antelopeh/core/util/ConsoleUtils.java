package com.antelopeh.core.util;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 控制台输出工具类。
 * 
 *
 */
public class ConsoleUtils {

	// 日志信息
	private static final Logger LOGGER = LoggerFactory.getLogger(ConsoleUtils.class);

	// 正常信息展示
	private static final String SMILIE = "O^V^O";

	// 异常信息展示
	private static final String BIGCRY = "#^O^#";
	
	/**
	 * 在控制台打印输出DEBUG信息。
	 * 
	 * @param title 标题
	 * @param desc 描述
	 *
	 */
	public static final void trace(String title, String desc) {
		if (LOGGER.isTraceEnabled()) {
			LOGGER.trace(String.valueOf("********************************** DEBUG **********************************"));
			LOGGER.trace(new StringBuilder(SMILIE).append("{").append(clazz()).append("--").append(title).append(":[").append(escape(desc)).append("]}").toString());
		}
	}

	/**
	 * 在控制台打印输出DEBUG信息。
	 * 
	 * @param title 标题
	 * @param desc 描述
	 *
	 */
	public static final void debug(String title, String desc) {
		if (LOGGER.isDebugEnabled()) {
			LOGGER.debug(String.valueOf("********************************** DEBUG **********************************"));
            LOGGER.debug(new StringBuilder(SMILIE).append("{").append(clazz()).append("--").append(title).append(":[").append(escape(desc)).append("]}").toString());
		}
	}

	/**
	 * 在控制台打印输出描述信息。
	 * 
	 * @param title 标题
	 * @param desc 描述
	 *
	 */
	public static final void info(String title, String desc) {
		if (LOGGER.isInfoEnabled()) {
			LOGGER.info(String.valueOf("********************************** INFOS **********************************"));
            LOGGER.info(new StringBuilder(SMILIE).append("{").append(clazz()).append("--").append(title).append(":[").append(escape(desc)).append("]}").toString());
		}
	}

	/**
	 * 在控制台打印输出错误信息。
	 * 
	 * @param title 标题
	 * @param desc 描述
	 *
	 */
	public static final void error(String title, String desc) {
		LOGGER.error(String.valueOf("********************************** ERROR **********************************"));
        LOGGER.error(new StringBuilder(SMILIE).append("{").append(clazz()).append("--").append(title).append(":[").append(escape(desc)).append("]}").toString());
	}

	/**
	 * 过滤掉换行和回车。
	 * 
	 * @param data 数据
	 * @return 处理后数据
	 *
	 */
	private static String escape(String data) {
		if (StringUtils.isNotEmpty(data)) {
			return data.replaceAll("\r|\n", "");
		}
		return data;
	}


	private static String clazz(){
        StackTraceElement[] stackTrace = new RuntimeException().getStackTrace();
        return stackTrace != null && stackTrace.length >=3 ? stackTrace[2].getClassName(): Object.class.toString();
    }
}
