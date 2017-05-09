package com.p2p.servlet.borrow;

import java.awt.Image;
import java.awt.image.RenderedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






import com.p2p.util.CheckCode;


public class CheckCodeServlet extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req,resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String op = req.getParameter("op");
		//System.out.println(op);
		if(op.equals("image")){
			CheckCode cc = new CheckCode();
			Image image = cc.getCheckCode();
			String codeString = cc.codeString();//验证码字符串
			//设置响应头通知浏览器以图片的形式打开
			resp.setContentType("image/jpeg");//等同于response.setHeader("Content-Type", "image/jpeg");
			//设置响应头控制浏览器不要缓存
			resp.setDateHeader("expries", -1);
			resp.setHeader("Cache-Control", "no-cache");
			resp.setHeader("Pragma", "no-cache");
			//将随机码存在session中
			req.getSession().setAttribute("codeString", codeString);
			//ImageIO.write((RenderedImage) image, "jpg",new File("E:\\Workspaces\\p2p\\WebRoot\\pictures\\code.jpg"));
			//将图片写给浏览器
			ImageIO.write((RenderedImage) image, "jpg",resp.getOutputStream());
			//System.out.println(codeString);
		}else if(op.equals("code")){
			//设置响应头控制浏览器不要缓存
			resp.setDateHeader("expries", -1);
			resp.setHeader("Cache-Control", "no-cache");
			resp.setHeader("Pragma", "no-cache");
			String codeString = (String) req.getSession().getAttribute("codeString");
			resp.getOutputStream().write(codeString.getBytes());
			//System.out.println(codeString);	
		}
	}
	
	
}
