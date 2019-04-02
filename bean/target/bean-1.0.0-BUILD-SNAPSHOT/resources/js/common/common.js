function CheckNull(str) {
    if (str == null) return true;
    if (str == "NaN") return true;
    if (new String(str).valueOf() == "undefined") return true;    
    var chkStr = new String(str);
    if( chkStr.valueOf() == "undefined" ) return true;
    if (chkStr == null) return true;    
    if (chkStr.toString().length == 0 ) return true;
    
    
    return false; 
}

function FmSubmit(fmId) {
    this.formId = CheckNull(fmId) == true ? "commonForm" : fmId;
    this.url = "";
    this.param = "?";
     
    if(this.formId == "commonForm"){
        $("#commonForm")[0].reset();
    }

    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    this.addParam = function addParam(key, value){
        $("#"+this.formId).append($("<input type='hidden' name='"+key+"' id='"+key+"' value='"+value+"' >"));
    };
    
    this.addParamGet = function addParamGet(key,value){ 
        this.param = this.param + "&" + key + "=" + value; 
    };
    
    this.delParam = function delParam(){
    	var del = document.getElementById(this.formId);
    	while(del.firstChild) {
    		del.removeChild(del.firstChild);
    	}
    };
    
     
    this.submit = function submit(key, value){
    	var frm = $("#"+this.formId)[0];
    	frm.action = this.url+this.param;
        frm.method = "post";
        frm.submit();   
    };
}





var gfv_ajaxCallback = "";
function ComAjax(opt_formId){
	
    this.url = "";      
    this.formId = CheckNull(opt_formId) == true ? "commonForm" : opt_formId;
    this.param = "";
     
    if(this.formId == "commonForm"){
        var frm = $("#commonForm");
        if(frm.length > 0){
            frm.remove();
        }
        var str = "<form id='commonForm' name='commonForm'></form>";
        $('body').append(str);
    }
     
    this.setUrl = function setUrl(url){
        this.url = url;
    };
     
    this.setCallback = function setCallback(callBack){
        fv_ajaxCallback = callBack;
    };
 
    this.addParam = function addParam(key,value){ 
        this.param = this.param + "&" + key + "=" + value; 
    };
     
    this.ajax = function ajax(){
        if(this.formId != "commonForm"){
            this.param += "&" + $("#" + this.formId).serialize();
        }
        $.ajax({
            url : this.url,    
            type : "POST",   
            data : this.param,
            async : false, 
            success : function(data, status) {
                if(typeof(fv_ajaxCallback) == "function"){
                    fv_ajaxCallback(data);
                }
                else {
                    eval(fv_ajaxCallback + "(data);");
                }
            }
        });
    };
}


/*
divId : 페이징 태그가 그려질 div
pageIndx : 현재 페이지 위치가 저장될 input 태그 id
recordCount : 페이지당 레코드 수
totalCount : 전체 조회 건수 
eventName : 페이징 하단의 숫자 등의 버튼이 클릭되었을 때 호출될 함수 이름
*/

var gfv_pageIndex = null;
var gfv_eventName = null;
function gfn_renderPaging(params){
    var divId = params.divId; //페이징이 그려질 div id
    gfv_pageIndex = params.pageIndex; //현재 위치가 저장될 input 태그
    var totalCount = params.totalCount; //전체 조회 건수
    var currentIndex = $("#"+params.pageIndex).val(); //현재 위치
    if($("#"+params.pageIndex).length == 0 || CheckNull(currentIndex) == true){
        currentIndex = 1;
    }
     
    var recordCount = params.recordCount; //페이지당 레코드 수
    if(CheckNull(recordCount) == true){
        recordCount = 20;
    }
    var totalIndexCount = Math.ceil(totalCount / recordCount); // 전체 인덱스 수
    gfv_eventName = params.eventName;
     
    $("#"+divId).empty();
    var preStr = "";
    var postStr = "";
    var str = "";
     
    var first = (parseInt((currentIndex-1) / 10) * 10) + 1;
    var last = (parseInt(totalIndexCount/10) == parseInt(currentIndex/10)) ? totalIndexCount%10 : 10;
    var prev = (parseInt((currentIndex-1)/10)*10) - 9 > 0 ? (parseInt((currentIndex-1)/10)*10) - 9 : 1; 
    var next = (parseInt((currentIndex-1)/10)+1) * 10 + 1 < totalIndexCount ? (parseInt((currentIndex-1)/10)+1) * 10 + 1 : totalIndexCount;
     
    if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨앞, 앞 태그 작성
        preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>" +
                "<a href='#this' class='pad_5' onclick='_movePage("+prev+")'>[<]</a>";
    }
    else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨앞 태그 작성
        preStr += "<a href='#this' class='pad_5' onclick='_movePage(1)'>[<<]</a>";
    }
     
    if(totalIndexCount > 10){ //전체 인덱스가 10이 넘을 경우, 맨뒤, 뒤 태그 작성
        postStr += "<a href='#this' class='pad_5' onclick='_movePage("+next+")'>[>]</a>" +
                    "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
    }
    else if(totalIndexCount <=10 && totalIndexCount > 1){ //전체 인덱스가 10보다 작을경우, 맨뒤 태그 작성
        postStr += "<a href='#this' class='pad_5' onclick='_movePage("+totalIndexCount+")'>[>>]</a>";
    }
     
    for(var i=first; i<(first+last); i++){
        if(i != currentIndex){
            str += "<a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a>";
        }
        else{
            str += "<b><a href='#this' class='pad_5' onclick='_movePage("+i+")'>"+i+"</a></b>";
        }
    }
    $("#"+divId).append(preStr + str + postStr);
}
 
function _movePage(value){
    $("#"+gfv_pageIndex).val(value);
    if(typeof(gfv_eventName) == "function"){
        gfv_eventName(value);
    }
    else {
        eval(gfv_eventName + "(value);");
    }
}



// 코드셋팅
function codeSet(){
	this.url = "";
	this.setUrl = function setUrl(url) {
		this.url = url;
	}
	
	// 게시판
    this.selectRef1Box = function selectRef1Box(cd,id,ref1){
    	var sendData = JSON.stringify({code: cd, ref_1: ref1 });
    	var inner="";
    	
    	setTimeout('',2000);
    	
     	$.ajax({
			type: "POST",
			url : this.url,
			data : sendData,
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
			success : function(list, status, xhr) {
				for(var key in list){
					inner += "<option value="+list[key].VAR_NAME+">"+list[key].VAR_CODE+"</option>";
				}
				$("#"+id).append(inner);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert("실패 :"+jqXHR.responseText);
			} 
     	});
    };
    
    this.selectedRef1_selBox = function selectedRef1_selBox(cd,id,val,ref1){
    	var sendData = JSON.stringify({code: cd, ref_1: ref1 });
    	var inner="";
    	
    	setTimeout('',2000);
 
     	$.ajax({
			type: "POST",
			url : this.url,
			data : sendData,
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
			success : function(list, status, xhr) {
				for(var key in list){
					if(val == list[key].VAR_NAME || val == list[key].VAR_CODE){
						inner += "<option value="+list[key].VAR_NAME+" selected >"+list[key].VAR_CODE+"</option>";
					}else{
						inner += "<option value="+list[key].VAR_NAME+">"+list[key].VAR_CODE+"</option>";
					}
				}
				$("#"+id).append(inner);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert("실패 :"+jqXHR.responseText);
			}
     	});
    };
    
    
	
    this.selectBox = function selectBox(cd,id){
    	var sendData = JSON.stringify({code: cd });
    	var inner="";
    	
    	setTimeout('',2000);
    	
     	$.ajax({
			type: "POST",
			url : this.url,
			data : sendData,
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
			success : function(list, status, xhr) {
				for(var key in list){
					inner += "<option value="+list[key].VAR_NAME+">"+list[key].VAR_CODE+"</option>";
				}
				$("#"+id).append(inner);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert("실패 :"+jqXHR.responseText);
			} 
     	});
    };
    
    
    this.selectBox = function selectBox(cd,id,val){
    	var sendData = JSON.stringify({code: cd });
    	var inner="";
    	
    	setTimeout('',2000);
 
     	$.ajax({
			type: "POST",
			url : this.url,
			data : sendData,
			dataType: "json",
			contentType:"application/json;charset=UTF-8",
			success : function(list, status, xhr) {
				for(var key in list){
					if(val == list[key].VAR_NAME || val == list[key].VAR_CODE){
						inner += "<option value="+list[key].VAR_NAME+" selected >"+list[key].VAR_CODE+"</option>";
					}else{
						inner += "<option value="+list[key].VAR_NAME+">"+list[key].VAR_CODE+"</option>";
					}
				}
				$("#"+id).append(inner);
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert("실패 :"+jqXHR.responseText);
			}
     	});
    };
     	
}


// readonly 속성 추가
function readonlySet(id, val ){
	if(val == "add"){
		$("#"+id).addClass("read");
		$("#"+id).attr("readonly",true);
	}
	if(val == "remove"){
		$("#"+id).removeClass("read");
		$("#"+id).attr("readonly",false);
	}
}

//display 속성 추가
function displaySet(id, val ){
	if(val == "none"){
		$("#"+id).css("display","none");
	}
	if(val == "inline"){
		$("#"+id).css("display","inline");
	}
	
	if(val == "block"){
		$("#"+id).css("display","block");
	}
}


// serialize to map

$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
    	var name = $.trim(this.name),
    		value = $.trim(this.value);
    	
        if (o[name]) {
            if (!o[name].push) {
                o[name] = [o[name]];
            }
            o[name].push(value || '');
        } else {
            o[name] = value || '';
        }
    });
    return o;
};

//value 초기화
function valueInit(id){
	$("#"+id).val("");
}


// form안의 모든 필드 조회, require 속성 체크
function fieldNullCheck(frm){
	var element =  $("#"+frm);
	var result = true;
		element.find("input,select,radio,textarea").each(function(e) {
			if($(this).prop("required")){
				if(!$.trim($(this).val())){
					var element_id = $(this).attr("id");
					var label_txt = $("label[for='" + element_id +"']").text();
					showAlert(element_id, label_txt);
					result = false;
					return result;
				}
			}
		});
	return result;
}


function showAlert(element_id, label_txt){
	alert(label_txt + " 필수 값 입니다. ");
	$("#" + element_id).focus();
}



// 사용자 관리 아이디 추가 중복 체크
function adminMemberIdCheck(val,url){
	this.url = url;
	
 	var sendData = val;
	var result = false;
 	$.ajax({
		type: "POST",
		url : this.url,
		data : sendData,
		dataType: "json",
		async:false,
		contentType:"application/json;charset=UTF-8",
		success : function(data, status, xhr) {
			if(data == 0){
				result = true;
			}else if(data > 0){
				result = false;
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert("실패 :"+jqXHR.responseText);
		}
 	});
 	
 	return result;
	
}


// 폼 클리어
$.fn.clearForm = function() {
	  return this.each(function() {
	    var type = this.type,
	      tag = this.tagName.toLowerCase()
	    if (tag === "form") {
	      return $(":input", this).clearForm()
	    }
	    if (
	      type === "text" ||
	      type === "password" ||
	      type === "hidden" ||
	      tag === "textarea"
	    ) {
	      this.value = ""
	    } else if (type === "checkbox" || type === "radio") {
	      this.checked = false
	    } else if (tag === "select") {
	      this.selectedIndex = -1
	    }
	  })
	}


function nullToBlank(data){
	if(data == null){
		data = "";
	}
	return data; 
}


// 공통으로 뺄 것 
// 전체 리스트 체크
function redupCheck(tableId, cn, keyCol){
	// 컬럼 이름
	var arry = new Array(); 
	
	// id 가 new 인 엘리먼트들만 찾는다.
	//여기수정
//	$("#"+tableId+" tbody > tr ").filter("[id = 'new']").each(function (i) {
	$("#"+tableId+" tbody > tr ").each(function (i) {      
	
		
		var cellItem = $(this).find(":input", ":select");
		// 객체에 tr > td 값을 순서대로 담는다.
		var itemObj = new Object();	
		for(var n = 0; n < cn.length; n++){
			itemObj[cn[n]] = cellItem.eq(n).val()	
		}
		arry.push(itemObj);
	});
	
	// 추가한 row에서 Data를 비교하여 중복여부를 판단한다.
	if(arry.length > 1){	
		for(var i = 0 ; i < arry.length-1; i++){
			for(var l = i+1; l < arry.length; l++){
				if(arry[i][keyCol] == arry[l][keyCol]){
					alert("추가한 코드에 중복 값이 있다.["+arry[i][keyCol]+"]");
					arry = new Array();
					return false;
				}
			} 
		}
	}
	
	return arry;
}




//공통으로 뺄 것 
//추가된 리스트만 체크
function redupCheckNew(tableId, cn, keyCol){
	// 컬럼 이름
	var arry = new Array(); 
	
	// id 가 new 인 엘리먼트들만 찾는다.
	//여기수정
	$("#"+tableId+" tbody > tr ").filter("[id = 'new']").each(function (i) {
//	$("#"+tableId+" tbody > tr ").each(function (i) {      
		var cellItem = $(this).find(":input", ":select");
		// 객체에 tr > td 값을 순서대로 담는다.
		var itemObj = new Object();	
		for(var n = 0; n < cn.length; n++){
			itemObj[cn[n]] = cellItem.eq(n).val()	
		}
		arry.push(itemObj);
	});
	
	// 추가한 row에서 Data를 비교하여 중복여부를 판단한다.
	if(arry.length > 1){	
		for(var i = 0 ; i < arry.length-1; i++){
			for(var l = i+1; l < arry.length; l++){
				if(arry[i][keyCol] == arry[l][keyCol]){
					alert("추가한 코드에 중복 값이 있다.["+arry[i][keyCol]+"]");
					arry = new Array();
				}
			} 
		}
	}
	
	return arry;
}




//공통으로 뺄 것 
function tableAllCheck(tableId, cn){
	
	// 컬럼 이름
	var arry = new Array(); 
	//여기수정
	$("#"+tableId+" tbody > tr ").each(function (i) {      
		var cellItem = $(this).find(":input", ":select");
		// 객체에 tr > td 값을 순서대로 담는다.
		var itemObj = new Object();	
		for(var n = 0; n < cn.length; n++){
			itemObj[cn[n]] = cellItem.eq(n).val()	
		}
		arry.push(itemObj);
		
	});
	
	
	return arry;
}



// 체크박스 이벤트 Y, N
function checkboxSet(name){
	$('input:checkbox[name="'+name+'"]').each(function() {
	      if(this.value == 'Y'){//checked 처리된 항목의 값
	    	  this.checked = true; 
	      }else if(this.value == 'N'){
	    	  this.checked = false;
	      }
	 });
}


//체크박스 값 받기
function getCheckBoxArry(name){
	
	var arry = new Array();
	var checkbox = $('input[name=name="'+name+'"]:checked');
	
	
	// 체크된 체크박스 값을 가져온다
	checkbox.each(function(i) {
		// checkbox.parent() : checkbox의 부모는 <td>이다.
		// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
		
		// 체크된 row의 모든 값을 배열에 담는다.
//		rowData.push(tr.text());
		var itemObj = new Object();
		// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
		// 가져온 값을 배열에 담는다.
		itemObj.no = td.eq(0).text().trim();
		itemObj.menu_id = td.eq(3).text().trim();
		itemObj.menu_name = td.eq(4).text().trim();
		
		arry.push(itemObj);
	});
	return arry;
	
}




// 체크박스 이벤트, 선택시 Y, 해제 N
function checkbox_event(id){
	var obj = $('input:checkbox[id="'+id+'"]');
	if(obj.is(":checked") == true){
		obj.val("Y");
	}else if(obj.is(":checked") == false){
		obj.val("N");
	}
}



function filenameView(id){
	var fileTarget = $("#"+id);
    // 값이 변경되면 
    if(window.FileReader){ 
    // modern browser 
    var filename = fileTarget[0].files[0].name; 
    
    } else { 
    // old IE
    var filename = fileTarget.val().split('/').pop().split('\\').pop();
    // 파일명만 추출
    }
    // 추출한 파일명 삽입 
    $("#lab_"+id).text(filename); 
}
