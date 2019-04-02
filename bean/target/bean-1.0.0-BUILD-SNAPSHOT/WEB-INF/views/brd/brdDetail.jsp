<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="javax.servlet.http.*" %>
<%
%>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/include/include-resource.jspf" %>
	<title>게시판 연습</title>
	<style type="text/css">
	</style>
	
 	<script type="text/javascript">
    $(document).ready(function(){
        $("#list").on("click", function(e){
            e.preventDefault();
            fn_brdList();
        });  
        
        $("#update").on("click", function(e){
            e.preventDefault();
            fn_brdModify();
        }); 
        
        $("a[id='file']").on("click", function(e){ //파일 이름
            e.preventDefault();
        
            fn_downloadFile($(this));
        });

    });

    function fn_brdList(){
        var fmSubmit = new FmSubmit();
        fmSubmit.setUrl("<c:url value='/brd/brdList.do' />");
        fmSubmit.addParam("menu_id", "${cur_menu_id}");
        fmSubmit.submit();
    }
    
    function fn_brdModify(){
    	var idx = "${map.idx}";
    	 $("#frm")[0].reset();
        var fmSubmit = new FmSubmit();
        fmSubmit.setUrl("<c:url value='/brd/brdModify.do' />");
        fmSubmit.addParam("menu_id", "${cur_menu_id}");
        fmSubmit.addParam("idx",idx);
        
        fmSubmit.submit();
    }
    
    function fn_downloadFile(obj){
    	
        var brdidx = obj.parent().find("#brdidx").val();
        var fileidx = obj.parent().find("#fileidx").val();
        
        var fmSubmit = new FmSubmit();
        fmSubmit.setUrl("<c:url value='/common/downloadFile.do' />");
        fmSubmit.addParam("fileidx", fileidx);
        fmSubmit.addParam("brdidx", brdidx);
        fmSubmit.submit();
        fmSubmit.delParam();

    }
    



	</script>
	
</head>
<body>
 <%@ include file="/WEB-INF/include/include-header.jspf" %>
 <%@ include file="/WEB-INF/include/include-body.jspf" %>
 <div class="container">
 <form id="frm" name="frm">
 
 
       <table class="brd_view">
        <colgroup>
            <col width="15%"/>
            <col width="25%"/>
            <col width="15%"/>
            <col width="45%"/>
        </colgroup>

        <tbody>
            <tr>
                <th scope="row">글 번호</th>
                <td>${map.brdidx }</td>
                <th scope="row">조회수</th>
                <td>${map.hitcnt }</td>
            </tr>
            <tr>
<!--                 <th scope="row">작성자</th> -->
<%--                 <td>${map.regid }</td> --%>
                <th scope="row">이름</th>
                <td colspan="3">${map.regname }</td>
            </tr>
            <tr>
            	<th scope="row">말머리</th>
                <td>${map.subject }</td>
                <th scope="row">작성시간</th>
                <td>${map.regdate }</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3">${map.title }</td>
            </tr>
            <tr>
                <td colspan="4" class="view_text">
                
                <c:out value="${row.fileext }" />
              	  <c:forEach var="row" items="${list }">
                	<c:if test ="${row.fileext == 'jpg' or row.fileext == 'png' or row.fileext == 'jpeg' or row.fileext == 'bmp' or
                				   row.fileext == 'JPG' or row.fileext == 'PNG' or row.fileext == 'JPEG' or row.fileext == 'BMP'}">
                		<img src ="<c:url value ="/uploadFile/${row.storedfilename}" />" alt="첨부파일_<c:out value="${row.originalfilename }" />" width="500px" height="auto" class="att_img" />
<%--                 		<img src ="/uploads/bean/${row.storedfilename}" alt="첨부파일_<c:out value="${row.originalfilename }" />" width="500px" height="auto" class="att_img" /> --%>
                	</c:if>
                	<br/> 
             	  </c:forEach>
             	  
              	  ${map.contents }
              	  
                </td>
            </tr>
            
            <c:if test="${fn:length(list) > 0 }">
            <tr>
                <th scope="row">첨부파일</th>
                <td colspan="3">
             		<div class="fileDiv" id="fileDiv">   
                    <c:forEach var="row" items="${list }">
                        <p>
                        	<input type="hidden" id="brdidx" value="${row.brdidx }">
                        	<input type="hidden" id="fileidx" value="${row.fileidx }">
                        	<a href="#this" id="file"  >${row.originalfilename }</a><span class="fileSize">(${row.filesize }kb)</span>
                        </p>                   
                    </c:forEach>
                    </div>
                </td>
            </tr>
            </c:if>

        </tbody>
    </table>
    
    <button type="button" id="list" class="brd_btn">목록</button>
<!--     <a href="#this" class="btn" id="list">목록으로</a> -->
    
   	<c:if test="${loginId == map.regid}">
<!--    		<a href="#this" class="brd_btn" id="update">수정하기</a> -->
   		<button type="button" id="update" class="brd_btn">글수정</button>
   	</c:if>
   	
    </form>
</div>
<%@ include file="/WEB-INF/include/include-bottom.jspf" %>                               	
</body>
</html>
