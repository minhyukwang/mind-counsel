<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css?20190816">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/template-style2.css?20190816">
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
  </head>
<title>SOL COUNSEL</title>
  <body>
	<div class="bodyPart">
    <div class="container">

      <div class="blog-header">
      </div>

      <div class="row">

        
        <div class="col-sm-12 blog-main">
			<div class="user-activity" id ="user-activity">
		       
           </div>

        </div><!-- /.blog-main -->


      </div><!-- /.row -->

    </div><!-- /.container -->

</div><!-- /.bodyPart -->

<script>
	$(document).ready(function(){
		loadData('${param.board_seq}');
		
	});
	
	function modifyCommentSubmit()
	{
		var formId = 'modify-comment';
		document.getElementById(formId).submit();
		opener.parent.location.reload();
		window.close();
	}
	
	function cancel()
	{
		window.close();
	}
	
	function loadData(board_seq)
	{
		var htmls = "";
		var data = {"board_seq" : board_seq, "board_type" : "T"};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/getTimeLineLikePopupList",
			success: function(result){
				$.each(result.likeList, function( index, like )
				{
					htmls += '<div class="user-info-container">';
			 		htmls += '<form class="user-info-form" action="${pageContext.request.contextPath}/member/mypage" id="user-info-form-';
			 		htmls += index;
			 		htmls += '" enctype="multipart/form-data" name="user-info" method="post"  enctype="multipart/form-data">';
			 		htmls += '<input type="hidden" name="mem_id" value="';
			 		htmls += like.mem_id;
			 		htmls += '" />'
		 			htmls += '<input type="hidden" name="mem_pic" value="';
			 		htmls += like.mem_pic;
			 		htmls += '" />'
		 			htmls += '<input type="hidden" name="mem_nick" value="';
			 		htmls += like.mem_nick;
			 		htmls += '" />'
			 		htmls += '<a href="javascript:void(0);" class="user_info_wrap" onclick = "javascript:loadUserInfo(';
			 		htmls += index;
			 		htmls += ');"><span class="user_profile" >';
			 		// 회원정보 링크 수정부분 완료 .. 밑에 </form> 해줄것.
			 		// 회원정보 링크 수정 전 start
			 		//htmls += '<div class="user-info-container"><a href="" class="user_info_wrap"><span class="user_profile" >'

			 		// 회원사진 적용
			 		if( like.mem_pic == null || like.mem_pic == '' )
			 		{
				 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
			 		}
			 		else
		 			{
			 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
			 			htmls += like.mem_pic;
			 			htmls += '" alt="">';
		 			}
			 		htmls += '</span><strong class="user_name">';
			 		htmls += like.mem_nick;
			 		htmls += '</strong></a></form></div>';
				})
				$('#user-activity').html(htmls);
			}
		})
	}
	
	function loadUserInfo(id)
	{
		var formId = "user-info-form-" + id;
		document.getElementById(formId).target= opener.name;
		document.getElementById(formId).submit(); // 폼 전송
		self.close(); //창 닫기 
	}
</script>
  </body>
</html>
