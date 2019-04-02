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
	
	var ROLE_CHAR;
	var SELECT_CODE;
	var DEL_DETAIL_NO = new Array();
	
	$(document).ready(function(){

	
		
		
		$("#btn_detailAdd").on("click",function(){
			var itemObj = new Object();
			var no_arry = new Array();
			$("#"+TB_DETAIL_ID+" tbody > tr ").each(function (i) {      
				var cellItem = $(this).find(":input");
				// 객체에 tr > td 값을 순서대로 담는다.
				
// 				itemObj.menu_no = cellItem.eq(1).val();
				no_arry.push(cellItem.eq(3).val());
				
			});
			
			   var popUrl ="<c:url value='/admin/authDetailPop.do?role_char="+ROLE_CHAR+"&no_arry="+no_arry+"' />";
			   var popOption = "width=380px, height=275px, resizable=no, location=no, top=300px, left=300px;"
			   window.open(popUrl,"메뉴선택 ",popOption);
		});
		
		$("#btn_detailSave").on("click",function(){
			
			
			codeUpdate();
			
			
		});
		
		
	});
	
	
	// 코드 중복체크 -> 코드 업데이트 실행
	
	function codeUpdate(){
		
		var detailArry= new Array();
		// id 가 new 인 엘리먼트들만 찾는다.
		
		// row가 있을 때
		if($("#"+TB_DETAIL_ID+" tbody > tr ").is("tr")){  
			$("#"+TB_DETAIL_ID+" tbody > tr ").each(function (i) {      
				var cellItem = $(this).find(":input");
				// 객체에 tr > td 값을 순서대로 담는다.
				var itemObj = new Object();	
				itemObj.no = cellItem.eq(0).val();
				itemObj.status = cellItem.eq(1).val();
				itemObj.role_char = ROLE_CHAR;
				itemObj.menu_no = cellItem.eq(3).val();
				itemObj.menu_id = cellItem.eq(4).val();
				itemObj.menu_name = cellItem.eq(5).val();
				itemObj.read_grant = cellItem.eq(6).val();
				itemObj.write_grant = cellItem.eq(7).val();
				itemObj.delete_grant = cellItem.eq(8).val();
				itemObj.del_detail_no = DEL_DETAIL_NO;
				detailArry.push(itemObj);
			});
		// row가 없을 떄, 삭제 할 row no 넘겨줌
		}else{
			var itemObj = new Object();	
			itemObj.del_detail_no = DEL_DETAIL_NO;
			detailArry.push(itemObj);
		}
		
		var sendData = JSON.stringify(detailArry);
// 		추가한 row의 Data와 DB table의 Data를 비교하여 중복여부를 판단한다 

	 	$.ajax({	
			type: "POST",
			url : "<c:url value='/admin/authDetailUpdate.do' />",
			dataType: "json",
			data : sendData,
			contentType:"application/json;charset=UTF-8",
			success : function(data, status, xhr) {
				alert("작업 완료!");	
				window.location.href = "<c:url value='/admin/authMenuManager.do' />";

			},
			error: function(jqXHR, textStatus, errorThrown) {
// 				alert("실패 :"+errorThrown);
				window.location.href = "<c:url value='/common/503error.do' />";
			}
		});
		
		
	}
	

	
	// 팝업창에서 데이터 return ,메뉴 추가
	function returnMenuNo(obj){
			var html;
			var varTable = $("#"+TB_DETAIL_ID+" > tbody");
			var no;
			for(var i = 0 ; i < obj.length; i++){
				html +="<tr align='center' id='new'>";
				html += "<td class='displayNone'><input type='text' id='new_no"+i+"' value='' readonly='readonly' class='infoTxt read w25' required='required' /></td>";
				html += "<td class='displayNone'><input type='text' id='new_status"+i+"' value='insert' readonly='readonly' class='infoTxt read w25'/></td>";
				html += "<td class='displayNone'><input type='text' id='new_role_char"+i+"' value='' readonly='readonly' class='infoTxt read w25'/></td>";
				html += "<td><input type='text' id='new_menu_no_"+i+"' value='"+nullToBlank(obj[i].no)+"' readonly='readonly' class='infoTxt read w25' required='required' /></td>";
				html += "<td><input type='text' id='new_menu_id_"+i+"' value='"+nullToBlank(obj[i].menu_id)+"' readonly='readonly' class='infoTxt read w75' required='required' /></td>";
				html += "<td><input type='text' id='new_menu_name_"+i+"' value='"+nullToBlank(obj[i].menu_name)+"' readonly='readonly' class='infoTxt read w75'/></td>";
				html += "<td><input type='checkbox' name ='ckbox_grant' id='new_read_grant_"+i+"' value='N' onclick ='javascript:checkbox_event(this.id);' class='infoTxt w30'/></td>";
				html += "<td><input type='checkbox' name ='ckbox_grant' id='new_write_grant_"+i+"' value='N' onclick ='javascript:checkbox_event(this.id);'  class='infoTxt w30'/></td>";
				html += "<td><input type='checkbox' name ='ckbox_grant' id='new_delete_grant_"+i+"' value='N' onclick ='javascript:checkbox_event(this.id);'  class='infoTxt w30'/></td>";
				html += "<td align='left'><a href='#this' onclick='codeDetailRowDel(this);' ><img src='<c:url value='/resources/image/icon/icon_del.png'/>' alt='돋보기' class='icon_info'/></a></td>";
				html+="</tr>";
			}
			varTable.append(html);
	}
	
	// code list 추가된 row del 버튼
	function codeListRowDel(obj){
		ADD_CHECK -= 1;
		$(obj).parent().parent().remove();

	}
	
	// code detail row del 버튼
	function codeDetailRowDel(obj){
		
		if( $(obj).parent().parent().find("td:nth-child(1) > :input").eq(0).val() != ''){
			DEL_DETAIL_NO.push($(obj).parent().parent().find("td:nth-child(1) > :input").eq(0).val());
		}
		
		$(obj).parent().parent().remove();
	}
	
	// 코드 상세보기
	function codeInfo(cd) {
		var sendData = JSON.stringify({role_char:cd});
	 	$.ajax({
			type: "POST",
			url : "<c:url value='/admin/authMenuDetail.do' />",
			data : sendData,
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
			success : function(data, status, xhr) {
				displaySet("codeDetail_div","block");
				ROLE_CHAR = cd;
				codeDetailList(data);
			},
			error: function(jqXHR, textStatus, errorThrown) {
// 				alert("실패 :"+jqXHR.responseText);
				window.location.href = "<c:url value='/common/503error.do' />";
			}
		});
	}
	
	// 코드 선택시 상세 리스트 출력 
	function codeDetailList(data) {
		
		DEL_DETAIL_NO = new Array();
		
		$("#"+TB_DETAIL_ID+" > tbody > tr").remove();
		
		var varTable = $("#"+TB_DETAIL_ID+" > tbody");
		

		var html;
		var varList;
		
		for(var i=0; i<data.list.length; i++){
			varList = data.list[i];
			html +="<tr align='center'>";
			html += "<td class='displayNone'><input type='text' id='no"+i+"' value='"+nullToBlank(varList.no)+"' readonly='readonly' class='infoTxt read w25'/></td>";
			html += "<td class='displayNone'><input type='text' id='status"+i+"' value='update' readonly='readonly' class='infoTxt read w25'/></td>";
			html += "<td class='displayNone'><input type='text' id='role_char"+i+"' value='"+nullToBlank(varList.role_char)+"' readonly='readonly' class='infoTxt read w25'/></td>";
			html += "<td><input type='text' id='menu_no_"+i+"' value='"+nullToBlank(varList.menu_no)+"' readonly='readonly' class='infoTxt read w25 ' required='required' /></td>";
			html += "<td><input type='text' id='menu_id_"+i+"' value='"+nullToBlank(varList.menu_id)+"' readonly='readonly' class='infoTxt read w75' required='required' /></td>";
			html += "<td><input type='text' id='menu_name_"+i+"' value='"+nullToBlank(varList.menu_name)+"' readonly='readonly' class='infoTxt read w75' readonly/></td>";
			html += "<td><input type='checkbox' name ='ckbox_grant' id='read_grant_"+i+"' value='"+nullToBlank(varList.read_grant)+"' onclick ='javascript:checkbox_event(this.id);' class='infoTxt w30'/></td>";
			html += "<td><input type='checkbox' name ='ckbox_grant' id='write_grant_"+i+"' value='"+nullToBlank(varList.write_grant)+"' onclick ='javascript:checkbox_event(this.id);'  class='infoTxt w30'/></td>";
			html += "<td><input type='checkbox' name ='ckbox_grant' id='delete_grant_"+i+"' value='"+nullToBlank(varList.delete_grant)+"' onclick ='javascript:checkbox_event(this.id);'  class='infoTxt w30'/></td>";
			html += "<td align='left'><a href='#this' onclick='codeDetailRowDel(this);' ><img src='<c:url value='/resources/image/icon/icon_del.png'/>' alt='돋보기' class='icon_info'/></a></td>";
			html+="</tr>";
		}
		
		varTable.append(html);
		checkboxSet("ckbox_grant");
		
		
	}

	

	
	
	
	// 페이징 처리를 위한 함수
// 	function fn_search(pageNo){
//         var fmSubmit = new FmSubmit();
//         fmSubmit.setUrl("<c:url value='/admin/codeManager.do' />");
//         fmSubmit.addParam("currentPageNo", pageNo);
//         fmSubmit.submit();
//     }
	

</script>


</head>
<body>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<div class="adminInfoMain">
		
		<div class="adminInfoList" align="center">

<!-- 			<button type="button" id="btn_codeAdd" name="btn_codeAdd" class="infoBtn">권한코드 갱신</button> -->
			
			<form id="formCodeList" name="formCodeList" />
			<table class="tb_adminList" id="tb_adminList">
			    <colgroup>
			        <col width="50%"/>
			        <col width="5%"/>
			        <col width="5%"/>
    			</colgroup>
				<thead>
				<tr>
					<th scope="col">권한이름</th>
					<th scope="col" colspan="2">권한코드</th>
				</tr>
				</thead>
				
				<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach var="row" items="${list }" varStatus="var">
							<tr>
								<td>
									<input type="text" id="code_${var.count }" value ="<c:out value="${row.var_code}"/>" class="codeInfo_input w50 read" required="required" readonly="readonly" />
								</td>
								<td>
									<input type="text" id="code_name_${var.count }"  value ="<c:out value="${row.var_name}"/>" class="codeInfo_input w70 read" required="required" readonly="readonly" />
								</td>
								<td>
									<a href="#this" onclick="javascript:codeInfo('${row.var_name }');" > 
										<img src="<c:url value='/resources/image/icon/icon_info.png'/>" alt="돋보기" class="icon_info"/>
									</a>
								</td>
							</tr>
						</c:forEach>
					</c:when>  
				</c:choose>
				</tbody>
			 </table>
			 </form>
			 
			 
<%-- 			<c:if test="${not empty paginationInfo}"> --%>
<%-- 		        <ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/> --%>
<%-- 		    </c:if> --%>
		    
		    
<!-- 		    <input type="hidden" id="currentPageNo" name="currentPageNo"/> -->
		    
			<br/>
		</div>
		
		
		
		<!-- Detail Frame -->
		<div name="adminInfoFrame" id ="adminInfoFrame" class="adminInfoFrame" >
			
			<div class="codeDetail_div" id="codeDetail_div">
			

			<form id="formCodeDetail" name="formCodeDetail" target="_parent">
			
			
			<table class="tb_adminInfo"  id="tb_codeDetail" name="tb_codeDetail">
			
			
				<div id="codeDetail_info" class="codeDetail_info" align="center">
					<h3>권한별 메뉴 관리</h3>
<!-- 					<input type="hidden" id="code_hidden" value="" class="infoTxt w40"/> -->
<!-- 					<input type="hidden" id="no" value="" class="infoTxt w40" required="required"  /> -->
<!-- 					<input type="text" id="code" value="" class="infoTxt w40" required="required" /> -->
<!-- 					<input type="text" id="code_name" value="" class="infoTxt w60" required="required" /> -->
<!-- 					<select id="use_yn" name="use_yn" class="infoSel w55" required="required"><option value="">선택</option></select> -->
					<button type="button" id="btn_detailAdd" class="infoBtn">추가</button>
					<button type="button" id="btn_detailSave"  class="infoBtn">저장</button>

				</div>
				<hr/>
			
			    <colgroup>
<!-- 			        <col width="8%"/> -->
<!-- 			        <col width="8%"/> -->
<!-- 			        <col width="8%"/> -->
			        <col width="8%"/>
			        <col width="15%"/>
			        <col width="15%"/>
			        <col width="8%"/>
			        <col width="8%"/>
			        <col width="8%"/>
			        <col width="8%"/>
    			</colgroup>
				<thead>
					<tr align="center">
<!-- 						<th>번호</th> -->
<!-- 						<th>상태</th> -->
<!-- 						<th>권한코드</th> -->
						<th><span class="">*</span>메뉴번호</th>
						<th><span class="">*</span>메뉴ID</th>
						<th><span class="">*</span>메뉴이름</th>
						<th>읽기권한</th>
						<th>쓰기권한</th>
						<th>삭제권한</th>
						<th></th>
					</tr>
				
				</thead>
				<tbody>
				</tbody>
			</table>
			
			</form>
		<div class="adminInfoClear">
		</div>
		
		</div>
	</div>
</body>
</html>