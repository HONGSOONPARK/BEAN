<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-resource.jspf" %>

<title>가입</title>

<style type="text/css">
</style>

<script type="text/javascript">

	$(document).ready(function(){
		$("html").css("overflow","hidden"); 
	    var childWindow = window.parent;
	    var parentWindow = childWindow.opener;
	    childWindow.resizeTo(400,300);
// 	    childWindow.opener='nothing';
	    childWindow.open('','_parent','');
	    
		$("#join_btn").on("click",function(){
			 	$.ajax({
					type: "POST",
					url : "<c:url value='/kakao/kakaoPopJoin.do' />",
					dataType: "json",
					contentType:"application/json;charset=UTF-8",
					success : function(data, status, xhr) {
						alert("["+data.membervo.member_id+"/"+data.membervo.member_name+"] 가입완료.\n");		
						childWindow.close(); 
					},
					error: function(jqXHR, textStatus, errorThrown) {
//		 				alert("실패 :"+jqXHR.responseText);
						window.location.href = "<c:url value='/common/503error.do' />";
					}
				});
		});
		
		$("#cancle_btn").on("click",function(){
			childWindow.close();
		});
		
		
		
		
	});

</script>


</head>
<body>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
<!-- 	<div class="kakaoPopDiv"> -->

		<p> 사용자  아이디 : ${kakaoUserId } </p>
		<p> 사용자 이름 : ${kakaoUserName } </p>
		
		<c:if test="${idCnt eq 0 }">
			<p>위 정보로 회원가입을 진행합니다.</p>
			<button type="button" id="join_btn" class="infoBtn">가입하기</button>
		</c:if>

		<c:if test="${idCnt ne 0 }">
			<p>이미 가입되어있습니다. </p> 
			<p>로그인 버튼을 눌러 로그인해주세요.</p>
		</c:if>			
		
		<button type="button" id="cancle_btn" class="infoBtn">취소</button>
<!-- 	</div> -->

</body>
</html>