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
	
// 	codeset.selectBox("2","use_yn");
	
	var ADD_CHECK = 0;
	var ADD_CHECK_DETAIL = 0;
	
	var TB_LIST_ID = "tb_adminList";
	var TB_DETAIL_ID = "tb_codeDetail";
	
	
	var COL_NAME = ['code','code_name'];
	
	
	var DEL_DETAIL_NO = new Array();
	
	$(document).ready(function(){
		
		var arry = new Array();
		
		$("#btn_codeAdd").on("click",function(){
			 arry = getCheckBoxArry("popCheckBox");
			if(arry != null || arry != ""){
				opener.returnMenuNo(arry);
				self.close();	
			}else{
				alert("선택된 항목이 없습니다");
			}
		});
		
		
		$("#btn_close").on("click",function(){
			arry = new Array();
			self.close();
			 
		});
		
	});


	// 페이징 처리를 위한 함수
	function fn_search(pageNo){
        var fmSubmit = new FmSubmit();
        fmSubmit.setUrl("<c:url value='/admin/authDetailPop.do' />");
        fmSubmit.addParam("currentPageNo", pageNo);
        fmSubmit.submit();
    }
	

</script>


</head>
<body>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<div>
		<div class="authManagerAdd" align="center">

			<button type="button" id="btn_codeAdd" name="btn_codeAdd" class="infoBtn">추가하기</button>
			<button type="button" id="btn_close" name="btn_close" class="infoBtn">창닫기</button>
			
			
			<form id="formCodeList" name="formCodeList" />
			<table class="tb_authDetailPopList" id="tb_authDetailPopList">
			    <colgroup>
			    	<col width="5%"/>
			        <col width="15%"/>
			        <col width="15%"/>
			        <col width="25%"/>
			        <col width="25%"/>
			        <col width="5%"/>
    			</colgroup>
				<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">부모코드</th>
					<th scope="col">메뉴코드</th>
					<th scope="col">메뉴ID</th>
					<th scope="col">메뉴이름</th>
					<th scope="col">선택</th>
				</tr>
				</thead>
				
				<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach var="row" items="${list }" varStatus="var">
							<tr 
								<c:forEach var="ck" items="${no_arry }" varStatus="var">
									<c:choose><c:when test="${ck eq row.no }">class="displayNone"</c:when></c:choose>
								</c:forEach>
							>
								<td>
									<c:out value="${row.no}"/>
								</td>
								<td>
									<c:out value="${row.depth_1}"/>
								</td>
								<td>
									<c:out value="${row.depth_2}"/>
								</td>
								<td>
									<c:out value="${row.menu_id}"/>
								</td>
								<td>
									<c:out value="${row.menu_name}"/>
								</td>
								<td>
									<input type="checkbox" id="ckbox_${var.count }" name="popCheckBox"   value="<c:out value="${row.no}"/>" class="codeInfo_input w25 read" />
								</td>
							</tr>
						</c:forEach>
					</c:when>  
				</c:choose>
				</tbody>
			 </table>
			 </form>
			<br/>
			
			<c:if test="${not empty paginationInfo}">
		        <ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
		    </c:if>
		    <input type="hidden" id="currentPageNo" name="currentPageNo"/>
			<br/>
			
		</div>
	
	
	</div>


</body>
</html>