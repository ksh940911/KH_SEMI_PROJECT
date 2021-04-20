package common;

import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SendSMS {
	
	
	public static int verify(String phone) {
		//System.out.println("phone@SendSMS = " + phone);
		String api_key = "NCSMMVOJHGFYV6PY";
	    String api_secret = "LEXDMHL8HTGYVWSJ0ABOEVYHNHLD1FKA";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone); //수신전화번호
	    params.put("from", "01050048995"); //발신전화번호
	    params.put("type", "SMS");
	    params.put("text", "여기요 인증번호는 [1004]입니다. 위 번호를 인증창에 입력하세요.");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	      return 1;
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	      return 0;
	    }
	}

}
