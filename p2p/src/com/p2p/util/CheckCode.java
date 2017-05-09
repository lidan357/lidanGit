package com.p2p.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.util.Random;

//生成验证码的图片
public class CheckCode {
	public static final int WIDTH=130;
	public static final int HEIGHT=38;
	String[] a = new String[4];
	Random random = new Random();
	
	
	public Image getCheckCode(){
		//创建图片对象
		BufferedImage image = new BufferedImage(WIDTH,HEIGHT,BufferedImage.TYPE_INT_RGB);
		//获得画笔
		Graphics g = image.getGraphics();
		
		//绘制背景颜色
		g.setColor(new Color(224,235,244));
		g.fillRect(0, 0, WIDTH, HEIGHT);
		
		//绘制干扰线
		for(int i=0;i<20;i++){
			g.setColor(myColor());
			int x1 = random.nextInt(WIDTH);
			int x2 = random.nextInt(WIDTH);
			int y1 = random.nextInt(HEIGHT);
			int y2 = random.nextInt(HEIGHT);
			g.drawLine(x1, y1, x2, y2);
		}
		
		//绘制字符
		for(int i=0;i<4;i++){
			g.setColor(myColor());
			g.setFont(myFont());
			a[i]=myCode();
			g.drawString(a[i], 30*i, 25);	
		}
		
		
		return image;
	}
	
	

		//获取验证码
	public String codeString(){
		return a[0]+a[1]+a[2]+a[3];
	}

		
		//随机顏色
	private Color myColor() {
		Color color = null;
		int r = random.nextInt(256);
		int g = random.nextInt(256);
		int b = random.nextInt(256);
		color = new Color(r,g,b);
		return color;	
	}
	//随机字体
	private Font myFont() {
		Font font = null;
		int num=random.nextInt(3);
		switch(num){
		case 0:
			font = new Font(null,Font.BOLD | Font.ITALIC,random.nextInt(3)*5+20);
			break;
		case 1:
			font = new Font(null,Font.BOLD| Font.PLAIN,random.nextInt(3)*5+20);
			break;
		case 2:
			font = new Font(null,Font.BOLD| Font.BOLD,random.nextInt(3)*5+20);
		}
		return font;
	}
	//生成随机验证码
	private String myCode() {
		String str="1234567890qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM";
		String s = null;
		Integer index=random.nextInt(61);
		Character c=str.charAt(index);
		s=c.toString();
		return s;
	}
	
}
