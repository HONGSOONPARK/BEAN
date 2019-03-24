<%@ page contentType="text/html; charset=UTF-8"%>

<html lang="ko">
<head>
	<%@ include file="/WEB-INF/include/include-resource.jspf" %>
	<title>게시판 연습</title>
	<style type="text/css">

	</style>
	
 	<script type="text/javascript">
 	var gfv_count = 0;
 	
 	var codeset = new codeSet();
	codeset.setUrl("<c:url value='/common/selectCommonRef1Code.do' />");
	codeset.selectRef1Box("3","subject","${cur_menu_id}");
	
	
    $(document).ready(function(){
    	
    	
        $("#list").on("click", function(e){
            e.preventDefault();
            fn_brdList();
        });  
        
        $("#write").on("click", function(e){
            e.preventDefault();
            
            if($("#subject").val() == 0){
            	alert("말머리를 선택해주세요.");
            	return false;
            }
            fn_brdWriteInsert();
        });
        
        
        $("#addFile").on("click", function(e){ //파일 추가 버튼
            e.preventDefault();
            fn_addFile();
        });

        $("a[id='delete']").on("click", function(e){ //삭제 버튼
            e.preventDefault();
            fn_deleteFile($(this));

        });
        

        
    });
    

    function fn_brdList(){
        var fmSubmit = new FmSubmit();
        fmSubmit.setUrl("<c:url value='/brd/brdList.do' />");
        
        fmSubmit.submit();
    }
    
    function fn_brdWriteInsert(){
        var fmSubmit = new FmSubmit("frm");
        fmSubmit.setUrl("<c:url value='/brd/brdWriteInsert.do' />");
        fmSubmit.addParam("menu_id", "${cur_menu_id}");
        
        fmSubmit.submit();
    }

    function fn_addFile(){

        var str = "<p><label id='lab_file_"+(gfv_count)+"' for='file_"+(gfv_count)+"'>+</label><input type='file' id='file_"+(gfv_count)+"' name='file_"+(gfv_count)+"' onchange='filenameView(this.id)'>"+
        "<a href='#this' class='brd_delBtn' id='delete'><img src='<c:url value='/resources/image/icon/icon_trash.png'/>' alt='삭제' class='icon_trash'/></a>" +
    	"</p>";
        
        
        $("#fileDiv").append(str);
        $("a[id='delete']").on("click", function(e){ //삭제 버튼
            e.preventDefault();
            fn_deleteFile($(this));
        });
        
        $("#file_"+(gfv_count)).trigger("click");
        
        gfv_count++;
        
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
                <col width="15%">
                <col width="*">
            </colgroup>
            <tbody>
                <tr>
                	<th scope="row">말머리</th>
                    <td>
						<select id="subject" name="subject" class="w90">
							<option value="0" selected="selected">선택</option>
<!-- 							<option value="1">공문</option> -->
<!-- 							<option value="2">중요</option> -->
<!-- 							<option value="3">행사</option> -->
						</select>
                    </td>
                </tr>
                <tr>
                	<th scope="row">제목</th>
                    <td align="left"><input type="text" id="title" name="title" class="w515"></input></td>
                </tr>
                
                <tr>
                    <td colspan="4" class="view_text">
                        <textarea rows="20" cols="100" title="내용" id="contents" name="contents"></textarea>
                    </td>
                </tr>
                
                <tr>
	            <th scope="row">첨부파일</th>
	              <td colspan="3">
	              	<div class="fileDiv" id="fileDiv">
<!--             <p> -->
<!-- 				<label for="file_0">+</label>             -->
<%--                 <input type="file" id="file_0" name="file_0" value="temp"><a href="#this" class="brd_delBtn" id="delete" ><img src="<c:url value='/resources/image/icon/icon_trash.png'/>" alt="삭제" class="icon_trash"/></a> --%>
<!--             </p> -->
        			</div>
	              </td>
	            </tr>
            </tbody>
        </table>

        
        
        <br/><br/>
        
<!--         <a href="#this" class="brd_btn" id="addFile">파일 추가</a> -->
<!--         <a href="#this" class="brd_btn" id="write" >작성하기</a> -->
<!--         <a href="#this" class="brd_btn" id="list" >목록으로</a> -->
        
        <button type="button" id="list" class="brd_btn">목록</button>
 		<button type="button" id="write" class="brd_btn">저장</button>
 		<button type="button" id="addFile" class="brd_btn">파일추가</button>
        
        
        <input type="hidden" id="brdid" name="brdid" value="${cur_menu_id }" />
    </form>
</div>  
 <%@ include file="/WEB-INF/include/include-body.jspf" %>
 <%@ include file="/WEB-INF/include/include-bottom.jspf" %>           
                   	
</body>
</html>
