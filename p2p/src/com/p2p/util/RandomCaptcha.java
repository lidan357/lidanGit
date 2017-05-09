package com.p2p.util;

import java.util.Random;
/**
 * 生成六位随机验证码工具类
 * @author Administrator
 *
 */
public class RandomCaptcha {
	
	public static String getCaptcha(){
		Random random = new Random();
		String captcha = "";
		for(int i=0;i<6;i++){
			captcha+=random.nextInt(10);
		}
		return captcha ;
		
	}

	
		public static void main(String[] args) {
			for(int i=0;i<1000;i++){
				System.out.println(getCaptcha());
			}
		}


}
