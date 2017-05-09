package com.p2p.servlet.borrow;

import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
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

import com.p2p.bean.LoanInfo;
import com.p2p.bean.MorGoods;
import com.p2p.bean.UserInfo;
import com.p2p.dao.impl.LoanInfoDaoImpl;
import com.p2p.dao.impl.MorGoodsDaoImpl;
import com.p2p.dao.impl.UserInfoDaoImpl;
import com.p2p.util.DateUtil;

public class BorrowServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			doPost(req,resp);
		
	
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
		Map<String,String> map=null;
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
					map.put(inputName, inputValue);
				}else{
					//代表当前处理的item里面封装的是上传文件
					//C:\Documents and Settings\ThinkPad\桌面\a.txt    a.txt
					filename = item.getName();
					//System.out.println(filename.indexOf('.'));
					filename=UUID.randomUUID().toString() + "_" +System.currentTimeMillis()+filename.substring(filename.indexOf("."));
					//System.out.println(filename);
					InputStream in = item.getInputStream();
					BufferedInputStream bis = new BufferedInputStream(in);
					int len = 0;
					byte buffer[] = new byte[1024];
					//filename=UUID.randomUUID().toString()+"_"+filename;
					realPic=this.getServletContext().getRealPath("/pictures")+"\\"+ filename;
					FileOutputStream out = new FileOutputStream(realPic);
					while((len=bis.read(buffer))>0){
						out.write(buffer, 0, len);
					}
					in.close();
					out.close();
				}
			}
		}catch (Exception e) {
			throw new RuntimeException(e);
		}
			
		String loanMoney=map.get("loanMoney");
		String inter=map.get("inter");
		String deadLine=map.get("deadLine");
		String morgood=map.get("morgoods");
		String year=map.get("year");
		String month=map.get("month");
		String day=map.get("day");
		String goods_descr=map.get("goods_descr");
		String loan_descr=map.get("loan_descr");
		
		
		String buyDate = year+""+month+""+day;	
		//System.out.println(buyDate);
		morgood = new String(morgood.getBytes("ISO8859-1"),"utf-8");
		buyDate = new String(buyDate.getBytes("ISO8859-1"),"utf-8");	
		goods_descr = new String(goods_descr.getBytes("ISO8859-1"),"utf-8");				
		loan_descr = new String(loan_descr.getBytes("ISO8859-1"),"utf-8");
		
		//String checkCode = req.getParameter("checkCode");
		//checkCode = new String(checkCode.getBytes("ISO8859-1"),"utf-8");
		/*System.out.println(realName+"\t"+loanMoney+"\t"+inter+"\t"+deadLine+"\t"+phone+"\t"+morgood+"\t"+buyDate+"\t"+goods_descr+"\t"
     			+image_src+"\t"+loan_descr+"\t"+checkCode);*/
		
		UserInfoDaoImpl userdao = new UserInfoDaoImpl();
		UserInfo user = (UserInfo) req.getSession().getAttribute("user");
		
		
		//添加LoanInfo
		LoanInfoDaoImpl loandao = new LoanInfoDaoImpl();
		LoanInfo loanInfo = new LoanInfo();
		loanInfo.setUserID(user.getUserID());
		loanInfo.setLoanMoney(Float.parseFloat(loanMoney));
		loanInfo.setLoanType("抵押");
		loanInfo.setInter(Float.parseFloat(inter));
		loanInfo.setLoanDate(new java.sql.Date(new java.util.Date().getTime()));
		loanInfo.setDeadLine(Integer.parseInt(deadLine));
		loanInfo.setDescr(loan_descr);
		loanInfo.setStatus("审核中");
		
		int maxID = loandao.addLoanInfo(loanInfo);
		
		//添加MorGoods
		MorGoodsDaoImpl goodsdao = new MorGoodsDaoImpl();
		MorGoods morGoods = new MorGoods();
		morGoods.setMorType(morgood);
		morGoods.setBuyTime(new java.sql.Date(DateUtil.stringToDate(buyDate, "yyyy-MM-dd").getTime()));
		morGoods.setLoanID(maxID);
		morGoods.setDescr(goods_descr);
		morGoods.setRealPic("/p2p/pictures/"+filename);
		goodsdao.addMorGoods(morGoods);
		
	}
	
}
