package com.fumin.food.util;

import java.security.MessageDigest;

public class MD5 {
	/**
	 * 获取散列后的密文
	 * @param s 散列前的原文
	 * @return 散列后的密文
	 */
	public final static String getEncode(String s) {      
        String text = get32(s);
        text = get32(text + s);
        return text;
    }
	
	private final static char md5HexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};	
	/**
	 * 获取32位的散列密文
	 * @param s 要散列的原文
	 * @return 密文
	 */
	private final static String get32(String s) {
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = md5HexDigits[byte0 >>> 4 & 0xf];
                str[k++] = md5HexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        
    }
	/**
	 * 获取16位的散列密文
	 * @param s 要散列的原文
	 * @return 密文
	 */
	@SuppressWarnings("unused")
	private final static String get16(String s) {       
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length-4;
            char[] str = new char[16];
            int k = 0;
            for (int i = 4; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = md5HexDigits[byte0 >>> 4 & 0xf];
                str[k++] = md5HexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
        
    }
}
