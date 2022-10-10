<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
      </div>

      <div class="row">

        <div class="col-sm-12 blog-main">
		<input type="hidden" id = "hidCurBoardSeq" />
		<input type="hidden" id = "hidRecommentSeq" />

			<div class="user-activity" id ="user-activity">
           </div>

        </div><!-- /.blog-main -->


      </div><!-- /.row -->

    </div><!-- /.container -->

</div><!-- /.bodyPart -->
<script>
window.name = "timelineContents";
	$(document).ready(function(){
		loadData('${param.board_seq}');
	});

	// 댓글 저장 event
	function sendComment(id)
	{
		var formId = 'comment-container-' + id;
		document.getElementById(formId).submit();
	}

	// like up event
	function upLike(seq, cnt)
	{
		var data = {"seq" : seq, "likeCnt" :  cnt};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/timelineUpLike",
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

	// 타임라인 컨텐츠 load
	function loadData(seq)
	{
		var htmls = "";
		var data = {"board_seq" : seq,
				"user_id" : '${login.mem_id}'};
		var cnt=0;
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/getTimelineContents",
			success: function(result){
				$('#hidCurBoardSeq').val(result.boardVo.board_seq);
		 		htmls += '<div class="_item user-container" id="user-container">';

		 		// 회원정보 링크 수정부분 start
		 		htmls += '<div class="user-info-container">';
		 		htmls += '<form class="user-info-form" action="${pageContext.request.contextPath}/member/mypage" id="user-info-form-';
		 		htmls += result.boardVo.board_seq;
		 		htmls += '" enctype="multipart/form-data" name="user-info" method="post"  enctype="multipart/form-data">';
		 		htmls += '<input type="hidden" name="mem_id" value="';
		 		htmls += result.boardVo.created_id;
		 		htmls += '" />'
	 			htmls += '<input type="hidden" name="mem_pic" value="';
		 		htmls += result.boardVo.mem_pic;
		 		htmls += '" />'
	 			htmls += '<input type="hidden" name="mem_nick" value="';
		 		htmls += result.boardVo.mem_nick;
		 		htmls += '" />'
		 		htmls += '<a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
		 		htmls += result.boardVo.board_seq;
		 		htmls += ');"><span class="user_profile" >';
		 		// 회원정보 링크 수정부분 완료 .. 밑에 </form> 해줄것.

		 		// 회원정보 수정 전 start
		 		/* htmls += '<div class="user-info-container">';
		 		htmls += '<a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
		 		htmls += result.boardVo.board_seq;
		 		htmls += ');"><span class="user_profile" >'; */
		 		// 회원정보 수정 전 end

		 		// 회원사진 적용
		 		if( result.boardVo.mem_pic == null || result.boardVo.mem_pic == '' )
		 		{
			 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
		 		}
		 		else
	 			{
		 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
		 			htmls += result.boardVo.mem_pic;
		 			htmls += '" alt="">';
	 			}
		 		htmls += '</span><div class="user_cont"><strong class="user_name">';
		 		htmls += result.boardVo.mem_nick;
		 		htmls += '</strong><span class="user_time">';
		 		if( result.boardVo.up_time.length > 10 )
	 			{
		 			htmls += result.boardVo.created_timestamp.substr(0,10);
	 			}
		 		else
	 			{
		 			htmls += result.boardVo.up_time;
	 			}
		 		htmls += '</span></div></a></form></div><div class="post_menu"><img src="" alt=""></div><div class="post_contents" ><div class="post_text"><div class="user_text"><pre style="white-space:pre-wrap;">';
		 		htmls += result.boardVo.contents;
		 		htmls += '</pre></div></div></div><div class="post_countView clearfix"><div class="count_like">';
		 		
		 		if( result.boardVo.like_count == 0 )
	 			{
		 			htmls += '<a href="javascript:likeEmptyEvent();">공감해요 ';
			 		htmls += result.boardVo.like_count;
			 		htmls += '개</a>';
	 			}
		 		else
		 		{
		 			htmls += '<a href="javascript:loadLikeListPopup(';
			 		htmls += result.boardVo.board_seq;
			 		htmls += ');" >공감해요 ';
			 		htmls += result.boardVo.like_count;
			 		htmls += '개</a>';
		 		}
		 		
		 		htmls += '</div><div class="count_com"><a href=""> 댓글 ';
		 		htmls += result.boardVo.comment_count;
		 		htmls += '개</a></div></div><div class="post_count clearfix"><div class="post_count_inner clearfix"><div class="ico_like">';
		 		htmls += '<a class="ico_post"  href= "javascript:void(0);" id= "ossn-like-18968" onclick = "javascript:upLike(';
		 		htmls += result.boardVo.board_seq;
		 		htmls += ',';
		 		htmls += result.boardVo.like_count;
		 		htmls += ');"><i class="material-icons" style="color:red;">favorite_border</i></a></div>';
		 		htmls += '<div class="ico_comment"><a href=""><i class="material-icons" style="color:gray;">insert_comment</i></a></div></div></div>';
		 		htmls += '<div class= "_item comments_wrap"><div class="comments-list"><div class="comments-input">';
		 		htmls += '<form action="${pageContext.request.contextPath}/board/writeBoardComment" id="comment-container-';
		 		htmls += result.boardVo.board_seq;
		 		htmls += '" class="comment-container" autocomplete="off" name="comment_add" method="post"  enctype="multipart/form-data"><fieldset>';
		 		htmls += '<input type="hidden" name = "hidCurBoardSeq" value="';
		 		htmls += result.boardVo.board_seq;
		 		htmls += '" /><div class="com_input_wrap clearfix"><div class="comment_box_wrap" style="position: relative; "><textarea type="text" style="position: relative;" name="comment" id="comment-box';
		 		htmls += '" class="comment-box" placeholder="댓글을 입력하세요" contenteditable="true"></textarea>';
		 		htmls += '<a href="javascript:sendComment(';
		 		htmls += result.boardVo.board_seq;
		 		htmls += ');"  style="position: relative; display: inline-block; width:30px; padding-left:0.5em; margin-left:0.5em; bottom:20px;">';
		 		htmls += '<i style="color:gray;" class="material-icons">send</i></a></div></div></fieldset></form></div>';
		 		htmls += '<div class="comments-list-';
		 		htmls += result.boardVo.board_seq;
		 		htmls += '" id = "comments-list-';
		 		htmls += result.boardVo.board_seq;
		 		htmls += '">';
		 		if( result.data_yn == "Y")
				{
					$.each(result.comment, function( index, comment )
					{
						if( index > 0 )
						{
							if( cnt > 0 )
							{
								htmls += '</div></div>';
								cnt = 0;
							}
							if( comment.parent_comment_seq == '0' )
							{
								// 회원정보 링크 수정부분 start
						 		/* htmls += '<div class="user-info-container">';
						 		htmls += '<form class="user-info-form" action="${pageContext.request.contextPath}/member/mypage" id="user-info-form-';
						 		htmls += result.boardVo.board_seq;
						 		htmls += '" enctype="multipart/form-data" name="user-info" method="post"  enctype="multipart/form-data">';
						 		htmls += '<input type="hidden" name="mem_id" value="';
						 		htmls += result.boardVo.created_id;
						 		htmls += '" />'
					 			htmls += '<input type="hidden" name="mem_pic" value="';
						 		htmls += result.boardVo.mem_pic;
						 		htmls += '" />'
					 			htmls += '<input type="hidden" name="mem_nick" value="';
						 		htmls += result.boardVo.mem_nick;
						 		htmls += '" />'
						 		htmls += '<a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
						 		htmls += result.boardVo.board_seq;
						 		htmls += ');"><span class="user_profile" >'; */
						 		// 회원정보 링크 수정부분 완료 .. 밑에 </form> 해줄것.

					 			// 코멘트 회원정보 링크 수정후 start
								htmls += '</div>';
								htmls += '<div class="comments-item clearfix" id="comments-item-';
								htmls += comment.comment_seq;
								htmls += '"><form class="user-info-form" action="${pageContext.request.contextPath}/member/mypage" id="user-info-form-';
								htmls += comment.comment_seq;
								htmls += '" enctype="multipart/form-data" name="user-info" method="post"  enctype="multipart/form-data">';
								htmls += '<input type="hidden" name="mem_id" value="';
						 		htmls += comment.created_id;
						 		htmls += '" />'
					 			htmls += '<input type="hidden" name="mem_pic" value="';
						 		htmls += comment.mem_pic;
						 		htmls += '" />'
					 			htmls += '<input type="hidden" name="mem_nick" value="';
						 		htmls += comment.mem_nick;
						 		htmls += '" />'
								htmls += '<span class= "user_profile"><a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
								htmls += comment.comment_seq;
								htmls += ');">';
								// 회원사진 적용
						 		if( comment.mem_pic == null || comment.mem_pic == '' )
						 		{
							 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
						 		}
						 		else
					 			{
						 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
						 			htmls += comment.mem_pic;
						 			htmls += '" alt="">';
					 			}
								htmls += '</a></span><div class = "user_comment" id="user-comment-';
								htmls += comment.comment_seq;
								htmls += '"><span class = "user_name"><a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
								htmls += comment.comment_seq;
								htmls += ');">';
								htmls += comment.mem_nick;
								htmls += '</a></span></form>';
								//end

						 		// 코멘트 회원정보 링크 수정전 start
								/* htmls += '</div>';
								htmls += '<div class="comments-item clearfix" id="comments-item-';
								htmls += comment.comment_seq;
								htmls += '"><span class= "user_profile"><a href=""><img src="${pageContext.request.contextPath}/images/default_user.png" alt=""></a></span><div class = "user_comment" id="user-comment-';
								htmls += comment.comment_seq;
								htmls += '"><span class = "user_name"><a href="">';
								htmls += comment.mem_nick;
								htmls += '</a></span>'; */
								//end
								if( comment.created_id == '${login.mem_id}' )
					 			{
									htmls += '<div class="post_menu">';
									htmls += '<a class="post-edit"  href="javascript:modifyComment(';
							 		htmls += comment.comment_seq;
							 		htmls += ');" style="font-size:0.8em; width:30px; position: relative; display: inline-block; margin-top:-0.5em; margin-right:0.3em; margin-left:0.1em;"><dl>수정</dl></a>';
							 		htmls += '<a class="post-delete" href="javascript:deleteComment(';
							 		htmls += comment.comment_seq;
							 		htmls += ');" style="font-size:0.8em; width:30px; position: relative; display: inline-block; margin-top:-0.5em;  "><dl>삭제</dl></a>';
							 		htmls += '</div>';
					 			}
								htmls += '<div  class = "user_text"><pre style="white-space:pre-wrap;">';
								htmls += comment.contents;
								htmls += '</pre></div><div class="comment-metadata">';
								htmls += '<a class="recomment-show" href="javascript:editRecomment(';
								htmls += result.boardVo.board_seq;
								htmls += ',';
								htmls += comment.comment_seq;
								htmls += ');">답글 달기</a><span class="_dot"> · </span><span class="user_time">';
								if( comment.up_time.length > 10 )
					 			{
						 			htmls += comment.created_timestamp.substr(0,10);
					 			}
						 		else
					 			{
						 			htmls += comment.up_time;
					 			}
								htmls += '</span></div>';
							}
							else
							{
								cnt++;
								htmls += '<div class="comments-item clearfix" id="comments-item-';
								htmls += comment.comment_seq;
								htmls += '"><form class="user-info-form" action="${pageContext.request.contextPath}/member/mypage" id="user-info-form-';
								htmls += comment.comment_seq;
								htmls += '" enctype="multipart/form-data" name="user-info" method="post"  enctype="multipart/form-data">';
								htmls += '<input type="hidden" name="mem_id" value="';
						 		htmls += comment.created_id;
						 		htmls += '" />'
					 			htmls += '<input type="hidden" name="mem_pic" value="';
						 		htmls += comment.mem_pic;
						 		htmls += '" />'
					 			htmls += '<input type="hidden" name="mem_nick" value="';
						 		htmls += comment.mem_nick;
						 		htmls += '" />'
								htmls += '<span class= "user_profile"><a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
								htmls += comment.comment_seq;
								htmls += ');">';
								// 회원사진 적용
						 		if( comment.mem_pic == null || comment.mem_pic == '' )
						 		{
							 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
						 		}
						 		else
					 			{
						 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
						 			htmls += comment.mem_pic;
						 			htmls += '" alt="">';
					 			}
								htmls += '</a></span><div class = "user_comment" id="user-comment-';
								htmls += comment.comment_seq;
								htmls += '"><span class = "user_name"><a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
								htmls += comment.comment_seq;
								htmls += ');">';
								htmls += comment.mem_nick;
								htmls += '</a></span></form>';

								if( comment.created_id == '${login.mem_id}' )
					 			{
									htmls += '<div class="post_menu">';
									htmls += '<a class="post-edit"  href="javascript:modifyComment(';
							 		htmls += comment.comment_seq;
							 		htmls += ');" style="font-size:0.8em; width:30px; position: relative; display: inline-block; margin-top:-0.5em; margin-right:0.3em; margin-left:0.1em;"><dl>수정</dl></a>';
							 		htmls += '<a class="post-delete" href="javascript:deleteComment(';
							 		htmls += comment.comment_seq;
							 		htmls += ');" style="font-size:0.8em; width:30px; position: relative; display: inline-block; margin-top:-0.5em;  "><dl>삭제</dl></a>';
							 		htmls += '</div>';
					 			}
						 		htmls += '<div  class = "user_text"><pre style="white-space:pre-wrap;">';
								htmls += comment.contents;
								htmls += '</pre></div><div class="comment-metadata">';
								htmls += '<a class="recomment-show" href="javascript:editRecomment(';
								htmls += result.boardVo.board_seq;
								htmls += ',';
								htmls += comment.comment_seq;
								htmls += ');">답글 달기</a><span class="_dot"> · </span><span class="user_time">';
								if( comment.up_time.length > 10 )
					 			{
						 			htmls += comment.created_timestamp.substr(0,10);
					 			}
						 		else
					 			{
						 			htmls += comment.up_time;
					 			}
								htmls += '</span></div>';
							}
						}
						else
						{
							htmls += '<div class="comments-item clearfix" id="comments-item-';
							htmls += comment.comment_seq;
							htmls += '"><form class="user-info-form" action="${pageContext.request.contextPath}/member/mypage" id="user-info-form-';
							htmls += comment.comment_seq;
							htmls += '" enctype="multipart/form-data" name="user-info" method="post"  enctype="multipart/form-data">';
							htmls += '<input type="hidden" name="mem_id" value="';
					 		htmls += comment.created_id;
					 		htmls += '" />'
				 			htmls += '<input type="hidden" name="mem_pic" value="';
					 		htmls += comment.mem_pic;
					 		htmls += '" />'
				 			htmls += '<input type="hidden" name="mem_nick" value="';
					 		htmls += comment.mem_nick;
					 		htmls += '" />'
							htmls += '<span class= "user_profile"><a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
							htmls += comment.comment_seq;
							htmls += ');">';
							// 회원사진 적용
					 		if( comment.mem_pic == null || comment.mem_pic == '' )
					 		{
						 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
					 		}
					 		else
				 			{
					 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
					 			htmls += comment.mem_pic;
					 			htmls += '" alt="">';
				 			}
							htmls += '</a></span><div class = "user_comment" id="user-comment-';
							htmls += comment.comment_seq;
							htmls += '"><span class = "user_name"><a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
							htmls += comment.comment_seq;
							htmls += ');">';
							htmls += comment.mem_nick;
							htmls += '</a></span></form>';

							if( comment.created_id == '${login.mem_id}' )
				 			{
								htmls += '<div class="post_menu">';
								htmls += '<a class="post-edit"  href="javascript:modifyComment(';
						 		htmls += comment.comment_seq;
						 		htmls += ');" style="font-size:0.8em; width:30px; position: relative; display: inline-block; margin-top:-0.5em; margin-right:0.3em; margin-left:0.1em;"><dl>수정</dl></a>';
						 		htmls += '<a class="post-delete" href="javascript:deleteComment(';
						 		htmls += comment.comment_seq;
						 		htmls += ');" style="font-size:0.8em; width:30px; position: relative; display: inline-block; margin-top:-0.5em;  "><dl>삭제</dl></a>';
						 		htmls += '</div>';
				 			}

							htmls += '<div  class = "user_text"><pre style="white-space:pre-wrap;">';
							htmls += comment.contents;
							htmls += '</pre></div><div class="comment-metadata">';
							htmls += '<a class="recomment-show" href="javascript:editRecomment(';
							htmls += result.boardVo.board_seq;
							htmls += ',';
							htmls += comment.comment_seq;
							htmls += ');">답글 달기</a><span class="_dot"> · </span><span class="user_time">';
							if( comment.up_time.length > 10 )
				 			{
					 			htmls += comment.created_timestamp.substr(0,10);
				 			}
					 		else
				 			{
					 			htmls += comment.up_time;
				 			}
							htmls += '</span></div>';
						}
					})
				}
		 		if( cnt > 0 )
				{
					htmls += '</div>';
					cnt = 0;
				}
		 		htmls += '</div></div>';

			$('#user-activity').html(htmls);

			}
		})
	}

	// 댓글 삭제 event
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
			url:"${pageContext.request.contextPath}/board/deleteComment",
			success: function(result){
				if( result.data_yn == "Y" )
				{
					location.reload();
				}
			}
		})
		}
	}

	// 댓글 수정 event popup
	function modifyComment(seq)
	{
		var option = 'width=530,height=130,scrollbars=no,resizable=no,status=yes,location=no,menubar=no,toolbar=no,top=340,left=476';
		window.open("${pageContext.request.contextPath}/board/pop/modifyTimelineComment?comment_seq="+seq, "a", option);

		var baseId = "comments-item-" + seq;
		var modiId = "user-modify-" + seq;
	}

	// 댓글 답글달기 event popup
	function editRecomment(boardSeq, commentSeq)
	{
		var option = 'width=530,height=130,scrollbars=no,resizable=no,status=yes,location=no,menubar=no,toolbar=no,top=340,left=476';
		window.open("${pageContext.request.contextPath}/board/pop/recomment?board_seq="+boardSeq+"&comment_seq="+commentSeq+"&board_type=T", "a", option);
	}

	function loadUserInfo(seq)
	{
		var formId = "user-info-form-" + seq;
		document.getElementById(formId).submit();

	}
	// Like List popup
	function loadLikeListPopup(seq)
	{
		var option = 'width=460,height=200,scrollbars=no,resizable=no,status=yes,location=no,menubar=no,toolbar=no,top=340,left=476';
		window.open("${pageContext.request.contextPath}/board/pop/likeList?board_seq="+seq, "a", option);

	}
	function likeEmptyEvent()
	{
		alert("공감한 사람이 없어요. 좋아요를 눌러주세요~");
	}
	
</script>
  </body>
</html>
