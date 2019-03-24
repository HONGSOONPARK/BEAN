<%@ page contentType="text/html; charset=UTF-8"%>


<!-- Modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog"aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header" align="center">
				<h4 class="modal-title" id="loginModalLabel">LOGIN</h4>
			</div>
			<div class="modal-body">


				<form name="frm" action="j_spring_security_check" method="post">
					<div align="center">
						<input type="text" id="loginid" name="loginid" placeholder="Login ID" required class="inputBox" /><br/>				
						<input type="password" id="loginpwd" name="loginPwd" placeholder="Password" required  class="inputBox" />				
					</div>
<%-- 				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
				</form>
				
			</div>
			<div class="modal-footer">
				<button type="button" id="loginBtn" class="btn btn-primary">로그인</button>
				<button type="button" id="helpPwd" class="btn btn-primary">비밀번호 찾기</button>
				<button type="button" id="closeModal" class="btn btn-default" data-dismiss="modal" >닫기</button>
			</div>
		</div>
	</div>
</div>

<div class="logout_disabled" style="display: none">
	<form name="frmLogout" id="frmLogout"  method="post">
<%-- 	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
	</form>
</div>

<script type="text/javascript">

	$(document).ready(function () {
		
		$('#loginModal').on('shown.bs.modal', function () {
		    $('#loginid').focus();
		})
		
		
		$("#helpPwd").on("click", function() {
			alert("골똘히 생각해보세요. \n저는 도움을 드리지 않을겁니다.");
		});
		
		$("#loginBtn").on("click", function() {
			
			
			if(frm.loginid.value == "") {
				alert("아이디를 입력해주세요.");
				return;
			}

			if(frm.loginpwd.value == "") {
				alert("패스워드를 입력해주세요.");
				return;

			}
			frm.submit();
		});
		
		
		$("#logoutBtn").on("click", function() {
			var fmSubmit = new FmSubmit("frmLogout");
			fmSubmit.setUrl("<c:out value ='${contextPath}/j_spring_security_logout' />");
			fmSubmit.submit();
		});
		
	});

</script>


