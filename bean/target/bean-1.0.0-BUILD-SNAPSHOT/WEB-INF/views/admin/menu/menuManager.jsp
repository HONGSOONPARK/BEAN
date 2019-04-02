<%@ page contentType="text/html; charset=UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/include-resource.jspf" %>


<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/tree/jquery.treeview.css'/>" />
<script src="<c:url value='/resources/js/tree/jquery.treeview.js'/>" charset="utf-8"></script>


<title>관리자메인</title>

<style type="text/css">
</style>

<script type="text/javascript">

	var codeset = new codeSet();
	var lastRow = 0;
	
	codeset.setUrl("<c:url value='/common/selectCommonCode.do' />");
// 	codeset.selectBox("2","use_yn_0");
	
	
	var ADD_CHECK = 0;
	var ADD_CHECK_DETAIL = 0;
	var DEPTH_1;
	var DEPTH_1_NAME;
	var TEMP_DEPTH_2;
	
	var DEL_NO = new Array();
	var MENU_ID = new Array();
	var TB_DETAIL_ID = "tb_menuDetail";
	
	var COL_NAME = ['no', 'depth_1', 'status', 'menu_name', 'menu_id', 'depth_2', 'menu_url', 'sort', 'use_yn', 'admin_yn','compare_depth_2','compare_menu_id'];
	
	// 초기화
	
	
	var rdmenu = "<c:out value='${rdmenu}'/>" ;
	var rdmenunm = "<c:out value='${rdmenunm}'/>" ;
	
// 	menuDetail(rdmenu, "사용중인 메뉴");
	
	$(document).ready(function(){
		 $("#tree").treeview({
             collapsed: false,
             animated: "medium",
             control:"#sidetreecontrol",
             persist: "location"
         });
		 
		 if(rdmenunm == null || rdmenunm == ""){
			 rdmenunm = "최상단";
		 }
		 menuDetail(rdmenu,rdmenunm);
		 
		 $("#btn_detailAdd").on("click",function(e){
				var html;
				var varTable = $(this).parent().parent().find('tbody');
	            var varTableLastRow = varTable.find('tr:last'); // 행추가 마지막 row
	            var copyRow = varTableLastRow.clone(true); // 행추가 마지막 row 복사
	            ADD_CHECK_DETAIL += 1;
	            
				// 기존 row 복사 추가
				if(varTable.find("tr").is("tr")){
		            // 첫번째 node, 두번쨰 node를 제외한 value 초기화
		            
			        $(copyRow).find('td > :input').not("td:nth-child(2) > :input").each(function(i){
			        	
			        	$(copyRow).find('td:nth-child(3) > :input').val("insert");
			        	$(copyRow).find('td:nth-child(10) > :input').val("N");
			        	$(copyRow).find("td:last > a").attr("onclick","javascript:menuDetailRowDel($(this), -1);");
			        	this.value = '';
			        	$(this).attr("id", "insert_"+ADD_CHECK_DETAIL+"_"+i);
		          	});
		            
			        copyRow.attr("id","new");
			        
		            varTable.append(copyRow);
		            
		        // 새로운 row 추가
				}else{
					html +="<tr align='center' id='new' >";
					html += "<td class='displayNone'><input type='hidden' id='no_0' value='' class='infoTxt w25'/></td>";
					html += "<td class='displayNone'><input type='hidden' id='depth_1_0' value='"+nullToBlank(DEPTH_1)+"' class='infoTxt w30' required='required' /></td>";
					html += "<td class='displayNone'><input type='hidden' id='status_0' value='insert' class='infoTxt w45' required='required' /></td>";
					html += "<td><input type='text' id='menu_name_0'  value='' class='infoTxt w75' required='required' /></td>";
					html += "<td><input type='text' id='menu_id_0'  value='' class='infoTxt w75' required='required'  /></td>";
					html += "<td><input type='text' id='depth_2_0' value='' class='infoTxt w55' required='required' /> </td>";
					html += "<td><input type='text' id='menu_url_0' value='' class='infoTxt w60' /></td>";
					html += "<td><input type='text' id='sort__0' value='' class='infoTxt w30' required='required' /></td>";
					html += "<td><select id='use_yn_0' name='use_yn_0' class='infoTxt w55' required='required'><option value=''>선택</option></select></td>";
					html += "<td><select id='admin_yn_0' name='admin_yn_0' class='infoTxt w55 read' required='required' onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;'  ><option value=''>선택</option></select></td>";
					html += "<td class='displayNone'><input type='hidden' id='depth_2_check_0' value='' class='infoTxt w30' /></td>";
					html += "<td class='displayNone'><input type='hidden' id='menu_id_check_0' value='' class='infoTxt w30' /></td>";
					html += "<td align='left'><a href='#this' onclick='menuDetailRowDel($(this), -1);' ><img src='<c:url value='/resources/image/icon/icon_del.png'/>' alt='돋보기' class='icon_info'/></a></td>";
					html +="</tr>";
					varTable.append(html);
					setTimeout('',1000);
				 	codeset.selectBox("2","use_yn_0");
				 	codeset.selectBox("2","admin_yn_0");
				 	codeset.selectBox("2","admin_yn_0","N");
				}
	            
			});
		 
		 
			$("#btn_detailSave").on("click",function(e){
				
				
				var arry_new = new Array();
				var arry_all = new Array();
				// 추가한 row의 value Null Check
				
				if($("#"+TB_DETAIL_ID+" tbody > tr ").is("tr")){
					arry_new = redupCheck(TB_DETAIL_ID, COL_NAME, "depth_2");
					
//	 				arry_all = tableAllCheck(TB_DETAIL_ID, COL_NAME);
					
					if(arry_new != false){
						if(fieldNullCheck("formMenuDetail") == true){
							codeOverlapCheck(arry_new);
						}
					}
				}else{
					menuDelete(arry_new);
				}
			});
		 
	});
	
	
	function menuDelete(arry_new){
		
		var arry = new Array();
		var itemObj = new Object();	
		itemObj["del_no"] = DEL_NO;
		itemObj["del_seq_menu_id"] = MENU_ID;	
		arry.push(itemObj);

		
		var sendData = JSON.stringify(arry);
		
		// 추가한 row의 Data와 DB table의 Data를 비교하여 중보여부를 판단한다 
	 	$.ajax({	
			type: "POST",
			url : "<c:url value='/admin/menuDelete.do' />",
			dataType: "json",
			data : sendData,
			contentType:"application/json;charset=UTF-8",
			success : function(data, status, xhr) {
			
				menuUpdate(arry_new);
			
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert("실패 :"+errorThrown);
				window.location.href = "<c:url value='/common/503error.do' />";
			}
		});
	}
	
	
	function menuUpdate(arry){
		
		var sendData = JSON.stringify(arry);
// 		alert(sendData);
		
		// 추가한 row의 Data와 DB table의 Data를 비교하여 중보여부를 판단한다 
	 	$.ajax({	
			type: "POST",
			url : "<c:url value='/admin/menuUpdate.do' />",
			dataType: "json",
			data : sendData,
			contentType:"application/json;charset=UTF-8",
			success : function(data, status, xhr) {
				
				alert("작업완료");
// 				menuDetail(DEPTH_1, DEPTH_1_NAME);
// 				window.location.href = "<c:url value='/admin/menuList.do?rd="+DEPTH_1+"&rdnm="+DEPTH_1_NAME+"'/>";
				window.location.href = "<c:url value='/admin/menuList.do?'/>";
					
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert("실패 :"+errorThrown);
				window.location.href = "<c:url value='/common/503error.do' />";
			}
		});
	}
	
	
	
	
	function codeOverlapCheck(arry_new){
		
		var sendData = JSON.stringify(arry_new);
		
		
		// 추가한 row의 Data와 DB table의 Data를 비교하여 중보여부를 판단한다 
	 	$.ajax({	
			type: "POST",
			url : "<c:url value='/admin/menuCheck.do' />",
			dataType: "json",
			data : sendData,
			contentType:"application/json;charset=UTF-8",
			success : function(data, status, xhr) {
				if(data != null){
					
					if(data.count > 0){
// 						alert("이미 존재하는 코드 값이다.["+data.depth_2+"]");
						alert("이미 메뉴ID, 메뉴코드를 확인해주세요(중복불가).");
						return false;
					}else{
						menuDelete(arry_new);
					}
				}else{
						menuDelete(arry_new);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert("실패 :"+errorThrown);
				window.location.href = "<c:url value='/common/503error.do' />";
			}
		});
	}
	
	
	function menuDetail(depth1, mn) {
		
		if(depth1 == ""){
			depth1 = 0;
		}
		
		DEL_NO = new Array();
		MENU_ID = new Array();
		DEPTH_1 = depth1;
		DEPTH_1_NAME = mn;
		
		var sendData = JSON.stringify({depth_1: depth1});
		var list;
		
		$("#menuDetail_info > h3").remove();
		$("#menuDetail_info").prepend(
				$('<h3/>', 
				{
			        title: '선택한 메뉴의 이름',
			        text: mn +"("+depth1+")의 하위 메뉴들입니다."
			    })
		);
		
		 $.ajax({	
				type: "POST",
				url : "<c:url value='/admin/menuDetail.do' />",
				dataType: "json",
				data : sendData,  
				contentType:"application/json;charset=UTF-8",
				success : function(data, status, xhr) {
			          menuDetailList(data);
				},
				error: function(jqXHR, textStatus, errorThrown) {
// 					alert("실패 :"+errorThrown);
					window.location.href = "<c:url value='/common/503error.do' />";
				}
			});
		
	}
	
	
	function menuDetailList(data) {
			
			$("#"+TB_DETAIL_ID+" > tbody > tr").remove();
			var varTable = $("#"+TB_DETAIL_ID+" > tbody");
			
// 			data.select`
			
			var html;
			var varList;
			var varListSelect;
			
			for(var i=0; i<data.list.length; i++){
				varList = data.list[i];
				html +="<tr align='center'>";
				html += "<td class='displayNone'><input type='hidden' id='no_"+i+"' value='"+nullToBlank(varList.no)+"' class='infoTxt w25' /></td>";
				html += "<td class='displayNone'><input type='hidden' id='depth_1_"+i+"' value='"+nullToBlank(varList.depth_1)+"' class='infoTxt w30' required='required' /></td>";
				html += "<td class='displayNone'><input type='hidden' id='status"+i+"' value='update' class='infoTxt w45' required='required' /></td>";
				html += "<td><input type='text' id='menu_name_"+i+"'  value='"+nullToBlank(varList.menu_name)+"' class='infoTxt w75' required='required' /></td>";
				html += "<td><input type='text' id='menu_id_"+i+"'  value='"+nullToBlank(varList.menu_id)+"' class='infoTxt w75' required='required'  /></td>";
				html += "<td><input type='text' id='depth_2_"+i+"' value='"+nullToBlank(varList.depth_2)+"'  class='infoTxt w55' required='required'  /></td>";

				// 				html += "<td><input type='text' id='depth_2_"+i+"' value='"+nullToBlank(varList.depth_2)+"'  class='infoTxt w55' required='required' onfocus='depthFocus(this.value)' onchange='depthOverlapCheck(this.value, this.id)' /></td>";
				
				html += "<td><input type='text' id='menu_url_"+i+"' value='"+nullToBlank(varList.menu_url)+"' class='infoTxt w60' /></td>";
				html += "<td><input type='text' id='sort_"+i+"' value='"+nullToBlank(varList.sort)+"' class='infoTxt w30' required='required' /></td>";
				html += "<td><select id='use_yn_"+i+"' name='use_yn_"+i+"' class='infoTxt w55' required='required'><option value=''>선택</option></select></td>";
				html += "<td><select id='admin_yn_"+i+"' name='admin_yn_"+i+"' class='infoTxt w55 read' required='required' onFocus='this.initialSelect = this.selectedIndex;' onChange='this.selectedIndex = this.initialSelect;' ><option value=''>선택</option></select></td>";
				html += "<td class='displayNone'><input type='hidden' id='depth_2_check"+i+"' value='"+nullToBlank(varList.depth_2)+"' class='infoTxt w30'/></td>";
				html += "<td class='displayNone'><input type='hidden' id='menu_id_check"+i+"' value='"+nullToBlank(varList.menu_id)+"' class='infoTxt w30'/></td>";
				html += "<td align='left'><a href='#this' onclick='menuDetailRowDel($(this), "+nullToBlank(varList.depth_2)+");' ><img src='<c:url value='/resources/image/icon/icon_del.png'/>' alt='돋보기' class='icon_info'/></a></td>";
				html+="</tr>";
			}
			
			varTable.append(html);
			setTimeout('',1000);
			for(var i=0; i<data.list.length; i++){
				varListSelect = data.list[i];
				codeset.selectBox("2","use_yn_"+i+"",varListSelect.use_yn);
				codeset.selectBox("2","admin_yn_"+i+"",varListSelect.admin_yn);
			}
	}
	
// 	function depthFocus(val){
		
// 		TEMP_DEPTH_2 = val;
// 		alert(TEMP_DEPTH_2);
// 		continue;
// 	}
	
	
// 	function depthOverlapCheck(val, id){
		
// 		var sendData = JSON.stringify({depth_2 : val});
// 		// 추가한 row의 Data와 DB table의 Data를 비교하여 중보여부를 판단한다 
// 	 	$.ajax({	
// 			type: "POST",
// 			url : "<c:url value='/admin/menuDepthCheck.do' />",
// 			dataType: "json",
// 			data : sendData,
// 			contentType:"application/json;charset=UTF-8",
// 			success : function(data, status, xhr) {
					
// 				if(data != null){
// 					if($("#"+id).prop('defaultValue') != val){
// 						alert("이미 존재하는 코드 값이다.["+data.pmenu_name+" > "+data.menu_name+"]");
// 						$("#"+id).focus();
// 						$("#"+id).val($("#"+id).prop('defaultValue'));
// 						return false;	
// 					}
// 				}
// 			},
// 			error: function(jqXHR, textStatus, errorThrown) {
// // 				alert("실패 :"+errorThrown);
// 				window.location.href = "<c:url value='/common/503error.do' />";
// 			}
// 		});
// 	}
	
	
	
	// menu detail row del 버튼
	function menuDetailRowDel(obj, val){
		
		var sendData = JSON.stringify({depth_2 : val});
		
		$.ajax({	
			type: "POST",
			url : "<c:url value='/admin/menuDelCheck.do' />",
			dataType: "json",
			data : sendData,
			contentType:"application/json;charset=UTF-8",
			success : function(data, status, xhr) {
					
				if(data > 0 ){
					alert("자식 메뉴가 발견되었습니다 ");
					return false;
					
				}else{
					ADD_CHECK_DETAIL -= 1;
					
					if($(obj).parent().parent().find("td:nth-child(1) > :input").eq(0).val() != ''){
						DEL_NO.push($(obj).parent().parent().find("td:nth-child(1) > :input").eq(0).val());
						MENU_ID.push($(obj).parent().parent().find("td:nth-child(5) > :input").eq(0).val());
					}
			 		
					$(obj).parent().parent().remove();
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
// 				alert("실패 :"+errorThrown);
				window.location.href = "<c:url value='/common/503error.do' />";
			}
		});

	}
	
	

	
	
		
	
	
	function accessFail(){
		alert("Depth_2 이하 메뉴 생성 불가 ");
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
		
		<div class="adminInfoList" >
			<div id="sidetree" class="sidetree" >
<!-- 			    <div class="treeheader"> -->
			          
<!-- 			    </div> -->
			    
			    <div id="sidetreecontrol">
				    <p><strong>현재 사용중인 메뉴</strong></p>
				    <p><a href="?#">접기</a>|<a href="?#">펼치기</a></p>
			    </div>
			    
			    <div id="treeTop" class="treeTop">
			    	<strong><a href="javascript:menuDetail(0, '최상단');" >최상단</a></strong>
			    </div>
			    
				<ul id="tree">
				<c:choose>
					<c:when test="${fn:length(menuvo) > 0 }">
						<c:forEach var="row" items="${menuvo }" varStatus="var">
							<c:choose>
<%-- 								<c:when test="${row.getLeaf() == 0 && row.getDepth_1() == 0}" > --%>
									<c:when test="${row.getDepth_1() == 0}" >
									<li>
										<a href="javascript:menuDetail(${row.getDepth_2()}, '${row.getMenu_name()}');">${row.getMenu_name()}</a>
										
										<c:forEach var="rowin" items="${menuvo }" varStatus="status">
											
											<c:if test ="${status.first}">
												<ul>
											</c:if>	
											
												<c:if test ="${row.getDepth_2() eq rowin.getDepth_1() }">
													<li>
														<a href="javascript:accessFail()">${rowin.getMenu_name()}</a>
<%-- 														<a href="javascript:menuDetail(${rowin.getDepth_2()}, '${rowin.getMenu_name()}');">${rowin.getMenu_name()}</a> --%>
													</li>
												</c:if>
												
											<c:if test ="${status.last}">
												</ul>
											</c:if>
										</c:forEach>
									</li>
								</c:when>
		                      	<c:when test="${row.getLeaf() == 1 && row.getDepth_1() == 0}" >
		                      		<li>
		                      			<a href="javascript:menuDetail(${row.getDepth_2()}, '${row.getMenu_name()}');">${row.getMenu_name()}</a>
		                      		</li>
		                      	</c:when>
							</c:choose>
						</c:forEach>
					</c:when>  
					<c:otherwise>
					</c:otherwise>  
				 </c:choose>
				 </ul>
			</div>

		</div>
		
		<!-- Detail Frame -->
		<div name="adminInfoFrame" id ="adminInfoFrame" class="adminInfoFrame" >
			
			<div class="" id="">
				
				<div class="" id="">
				
						<form id="formMenuDetail" name="formMenuDetail" target="_parent">
							<table class="tb_adminInfo"  id="tb_menuDetail" name="tb_menuDetail">
							
								<div id="menuDetail_info" class="menuDetail_info" align="center">
									<h3>메뉴 상세 관리</h3>
									<button type="button" id="btn_detailAdd" class="infoBtn">추가</button>
									<button type="button" id="btn_detailSave"  class="infoBtn">저장</button>
<!-- 									<button type="button" id="btn_detailDel"  class="infoBtn">삭제</button> -->
								</div>
								<hr/>
							
							    <colgroup>
<!-- 							    	<col width="3%"/> -->
<!-- 							        <col width="7%"/> -->
<!-- 							        <col width="5%"/> -->
							        <col width="15%"/>
							        <col width="15%"/>
							        <col width="10%"/>
							        <col width="9%"/>
							        <col width="5%"/>
							        <col width="5%"/>
							        <col width="5%"/>
							        <col width="3%"/>
<!-- 							        <col width="3%"/> -->
				    			</colgroup>
								<thead>
									<tr align="center">
<!-- 										<th><span class="">*</span>No</th> -->
<!-- 										<th><span class="">*</span>부모메뉴</th> -->
<!-- 										<th><span class="">*</span>상태</th> -->
										<th><span class="">*</span>메뉴이름</th>
										<th><span class="">*</span>메뉴ID</th>
										<th><span class="">*</span>메뉴코드</th>
										<th><span class=""></span>메뉴URL</th>
										<th><span class="">*</span>순서</th>
										<th><span class="">*</span>사용</th>
										<th><span class="">*</span>관리자</th>
<!-- 										<th><span class=""></span>변경확인</th> -->
										<th></th>
									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
							</form>
			
				</div>
			
				<div class="adminInfoClear">
				</div>
		
			</div>
		</div>



	</div>
</body>
</html>