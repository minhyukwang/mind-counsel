<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

 	<div class="col-sm-1 col-sm-offset-1 blog-sidebar sidebar">
          <div class="sidebar-module sidebar-module-inset">
          </div>
          <div class="sidebar-module">
            <ol class="list-unstyled" id="categoryOl">
            </ol>
          </div>
        </div><!-- /.blog-sidebar -->

        <div class="col-sm-8 blog-main" style="position:relative; left:3em;">

          <div class="blog-post">
		<!-- 카테고리 설명 text -->
			<div class="_item notice-container" id="category-ex-container">
			<!-- <div class="fixed_title"><span class="user_info" style="position:relative;"></span>#이렇게 적어보세요

				</div>
				<div class="post_contents" >
			<div class='post_text' id='post_text'>
					<div class="user_text" id ="category-ex-contents">
					</div>
			</div>
			</div> -->
			</div>
			<!-- 카테고리 설명 text END -->
          <div class = "_item edit_form">
			<form class="container_edit" action="${pageContext.request.contextPath}/board/writeTimeline" id="post-form" enctype="multipart/form-data" name="post_edit" method="post"  enctype='multipart/form-data'>
			<fieldset> <div class="edit_inner clearfix">


			    <div class="profile-container">
			      <%--   <a href="${pageContext.request.contextPath}/member/mypage?mem_id=admin&mem_nick=관리자&mem_pic=null"> --%>
			            <span class="user_info">
					<c:if test="${login.mem_pic==''}">
						<img id="user_img"src="${pageContext.request.contextPath}/images/default_user.png" alt="">
					</c:if>
					<c:if test="${login.mem_pic!=''}">
						<img id="user_img" src="${pageContext.request.contextPath}/images/display?imageName=${login.mem_pic}"  />
					</c:if>
			            </span><strong class="user_name">${login.mem_nick}</strong>
			        <!-- </a> -->
			            </div>
					<textarea rows="4" placeholder="내용을 입력하세요" name="contents" id="edit_post" contenteditable="true"></textarea>
					</div>
					<div>
					<span class="edit_submit" style="float:left;position:relative; left:0em; top:1em">게시판&nbsp;&nbsp;&nbsp;
					<select name="cate-select" id="cate-select" >
						</select>
					<!-- 익명등록&nbsp;<input type='checkbox' class="checkbox" name='anony_yn' value='Y' /> -->
					공개등급&nbsp;<select name="open-select" id="open-select">
						<option value="E">공개</option>
						<!-- <option value="F">친구만</option> -->
						<option value="N">비공개</option>
						</select>
						<input class="btn_edit_submit" type="submit" value="게시" style="float:right;position:relative; height:2.3em; left:4em; top:-1.4em;" >
					</span>
					</div>
					</fieldset>
					</form>
			</div>

			<!--  공지사항 contents -->
			<div class="_item notice-container" id="notice-container">

	<div class="fixed_title"><span class="user_info" style="position:relative;"><img src="${pageContext.request.contextPath}/images/default_user.png" alt=""></span>#공지사항

				</div>


		<!-- post_contents -->

	<div class="post_contents" >

		<!-- 공지사항 text -->

		<div class='post_text' id='post_text'>
				<div class="user_text" id ="notice-contents">
					</div>
			</div>
				<!-- END OF post_text -->
					</div>
			<!-- END OF post_contents -->

			<!--  like, comment count -->
			<div class="post_countView clearfix">
				<div class="count_like" id="notice_count_like">
				</div>
				<div class="count_com" id="notice_count_com">
						</div>
			</div>
			<!--  END OF like, comment count -->

							<!-- END OF post_count_inner clearfix-->
			</div>
			<!--//post_count-->


		</div>
		<!--  default board_seq, category_id -->
		<input type="hidden" id = "hidCurBoardSeq" value="0" />
		<input type="hidden" id = "hidCurCateId" value="CG001" />
		<!--  END OF default board_seq, category_id -->

		<!-- user contents -->
		<div class="user-activity" id="user-activity">


           </div>
         <!--  END OF user contents  -->
        </div><!-- /.blog-main -->

        <div class="col-sm-3 col-sm-offset-1 blog-sidebar" style="border-left:solid 0.8px #dee2e6; postition:relative; left:-2em; font-family: 'Stylish', sans-serif; font-size: 1em;">
          <div class="sidebar-module sidebar-module-inset">
          </div>
          <div class="_item notice-container" style="padding-left:1.5em; padding-top:0.5em; height:14em"><br>
            <h4>
            <a href="${pageContext.request.contextPath}/board/issueBoard">
            &nbsp;#멘탈이슈게시판
           <span style="color:#ffb98c; text-align:right;"> …더 보기</span></a></h4>
            <ol class="list-unstyled" id = "sideIssueList">
            </ol>
          </div>
        </div><!-- /.blog-sidebar -->

      </div><!-- /.row -->

    </div><!-- /.container -->

</div><!-- /.bodyPart -->
<script>
window.name = "timeline";
	$(document).ready(function(){
	   loadCategory();
	   loadTimelineContents('CG001');
	   loadNoticeContents();
	   loadIssueList();
	});

	// 페이징처리 관련 멤버변수 bool
	var bool = true;

	// 카테고리 리스트 load
	function loadCategory()
	{
		var auth='${login.auth}';
		var categoryHtmls = "";
		var cateSelectHtmls = "";
		$.ajax({
			type: "post",
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/getCategoryList",
			success: function(result){
				 $.each(result, function( index, categoryList )
				{
					categoryHtmls += '<br><li><a class="a-base" onclick="javascript:loadTimelineContents(this.id)" id="';
					categoryHtmls += categoryList.category_id;
					categoryHtmls += '">';
					categoryHtmls += "#"+categoryList.category_name;
					categoryHtmls += '</a></li>';

					if( categoryList.category_id =="CG002" )
					{
						if(auth == "A" || auth.substring(0,1) == "M")
						{
							cateSelectHtmls += '<option value="';
							cateSelectHtmls += categoryList.category_id;
							cateSelectHtmls += '">';
							cateSelectHtmls += categoryList.category_name;
							cateSelectHtmls += '</option>';
						}
						else
						{
						}
					}
					else
					{
						cateSelectHtmls += '<option value="';
						cateSelectHtmls += categoryList.category_id;
						cateSelectHtmls += '">';
						cateSelectHtmls += categoryList.category_name;
						cateSelectHtmls += '</option>';

					}
				})
				$('#categoryOl').html(categoryHtmls);
				$('#cate-select').html(cateSelectHtmls);


			}
		})
	}

	// 타임라인 리스트 load
	function loadTimelineContents(cgId)
	{
		var htmls = "";
		var categoryHtmls = "";
		var imageUrl="${pageContext.request.contextPath}";
		$('#hidCurCateId').val(cgId);
		var data = {"cgId" : cgId,
				"user_id" : '${login.mem_id}'};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/getTimelineList",
			success: function(result){
				if( cgId != "CG001" && cgId != "CG002")
				{
					categoryHtmls += '<div class="fixed_title"><span class="user_info" style="position:relative;"></span>#이렇게 적어보세요';
					categoryHtmls += '</div><div class="post_contents" style="position:relative; bottom:0.5em;" ><div class="post_text" id="post_text"><div class="user_text" id ="category-ex-contents">';
					categoryHtmls += result.category.category_ex;
					categoryHtmls += '</div></div>';
					$('#category-ex-container').html(categoryHtmls);
				}

				 $.each(result.boardList, function( index, board )
				 {
					$('#hidCurBoardSeq').val(board.board_seq);
					// 기본 글 load
			 		htmls += '<div class="_item user-container" style="display:"";" id="user-container-';
			 		htmls += board.board_seq;
			 		htmls += '">';
			 	// 회원정보 링크 수정부분 start
			 		htmls += '<div class="user-info-container">';
			 		htmls += '<form class="user-info-form" action="${pageContext.request.contextPath}/member/mypage" id="user-info-form-';
			 		htmls += board.board_seq;
			 		htmls += '" enctype="multipart/form-data" name="user-info" method="post"  enctype="multipart/form-data">';
			 		htmls += '<input type="hidden" name="mem_id" value="';
			 		htmls += board.created_id;
			 		htmls += '" />'
		 			htmls += '<input type="hidden" name="mem_pic" value="';
			 		htmls += board.mem_pic;
			 		htmls += '" />'
		 			htmls += '<input type="hidden" name="mem_nick" value="';
			 		htmls += board.mem_nick;
			 		htmls += '" />'
			 		htmls += '<a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
			 		htmls += board.board_seq;
			 		htmls += ');"><span class="user_profile" >';
			 		// 회원정보 링크 수정부분 완료 .. 밑에 </form> 해줄것.
			 		// 회원정보 링크 수정 전 start
			 		//htmls += '<div class="user-info-container"><a href="" class="user_info_wrap"><span class="user_profile" >'

			 		// 회원사진 적용
			 		if( board.mem_pic == null || board.mem_pic == '' )
			 		{
				 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
			 		}
			 		else
		 			{
			 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
			 			htmls += board.mem_pic;
			 			htmls += '" alt="">';
		 			}
			 		htmls += '</span><div class="user_cont"><strong class="user_name">';
			 		htmls += board.mem_nick;
			 		htmls += '</strong><span class="user_time">';
			 		if( board.up_time.length > 10 )
		 			{
			 			htmls += board.created_timestamp.substr(0,10);
		 			}
			 		else
		 			{
			 			htmls += board.up_time;
		 			}
			 		htmls += '</span></div></a></form></div><div class="post_menu">';
			 		if( board.created_id == '${login.mem_id}' )
		 			{
				 		htmls += '<a class="post-edit"  href="javascript:modifyPost(';
				 		htmls += board.board_seq;
				 		htmls += ');" style="width:35px; position: relative; display: inline-block;  margin-right:0.3em; margin-left:0.1em;"><dl>수정</dl></a>';
				 		htmls += '<a class="post-delete" href="javascript:deletePost(';
				 		htmls += board.board_seq;
				 		htmls += ');" style="width:35px; position: relative; display: inline-block;  "><dl>삭제</dl></a>';
		 			}
			 		// htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
			 		htmls += '</div><div class="post_contents" ><div class="post_text"><div class="user_text" >';
			 		htmls += '<a class="post_all" id = "post-contents-';
			 		htmls += board.board_seq;
			 		htmls += '" href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
			 		htmls += board.board_seq;
			 		htmls += '" ><pre style="white-space:pre-wrap;">';
			 		htmls += board.contents;
			 		htmls += '</pre></a></div></div></div><div class="post_countView clearfix"><div class="count_like">';
			 		
			 		if( board.like_count == 0 )
		 			{
			 			htmls += '<a href="javascript:likeEmptyEvent();">공감해요 ';
				 		htmls += board.like_count;
				 		htmls += '개</a>';
		 			}
			 		else
			 		{
			 			htmls += '<a href="javascript:loadLikeListPopup(';
				 		htmls += board.board_seq;
				 		htmls += ');" >공감해요 ';
				 		htmls += board.like_count;
				 		htmls += '개</a>';
			 		}
			 		
			 		htmls += '</div><div class="count_com"><a href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
			 		htmls += board.board_seq;
			 		htmls += '"> 댓글 ';
			 		htmls += board.comment_count;
			 		htmls += '개</a></div></div><div class="post_count clearfix"><div class="post_count_inner clearfix"><div class="ico_like">';
			 		htmls += '<a class="ico_post"  href= "javascript:void(0);" onclick = "javascript:upLike(';
			 		htmls += board.board_seq;
			 		htmls += ',';
			 		htmls += board.like_count;
			 		htmls += ');"><i class="material-icons" style="color:red;">favorite_border</i></a></div>';
			 		htmls += '<div class="ico_comment"><a href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
			 		htmls += board.board_seq;
			 		htmls +='"><i class="material-icons" style="color:gray;">insert_comment</i></a></div></div></div></div></div>';

			 	// 수정 글 load hidden
			 		htmls += '<div class="_item user-container" style="display:none;" id="user-modify-';
			 		htmls += board.board_seq;
			 		htmls += '">';

			 		htmls += '<div class="user-info-container"><a href="" class="user_info_wrap"><span class="user_profile" >'
			 		// 회원사진 적용
			 		if( board.mem_pic == null || board.mem_pic == '' )
			 		{
				 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
			 		}
			 		else
		 			{
			 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
			 			htmls += board.mem_pic;
			 			htmls += '" alt="">';
		 			}

			 		htmls += '</span><div class="user_cont"><strong class="user_name">';
			 		htmls += board.mem_nick;
			 		htmls += '</strong><span class="user_time">';
			 		if( board.up_time.length > 10 )
		 			{
			 			htmls += board.created_timestamp.substr(0,10);
		 			}
			 		else
		 			{
			 			htmls += board.up_time;
		 			}
			 		htmls += '</span></div></a></div><div class="post_menu">';
			 		htmls += '<input class="btn_edit_submit" type="button" onclick = "javascript:modifySubmit(';
			 		htmls += board.board_seq;
			 		htmls += ');" value="수정" style="float:right;position:relative; height:2.3em; left:0em; top:-1.4em;" ></div>';
			 		htmls += '<div class="post_contents" ><div class="post_text"><div class="profile-container"><textarea  onkeydown="resize(this)"';
			 		htmls += 'onkeyup="resize(this)" style="width:100%; margin-left:0.8em;" name="contents" id="modify-post-';
			 		htmls += board.board_seq;
			 		htmls += '" contenteditable="true">';
			 		htmls += board.contents;
			 		htmls += '</textarea></div>';
			 		htmls += '</div></div></div>';

				 })
			$('#user-activity').html(htmls);
			}
		})
	}

	 // textarea 사이즈 자동 조절
	function resize(obj)
	{
		obj.style.height = "1px";
		obj.style.height = (12+obj.scrollHeight)+"px";
	}

	 // 타임라인 리스트 내 공지사항 load
	function loadNoticeContents()
	{
		var likeHtmls = "";
		var comHtmls = "";
		var noticeHtmls = "";
		var like ="";
		var comment = "";
		$.ajax({
			type: "post",
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/getTimelineNoticeContents",
			success: function(result){
				if(result.data_yn == "Y")
				{
					noticeHtmls += '<a class="post_all" href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
					noticeHtmls += result.boardVo.board_seq;
					noticeHtmls += '" ><pre style="white-space:pre-wrap;">';
					noticeHtmls += result.boardVo.contents;
					noticeHtmls += '</pre></a>';
	
					$('#notice-contents').html(noticeHtmls);
					
					if( result.boardVo.like_count == 0 )
		 			{
						likeHtmls += '<a href="javascript:likeEmptyEvent();">공감해요 ';
						likeHtmls += result.boardVo.like_count;
						likeHtmls += '개</a>';
		 			}
			 		else
			 		{
			 			likeHtmls += '<a href="javascript:loadLikeListPopup(';
			 			likeHtmls += result.boardVo.board_seq;
			 			likeHtmls += ');" >공감해요 ';
			 			likeHtmls += result.boardVo.like_count;
				 		likeHtmls += '개</a>';
			 		}
					$('#notice_count_like').html(likeHtmls);
					
					comHtmls += '<a href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
					comHtmls += result.boardVo.board_seq;;
					comHtmls += '"> 댓글 ';
					comHtmls += result.boardVo.comment_count;
					comHtmls += '개</a>';
					$('#notice_count_com').html(comHtmls);
	
					like += '<a href="javascript:void(0);" onclick = "javascript:upLike(';
					like += result.boardVo.board_seq;
					like += ',';
					like += result.boardVo.like_count;
					like += ');"><i class="material-icons" style="color:red;">favorite_border</i></a>';
					$('#notice_like').html(like);
	
					comment += '<a href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
					comment += result.boardVo.board_seq;
					comment += '"><i class="material-icons" style="color:gray;">insert_comment</i></a>';
					$('#notice_comment').html(comment);
				}
			}
		})
	}
	function checkValue()
	{
		theForm = document.post_edit;
		if(theForm.contents.value="")
		{
			alert("내용을 입력해주세요.");
			return theForm.contents.focus();
		}
	}

	// 우측 side 이슈게시판 리스트 load
	function loadIssueList()
	{
		var issueHtmls = "";
		var title="";
		$.ajax({
			type: "post",
			url:"${pageContext.request.contextPath}/board/getIssueList",
			success: function(result){
				if( result.length < 1)
				{

				}
				else
				{
					$.each(result, function( index, result ){
						if( index == 5 )
						{
							return false;
						}
						if( result.title.length > 12 )
						{
							title = result.title.replace(result.title.substr(12,result.title.length),"..")
						}
						else
						{
							title = result.title;
						}
						issueHtmls += '<br><li><a href="${pageContext.request.contextPath}/board/issueBoardContents?issue_board_seq=';
						issueHtmls += result.issue_board_seq;
						issueHtmls += '">&nbsp;&nbsp;';
						issueHtmls += title;
						issueHtmls += '</a></li>';
					}
					)
					$('#sideIssueList').html(issueHtmls);
				}
			}
		})
	}

	// 타임라인 페이지 증가 이벤트
 	$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		var maxHeight = $(document).height();
	    var currentScroll = $(window).scrollTop() + $(window).height();

		if (maxHeight <= currentScroll+20) {
			if(bool)
			{
				appendTimeline();
			}
	    }
	});

	// 타임라인 페이지 추가 append load
	function appendTimeline()
	{
		bool = false;
		var htmls = "";
		var imageUrl="${pageContext.request.contextPath}";
		var boardSeq = $("#hidCurBoardSeq").val();
		var cateId = $("#hidCurCateId").val();
		var data = {"cgId" : cateId,
				"boardSeq" : boardSeq,
				"user_id" : '${login.mem_id}'};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/appendTimelineList",
			success: function(result){
				 $.each(result, function( index, board )
				 {
					$('#hidCurBoardSeq').val(board.board_seq);
					//기본글 load
					htmls += '<div class="_item user-container" style="display:"";" id="user-container-';
			 		htmls += board.board_seq;
			 		htmls += '">';
			 	// 회원정보 링크 수정부분 start
			 		htmls += '<div class="user-info-container">';
			 		htmls += '<form class="user-info-form" action="${pageContext.request.contextPath}/member/mypage" id="user-info-form-';
			 		htmls += board.board_seq;
			 		htmls += '" enctype="multipart/form-data" name="user-info" method="post"  enctype="multipart/form-data">';
			 		htmls += '<input type="hidden" name="mem_id" value="';
			 		htmls += board.created_id;
			 		htmls += '" />'
		 			htmls += '<input type="hidden" name="mem_pic" value="';
			 		htmls += board.mem_pic;
			 		htmls += '" />'
		 			htmls += '<input type="hidden" name="mem_nick" value="';
			 		htmls += board.mem_nick;
			 		htmls += '" />'
			 		htmls += '<a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
			 		htmls += board.board_seq;
			 		htmls += ');"><span class="user_profile" >';
			 		// 회원정보 링크 수정부분 완료 .. 밑에 </form> 해줄것.

			 		//htmls += '<div class="user-info-container"><a href="" class="user_info_wrap"><span class="user_profile" >'

			 		// 회원사진 적용
			 		if( board.mem_pic == null || board.mem_pic == '' )
			 		{
				 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
			 		}
			 		else
		 			{
			 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
			 			htmls += board.mem_pic;
			 			htmls += '" alt="">';
		 			}
			 		htmls += '</span><div class="user_cont"><strong class="user_name">';
			 		htmls += board.mem_nick;
			 		htmls += '</strong><span class="user_time">';
			 		if( board.up_time.length > 10 )
		 			{
			 			htmls += board.created_timestamp.substr(0,10);
		 			}
			 		else
		 			{
			 			htmls += board.up_time;
		 			}
			 		htmls += '</span></div></a></form></div><div class="post_menu">';
			 		if( board.created_id == '${login.mem_id}' )
		 			{
				 		htmls += '<a class="post-edit"  href="javascript:modifyPost(';
				 		htmls += board.board_seq;
				 		htmls += ');" style="width:35px; position: relative; display: inline-block;  margin-right:0.3em; margin-left:0.1em;"><dl>수정</dl></a>';
				 		htmls += '<a class="post-delete" href="javascript:deletePost(';
				 		htmls += board.board_seq;
				 		htmls += ');" style="width:35px; position: relative; display: inline-block;  "><dl>삭제</dl></a>';
		 			}
			 		htmls += '</div><div class="post_contents" ><div class="post_text"><div class="user_text">';
			 		htmls += '<a class="post_all" href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
			 		htmls += board.board_seq;
			 		htmls += '" ><pre style="white-space:pre-wrap;">';
			 		htmls += board.contents;
			 		htmls += '</pre></a></div></div></div><div class="post_countView clearfix"><div class="count_like">';
			 		
			 		if( board.like_count == 0 )
		 			{
			 			htmls += '<a href="javascript:likeEmptyEvent();">공감해요 ';
				 		htmls += board.like_count;
				 		htmls += '개</a>';
		 			}
			 		else
			 		{
			 			htmls += '<a href="javascript:loadLikeListPopup(';
				 		htmls += board.board_seq;
				 		htmls += ');" >공감해요 ';
				 		htmls += board.like_count;
				 		htmls += '개</a>';
			 		}
			 		
			 		htmls += '</div><div class="count_com"><a href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
			 		htmls += board.board_seq;
			 		htmls += '"> 댓글 ';
			 		htmls += board.comment_count;
			 		htmls += '개</a></div></div><div class="post_count clearfix"><div class="post_count_inner clearfix"><div class="ico_like">';
			 		htmls += '<a class="ico_post"  href= "javascript:void(0);" id= "ossn-like-18968" onclick = "javascript:upLike(';
			 		htmls += board.board_seq;
			 		htmls += ',';
			 		htmls += board.like_count;
			 		htmls += ');"><i class="material-icons" style="color:red;">favorite_border</i></a></div>';
			 		htmls += '<div class="ico_comment"><a href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
			 		htmls += board.board_seq;
			 		htmls += '"><i class="material-icons" style="color:gray;">insert_comment</i></a></div></div></div></div></div>';

			 	// 수정 글 load hidden
			 		htmls += '<div class="_item user-container" style="display:none;" id="user-modify-';
			 		htmls += board.board_seq;
			 		htmls += '">';

			 		htmls += '<div class="user-info-container"><a href="" class="user_info_wrap"><span class="user_profile" >'
			 		// 회원사진 적용
			 		if( board.mem_pic == null || board.mem_pic == '' )
			 		{
				 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
			 		}
			 		else
		 			{
			 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
			 			htmls += board.mem_pic;
			 			htmls += '" alt="">';
		 			}
			 		htmls += '</span><div class="user_cont"><strong class="user_name">';
			 		htmls += board.mem_nick;
			 		htmls += '</strong><span class="user_time">';
			 		if( board.up_time.length > 10 )
		 			{
			 			htmls += board.created_timestamp.substr(0,10);
		 			}
			 		else
		 			{
			 			htmls += board.up_time;
		 			}
			 		htmls += '</span></div></a></div><div class="post_menu">';
			 		htmls += '<input class="btn_edit_submit" type="button" onclick = "javascript:modifySubmit(';
			 		htmls += board.board_seq;
			 		htmls += ');" value="수정" style="float:right;position:relative; height:2.3em; left:0em; top:-1.4em;" ></div>';
			 		htmls += '<div class="post_contents" ><div class="post_text"><div class="profile-container"><textarea  onkeydown="resize(this)"';
			 		htmls += 'onkeyup="resize(this)" style="width:100%; margin-left:0.8em;" name="contents" id="modify-post-';
			 		htmls += board.board_seq;
			 		htmls += '" contenteditable="true">';
			 		htmls += board.contents;
			 		htmls += '</textarea></div>';
			 		htmls += '</div></div></div>';

				 })
			$('#user-activity').append(htmls);
			bool = true;
			}
		})
	}

	// like up
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
					location.href = "${pageContext.request.contextPath}/board/timelineContents?board_seq="+seq;
					//location.reload();
				}
				else
				{
					alert("이미 좋아요를 눌렀습니다.");
					return;
				}
			}
		})
	}

	// 게시글 삭제 event
	function deletePost(seq)
	{
		var data = {"seq" : seq};
		var con = confirm("게시글을 정말 삭제하시겠습니까?")
		if(con == true)
		{
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/deletePost",
			success: function(result){
				if( result.data_yn == "Y" )
				{
					location.reload();
				}
			}
		})
		}
	}

	// 게시글 수정 event
	function modifyPost(seq)
	{
		var baseId = "user-container-" + seq;
		var modiId = "user-modify-" + seq;
		document.getElementById(baseId).style.display="none";
		document.getElementById(modiId).style.display="";
	}

	// 게시글 수정 submit event
	function modifySubmit(seq)
	{
		var modiPostId = "modify-post-" + seq;
		var midiId = document.getElementById(modiPostId);
		var contents = midiId.value;
		var data = {"seq" : seq, "contents" :contents};
		var con = confirm("게시글을 정말 수정하시겠습니까?")
		if(con == true)
		{
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/modifyPost",
			success: function(result){
				if( result.data_yn == "Y" )
				{
					var baseId = "user-container-" + seq;
					var modiId = "user-modify-" + seq;
					var postId = "post-contents-" + seq;
					//alert(contents);
					//document.getElementById(baseId).html = contents;
					document.getElementById(baseId).style.display="";
					document.getElementById(modiId).style.display="none";
					//document.getElementById(postId).load(window.location.href + '#'+postId);
					location.reload();
				}
			}
		})
		}
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
