package com.p2p.servlet.userzone;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


import com.p2p.bean.UserInfo;
import com.p2p.dao.impl.PCDaoImpl;

import com.p2p.service.impl.UserInfoServiceImpl;

public class UserDataServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		UserInfo userInfo=(UserInfo) req.getSession().getAttribute("user");
		PCDaoImpl pcDao=new PCDaoImpl();
		UserInfoServiceImpl userSer=new UserInfoServiceImpl();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setHeaderEncoding("utf-8");
		Map<String,String> map=new HashMap<String,String>();;
		List<FileItem> list=null;
		try {
			list = upload.parseRequest(req);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(FileItem item : list){
			if(item.isFormField()){
				//为普通输入项
				String inputName = item.getFieldName();

				String inputValue = item.getString();
				System.out.println(inputName + "="  + inputValue);
				map.put(inputName, inputValue);
			}else{
				
				//代表当前处理的item里面封装的是上传文件
				//C:\Documents and Settings\ThinkPad\桌面\a.txt    a.txt
				String filename = item.getName();  
				System.out.println(filename);
				//生成唯一文件名
				filename=UUID.randomUUID().toString() + "_" +System.currentTimeMillis()+filename.substring(filename.indexOf("."));	
				
				InputStream in = item.getInputStream();
				int len = 0;
				byte buffer[] = new byte[1024];
				FileOutputStream out = new FileOutputStream(this.getServletContext().getRealPath("/upload")+"\\"+ filename);
				while((len=in.read(buffer))>0){
					out.write(buffer, 0, len);
				}		
				
				userInfo.setUserIconAddr("/p2p/upload/"+filename);
				in.close();
				out.close();
				
			}
		}
			
			userInfo.setUserID(userInfo.getUserID());
			userInfo.setEmail(map.get("email"));
			userInfo.setRealName(new String(map.get("realName").getBytes("iso8859-1"),"utf-8"));
			userInfo.setAge(Integer.parseInt(map.get("age")));
			int pid=Integer.parseInt(map.get("province"));
			String pro=pcDao.findPromaryByID(pid).getpName();
			int cid=Integer.parseInt(map.get("city"));
			String city=pcDao.findCityByID(cid).getcName();
			userInfo.setResidence(pro+"-"+city);
			userInfo.setSex(new String(map.get("sex").getBytes("iso8859-1"),"utf-8"));
			userInfo.setEduExp(new String(map.get("eduExp").getBytes("iso8859-1"),"utf-8"));
			userInfo.setMonthInco(Integer.parseInt(map.get("monthInco")));
			userInfo.setJob(new String(map.get("job").getBytes("iso8859-1"),"utf-8"));
			userSer.updateUserInfo(userInfo);
			resp.sendRedirect("/p2p/homePage.action");
	}
	
}	
