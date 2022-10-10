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
			<form class="form-signin" method="post" id="issueForm" action="${pageContext.request.contextPath}/board/modifyIssuePOST">
				<input type="hidden" id = "hidCurSeq" name = "issue_board_seq" value="" />
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">이슈게시판</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" id ="title" name="title" maxlength="50"/></td>
						</tr>
						<tr>
							<td><pre><textarea class="form-control" id="contents"  name="contents" style="height: 350px;"></textarea></pre></td>
						</tr>
					</tbody>
				</table>
				<input type="submit" class="btn btn-primary pull-right" value="수정하기" />
			</form>




        </div><!-- /.blog-main -->

		</div><!--  blog post -->
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

  function loadData(seq)
  {
	  var htmls = "";
		var data = {"seq" : seq};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/getIssueContents",
			success: function(result){
				document.getElementById("title").value = result.issueContents.title;
				document.getElementById("contents").value = result.issueContents.contents;
				document.getElementById("hidCurSeq").value = result.issueContents.issue_board_seq;
			}
		})
  }
  </script>
</html>
