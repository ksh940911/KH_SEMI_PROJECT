package order.model.service;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class KakaoPay {
	
	private Properties prop = new Properties();
	private String adminKey;
	
	public KakaoPay() {
	}
	
	public void requestKakaoPay() {
		try {
			URL url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			
			String filename = KakaoPay.class.getResource("/kakao-api.properties").getPath();
			StringBuilder sb = new StringBuilder();
			String key = prop.getProperty("adminKey");
			sb.append("KakaoAK ");
			sb.append(key);
			adminKey = sb.toString();
			
			//URL에 요청할때 보낼 헤더 값
			conn.setRequestProperty("Authorization", adminKey);
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
			
			conn.setDoInput(true); //url연결에 성공했을 시 값을 받아올 것인지
			conn.setDoOutput(true); //값을 넣을지 여부(true : ㅇㅇ넣을것)
			
			//URL에 보낼 값을 map에 담기
			Map<String, String> params = new HashMap<String, String>();
			params.put("cid", "TC0ONETIME");
			params.put("partner_order_id", remappingFunction)
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
