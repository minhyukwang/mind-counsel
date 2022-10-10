<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    <%
    	pageContext.setAttribute("br", "<br/>");
    	pageContext.setAttribute("cn", " \r\n");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

  </head>

  <body>
 	 <%@include file="/WEB-INF/views/decorator/header.jsp" %>
	<div class="bodyPart">
    <div class="container">

      <div class="blog-header">
        <h1 class="blog-title">쪽지보관함</h1>
      </div>
      <hr style="border:solid; width:100%"/>
      <div class="row">
        <div class="col-md-12 blog-main">
			<input type="hidden" id = "hidCurSeq" value="" />
          	<div class="table-responsive">
            	<table class="table" style="text-align:center; width:100%;" id="issueContents">
					<colgroup>
						<col style="width:*">
						<col style="width:40%">
					</colgroup>
						<tbody id = "issueContentsTbody">
						</tbody>
					</table>
					<br>
					<table class="table" style="text-align:center; width:100%;" id="issueComment">
					<colgroup>
						<col style="width:80px;">
						<col style="width:80px;">
						<col style="width:*">
						<col style="width:200px">
						<col style="width:80px">
					</colgroup>
						<tbody id = "issueCommentTbody" class="table-body-comment">
						</tbody>
					</table>
				</div>
				<div class="blog-comment">
				<table class="table" style="text-align:center; width:100%;" id="comment-upload">
					<colgroup>
						<col style="width:*">
						<col style="width:3%;">
						<col style="width:8%;">
						<col style="width:2%;">
					</colgroup>
						<tbody>
							<tr>
								<c:if test="${param.flag=='recNoteListTbody'}">
									<c:if test="${fn:substring(login.auth, 0, 1) == 'M'}">
										<td><textarea class="issue-comment" id="noteContent" placeholder="댓글 내용" name="comment"
										onkeydown="resize(this)" onkeyup="resize(this)" style="height: 50px; width:100%;"></textarea></td>
										<td><button class="btn btn-default" id="sendNote" >답장하기</button></td>
										<td><button class="btn btn-default" id="regCounsel" >상담등록예정</button></td>
									</c:if>
								</c:if>
								<td><button class="btn btn-default" id="preContents" style="float:right" onclick="location='${pageContext.request.contextPath}/counsel/mngNote'">목록</button></td>
							</tr>
						</tbody>
					</table>
				</div>
          </div><!-- /.blog-main -->
        </div><!-- /.row -->
      </div><!-- /.container -->
    </div><!-- /.bodyPart -->
  </body>
  <script>
   $(document).ready(function(){
	   $("#hidCurSeq").val('${param.note_seq}');
	   loadData( $("#hidCurSeq").val());
	   $("#sendNote").click(function(){
		    sendNote();
	   });
	   $("#regCounsel").click(function(){
	    	var reci_mem_id='${param.mem_id}';
	    	var data = {"created_id":'${login.mem_id}', "mem_id":reci_mem_id};
			$.ajax({
				type: "post",
				data:data,
				url: "${pageContext.request.contextPath}/counsel/regCounelPlan",
				success: function(result){
					document.location.href = "${pageContext.request.contextPath}/counsel/mngNote";
				}
	    	});
	   })
	});

    // textarea 사이즈 자동 조절
	function resize(obj)
	{
		obj.style.height = "1px";
		obj.style.height = (12+obj.scrollHeight)+"px";
	}

    function sendNote(){
    	var title="Re: "+$("#title").html();
    	var reci_mem_id='${param.mem_id}';
    	var send_mem_id="${login.mem_id}";
    	var co_type="${param.co_type}";
    	var note_contents=$("#noteContent").val();

    	if(note_contents=="")
    		return false;

    	var data = {"note_title" : title, "reci_mem_id" :  reci_mem_id
    			,"send_mem_id" : send_mem_id, "note_contents" : note_contents
    			,"co_type":co_type};
		$.ajax({
			type: "post",
			data:data,
			url: "${pageContext.request.contextPath}/counsel/sendNote",
			success: function(result){
				document.location.href = "${pageContext.request.contextPath}/counsel/mngNote";
			}
    	});
    }

	function loadData(seq){
		var htmls = "";
		var commentHtmls = "";
		var coType="";
		var data = {"note_seq" : seq};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/counsel/getNoteContents",
			success: function(result){
				if(result.co_type=="O")
					coType = "온라인상담신청";
				else if(result.co_type=="C")
					coType = "유료답변요청";
				else
					coType = "자가검진완료";
				htmls += '<input type="hidden" id = "issueBoardSeq" value="';
				htmls += result.note_seq;
				htmls += '" /><tr><td align="left" id="title">';
				htmls += "["+coType+"] "+result.note_title;
				htmls += '</td><td align="right">';
				htmls += result.created_timestamp;
				htmls += '</tr><tr><td colspan="2" align="left"><div id="contentsDiv" style="white-space:pre;">';
				htmls += result.note_contents;
				// htmls += '</div></td></tr>
				$('#issueContentsTbody').html(htmls);
			}
		})
	}
   </script>
</html>
