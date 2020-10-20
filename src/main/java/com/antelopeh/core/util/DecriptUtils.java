package com.antelopeh.core.util;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class DecriptUtils {

	public static final String encodeMD5(String input) {
		return encode(input, "MD5");
	}

	public static final String encodeSHA1(String input) {
		return encode(input, "SHA-1");
	}

	// 转换为16进制数据。
	private static String toHex(byte[] b) {
		StringBuffer signInfo = new StringBuffer();
		for (int n = 0; n < b.length; n++) {
			String stmp = Integer.toHexString(b[n] & 0XFF);
			if (stmp.length() == 1) {
				signInfo.append("0");
				signInfo.append(stmp);
			} else {
				signInfo.append(stmp);
			}
		}
		return signInfo.toString();
	}

	protected static final String encode(String input, String type) {
		try {
			MessageDigest alga = MessageDigest.getInstance(type);
			alga.update(input.getBytes(Charset.forName("UTF-8")));
			return toHex(alga.digest());
		} catch (NoSuchAlgorithmException e) {

		}
		return null;
	}
}
