package com.user.message;

import java.util.HashMap;

import org.json.simple.JSONObject;

import com.sun.net.httpserver.Authenticator.Result;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

//핸드폰 인증관련 CoolSMS
public class messageApp {
	public static void main(String[] args) {
		String api_key = "NCS9CI1UWC8LFNBC"; //개인용키
	    String api_secret = "RDZZW13SAMYGVSTY7CHRQINZKJ04BH5L"; //개인용 시크릿 키
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", "user_phone"); //수신번호
	    params.put("from", "01035939862"); //발신번호
	    params.put("type", "SMS");
	    params.put("text", "인증번호는" +  "key" +"입니다."); //문자내용
	    params.put("app_version", "test app 1.2"); // application name and version
	    
	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
	   
	}
}


