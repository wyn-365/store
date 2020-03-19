package com.wang.store.test;

import com.wang.store.utils.MD5Utils;

public class TestMD5 {
	public static void main(String[] args) {
		String md5 = MD5Utils.md5("123");
		System.out.println(md5);
		
	}
}
