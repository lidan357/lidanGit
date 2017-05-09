package com.p2p.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

public class UploadFile {
	private  FileInputStream fis;
	private  FileOutputStream fos;
	//private  FileOutputStream fos2;
	
	//传入要上传的图片路径，并返回上传后的图片名
	public String uploadImage(File file){
		String imageName = new Date().getTime()+".jpg";
		String path = this.getClass().getClassLoader().getResource("/").getPath();
		path = path.substring(0, path.length()-16);
//		System.out.println(path);
		String dir =path+"pictures/"+imageName;
		try {
			fis = new FileInputStream(file);
			fos = new FileOutputStream(dir);
			//fos2 = new FileOutputStream("E:\\Workspaces\\p2p\\WebRoot\\pictures\\"+imageName);
			byte[] b =new byte[1024];
			while(fis.read(b)!=-1){
				fos.write(b, 0, b.length);
				//fos2.write(b, 0, b.length);
			}
			//System.out.println(new Date().getTime());
			fis.close();
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return imageName;
	}
	

}
