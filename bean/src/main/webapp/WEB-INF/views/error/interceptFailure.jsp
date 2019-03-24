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
			 fmSubmit.setUrl("<c:url value='/login.do' />");
			 fmSubmit.submit();
		 }
		 	

		
	</script>
	
</head>
<body>
<div align="center">
	<div class="intercept_box1">
		<p> 잘못된 접근 입니다.(로그인 후 이용)</p>
	</div>
	
	<div class="intercept_box2">
		<form name="frm">
			<p> 로그인 페이지 가기 ☞  <button type="button" id="redirect">이동</button> </p>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>
