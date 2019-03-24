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
	codeset.selectBox("2","use_yn");
	var ADD_CHECK = 0;
	var ADD_CHECK_DETAIL = 0;
	
	var TB_LIST_ID = "tb_adminList";
	var TB_DETAIL_ID = "tb_codeDetail";
	var COL_NAME = ['code','code_name'];
	
	
	var DEL_DETAIL_NO = new Array();
	
	$(document).ready(function(){

		// code list row 추가
		$("#btn_codeAdd").on("click",function(e){
			// 코드 추가 row는 5개 까지만
			if(ADD_CHECK < 5 ){ 
				ADD_CHECK += 1;

				// row 추가작업 , tr 요소 복사(clone)
				var varTable = $("#"+TB_LIST_ID+" > tbody"); 
	            var varTableRow = varTable.find('tr:first'); 
	            var copyRow = varTableRow.clone(true);
	            
	            // 복사한 row 값 초기화
	            $(copyRow).find(':input').each(function(){
	            	this.value = '';
	                this.checked = '';
	          	});
	            
	            // 복사한 row에  id ='new' 추가, DB update 시 구분하기 위해
	            copyRow.attr("id","new");
	            
	            // img src 변경, 호출함수 변경, css, class 변경
	            $(copyRow).find("td:nth-child(1) > :input").attr("id","cd_new_"+ADD_CHECK).removeAttr("readonly").removeClass("read");
	            $(copyRow).find("td:nth-child(2) > :input").attr("id","cn_new_"+ADD_CHECK).removeAttr("readonly").removeClass("read");
	            $(copyRow).find("td:last > a > img").attr("src","<c:url value='/resources/image/icon/icon_del.png'/>");
	            $(copyRow).find("td:last > a").attr("onclick","javascript:codeListRowDel(this);");
	            
	            varTable.prepend(copyRow);
	            $("#"+TB_LIST_ID+" > tbody > tr:first > td:first > input").focus();
	            
			}else{
				alert("5개 초과 추가 할 수 없습니다.");
			}
		});
		
		
		
		// code list 저장버튼
		$("#btn_codeSave").on("click",function(e){
			// 코드추가 눌렀는지 체크, row가 생성되었으면 이벤트 진행
			if(ADD_CHECK > 0){    
			
				var arry = new Array();
				
				// 추가한 row의 value Null Check
				if(fieldNullCheck("formCodeList") == true){  
					
					arry = redupCheckNew(TB_LIST_ID, COL_NAME, "code");
					
					if(arry != null){
						codeOverlapCheck(arry, 1);	
					}
					
					// 코드 중복 체크 후 이벤트 진행
					
				}
				
			}else{
				alert("추가할 코드가 없습니다.");
			}
		});
		
		
		$("#btn_detailAdd").on("click",function(e){

			var html;
			var varTable = $(this).parent().parent().find('tbody');
            var varTableLastRow = varTable.find('tr:last'); // 행추가 마지막 row
            var copyRow = varTableLastRow.clone(true); // 행추가 마지막 row 복사
            ADD_CHECK_DETAIL += 1;
            
			// 기존 row 복사 추가
			if(varTable.find("tr").is("tr")){
	            // 첫번째 node, 두번쨰 node를 제외한 value 초기화
		        $(copyRow).find('td > :input').not("td:nth-child(n+2):nth-child(-n+3) > :input").each(function(i){
		        	
		        	$(copyRow).find('td:nth-child(4) > :input').val("insert");
		        	
		        	this.value = '';
		        	$(this).attr("id", "insert_"+ADD_CHECK_DETAIL+"_"+i);
	          	});
	            varTable.append(copyRow);
	        // 새로운 row 추가
			}else{
				html +="<tr align='center' id='new' >";
				html += "<td class='displayNone'><input type='text' id='detail_no_0'  value='' class='infoTxt w40'/></td>";
				html += "<td class='displayNone'><input type='text' id='code_0'  value='"+$("#code").val()+"' class='infoTxt w40' required='required'  /></td>";
				html += "<td class='displayNone'><input type='text' id='code_name_0' value='"+$("#code_name").val()+"' class='infoTxt w60' required='required' /></td>";
				html += "<td class='displayNone'><input type='text' id='status_0' value='insert' class='infoTxt w65' required='required' /></td>";
				html += "<td><input type='text' id='var_code_0' value='' class='infoTxt w65' required='required' /></td>";
				html += "<td><input type='text' id='var_name_0' value='' class='infoTxt w65' required='required' /></td>";
				html += "<td><input type='text' id='code_order_0' value='' class='infoTxt w15' required='required' /></td>";
				html += "<td><input type='text' id='ref_1_0' value='' class='infoTxt w70'/></td>";
				html += "<td><input type='text' id='ref_2_0' value='' class='infoTxt w70'/></td>";
				html += "<td><input type='text' id='ref_3_0' value='' class='infoTxt w70'/></td>";
				html += "<td align='left'><a href='#this' onclick='codeDetailRowDel(this);' ><img src='<c:url value='/resources/image/icon/icon_del.png'/>' alt='돋보기' class='icon_info'/></a></td>";
				html+="</tr>";
				
				varTable.append(html);
				
			}
            
		});
		
		// 코드 상세 저장버튼 -> 부모 코드 업데이트(중복확인) -> 코드 상세 업데이트
		$("#btn_detailSave").on("click",function(e){
			
			var obj = new Array();
			var itemObj = new Object();	
			itemObj.code = $("#code").val();
			itemObj.code_name = $("#code_name").val();
			obj.push(itemObj);
			
			codeOverlapCheck(obj, 2);
			
		});
		
		// 코드 삭제버튼 -> 코드상세삭제 -> 코드리스트삭제
		$("#btn_detailDel").on("click",function(e){
			
			if(confirm("삭제하시겠습니까? 모든 코드정보가 삭제됩니다.")){
				var fmSubmit = new FmSubmit();
		        fmSubmit.setUrl("<c:url value='/admin/codeDeleteAll.do' />");
		        fmSubmit.addParam("code", $("#code_hidden").val());
		        fmSubmit.submit();	
			}
			
		});
		
		
		
		
		// 상단 공통 코드 변경시 아래 row 에 추가된 hidden code, code_name 의 value 일괄 변경
		$("#code").keyup(function(e){
			$("#"+TB_DETAIL_ID+" > tbody > tr > td:nth-child(2)").each(function(i){
				$(this).find("[id = 'code_0']").val($("#code").val());
          	});
		});
		
		$("#code_name").keyup(function(e){
			$("#"+TB_DETAIL_ID+" > tbody > tr > td:nth-child(3)").each(function(i){
				$(this).find("[id = 'code_name_0']").val($("#code_name").val());
          	});
		});
		
		
		
		
	});
	
	
	// code List Insert
	function codeInsert(arry){
		// code 중복값 체크 완료시 
		if(confirm("등록하시겠습니까?")){
			var sendData = JSON.stringify(arry);
			// 추가한 row의 Data와 DB table의 Data를 비교하여 중복여부를 판단한다 
		 	$.ajax({	
				type: "POST",
				url : "<c:url value='/admin/codeListInsert.do' />",
				dataType: "json",
				data : sendData,
				contentType:"application/json;charset=UTF-8",
				success : function(data, status, xhr) {
					alert("등록 완료!!");			
					window.location.href = "<c:url value='/admin/codeManager.do' />";
				},
				error: function(jqXHR, textStatus, errorThrown) {
					window.location.href = "<c:url value='/common/503error.do' />";
				}
			});
		}
	}
	
	// code list 추가된 row del 버튼
	function codeListRowDel(obj){
		ADD_CHECK -= 1;
		$(obj).parent().parent().remove();

	}
	
	// code detail row del 버튼
	function codeDetailRowDel(obj){
		ADD_CHECK_DETAIL -= 1;
		
		if( $(obj).parent().parent().find("td:nth-child(1) > :input").eq(0).val() != ''){
			DEL_DETAIL_NO.push($(obj).parent().parent().find("td:nth-child(1) > :input").eq(0).val());
		}
		
		$(obj).parent().parent().remove();
	}
	
	// 코드 상세보기
	function codeInfo(cd, cn) {
		var sendData = JSON.stringify({code:cd, code_name:cn});
	 	$.ajax({
			type: "POST",
			url : "<c:url value='/admin/codeDetail.do' />",
			data : sendData,
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
			success : function(data, status, xhr) {
				displaySet("codeDetail_div","block");
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
		var info = data.info;

		$("#no").val(info[0].no);
		$("#code").val(info[0].code);
		$("#code_hidden").val(info[0].code);
		$("#code_name").val(info[0].code_name);
		$("#use_yn").val(info[0].use_yn);
		
		
		var html;
		var varList;
		
		for(var i=0; i<data.list.length; i++){
			varList = data.list[i];
			html +="<tr align='center'>";
			html += "<td class='displayNone'><input type='hidden' id='detail_no_0'  value='"+nullToBlank(varList.detail_no)+"' class='infoTxt w40' /></td>";
			html += "<td class='displayNone'><input type='hidden' id='code_0'  value='"+nullToBlank(varList.code)+"' class='infoTxt w40' required='required'  /></td>";
			html += "<td class='displayNone'><input type='hidden' id='code_name_0' value='"+nullToBlank(varList.code_name)+"' class='infoTxt w60' required='required' /></td>";
			html += "<td class='displayNone'><input type='hidden' id='status"+i+"' value='update' class='infoTxt w65' required='required' /></td>";
			html += "<td><input type='text' id='var_code_"+i+"' value='"+nullToBlank(varList.var_code)+"' class='infoTxt w65' required='required' /></td>";
			html += "<td><input type='text' id='var_name_"+i+"' value='"+nullToBlank(varList.var_name)+"' class='infoTxt w65' required='required' /></td>";
			html += "<td><input type='text' id='code_order_"+i+"' value='"+nullToBlank(varList.code_order)+"' class='infoTxt w15' required='required' /></td>";
			html += "<td><input type='text' id='ref_1_"+i+"' value='"+nullToBlank(varList.ref_1)+"' class='infoTxt w70'/></td>";
			html += "<td><input type='text' id='ref_2_"+i+"' value='"+nullToBlank(varList.ref_2)+"' class='infoTxt w70'/></td>";
			html += "<td><input type='text' id='ref_3_"+i+"' value='"+nullToBlank(varList.ref_3)+"' class='infoTxt w70'/></td>";
			html += "<td align='left'><a href='#this' onclick='codeDetailRowDel(this);' ><img src='<c:url value='/resources/image/icon/icon_del.png'/>' alt='돋보기' class='icon_info'/></a></td>";
			html+="</tr>";
		}
		
		varTable.append(html);
		
	}

	
	// 코드 중복체크
	function codeOverlapCheck(val, event){
	
		var sendData = JSON.stringify(val);
		
		// 추가한 row의 Data와 DB table의 Data를 비교하여 중보여부를 판단한다 
	 	$.ajax({	
			type: "POST",
			url : "<c:url value='/admin/codeCheck.do' />",
			dataType: "json",
			data : sendData,
			contentType:"application/json;charset=UTF-8",
			success : function(data, status, xhr) {
				
				// event = 1 ; 코드 리스트에 추가
				// event = 2 ; 코드 디테일에 추가
				if(event == 1){
					if(data[0].code_check > 0){
						alert("이미 존재하는 코드 값이다.["+data[0].code+"]");
						return false;
					}else{
						codeInsert(val);
					}
				}else if(event == 2){
					// 코드 값이 존재, 하지만 현재 선택한 코드일 경우
					if(data[0].code == $("#code_hidden").val() || data[0].code_check < 1){
						// 코드 업데이트하자
						if(fieldNullCheck("formCodeDetail") == true){
							codeUpdate();
						}
					}else{
						alert("이미 존재하는 코드 값이다.["+data[0].code+"]");
					}
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
// 				alert("실패 :"+errorThrown);
				window.location.href = "<c:url value='/common/503error.do' />";
			}
		});
	}
	
	
	// 코드 중복체크 -> 코드 업데이트 실행
		
	function codeUpdate(){
		
		var detailArry= new Array();
		// id 가 new 인 엘리먼트들만 찾는다.
		
		// row가 있을 때
		if($("#"+TB_DETAIL_ID+" tbody > tr ").is("tr")){  
			$("#"+TB_DETAIL_ID+" tbody > tr ").each(function (i) {      
				var cellItem = $(this).find(":input", ":select");
				// 객체에 tr > td 값을 순서대로 담는다.
				var itemObj = new Object();	
				itemObj.detail_no = cellItem.eq(0).val();
				itemObj.code = cellItem.eq(1).val();
				itemObj.code_name = cellItem.eq(2).val();
				itemObj.status = cellItem.eq(3).val();
				itemObj.var_code = cellItem.eq(4).val();
				itemObj.var_name = cellItem.eq(5).val();
				itemObj.code_order = cellItem.eq(6).val();
				itemObj.ref_1 = cellItem.eq(7).val();
				itemObj.ref_2 = cellItem.eq(8).val();
				itemObj.ref_3 = cellItem.eq(9).val();
				itemObj.use_yn = $("#use_yn").val();
				itemObj.no = $("#no").val();
				itemObj.del_detail_no = DEL_DETAIL_NO;
				detailArry.push(itemObj);
			});
		
		// row가 없을 떄, 삭제 할 row no 넘겨줌
		}else{
			var itemObj = new Object();	
			itemObj.no = $("#no").val();
			itemObj.use_yn = $("#use_yn").val();
			itemObj.code = $("#code").val();
			itemObj.code_name = $("#code_name").val();
			itemObj.del_detail_no = DEL_DETAIL_NO;
			detailArry.push(itemObj);
		}
		
		var sendData = JSON.stringify(detailArry);
		// 추가한 row의 Data와 DB table의 Data를 비교하여 중복여부를 판단한다 
	 	$.ajax({	
			type: "POST",
			url : "<c:url value='/admin/codeDetailUpdate.do' />",
			dataType: "json",
			data : sendData,
			contentType:"application/json;charset=UTF-8",
			success : function(data, status, xhr) {
				alert("작업 완료!");	
				window.location.href = "<c:url value='/admin/codeManager.do' />";

			},
			error: function(jqXHR, textStatus, errorThrown) {
// 				alert("실패 :"+errorThrown);
				window.location.href = "<c:url value='/common/503error.do' />";
			}
		});
		
		
	}
	
	
	
	// 페이징 처리를 위한 함수
	function fn_search(pageNo){
        var fmSubmit = new FmSubmit();
        fmSubmit.setUrl("<c:url value='/admin/codeManager.do' />");
        fmSubmit.addParam("currentPageNo", pageNo);
        fmSubmit.submit();
    }
	

</script>


</head>
<body>
<%@ include file="/WEB-INF/include/include-body.jspf" %>
	<div class="adminInfoMain">
		
		<div class="adminInfoList" align="center">
			<button type="button" id="btn_codeAdd" name="btn_codeAdd" class="infoBtn">코드추가</button>
			<button type="button" id="btn_codeSave" name="btn_codeSave" class="infoBtn">코드저장</button>
			
			<form id="formCodeList" name="formCodeList" />
			<table class="tb_adminList" id="tb_adminList">
			    <colgroup>
			        <col width="30%"/>
			        <col width="*"/>
			        <col width="5%"/>
    			</colgroup>
				<thead>
				<tr>
					<th scope="col">코드번호</th>
					<th scope="col" colspan="2">이름</th>
				</tr>
				</thead>
				
				<tbody>
				<c:choose>
					<c:when test="${fn:length(list) > 0 }">
						<c:forEach var="row" items="${list }" varStatus="var">
							<tr>
								<td>
									<input type="text" id="code_${var.count }" value ="<c:out value="${row.code}"/>" class="codeInfo_input w40 read" required="required" readonly="readonly" />
								</td>
								<td>
									<input type="text" id="code_name_${var.count }" value ="<c:out value="${row.code_name}"/>" class="codeInfo_input w70 read" required="required" readonly="readonly" />
								</td>
								<td>
									<a href="#this" onclick="javascript:codeInfo('${row.code }','${row.code_name }');" > 
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
			<c:if test="${not empty paginationInfo}">
		        <ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
		    </c:if>
		    <input type="hidden" id="currentPageNo" name="currentPageNo"/>
			<br/>
		</div>
		
		
		
		<!-- Detail Frame -->
		<div name="adminInfoFrame" id ="adminInfoFrame" class="adminInfoFrame" >
			
			<div class="codeDetail_div" id="codeDetail_div">
			

			<form id="formCodeDetail" name="formCodeDetail" target="_parent">
			
			
			<table class="tb_adminInfo"  id="tb_codeDetail" name="tb_codeDetail">
			
			
				<div id="codeDetail_info" class="codeDetail_info" align="center">
					<h3>코드 상세 관리</h3>
					<input type="hidden" id="code_hidden" value="" class="infoTxt w40"/>
					<input type="hidden" id="no" value="" class="infoTxt w40" required="required"  />
					<input type="text" id="code" value="" class="infoTxt w65" required="required" />
					<input type="text" id="code_name" value="" class="infoTxt w130" required="required" />
					<select id="use_yn" name="use_yn" class="infoSel w55" required="required"><option value="">선택</option></select>
					<button type="button" id="btn_detailAdd" class="infoBtn">추가</button>
					<button type="button" id="btn_detailSave"  class="infoBtn">저장</button>
					<button type="button" id="btn_detailDel"  class="infoBtn">삭제</button>
				</div>
				<hr/>
			
			    <colgroup>
<!-- 					<col width="8%"/> -->
<!-- 					<col width="8%"/> -->
<!-- 			        <col width="8%"/> -->
<!-- 			        <col width="8%"/> -->
			        <col width="8%"/>
			        <col width="8%"/>
			        <col width="8%"/>
			        <col width="8%"/>
			        <col width="8%"/>
			        <col width="8%"/>
			        <col width="8%"/>
    			</colgroup>
				<thead>
					<tr align="center">
<!-- 						<th><span class="">*</span>번호</th> -->
<!-- 						<th><span class="">*</span>코드</th> -->
<!-- 						<th><span class="">*</span>코드이름</th> -->
<!-- 						<th><span class="">*</span>상태값</th> -->
						<th><span class="">*</span>변수이름</th>
						<th><span class="">*</span>변수값</th>
						<th><span class="">*</span>순번</th>
						<th>참조1</th>
						<th>참조2</th>
						<th>참조3</th>
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