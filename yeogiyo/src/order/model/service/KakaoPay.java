package order.model.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import com.google.gson.Gson;

import order.model.vo.SelectedMenu;

public class KakaoPay {
	
//	private Properties prop = new Properties();
	private String adminKey;
	
	public String requestKakaoPay(String partner_user_id, String orderMenu) {
		DataOutputStream dos = null;
		String kakaoResult = null;
		URL url = null;
		InputStream inputStream = null;
		InputStreamReader inputStreamReader = null;
		BufferedReader bufferedReader = null;
		Properties prop = new Properties();
		
		
		try {
			url = new URL("https://kapi.kakao.com/v1/payment/ready");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("POST");
			
//			String filename = KakaoPay.class.getResource("/kakao-api.properties").getPath();
//			System.out.println("filename@kakao = " + filename);
//			adminKey = prop.getProperty("adminKey");
//			System.out.println("adminKeyProperties@kakao = " + adminKey);
			//key를 properties파일에 담으려고 했는데 왜인지 계속 읽어오질 못한다ㅠㅠ
			adminKey = "KakaoAK 75418995b493f8fec66ecbc9a35492cc";
//			
			//URL에 요청할때 보낼 헤더 값
			conn.setRequestProperty("Authorization", adminKey);
			conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
			
			conn.setDoInput(true); //url연결에 성공했을 시 값을 받아올 것인지 (기본값 true라 안써줘도 된다고 함)
			conn.setDoOutput(true); //값을 넣을지 여부(true : ㅇㅇ넣을것)
			
			//URL에 보낼 값을 map에 담기
			Map<String, String> params = new HashMap<String, String>();
			params.put("cid", "TC0ONETIME");
			
			//주문번호 생성하기
			//주문번호 = 주문테이블의 count를 조회한 값에 +1을 한다
			//(주문 테이블에 insert하기 전이기 때문에 db에서 가져올 수가 없다)
			int countOrder = new OrderService().countOrder();
			String partner_order_id = (String.valueOf(countOrder)) + 1;
			params.put("partner_order_id", "partner_order_id");
			
			params.put("partner_user_id", partner_user_id);
			
			
			Gson gson = new Gson();
			SelectedMenu[] result = gson.fromJson(orderMenu, SelectedMenu[].class);
			int totalPrice = 0;
			int totalAmount = 0;
			for(SelectedMenu sm : result) {
				totalAmount += sm.getAmount();
				totalPrice += sm.getTotalPrice();
			}
			System.out.println("gsonTest@kakao = " + Arrays.toString(result));
			
			String menuName = URLEncoder.encode((result[0].getMenuName() + " 외"), "UTF-8");
			params.put("item_name", (menuName));
			
			String menuId = String.valueOf(result[0].getMenuId());
			params.put("item_code", menuId);
			
			params.put("quantity", String.valueOf(totalAmount)); //상품 수량
			params.put("total_amount", String.valueOf(totalPrice)); //상품 총액
			params.put("tax_free_amount", String.valueOf(totalPrice)); //상품 비과세 금액
			
			//리다이렉트 할 페이지 주소
			//결제승인 요청을하면 approval_url에 넣은 value 값으로 
			//결제절차중 취소를 하면 cancel_url
			//결제가 15분이상 지연되면 faul_url 로 이동시켜준다.
//			params.put("approval_url", "http://localhost:9090/yeogiyo/order/approval.do");
//			params.put("cancel_url", "http://localhost:9090/yeogiyo/views/order/cancel.jsp");
//			params.put("fail_url", "http://localhost:9090/yeogiyo/views/order/fail.jsp");
			params.put("approval_url", "http://kym9129.ddns.net:10000/yeogiyo/order/approval.do");
			params.put("cancel_url", "http://kym9129.ddns.net:10000/yeogiyo/views/order/cancel.jsp");
			params.put("fail_url", "http://kym9129.ddns.net:10000/yeogiyo/views/order/fail.jsp");
			
			//map을 key=value&key=value 형태로 변경 
			String string_params = new String();
			for(Map.Entry<String, String> elem : params.entrySet()) {
				string_params += (elem.getKey() + "=" + elem.getValue() + "&");
			}
			System.out.println("string_params@kakao = " + string_params);
			
			//전송
			OutputStream os = conn.getOutputStream();
			dos = new DataOutputStream(os);
			dos.writeBytes(string_params); 
			dos.writeBytes("Content-Disposition: form-data;");
			dos.writeUTF("한글");
			
			//http response code 받기
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode@kakao = " + responseCode);
			
			//받기
//			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//			kakaoResult = br.readLine();
			
			inputStream = (InputStream) conn.getContent();
			inputStreamReader = new InputStreamReader(inputStream, "UTF-8");
			bufferedReader = new BufferedReader(inputStreamReader);
			
			kakaoResult = bufferedReader.readLine();
			
			
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
//		finally {
//			try {
//				dos.flush();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//			try {
//				dos.close();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		return kakaoResult;
		
	}

}
