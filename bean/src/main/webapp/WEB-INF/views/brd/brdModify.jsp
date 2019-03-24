<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<%@ include file="/WEB-INF/include/include-resource.jspf" %>
	<title>게시판 연습</title>
	<style type="text/css">
			
	</style>
	
<!-- 	<script src="js/jquery-1.11.1.js"></script> -->
 	<script type="text/javascript">
 	
//  	var gfv_count = '${fn:length(list)+1}';

	var codeset = new codeSet();
	codeset.setUrl("<c:url value='/common/selectCommonRef1Code.do' />");
	codeset.selectedRef1_selBox("3","subject", "${map.subject }","${cur_menu_id}");
 	
	
 	var gfv_count = gfvCountSort() + 1;
 	
 	function gfvCountSort(){
 		var max = ${maxidx};
 		return max;
 	}

    $(document).ready(function(){
        $("#list").on("click", function(e){
            e.preventDefault();
            fn_brdList();
        });  
        
        $("#update").on("click", function(e){
            e.preventDefault();
            fn_brdModifyUpdate();
        }); 
        
        $("#delete").on("click", function(e){
            e.preventDefault();
            fn_brdModifyDelete();
        }); 
        
        $("#addFile").on("click", function(e){ //파일 추가 버튼
            e.preventDefault();
            fn_addFile();
        });
        
        $("a[id^='delete']").on("click", function(e){ //삭제 버튼
            e.preventDefault();
            fn_deleteFile($(this));
        });       
        
        
    });

    function fn_brdList(){
        var fmSubmit = new FmSubmit();
        fmSubmit.setUrl("<c:url value='/brd/brdList.do' />");
        fmSubmit.submit();
    }
    
    function fn_brdModifyUpdate(){
        var fmSubmit = new FmSubmit("frm");
        if(fieldNullCheck("frm") == true){
        	fmSubmit.setUrl("<c:url value='/brd/brdModifyUpdate.do' />");
        	fmSubmit.addParam("menu_id", "${cur_menu_id}");
            fmSubmit.submit();	
        }
        
    }

    function fn_brdModifyDelete(){
    	var fmSubmit = new FmSubmit();
    	
    	if(confirm("삭제하시겠습니까?")){
    		fmSubmit.setUrl("<c:url value='/brd/brdModifyDelete.do' />");
        	fmSubmit.addParam("idx", "${map.idx }");
        	fmSubmit.addParam("menu_id", "${cur_menu_id}");
        	fmSubmit.submit();		
    	}
    }

    function fn_addFile(){
        var str = "<p><label id='lab_file_"+(gfv_count)+"' for='file_${row.fileidx }'>+</label>" +
                "<input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"' onchange='filenameView(this.id)'>"+
                "<a href='#this' class='brd_delBtn' id='delete_"+(gfv_count)+"' name='delete_"+(gfv_count)+"'>"+
              	"<img src='<c:url value='/resources/image/icon/icon_trash.png'/>' alt='돋보기' class='icon_trash'/>"+
                "</a>" +
            	"</p>";
            	
        $("#fileDiv").append(str);
        
        $("#file_"+(gfv_count)).trigger("click");
        
        $("#delete_"+(gfv_count++)).on("click", function(e){ //삭제 버튼
            e.preventDefault();
            fn_deleteFile($(this));
        });
        
        
        
        
    }

    function fn_deleteFile(obj){
        obj.parent().remove();
    }

    
	</script>
	
</head>
<body>
<%@ include file="/WEB-INF/include/include-header.jspf" %>
<div class="container"> 
 <form id="frm" name="frm" enctype="multipart/form-data">
     
       <table class="brd_view">
        <colgroup>
            <col width="15%"/>
            <col width="35%"/>
            <col width="15%"/>
            <col width="35%"/>
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
                <td>
                		<select id="subject" name="subject" class="w90" required="required">
							<option value="">선택</option>
						</select>
                </td>
                <th scope="row">작성시간</th>
                <td>${map.regdate }</td>
            </tr>
            <tr>
                <th scope="row">제목</th>
                <td colspan="3"><input type="text" id="title" name ="title" value="${map.title }" class="w515" required="required"/></td>
            </tr>
            <tr>
<%--                 <td colspan="4"><input type="text" id="contents" name ="contents" value="${map.CONTENTS }"/></td> --%>
                
                 <td colspan="4" class="view_text"><textarea rows="20" cols="100" title="내용" id="contents" name="contents">
                 ${map.contents }
                 </textarea></td>
            </tr>
            
           
             <tr>
	            <th scope="row">첨부파일</th>
	              <td colspan="3">
	                  <div class="fileDiv" id="fileDiv">                
	                      <c:forEach var="row" items="${list }" varStatus="var">
	                      <!-- 	                          <p> -->
<%-- 	                              <input type="hidden" id="idx" name="idx_${var.index }" value="${row.idx }"> --%>
<%-- 	                              <a href="#this" id="name_${var.index }" name="name_${var.index }">${row.originalfilename }</a> --%>
<%-- 	                              <input type="file" id="file_${var.index }" name="file_${var.index }">  --%>
<%-- 	                              (${row.filesize }kb) --%>
<%-- 	                              <a href="#this" class="btn" id="delete_${var.index }" name="delete_${var.index }">삭제</a> --%>
<!-- 	                          </p> -->

<!-- 	                          <p> -->
<%-- 	                              <input type="hidden" id="fileidx" name="fileidx" value="${row.fileidx }"> --%>
<%-- 	                              <input type="hidden" id="brdidx" name="brdidx" value="${row.brdidx }"> --%>
<%-- 	                              <a href="#this" id="name_${row.fileidx }" name="name_${row.fileidx }">${row.originalfilename }</a> --%>
<%-- 	                              <input type="file" id="file_${row.fileidx }" name="file_${row.fileidx }">  --%>
<%-- 	                              (${row.filesize }kb) --%>
<%-- 	                              <a href="#this" class="btn" id="delete_${row.fileidx }" name="delete_${row.fileidx }">삭제</a> --%>
<!-- 	                          </p> -->
	                      
	                      
	                          <p>
<%-- 	                              <input type="hidden" id="fileidx_${row.fileidx }" name="fileidx_${row.fileidx }" value="${row.fileidx }"> --%>
	                              <input type="hidden" id="brdidx" name="brdidx" value="${row.brdidx }">
	                              <a href="#this" id="name_${row.fileidx }" name="name_${row.fileidx }">${row.originalfilename }</a>
	                              <span class="fileSize">(${row.filesize }kb)</span>
	                              <label id="lab_file_${row.fileidx }" for="file_${row.fileidx }">+</label>
	                              <input type="file" id="file_${row.fileidx}" name="file_${row.fileidx }"> 
	                              <a href="#this" class="brd_delBtn" id="delete_${row.fileidx }" name="delete_${row.fileidx }">
	                              	<img src="<c:url value='/resources/image/icon/icon_trash.png'/>" alt="돋보기" class="icon_trash"/>
	                              </a>
	                          </p>
	                      </c:forEach>
	                  </div>
	              </td>
	          </tr>
	          
        </tbody>
    </table>
	<input type="hidden" id="idx" name="idx" value="${map.idx }"/>
	<input type="hidden" id="brdid" name="brdid" value="${map.brdid }"/>
 </form>
 
 	<button type="button" id="list" class="brd_btn">목록</button>
 	<button type="button" id="update" class="brd_btn">저장</button>
 	<button type="button" id="addFile" class="brd_btn">파일추가</button>
 	
 	<c:forEach var="rowin" items="${menuvo }" varStatus="status">
		<c:if test="${rowin.getMenu_id() eq cur_menu_id }">
		
			<c:if test="${rowin.getDelete_grant() eq 'Y'}">
				 <button type="button" id="delete" class="brd_btn">글삭제</button>
			</c:if>
		</c:if>
	</c:forEach>
 	
<!--  	<a href="#this" class="brd_btn" id="addFile">파일 추가</a> -->
<!--     <a href="#this" class="brd_btn" id="list">목록으로</a> -->
<!--     <a href="#this" class="brd_btn" id="update">저장하기</a> -->
<!--     <a href="#this" class="brd_btn" id="delete">삭제하기</a> -->


</div>
 <%@ include file="/WEB-INF/include/include-body.jspf" %>
 <%@ include file="/WEB-INF/include/include-bottom.jspf" %>                              	
</body>
</html>
