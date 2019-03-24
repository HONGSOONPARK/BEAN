<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-resource.jspf" %>

<title>관리자메인</title>

<style type="text/css">


</style>

<script type="text/javascript">

	var codeset = new codeSet();
	codeset.setUrl("<c:url value='/common/selectCommonCode.do' />");
	codeset.selectBox("1","member_role");
	codeset.selectBox("2","use_yn");
	codeset.selectBox("4","member_type");
	
	var selMemberType;
	
	
	$(document).ready(function(){
		displaySet("btn_del","none");
		displaySet("btn_pwdChange","none");
		displaySet("pwdChange","none");
		
		$("#btn_new").on("click",function(){
			$("#formInfo").clearForm();
			$("#member_id").focus();
			$("#status").val("insert");
			
			displaySet("btn_del","none");
			displaySet("btn_pwdChange","none");
			displaySet("pwdChange","none");
			readonlySet("member_id","remove");
			readonlySet("member_name","remove");
			readonlySet("member_pwd","remove");
			
		});
		
		$("#btn_save").on("click",function(e){
	
			
			if(fieldNullCheck("formInfo") == true){
				if(($("#status").val() == "insert") && !adminMemberIdCheck($("#member_id").val(),"<c:url value='/admin/member/memberIdCheck.do' />")){
					alert("아이디 있음");
					return false;
				}
				
				if(confirm("저장하시겠습니까?")){
					var fmSubmit = new FmSubmit("formInfo");
					fmSubmit.setUrl("<c:url value='/admin/member/memberInfoUpdate.do'/>");
					fmSubmit.submit();
				}
			
			}
		});
		
		
		$("#btn_pwdChange").on("click",function(){
			readonlySet("member_pwd","remove");
			valueInit("member_pwd");		
			$("#member_pwd").focus();
		});
		
		
		$("#btn_del").on("click",function(e){
// 			e.preventDefault();
		
		if($("#status").val() == "update"){
			if(confirm("삭제하시겠습니까?")){
				if($("#member_type").val() == "카카오"){
					alert("카카오사용자는 임의로 삭제할 수 없습니다.");	
					return false;
				}else{
					var fmSubmit = new FmSubmit("formInfo");
					fmSubmit.setUrl("<c:url value='/admin/member/memberDelete.do'/>");
					fmSubmit.submit();
				}
			}
		}
		});
		
	});
	
	
	function memberinfo(no,id,name) {
		var sendData = JSON.stringify({member_id:id, member_no:no, member_name:name});
		
		$("#status").val("update");
		
		displaySet("btn_del","inline");
		displaySet("btn_pwdChange","inline");
		displaySet("pwdChange","inline");
		readonlySet("member_id","add");
		readonlySet("member_name","add");
		readonlySet("member_pwd","add");
		
		
	 	$.ajax({
			type: "POST",
			url : "<c:url value='/admin/member/memberInfoDetails.do' />",
			data : sendData,
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
			success : function(data, status, xhr) {
				var membervo = data.membervo;
				selMemberType = membervo["member_type"];
				// 카카오로 가입한 회원의 비밀번호는 수정불가능하다.
				if(selMemberType == "카카오"){
					$("#btn_pwdChange").attr("disabled", true);
				}else{
					$("#btn_pwdChange").attr("disabled", false);
				}
				
				
				for( var key in membervo ){
					$("#"+key).val(membervo[key]);
				}
				$("#status").val("update");
				
			},
			error: function(jqXHR, textStatus, errorThrown) {
// 				alert("실패 :"+jqXHR.responseText);
				window.location.href = "<c:url value='/common/503error.do' />";
			}
		});
	}
	

</script>


</head>
<body>
	<div class="adminInfoMain">
		
		<div class="adminInfoList" align="center">
<!-- 			<ul> -->

			<table class="tb_adminList">
			    <colgroup>
			        <col width="*"/>
			        <col width="40%"/>
			        <col width="5%"/>
    			</colgroup>
				<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col" colspan="2">이름</th>
				</tr>
				</thead>
				
				<tbody>
				<c:choose>
					<c:when test="${fn:length(userlist) > 0 }">
						<c:forEach var="row" items="${userlist }" varStatus="var">
							<tr>
<!-- 								<td> -->
<%-- 									<c:out value="${row.member_no}"/> --%>
<!-- 								</td> -->
<!-- 								<td> -->
<%-- 									<c:out value="${row.member_id}"/> --%>
<!-- 								</td> -->
<!-- 								<td> -->
<%-- 									<c:out value="${row.member_name}"/> --%>
<!-- 								</td> -->

								<td>
									<input type="text" id="id_${var.count }" value ="<c:out value="${row.member_id}"/>" class="codeInfo_input w60 read" readonly="readonly" />
								</td>
								
								<td>
									<input type="text" id="name_${var.count }" value ="<c:out value="${row.member_name}"/>" class="codeInfo_input w60 read" readonly="readonly" />
								</td>

								<td>
									<a href="javascript:memberinfo('${row.member_no }','${row.member_id }','${row.member_name }');" >
										<img src="<c:url value='/resources/image/icon/icon_info.png'/>" alt="돋보기" class="icon_info"/>
									</a>
								</td>
							</tr>
						</c:forEach>
					</c:when>  
				</c:choose>
				</tbody>
			 </table>
<!-- 			 </ul> -->
		</div>
		
		<div name="memberInfoFrame" id ="memberInfoFrame" class="adminInfoFrame">
			<form id="formInfo" name="formInfo" target="adminMainFrame">
			<table class="tb_adminInfo">
			    <colgroup>
			        <col width="15%"/>
			        <col width="*"/>
			        <col width="15%"/>
			        <col width="*"/>
    			</colgroup>
				<thead>
				
				</thead>
				<tbody>
					<tr>
						<th><label for="member_id"><span class="req">*</span>아이디</label></th>
						<td><input type="text" id="member_id" name="member_id" value="" class="infoTxt" required="required"  /></td>
						<th><label for="member_name"><span class="req">*</span>이름</label></th>
						<td><input type="text" id="member_name" name="member_name" value="" class="infoTxt" required="required" /></td>
					</tr>
					<tr>
						<th><label for="member_pwd"><span class="req">*</span>비밀번호</label></th>
						<td><input type="password" id="member_pwd" name="member_pwd" value="" class="infoTxt" required="required" /></td>
						<th><label for="btn_pwdChange" id="pwdChange">비밀번호변경</label> </th>
						<td><button type="button" id="btn_pwdChange" name="btn_pwdChange">비밀번호 변경</button></td>
					</tr>
					<tr>
						<th><label for="member_nick"><span class="req">*</span>별명</label></th>
						<td><input type="text" id="member_nick" name="member_nick" value="" class="infoTxt" required="required"/></td>
						<th><label for="member_eng_name">영문이름</label></th>
						<td><input type="text" id="member_eng_name" name="member_eng_name" value="" class="infoTxt"/></td>
					</tr>						
	
					<tr>
						<th><label for="member_tel">전화</label></th>
						<td><input type="text" id="member_tel" name="member_tel" value="" class="infoTxt"/></td>
						<th><label for="member_phone">휴대전화</label></th>
						<td><input type="text" id="member_phone" name="member_phone" value="" class="infoTxt"/></td>
					</tr>			
					
					<tr>
						<th><label for="member_email">E-mail</label></th>
						<td><input type="text" id="member_email" name="member_email" value="" class="infoTxt"/></td>
						<th><label for="member_addr" >주소</label><label for="member_addr_2" hidden="상세주소">상세주소</label></th>
						<td><input type="text" id="member_addr" name="member_addr" value="" class="infoTxt"/><input type="text" id="member_addr_2" name="member_addr_2" value="" class="infoTxt"/></td>
					</tr>			
																		
					<tr>
						<th><label for="member_role"><span class="req">*</span>권한</label></th>
						<td>
							<select id="member_role" name="member_role" class="infoSel" required="required" >
								<option value="" selected="selected" >선택</option>
							</select>	
						</td>
						<th><label for="member_type"><span class="req">*</span>가입유형</label></th>
						<td>
							<select id="member_type" name="member_type" class="infoSel" required="required">
								<option value="" selected="selected">선택</option>
							</select>
						</td>
					</tr>
					<tr>
						<th><label for="cre_date">생성일</label></th>
						<td><input type="text" id="cre_date" name="cre_date" value="" class="infoTxt read" readonly="readonly"/></td>
						<th><label for="use_yn"><span class="req">*</span>사용구분</label></th>
						<td>
							<select id="use_yn" name="use_yn" class="infoSel" required="required">
								<option value="" selected="selected">선택</option>
							</select>
						</td>
					</tr>	
				</tbody>
			</table>
			<input type="hidden" id="member_no" name="member_no" value="" />
			<input type="hidden" id="status" name="status" value="" />
			<input type="hidden" id="member_pwd_cur" name="member_pwd_cur" value="" />
			
			<hr/>
			<div align="center">
				<button type="button" id="btn_new" name="btn_new" class="info_btn">신규</button>
				<button type="button" id="btn_save" name="btn_save" class="info_btn">저장</button>
				<c:if test ="${user.getMember_role() == 'ROLE_ADMIN'}" > 
					<button type="button" id="btn_del" name="btn_del" class="info_btn">계정삭제</button>
				</c:if>
			</div>
			
			</form>
		
		</div>
		<div class="adminInfoClear">
		</div>
	</div>
</body>
</html>