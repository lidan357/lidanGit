package com.p2p.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


public class DateUtil {
	
	public static String dateToString(Date date,String format){
		if(date!=null&&format!=null){
		SimpleDateFormat dateFormat = new SimpleDateFormat(format);
		return dateFormat.format(date);
		}
		return null;
	}
	
	
	public static Date stringToDate(String date,String format){
		Date d=null;
		if(date!=null&&format!=null){
			SimpleDateFormat sdf = new SimpleDateFormat(format);

		try {
			 d = sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
			}
		}
		return d;
	}
	
	public static int DateToDateDays(Date date1,Date date2){
		int result=(int) ((date1.getTime()-date2.getTime())/(24*60*60*1000));
		return result;
	}
	//已定死初始时间！获得当前的日期时间
	 public static Long daysBetween()  
	    {   
	    	Long day=0l;
	        String data = "2016-08-15 00:00:00";
	        Long data2 = System.currentTimeMillis();
	        java.text.SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	        try {
				Date data1 = df.parse(data);
				Long databegin =  data1.getTime();
				day = (data2-databegin)/(1000*60*60*24);
			} catch (ParseException e) {
				e.printStackTrace();
			}
	       return day;
	    }
	 
	 
	 
	 public static List<String> getRecentlySevenDay(){
		 Date d = new Date();
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 List<String> dates = new ArrayList<String>();
		 for(int i=6;i>=0;i--){
			 String str = sdf.format(d.getTime()-i*24*60*60*1000);
			 dates.add(str);
		 }
		 return dates;
	 }
}
