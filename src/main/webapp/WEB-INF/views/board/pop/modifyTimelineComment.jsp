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
			<div class= "comments_wrap">
			<div class="comments-list">
			<div class="comments-input">
			<form action="${pageContext.request.contextPath}/board/modifyCommentSubmit" id="modify-comment" class="comment-container" autocomplete="off" name="post/comment_modify" method="post"  enctype='multipart/form-data'><fieldset> 
			<input type="hidden" id = "hidCommentSeq" name ="comment_seq" />
			<div class="com_input_wrap clearfix">
			<textarea type="text" name="comment" id="modify-comment-box" class="comment-box"
		        contenteditable="true"></textarea>
		       </div>
		       </fieldset>
		       </form>
		       </div>
		       </div>
		       <div class="com_submit" id="modify-comment-submit"><a href="javascript:modifyCommentSubmit();" 
		       style="position: relative; display: inline-block; margin-right:0.3em; margin-left:10em;"
		        class="btn_com_submit">등록</a>
		       <a href="javascript:modifyCommentCancel();"  class="btn_com_submit"
		       style="position: relative; display: inline-block; margin-right:0.3em; margin-left:22em;  margin-top:-3.2em;">취소</a></div>
		       </div>
		       
           </div>

        </div><!-- /.blog-main -->


      </div><!-- /.row -->

    </div><!-- /.container -->

</div><!-- /.bodyPart -->

<script>
	$(document).ready(function(){
		loadData('${param.comment_seq}');
		
	});
	
	function modifyCommentSubmit()
	{
		var formId = 'modify-comment';
		document.getElementById(formId).submit();
		opener.parent.location.reload();
		window.close();
	}
	
	function modifyCommentCancel()
	{
		window.close();
	}
	
	function loadData(seq)
	{
		var htmls = "";
		var data = {"comment_seq" : seq};
		var cnt=0;
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/getModifyComment",
			success: function(result){
				$('#hidCommentSeq').val(seq);
				$('#modify-comment-box').val(result.comment.contents);
			}
		})
	}

	
</script>
  </body>
</html>
