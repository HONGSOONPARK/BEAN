<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-resource.jspf" %>

<title>관리자메인</title>

<style type="text/css">
</style>

<script type="text/javascript">


Kakao.init("${kakaoJsApi}");

$(document).ready(function(){
	
	$("#btn_close").on("click",function(){
		self.close();
	});
	
	$("#btn_unLink").on("click",function(){
		
		var type = "${user.getMember_type()}";
		
		var data = "${token}";
		   
		if(confirm("탈퇴하시겠습니까?")){
			var sendData = JSON.stringify({token: data, type: type });
		 	$.ajax({
				type: "POST",
				url : "<c:url value='/kakao/kakaoDrop.do' />",
				data : sendData,
				dataType: "json",
				contentType:"application/json;charset=UTF-8",
				success : function(data, status, xhr) {
					if(data == 1){
						alert("탈퇴 완료되었습니다. 로그인화면으로 이동합니다.");
	  					window.opener.logout();
						$("#btn_close").trigger("click");
					}
				},
				error: function(jqXHR, textStatus, errorThrown) {
//	 				alert("실패 :"+jqXHR.responseText);
					window.location.href = "<c:url value='/common/503error.do' />";
				}
			});
		}
	});

});

</script>


</head>
<body>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<div>
		<div class="authManagerAdd" align="center">

			<c:if test="${user.getMember_role() ne 'ROLE_ADMIN' }" >
			<button type="button" id="btn_unLink" name="btn_unLink" class="infoBtn">탈퇴하기</button>
			</c:if>
			
			<button type="button" id="btn_close" name="btn_close" class="infoBtn">창닫기</button>
			
			
			<form id="formCodeList" name="formCodeList" />
			<table class="tb_authDetailPopList" id="tb_authDetailPopList">
			    <colgroup>
			    	<col width="20%"/>
			    	<col width="*"/>
			    	<col width="20%"/>
			    	<col width="*"/>
    			</colgroup>
				<tbody>
				<tr>
					<th scope="col">아이디</th>
					<td scope="col">${user.getMember_id() }</td>
					<th scope="col">이름</th>
					<td scope="col">${user.getMember_name() }</td>
				</tr>
				<tr>
					<th scope="col">권한</th>
					<td scope="col">${user.getMember_role_name() }</td>
					<th scope="col">별명</th>
					<td scope="col">${user.getMember_nick() }</td>
				</tr>
				<tr>
					<th scope="col">가입유형</th>
					<td scope="col" colspan="3">${user.getMember_type() }</td>
				</tr>
				</tbody>
			 </table>
			 </form>
			<br/>
		</div>
	
	
	</div>


</body>
</html>