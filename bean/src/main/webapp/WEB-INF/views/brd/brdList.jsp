<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/include/include-resource.jspf" %>
	<title>게시판 연습</title>
 	<script type="text/javascript">

		$(document).ready(function(){
			 $("#write").on("click", function(e){ //글쓰기 버튼
		         e.preventDefault();
		         fn_brdWrite();
	         }); 
			 
			 $("a[id='title']").on("click", function(e){ //글쓰기 버튼
				 e.preventDefault();
				 fn_brdDetail($(this));
	         }); 
		});
		function fn_brdWrite() {
			 var fmSubmit = new FmSubmit();
			 fmSubmit.setUrl("<c:url value='/brd/brdWrite.do' />");
			 fmSubmit.addParam("menu_id", "${cur_menu_id}");
			 fmSubmit.submit();
		 }
		
		function fn_brdDetail(obj) {
			if($("#read_grant").val() == 'Y'){
				var fmSubmit = new FmSubmit();
				 fmSubmit.setUrl("<c:url value='/brd/brdDetail.do' />");
				 fmSubmit.addParam("idx", obj.parent().find("#idx").val());
				 fmSubmit.addParam("menu_id", "${cur_menu_id}");
				 fmSubmit.submit();	
			}else{
				alert("해당 게시판 읽기권한이 없습니다.");
			}
			
			
		 }
		
		function fn_search(pageNo){
			
            var fmSubmit = new FmSubmit();
            fmSubmit.setUrl("<c:url value='/brd/brdList.do' />");
            fmSubmit.addParam("currentPageNo", pageNo);
            fmSubmit.addParam("menu_id", "${cur_menu_id}");
            fmSubmit.submit();
        }

		
	</script>
	
</head>
<body>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<%@ include file="/WEB-INF/include/include-body.jspf" %>

<div class="container">
<div align="center">

	<c:forEach var="rowin" items="${menuvo }" varStatus="status">
		<c:if test="${rowin.getMenu_id() eq cur_menu_id}">
			<c:set var="read_grant" value="${rowin.getRead_grant()}" />
		</c:if>
	</c:forEach>


<table class="brd_table">
    <colgroup>
        <col width="6%"/>
        <col width="9%"/>
        <col width="*"/>
<!--         <col width="9%"/> -->
        <col width="9%"/>
        <col width="9%"/>
        <col width="25%"/>
    </colgroup>
    <thead>
        <tr>
            <th scope="col">번호</th>
            <th scope="col">말머리</th>
            <th scope="col">제목</th>
<!--             <th scope="col">작성자</th> -->
            <th scope="col">이름</th>
            <th scope="col">조회수</th>
            <th scope="col">작성일</th>
        </tr>
    </thead>
    <tbody>
    
    <input type="hidden" id="read_grant" namd="read_grant" value="${read_grant }">
                <c:forEach items="${list }" var="row" varStatus="status">
        		<c:choose>
         		   <c:when test="${total_count > 0}">         	  
                   
                    <tr>
                        <td>${row.brdidx }</td>
                        <td>${row.subject }</td>
                        <td class="title">
                        	<a href="#this" id="title" >${row.title }</a>
                            <input type="hidden" id="idx" namd="idx" value="${row.idx }">
                            <c:if test ="${row.filecount > 0}">
                            	<img src="<c:url value='/resources/image/icon/icon_attach.png'/>" alt="첨부파일" class="icon_attach"/>
                            </c:if>
                        </td>
<%--                         <td>${row.regid }</td> --%>
						<td>${row.regname }</td>
                        <td>${row.hitcnt }</td>
                        <td>${row.regdate }</td>
                    </tr>
             	  </c:when>     
             	  <c:otherwise>
	              	<tr>
	                	<td colspan="7">조회된 결과가 없습니다.</td>
	              	</tr>
	              </c:otherwise>
	              
                 </c:choose>   
                </c:forEach>
    </tbody>
</table>

 	<c:if test="${not empty paginationInfo}">
        <ui:pagination paginationInfo = "${paginationInfo}" type="text" jsFunction="fn_search"/>
    </c:if>
    <input type="hidden" id="currentPageNo" name="currentPageNo"/>
	<br/>
	
	
	<c:forEach var="rowin" items="${menuvo }" varStatus="status">
		<c:if test="${rowin.getMenu_id() eq cur_menu_id }">
		
			<c:if test="${rowin.getWrite_grant() eq 'Y'}">
				 <button type="button" id="write" class="brd_btn">글쓰기</button>
			</c:if>
		</c:if>
	</c:forEach>
	

</div>
</div>
  
<%@ include file="/WEB-INF/include/include-bottom.jspf" %>                               	
</body>
</html>
