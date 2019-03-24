<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/include/include-resource.jspf" %>
<html>
<head>
	<title>로그인</title>
	<style type="text/css">
		.intercept_box1 p{
			color: red;
			font-size: 20px;
			font-weight: 900;
			margin: 150px 0 0 0;
		}
		
		.intercept_box2 p{
			font-size: 12px;
/* 			font-weight: 900; */
			margin: 50px 0 0 0;
		}
		
	</style>
	
 	<script type="text/javascript">
 	
	 	$(document).ready(function(){
			$("#redirect").on("click", function(e){
				e.preventDefault();
				fn_redirect();	
			});
		 
		});
	
		function fn_redirect() {
			 var fmSubmit = new FmSubmit();
			 fmSubmit.setUrl("<c:url value='${returnUrl}' />");
			 fmSubmit.submit();
		 }
		
	</script>
	
</head>
<body>
<div align="center">
	<div class="intercept_box1">
		<p> 권한이 없습니다.</p>
	</div>
	
	<div class="intercept_box2">
		<form name="frm">
			<p> 이전 페이지 가기 ☞  <button type="button" id="redirect">이동</button> </p>
		</form>
		<p>${exceptionMsg }</p>
	</div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>
