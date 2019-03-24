<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<%@ include file="/WEB-INF/include/include-resource.jspf" %>
	<title>로또번호생성기</title>
	
	<style type="text/css">
		.lottoView body{  text-align: center;  }
		.lottoView #frmLotto  input[type=text] { width:60px; height: 30px; vertical-align: middle; background-color: #f5f5dc }
		.lottoView #frmLotto  input[type=button]{ width: 60px; height: 30px; vertical-align: middle; margin: 0.5px; }
		
		.lottoView .box1 { overflow-y:auto;  }
		.lottoView .box1 .box2 .line{ margin:10px; text-align: center;  }
		.lottoView .col-sm-12 h3{ text-align: center;  }
		
		.lottoView .box1 .box2 .line .over{
		display:inline-block; text-align:center; width:45px; height:45px;  line-height:45px;margin:5px auto; border:2px solid black; border-radius:23px; color:#ffffff; font-size:15px; font-weight:600;vertical-align:middle; 
		
		 }
		
		.lottoView .lab{vertical-align: bottom;}
		.lottoView .box1 .box2 .line .forty{background-color: #0100FF;}
		.lottoView .box1 .box2 .line .thirty{background-color: #FF7373;}
		.lottoView .box1 .box2 .line .twenty{ background-color: #5D5D5D;}
		.lottoView .box1 .box2 .line .ten{ background-color: #A566FF;} 
		.lottoView .box1 .box2 .line .zero{ background-color: #2F9D27;}
	</style>
	
 	<script type="text/javascript" >
		$(document).ready(function(){
			$("#countNum").focus();
			function submitEvent() {
				var countNum = $("#countNum").val(); // 입력한 숫자
				if(countNum == null || countNum == ""){ alert("숫자를 입력해주세요."); return false; }
				if($.isNumeric(countNum)){ $("#frmLotto").submit(); }else{ alert("숫자를 입력해주세요."); }
			}
			$("#create").click(function(){ submitEvent(); });
			$("#countNum").keyup(function (event) { this.value = this.value.replace(/[^0-9]/g,''); if(this.value > 1000){ alert("1~1000 사이의 숫자를 입력해주세요."); this.value = ''; return false; } }).keydown(function(e) { var key = e.which; if(key == 13){ submitEvent();  } });
		});
	</script>

	
</head>
<body class="lottoView">
<%@ include file="/WEB-INF/include/include-header.jspf" %>

<div class="container">
        <div class="row">
            <div class="col-sm-12">        
            	<div align="center">
					<h3>로또 번호 생성기</h3>
						<div>
							<form id="frmLotto" name="frmLotto" action="<c:url value='/lotto_view.do'/>" method="post">
								<input type="text" class="txt" id="countNum" name="countNum" />
								<label class="lab" for="countNum">장</label>
								<button type="button" class="cre_btn" id="create">생성</button>
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</form>
						</div>
						<div class="box1">
							<c:forEach items="${result}" var="data" varStatus="count" >   	
								<div class="box2">
									<p class="line">
									<c:forEach items="${data}" var="namba" >
										<c:choose>
											<c:when test="${namba >= 40 }"> <span class="over forty"><c:out value="${namba }" /></span> </c:when>
											<c:when test="${namba >= 30 }"> <span class="over thirty"><c:out value="${namba }" /></span> </c:when>
											<c:when test="${namba >= 20 }"> <span class="over twenty"><c:out value="${namba }" /></span> </c:when>
											<c:when test="${namba >= 10 }"> <span class="over ten"><c:out value="${namba }" /></span> </c:when>
											<c:otherwise> <span class="over zero"><c:out value="${namba }" /></span> </c:otherwise>
										</c:choose>
									</c:forEach>
									</p>
								</div>
							</c:forEach>
						</div>    
					</div>
			</div>
		</div>
 </div>
 
 <%@ include file="/WEB-INF/include/include-bottom.jspf" %>    
</body>
</html>
