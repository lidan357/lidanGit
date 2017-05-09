/**
  * 文件说明
  * @Description:扩展说明
  * @Copyright: 2015 dreamtech.com.cn Inc. All right reserved
  * @Version: V6.0
  */
package com.p2p.util;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**  
 * @Author: feizi
 * @Date: 2015年4月17日 上午9:24:48 
 * @ModifyUser: feizi
 * @ModifyDate: 2015年4月17日 上午9:24:48 
 * @Version:V6.0
 */
public class SendMsgUtil {
	
	/**
	 * 发送短信消息
	  * 方法说明
	  * @Discription:扩展说明
	  * @param phones
	  * @param content
	  * @return
	  * @return String
	  * @Author: feizi
	  * @Date: 2015年4月17日 下午7:18:08
	  * @ModifyUser：feizi
	  * @ModifyDate: 2015年4月17日 下午7:18:08
	 */
	@SuppressWarnings("deprecation")
	public static String sendMsg(String phones,String content){
		
		//短信接口URL提交地址
		String url = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
		MD5keyBean md5 = new MD5keyBean();
		
		Date now = new Date();
		String strNow = format.format(now);
		Map<String, String> params = new HashMap<String, String>();
		String sig = md5.getkeyBeanofStr("ed0f306b17044456bfd9511434cb1002"+"ce96a7911b854af888d245f94028218b"+strNow);
		sig =sig.toLowerCase();
		
		
		params.put("accountSid", "ed0f306b17044456bfd9511434cb1002");
	//	params.put("smsContent", "你是陈勇么？");
		//params.put("to", "15074862611");
		params.put("timestamp", strNow);
		params.put("sig", sig);
		
		
		
		//手机号码，多个号码使用英文逗号进行分割
		params.put("to", phones);
		//将短信内容进行URLEncoder编码
		params.put("smsContent", content);
		
		return HttpRequestUtil.postRequest(url, params);
	}
	
	/**
	 * 随机生成6位随机验证码
	  * 方法说明
	  * @Discription:扩展说明
	  * @return
	  * @return String
	  * @Author: feizi
	  * @Date: 2015年4月17日 下午7:19:02
	  * @ModifyUser：feizi
	  * @ModifyDate: 2015年4月17日 下午7:19:02
	 */
	public static String createRandomVcode(){
		//验证码
		String vcode = "";
		for (int i = 0; i < 6; i++) {
			vcode = vcode + (int)(Math.random() * 9);
		}
		return vcode;
	}
	
	/**
	 * 测试
	  * 方法说明
	  * @Discription:扩展说明
	  * @param args
	  * @return void
	  * @Author: feizi
	  * @Date: 2015年4月17日 下午7:26:36
	  * @ModifyUser：feizi
	  * @ModifyDate: 2015年4月17日 下午7:26:36
	 */
	public static void main(String[] args) {
		System.out.println(sendMsg("18390944386", "【中鑫P2P】您注册中鑫网站的验证码为256487，请于5分钟内正确输入验证码"));
	
	}
}
