<%@page import="common.SendSMS"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="java.util.HashMap" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="net.nurigo.java_sdk.api.Message"%>
<%@ page import="net.nurigo.java_sdk.exceptions.CoolsmsException" %>    
    
 
    
    
<%@ include file="/WEB-INF/views/common/header.jsp" %>

	<div class="verify-wrapper">
      <form name="idsearchFrm" onsubmit="return false" action="<%= request.getContextPath() %>/member/searchId" method="POST">
        <div class="idsearch">
          <div class="name-phone">
            <ul>
              <li>
                <!-- <input type="text" placeholder="이름 입력"> -->
                <input type="tel" name="telephone" placeholder="(-없이)휴대폰 전화번호 입력">
                <button type="button" class="sms-verify-btn" onclick="sms_verify()">인증</button>
                <input type="hidden" id="verifyid" value="0" />
                <input type="hidden" id="rndNum" value="0"/>
              </li>
              <li>
                <!-- <input type="tel" placeholder="휴대폰 전화번호 입력"> -->
                <input type="text" name="verifycode" placeholder="인증번호 입력">
              </li>
            </ul>
          </div>    
          <button type="submit" onclick="modalOpen()">아이디찾기</button>
          <!-- <button type="button" name="testbtn" onclick="modalOpen()">테스트용</button> --> <!-- test용 -->          
        </div>
      </form>
    </div>
    
    <div class="modal-wrapper" tabindex="-1" role="dialog">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="closebtn" onclick="parent.modalClose()">×</button>
	                <h4 class="modal-title">알림</h4>
	            </div>
	            <div class="modal-body" ></div>
	            <div class="modal-footer">
	                <button type="button" class="chkbtn" onclick="parent.modalClose()">확인</button>
	            </div>
	        </div>
	    </div>
	</div>


<script>
	
	$("[name=telephone]").change(function(){
		$("#verifyid").val(0);
	})



	//휴대폰인증
	function sms_verify(){
		var $tel = $("[name=telephone]").val();
		//console.log($tel);
		if(/^010[0-9]{8}$/.test($tel) == false) {
			alert("유효한 휴대폰 번호를 입력해주세요.");
			$("[name=telephone]").select();
			return false;
	 	}else {
			$(".modal-body").html("인증번호가 전송되었습니다. 확인해주세요");
			$modal.css("display","block");
			
	 	}
		
		$.ajax({
			url: "<%= request.getContextPath() %>/member/searchId",
			method:"POST",
			data:{
				phone:$("[name=telephone]").val()
			},
			success:function(data){
				console.log(data);
				//alert(data);
				$("#verifyid").val(1); //성공시
				$("#rndNum").val(data);
				
			},
			error:function(xhr,status,err){
				console.log(xhr,status,err);
			}
		});
		
		
	 }
	
	
	var $modal = $(".modal-wrapper");
	
	//모달폼 열기
	function modalOpen() {
		if($("[name=telephone]").val() == "" ||  $("[name=verifycode]").val() == "" || $("#verifyid").val() == "0"){
			$(".modal-body").html("먼저 인증을 진행해주세요");
		}
		else if($("[name=verifycode]").val() == $("#rndNum").val()){
			
			$.ajax({
				url: "<%= request.getContextPath() %>/member/searchId",
				method:"POST",
				data:{
					phone:$("[name=telephone]").val(),
					chk:$("#verifyid").val()
				},
				success:function(data){
					console.log(data);
					if(data != null){
						$(".modal-body").html("회원님의 아이디는 [" + data + "]입니다.");
					}else{
						$(".modal-body").html("가입된 회원이 아닙니다.");
					}
						
				},
				error:function(xhr,status,err){
					console.log(xhr,status,err);
				}
			});
			
			$("[name=telephone]").val("");
			$("[name=verifycode]").val("");
			
		}else {
			$(".modal-body").html("잘못된 인증번호입니다.");
		}
		
		
		$modal.css("display","block");
	}

	//모달폼 닫기
	function modalClose() {
		$modal.css("display","none");
		$(".modal-body").html("");
	}
	//모달폼 밖
	$(window).click(function(e){
		var modal = e.target.className;
		
		if(modal == "modal-wrapper"){
			$modal.css("display","none");
			$(".modal-body").html("");
		}
	});

</script>



<%@ include file="/WEB-INF/views/common/footer.jsp" %>