package com.p2p.servlet.userzone;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.p2p.bean.IDCardInfo;
import com.p2p.bean.UserInfo;
import com.p2p.dao.impl.IDCardInfoDaoImpl;

public class UserIdentServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Map<String,String> map = null;
		String realPic=null;
		String filename=null;
		try{
			//创建解析工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List<FileItem> list = upload.parseRequest(req);
			
			map=new HashMap<String,String> ();
			for(FileItem item : list){
				if(item.isFormField()){
					//为普通输入项
					String inputName = item.getFieldName();
					String inputValue = item.getString();
					//System.out.println(inputName+" "+inputValue);
					map.put(inputName, inputValue);
				}else{
					//上传的文件
					String inputName = item.getFieldName();
					filename = item.getName();
					//System.out.println(filename.indexOf('.'));
					filename=UUID.randomUUID().toString() + "_" +System.currentTimeMillis()+filename.substring(filename.indexOf("."));
					//System.out.println(filename);
					InputStream in = item.getInputStream();
					int len = 0;
					byte buffer[] = new byte[1024];
					//filename=UUID.randomUUID().toString()+"_"+filename;
					realPic=this.getServletContext().getRealPath("/pictures")+"\\"+ filename;
					FileOutputStream out = new FileOutputStream(realPic);
					while((len=in.read(buffer))>0){
						out.write(buffer, 0, len);
					}
					in.close();
					out.close();
					map.put(inputName, filename);
					}
				}
			}catch (Exception e) {
				throw new RuntimeException(e);
			}
		UserInfo user = (UserInfo) req.getSession().getAttribute("user");
		int userID = user.getUserID();
		String idNum = map.get("idNum");
		String cardPic = "/p2p/pictures/"+map.get("cardPic");
		String cardPicWithH = "/p2p/pictures/"+map.get("cardPicWithH");
		//System.out.println(idNum+"\t"+cardPic+"\t"+cardPicWithH);
		IDCardInfoDaoImpl iii = new IDCardInfoDaoImpl();
		IDCardInfo idCardInfo = iii.findByUserId(userID);
		if(idCardInfo==null){
			idCardInfo = new IDCardInfo();
			idCardInfo.setUserID(userID);
			idCardInfo.setIdNum(idNum);
			idCardInfo.setCardPic(cardPic);
			idCardInfo.setCardPicWithH(cardPicWithH);
			idCardInfo.setStatus("否");
			iii.addIDCardInfo(idCardInfo);
		}else{
			idCardInfo.setUserID(userID);
			idCardInfo.setIdNum(idNum);
			idCardInfo.setCardPic(cardPic);
			idCardInfo.setCardPicWithH(cardPicWithH);
			idCardInfo.setStatus("否");
			iii.updateIDCardInfo(idCardInfo);
		}
		
		
		resp.sendRedirect("/p2p/userzone/homePage.jsp");
	}

}
