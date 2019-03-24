<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<meta http-equiv="X-UA-Compatible" content="IE=11"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<html>

<head>
<%@ include file="/WEB-INF/include/include-resource.jspf" %>
	<title>로그인</title>
 	<script type="text/javascript">
	 	$(document).ready(function(){

	 		
	 		
	 		$("#loginid").focus();	 

			$("#enter_btn").on("click",function(){
				 form_submit();
			});
			
			$("#enter_abtn").on("click",function(){
				$("#loginid").val("admin");
				$("#loginpwd").val("admin");
				form_submit();
			});
			
			$("#enter_gbtn").on("click",function(){
				$("#loginid").val("guest");
				$("#loginpwd").val("guest");
				
				 form_submit();
			});
			
			
			
	 		$("#kakaoAuth").on("click", function(){
	 			kakaoAuth("join");
	 		});
			
			$("#kakaoMember").on("click",function(){
				
				kakaoAuth("login");
			});
			
			// 로그아웃
			$("#kakaoLogout").on("click",function(){ Kakao.Auth.logout(function(){ }); });
			
			// 연결상태
			$("#kakaoStatus").on("click",function(){ Kakao.Auth.getStatus(function(statusObj){ });});

			// 앱연결 해제
			$("#kakaoDrop").on("click",function(){ Kakao.Auth.login({ persistAccessToken: true, persistRefreshToken: true, success: function(authObj) { kakaoDrop(authObj.access_token); }, fail: function(err) { console.log(err); } }); });
				
			// id, password placeholder 기능
			$("#loginid").on("focus", function(){ if($(this).val() != "아이디"){ $(this).removeClass("input_pre"); }else{ $(this).val("").removeClass("input_pre"); }   }).on("blur", function() { if($(this).val() == "" || $(this).val() == null ){ $(this).val("아이디"); $(this).addClass("input_pre"); } });
			$("#loginpwd").on("focus", function(){ $(this).prop("type","password"); if($(this).val() != "비밀번호"){ $(this).removeClass("input_pre"); }else{ $(this).val("").removeClass("input_pre"); } }).on("blur", function() { if($(this).val() == "" || $(this).val() == null ){ $(this).addClass("input_pre").prop("type","text"); $(this).val("비밀번호"); } });
	 	});
	 	
	 	
	 	function kakaoAuth(state){
	 		var url = "https://kauth.kakao.com/oauth/authorize?client_id=${kakaoRestApi}&redirect_uri=${kakaoRdUrl }&response_type=code&state="+state+"&encode_state=true";
		 	var popOption = "width=460px, height=608px, resizable=yes, scrollbars=no, location=no, top=300px, left=300px;"
		 	window.open(url,"카카오톡 ",popOption);
	 	}
	 	
	 	
		function kakaoCheck(accessToken){
	 		var sendData = JSON.stringify({at : accessToken});
		 	$.ajax({
				type: "POST",
				url : "<c:url value='/kakao/kakaoCheck.do' />",
				data : sendData,
				dataType: "json",
				contentType:"application/json;charset=UTF-8",
				success : function(data, status, xhr) {
					$("#loginid").val(data.member.member_id);
	 				$("#loginpwd").prop("type","password").val(data.member.member_id);
	 				form_submit();
				},
				error: function(jqXHR, textStatus, errorThrown) {
//	 				alert("실패 :"+jqXHR.responseText);
					window.location.href = "<c:url value='/common/503error.do' />";
				}
			});
		 	
		 	
	 	}
		
		function kakaoLogin(member){
			
			$("#loginid").prop("type","password").val(member.id);
			$("#loginpwd").prop("type","password").val(member.id);
			form_submit();

		}
			
	 	function homeJoin(){
	 		var url = "<c:url value='/join/memberPopJoin.do' />";
		 	var popOption = "width=460px, height=300px, resizable=yes, scrollbars=no, location=no, top=300px, left=300px;"
		 	window.open(url,"카카오톡 ",popOption);
	 	}
		
		function fn_loginEvent(val){
			
			
			if(val == 'join'){
				displaySet("join_div","block");
			}
		}
		
	 	
	 	function form_submit() {
	 		$("#member_login").submit();
	 		
		}
		
	 	
	 	$(document).keydown(function(e) {

	 		  // Set self as the current item in focus
	 		  var self = $(':focus'),
	 		      // Set the form by the current item in focus
	 		      form = self.parents('form:eq(0)'),
	 		      focusable;

	 		  // Array of Indexable/Tab-able items
	 		  focusable = form.find('input,a,select,button,textarea,div[contenteditable=true]').filter(':visible');

	 		  function enterKey(){
	 		    if (e.which === 13 && !self.is('textarea,div[contenteditable=true]') && !self.is('a')) { // [Enter] key

	 		      // If not a regular hyperlink/button/textarea
	 		      if ($.inArray(self, focusable) && (!self.is('a,button'))){
	 		        // Then prevent the default [Enter] key behaviour from submitting the form
	 		        e.preventDefault();
	 		      } // Otherwise follow the link/button as by design, or put new line in textarea

	 		      // Focus on the next item (either previous or next depending on shift)
	 		      focusable.eq(focusable.index(self) + (e.shiftKey ? -1 : 1)).focus();

	 		      return false;
	 		    }
	 		  }
	 		  // We need to capture the [Shift] key and check the [Enter] key either way.
	 		  if (e.shiftKey) { enterKey() } else { enterKey() }
	 		});
	 	
	 	
	</script>
</head>
<body class="loginBody">
	<a id="kakao-login-btn"></a>
	<form id="member_login" name="member_login" action="j_spring_security_check" method="post">
		<div class="login_main" align="center">
			<div class="login_con">
				<input type="text" id="loginid" name="loginid" class="login_txt" maxlength="30" value="" />
			</div>
			<div class="login_con">
				<input type="text" id="loginpwd" name="loginpwd" class="login_txt input_pre" maxlength="30" value="비밀번호" />
			</div>
				
			<div class="wrap_login_btn">
				<a href="javascript:;" id="enter_btn" class="login_btn"><img src="<c:url value='/resources/image/icon/login_btn.png'/>" alt="로그인" /></a>
				<a href="javascript:;" id="kakaoMember" class="login_btn"><img src="<c:url value='/resources/image/icon/kakao_login_btn.png'/>" alt="카카오톡으로 시작하기"/></a>
	<%-- 			<a href="javascript:;" id="enter_abtn" class="login_btn"><img src="<c:url value='/resources/image/icon/login_btn.png'/>" alt="로그인" /></a> --%>
	<%-- 			<a href="javascript:;" id="enter_gbtn" class="login_btn"><img src="<c:url value='/resources/image/icon/login_btn.png'/>" alt="로그인" /></a> --%>
			</div>
		</div>
			<%-- 		 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
	</form>
	<div class="wrap_join" align="center">
		<div class="wrap_join_inner">
			<ul>
	<!-- 				<li><a href="javascript:fn_loginEvent('id');" >아이디 찾기</a></li> -->
	<!-- 				<li><a href="javascript:fn_loginEvent('pwd');">비밀번호 찾기</a></li> -->
				<li><a href="javascript:fn_loginEvent('join');">회원가입</a></li>
			</ul>
		</div>
	</div>
	<div align="center">
		<div  id="join_div" class="wrap_join displayNone" align="center">
			<div class="wrap_join_inner">
				<ul>
					<li id="homeJoin"><a href="javascript:homeJoin();" id="homeJoin">홈페이지 가입 ></a></li>
					<li id="kakaoAuth"><a href="javascript:;" id="kakaoAuth">카카오톡 가입 > </a></li>
				</ul>
			</div>
		</div>
		
		<c:if test="${not empty exceptionMsg }">
	<%-- 	<p>이유 : ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message } </p> --%>
		<p style="color:red; font-weight: bolder;" >${exceptionMsg } </p>
		<c:remove scope="session" var="SPRING_SECURITY_LAST_EXCEPTION"/>
		</c:if>
	</div>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
</body>
</html>
