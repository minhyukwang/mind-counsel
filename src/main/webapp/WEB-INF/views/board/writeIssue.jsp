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
        <h1 class="blog-title">MENTAL ISSUE BOARD</h1>
      </div>
      <hr style="border:solid; width:100%"/>
      <div class="row">

        <div class="col-md-10 blog-main">

          <div class="blog-post">
	          <div class="blog-intro">
	          	여기는 멘탈 이슈 게시판입니다.<br>
	          	관리자가 매일 멘탈 이슈에 대한 내용을 올려드립니다.<br>
	          </div>
	          <br>

        <div class="col-sm-12 blog-main">
			<form class="form-signin" method="post" id="issueForm" action="${pageContext.request.contextPath}/board/insertIssuePOST">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">이슈게시판</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" id ="title" placeholder="글 제목" name="title" maxlength="50"/></td>
						</tr>
						<tr>
							<td><textarea class="form-control" id="contents" placeholder="글 내용" name="contents"  style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기" />
			</form>




        </div><!-- /.blog-main -->

		</div><!--  blog post -->
		 </div><!-- /.blog-main -->
      </div><!-- /.row -->

    </div><!-- /.container -->
</div><!-- /.bodyPart -->

  </body>
  <script>
  </script>
</html>
