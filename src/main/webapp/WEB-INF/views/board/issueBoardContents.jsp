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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

  </head>

  <body>
 	 <%@include file="/WEB-INF/views/decorator/header.jsp" %>
	<div class="bodyPart">
    <div class="container">

      <div class="blog-header">
        <h1 class="blog-title">MENTAL ISSUE BOARD</h1>
      </div>
      <hr style="border:solid; width:100%"/>
      <div class="row">

        <div class="col-md-12 blog-main">

          <div class="blog-post">
	          <div class="blog-intro">
	          	멘탈이슈컨텐츠<br>
	          </div>
	          <br>
				<br>
				<div class="blog-contents-button">
          		<button class="btn btn-default" id="preContents" onclick="javascript:preContents()">이전글</button>&nbsp;
				<button class="btn btn-default" id="nextContents"  onclick="javascript:nextContents(${result.issueContents.issue_board_seq})">다음글</button>
          		<button class="btn btn-default" id="issueList" style="float:right" onclick="location='${pageContext.request.contextPath}/board/issueBoard'">목록</button>
          		<%-- <c:if test="${login.auth eq 'A'}"> --%>
          		<c:if test="${fn:substring(login.auth, 0, 1) == 'M' or login.auth eq 'A'}">
	          		<button class="btn btn-default" id="deleteIssue" style="float:right" onclick="javascript:deleteIssueContents();">삭제</button>
	          		<button class="btn btn-default" id="modifyIssue" style="float:right" onclick="javascript:modifyIssueContents();">수정</button>
				</c:if>
					</div>
				<br>
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
						<col style="width:180px">
						<col style="width:130px">
					</colgroup>
						<tbody id = "issueCommentTbody" class="table-body-comment">
						</tbody>
					</table>
				</div>
				<div class="blog-comment">
				<table class="table" style="text-align:center; width:100%;" id="comment-upload">
					<colgroup>
						<col style="width:*">
						<col style="width:80px;">
					</colgroup>
						<tbody>
							<tr>
								<td><textarea class="issue-comment" id="issue-comment" placeholder="댓글 내용" name="comment"
								onkeydown="resize(this)" onkeyup="resize(this)" style="height: 50px; width:100%;"></textarea></td>
								<td><button class="btn btn-default" id="issue-comment-up" onclick="javascript:commentUpload()">등록</button></td>
							</tr>
						</tbody>
					</table>
				</div>
          </div>
          <!-- /.blog-post -->
        </div><!-- /.blog-main -->


      </div><!-- /.row -->

    </div><!-- /.container -->

</div><!-- /.bodyPart -->
  </body>
  <script>
   $(document).ready(function(){
	   $("#hidCurSeq").val('${param.issue_board_seq}');
	   loadData( $("#hidCurSeq").val());
	});

    // textarea 사이즈 자동 조절
	function resize(obj)
	{
		obj.style.height = "1px";
		obj.style.height = (12+obj.scrollHeight)+"px";
	}

	function commentUpload()
	{
		if( $("#issue-comment").val() == "" )
			{
				alert("내용을 입력하세요");
				return;
			}
		var commentHtmls = "";
		var data = {"comment" : $("#issue-comment").val(),
				"board_seq" : $("#hidCurSeq").val()};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/writeIssueComment",
			success: function(result){
				location.reload();
			}
			})
	}

	function loadData(seq){
		var htmls = "";
		var commentHtmls = "";
		var data = {"seq" : seq};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/getIssueContents",
			success: function(result){
				htmls += '<input type="hidden" id = "issueBoardSeq" value="';
				htmls += result.issueContents.issue_board_seq;
				htmls += '" /><tr><td align="left" ><pre style="overflow-y:hidden; letter-spacing: 1px;">';
				htmls += result.issueContents.title;
				htmls += '</pre></td><td align="right">';
				htmls += result.issueContents.created_timestamp;
				htmls += '</tr><tr><td colspan="2" align="left"><div style="white-space:pre-wrap; letter-spacing: 1px;">';
				htmls += result.issueContents.contents;
				htmls += '</div></td></tr><tr><td colspan="2" align="left">댓글 &nbsp;';
				htmls += result.commentCnt;
				htmls += '&nbsp; || &nbsp; 공감 &nbsp;<span id="likeCnt">';
				htmls += result.likeCnt;
				htmls += '</span>&nbsp;&nbsp;&nbsp;<button class="btn btn-default" id="likeUp" onclick="javascript:likeUpload()">공감</button></td></tr>';
				htmls += '<input type="hidden" id = "issueBoardSeq" value="';
				$('#issueContentsTbody').html(htmls);
				if( result.data_yn == "Y")
					{
					$.each(result.comment, function( index, comment )
					{
						
						
						if( comment.parent_comment_seq != '0' )
						{
							commentHtmls += '<tr><td rowspan="2"></td><td rowspan="2"><span class="user_profile" >';
							// 회원사진 적용
					 		if( comment.mem_pic == null || comment.mem_pic == '' )
					 		{
					 			commentHtmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
					 		}
					 		else
				 			{
					 			commentHtmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
					 			commentHtmls += comment.mem_pic;
					 			commentHtmls += '" alt="">';
				 			}
							//commentHtmls += '사진';
							commentHtmls += '</span></td><td>';
						}
						else
						{
							commentHtmls += '<tr><td rowspan="2"><span class="user_profile" >';
							// 회원사진 적용
					 		if( comment.mem_pic == null || comment.mem_pic == '' )
					 		{
					 			commentHtmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
					 		}
					 		else
				 			{
					 			commentHtmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
					 			commentHtmls += comment.mem_pic;
					 			commentHtmls += '" alt="">';
				 			}
							//commentHtmls += '사진';
							commentHtmls += '</span></td><<td colspan="2">';
						}
						if( comment.anony_yn == 'Y' )
						{
							commentHtmls += '익명';
						}
						else
						{
							commentHtmls += comment.mem_nick;
						}
						commentHtmls += '</td><td>';
						commentHtmls += comment.created_timestamp.substr(0,16);
						commentHtmls += '</td><td>';

						if( comment.created_id == '${login.mem_id}' )
			 			{
							//commentHtmls += '수정삭제';
						//	commentHtmls += '<div class="post_menu">';
							commentHtmls += '<a class="post-edit"  href="javascript:modifyComment(';
							commentHtmls += comment.comment_seq;
							commentHtmls += ');" style="font-size:0.9em; width:30px; position: relative; display: inline-block;  margin-right:0.3em; margin-left:0.1em;"><dl>수정</dl></a>';
					 		commentHtmls += '<a class="post-delete" href="javascript:deleteComment(';
					 		commentHtmls += comment.comment_seq;
					 		commentHtmls += ');" style="font-size:0.9em; width:30px; position: relative; display: inline-block;   "><dl>삭제</dl></a>';
					 	//	commentHtmls += '</div>';
			 			}

						if( comment.parent_comment_seq != '0' )
						{
							commentHtmls += '</td></tr><tr><td colspan="3"><pre style="overflow-y:hidden; white-space:pre-wrap;">';
						}
						else
						{
							commentHtmls += '</td></tr><tr><td colspan="4" ><pre style="overflow-y:hidden; white-space:pre-wrap;">';
						}
						commentHtmls += comment.contents;
						commentHtmls += '<br/><br/><br/><a style="font-size:0.9em; " href="javascript:editRecomment(';
						commentHtmls += result.issueContents.issue_board_seq;
						commentHtmls += ',';
						commentHtmls += comment.comment_seq;
						commentHtmls += ');">답글 달기</a>';
						commentHtmls += '</pre></td></tr>';
					})

					$('#issueCommentTbody').html(commentHtmls);
					}
				else
					{
					commentHtmls += '<tr><td>등록된 댓글이 없습니다.</td></tr>';
					$('#issueCommentTbody').html(commentHtmls);
					}
			}
		})
	}

	function preContents()
	{
		var data = {"preSeq" : $("#issueBoardSeq").val()};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/getIssuePreSeq",
			success: function(result){
				if( result.data_yn == 'Y' )
				{
					document.location.href = "${pageContext.request.contextPath}/board/issueBoardContents?issue_board_seq=" + result.preSeq;
				}
				else
				{
					alert("첫 글 입니다.");
				}
			}
		})
	}

	function nextContents(nextSeq)
	{
		var data = {"nextSeq" : $("#issueBoardSeq").val()};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/getIssueNextSeq",
			success: function(result){
				if( result.data_yn == 'Y' )
				{
					document.location.href = "${pageContext.request.contextPath}/board/issueBoardContents?issue_board_seq=" + result.nextSeq;
				}
				else
				{
					alert("마지막 글 입니다.");
				}
			}
		})
	}

	function likeUpload()
	{
		var data = {"seq" : $("#issueBoardSeq").val(), "likeCnt" :  $("#likeCnt").html()};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/upLike",
			success: function(result){
				if( result.data_yn == "Y" )
				{
					location.reload();
				}
				else
				{
					alert("이미 좋아요를 눌렀습니다.");
					return;
				}
			}
		})
	}

	function deleteIssueContents()
	{
		var data = {"seq" : $("#issueBoardSeq").val()};
		var con = confirm("게시글을 정말 삭제하시겠습니까?")
		if(con == true)
		{
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/deleteIssueContents",
			success: function(result){
				if( result.data_yn == "Y" )
				{
					document.location.href = "${pageContext.request.contextPath}/board/issueBoard";
				}
				else
				{
				}
			}
		})
		}
	}

	function modifyIssueContents()
	{
		var con = confirm("게시글을 정말 수정하시겠습니까?");
		if(con == true)
		{
			document.location.href = "${pageContext.request.contextPath}/board/modifyIssueContents?issue_board_seq="+$("#issueBoardSeq").val();
		}
	}

	function deleteComment(seq)
	{
		var data = {"seq" : seq};
		var con = confirm("댓글을 정말 삭제하시겠습니까?")
		if(con == true)
		{
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/deleteIssueComment",
			success: function(result){
				if( result.data_yn == "Y" )
				{
					location.reload();
				}
			}
		})
		}
	}

	function modifyComment(seq)
	{
		var option = 'width=530,height=130,scrollbars=no,resizable=no,status=yes,location=no,menubar=no,toolbar=no,top=340,left=476';
		window.open("${pageContext.request.contextPath}/board/pop/modifyIssueComment?comment_seq="+seq, "a", option);

	}

	function editRecomment(boardSeq, commentSeq)
	{
		var option = 'width=530,height=130,scrollbars=no,resizable=no,status=yes,location=no,menubar=no,toolbar=no,top=340,left=476';
		window.open("${pageContext.request.contextPath}/board/pop/recomment?board_seq="+boardSeq+"&comment_seq="+commentSeq+"&board_type=I", "a", option);
	}
   </script>
</html>
