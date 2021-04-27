<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>




	<div class="verify-wrapper">
      <form name="pwdsearchFrm" onsubmit="return false" action="<%= request.getContextPath() %>/member/searchPwd" method="POST">
        <div class="pwdsearch">
          <div class="subscribed-email">
            <ul>
              <li>
                <input type="email" name="email" placeholder="가입한 이메일 주소 입력" required="required">
                <span class="err-mail">유효한 이메일 주소 형식이 아닙니다.</span>
                <input type="hidden" class="chkemail" value="0"/>
              </li>
            </ul>
            <p class="txt-mail">입력하신 이메일 주소로 비밀번호 재설정 메일이 발송됩니다.</p>
            <p class="txt-social">소셜 계정 회원은 비밀번호 찾기가 불가능합니다.</p>
            
          </div>    
          <button type="submit">이메일발송</button>
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


$("[name=email]").keyup(function(){
	
	if(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test($("[name=email]").val()) == false) {
		$(".err-mail").css("display","block");
		$(".chkemail").val(1);
	}else {
		$(".err-mail").css("display","none");
		$(".chkemail").val(0);
	}
	
	
	if($("[name=email]").val() == ""){
		$(".err-mail").css("display","none");
		$(".chkemail").val(0);
	}
	
});



var $modal = $(".modal-wrapper");

$(document.pwdsearchFrm).submit(function(){
	console.log($(".chkemail").val());
	
	if($(".chkemail").val() == 0){
		//유효성검사 통과 후
		$.ajax({
			url: "<%= request.getContextPath() %>/member/searchPwd",
			method:"POST",
			data:{
				email:$("[name=email]").val()
			},
			success:function(data){		
				console.log(data);
				if(data != null){
					if(data == "성공"){
						$(".modal-body").html("입력하신 메일로 임시비밀번호를 전송하였습니다. 확인해주세요.");
					}else{
						$(".modal-body").html("Error!");
					}
				}else{
					$(".modal-body").html("가입된 정보가 없습니다.");
				}
			},
			error:function(xhr,status,err){
				console.log(xhr,status,err);
				$(".modal-body").html("xhr,status,err");
			}
		});
		$("[name=email]").val("");
	}else {
		$(".modal-body").html("이메일주소를 확인해주세요.");
	}
	
	
		$modal.css("display","block");
	
	
});

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