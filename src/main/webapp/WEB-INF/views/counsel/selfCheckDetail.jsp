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
        <h1 class="blog-title">심리자가검진</h1>
      </div>
      <hr style="border:solid; width:100%"/>
      <div class="row">

        <div class="col-md-12 blog-main">

          <div class="blog-post">
          <h2 class="blog-semi_title" id="check_name"></h2>
          <hr style="border:0.5px solid; width:100%"/>
	          <div class="blog-intro" id="check_explain">

	          </div>
	          <br>
	          <form class="check-form" action="${pageContext.request.contextPath}/counsel/writeSelfCheck" id="check-form" enctype="multipart/form-data" name="check_edit" method="post"  enctype='multipart/form-data'>
			<fieldset>
	          <input type="hidden" id = "hidCheckId" name = "checkId" value="" />
	          <input type="hidden" id = "hidLastAns" name = "lastAns" value="" />
	          <div class="blog-post-main" style="width:100%;">
	          <div class="table-responsive">
            	<table class=table-striped style="text-align:center; width:90%;" id="selfCheckDetail" >
					<colgroup>
						<col style="width:90%">
					</colgroup>
						<tbody id="scTbody">


						</tbody>
						</table>
						<div class="blog-post-check-btn" style="text-align:center;"><br>
						<input class="btn_edit_submit" type="button" id = "selfCheckSubmit"value="결과보기" >&nbsp;
						<input class="btn_edit_submit" type="reset" value="다시하기" >
					</div>
						</div>

					  </div>
					  </fieldset></form>
	          </div>

          <!-- /.blog-post -->
        </div><!-- /.blog-main -->


      </div><!-- /.row -->

    </div><!-- /.container -->

</div><!-- /.bodyPart -->
  </body>
  <script>
   $(document).ready(function(){
	   $("#hidCheckId").val('${param.tdId}');
	   loadData( $("#hidCheckId").val());
	});

   function loadData(checkId){
		var htmls = "";
		var ansHtmls = "";
		var data = {"checkId" : checkId};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/counsel/getSelfCheckDetail",
			success: function(result){
				$('#check_name').html(result.selfCheck.check_name);
				$('#check_explain').html(result.selfCheck.check_explain);
				$.each(result.selfCheckQu, function( index, selfCheckQu )
				{
					$('#hidLastAns').val(index);
					htmls += '<tr><td  class="table-content-left">';
					htmls += selfCheckQu.qu;
					htmls += '</td></tr><tr><td  class="table-content-left" id ="ans';
					htmls += index;
					htmls += '"></td></tr>';
				})
				$('#scTbody').html(htmls);

				$.each(result.selfCheckAns, function( index, selfCheckAns )
				{
					ansHtmls += '&nbsp;';
					var ansIndex = 'ans'+ index;
					if(selfCheckAns.ans1 != null )
					{
						ansHtmls += '<label class="radio-inline"><input type="radio" name="';
						ansHtmls += ansIndex;
						ansHtmls += 're';
						ansHtmls += index;
						ansHtmls += '" id="';
						ansHtmls += ansIndex;
						ansHtmls += 're1" value="0" >&nbsp;';
						ansHtmls += selfCheckAns.ans1;
						ansHtmls += '</label>&nbsp;';
					}
					if(selfCheckAns.ans2 != null )
					{
						ansHtmls += '<label class="radio-inline"><input type="radio" name="';
						ansHtmls += ansIndex;
						ansHtmls += 're';
						ansHtmls += index;
						ansHtmls += '" id="';
						ansHtmls += ansIndex;
						ansHtmls += 're2" value="1">&nbsp;';
						ansHtmls += selfCheckAns.ans2;
						ansHtmls += '</label>&nbsp;';
					}
					if(selfCheckAns.ans3 != null )
					{
						ansHtmls += '<label class="radio-inline"><input type="radio" name="';
						ansHtmls += ansIndex;
						ansHtmls += 're';
						ansHtmls += index;
						ansHtmls += '" id="';
						ansHtmls += ansIndex;
						ansHtmls += 're3" value="2">&nbsp;';
						ansHtmls += selfCheckAns.ans3;
						ansHtmls += '</label>&nbsp;';
					}

					if(selfCheckAns.ans4 != null )
					{
						ansHtmls += '<label class="radio-inline"><input type="radio" name="';
						ansHtmls += ansIndex;
						ansHtmls += 're';
						ansHtmls += index;
						ansHtmls += '" id="';
						ansHtmls += ansIndex;
						ansHtmls += 're4" value="3">&nbsp;';
						ansHtmls += selfCheckAns.ans4;
						ansHtmls += '</label>&nbsp;';
					}
					if(selfCheckAns.ans5 != null )
					{
						ansHtmls += '<label class="radio-inline"><input type="radio" name="';
						ansHtmls += ansIndex;
						ansHtmls += 're';
						ansHtmls += index;
						ansHtmls += '" id="';
						ansHtmls += ansIndex;
						ansHtmls += 're5" value="4">&nbsp;';
						ansHtmls += selfCheckAns.ans5;
						ansHtmls += '</label>&nbsp;';
					}
					if(selfCheckAns.ans6 != null )
					{
						ansHtmls += '<label class="radio-inline"><input type="radio" name="';
						ansHtmls += ansIndex;
						ansHtmls += 're';
						ansHtmls += index;
						ansHtmls += '"  id="';
						ansHtmls += ansIndex;
						ansHtmls += 're6" value="5">&nbsp;';
						ansHtmls += selfCheckAns.ans6;
						ansHtmls += '</label>&nbsp;';
					}
					if(selfCheckAns.ans7 != null )
					{
						ansHtmls += '<label class="radio-inline"><input type="radio" name="';
						ansHtmls += ansIndex;
						ansHtmls += 're';
						ansHtmls += index;
						ansHtmls += '" id="';
						ansHtmls += ansIndex;
						ansHtmls += 're7" value="6">&nbsp;';
						ansHtmls += selfCheckAns.ans7;
						ansHtmls += '</label>&nbsp;';
					}
					if(selfCheckAns.ans8 != null )
					{
						ansHtmls += '<label class="radio-inline"><input type="radio" name="';
						ansHtmls += ansIndex;
						ansHtmls += 're';
						ansHtmls += index;
						ansHtmls += '" id="';
						ansHtmls += ansIndex;
						ansHtmls += 're8" value="7">&nbsp;';
						ansHtmls += selfCheckAns.ans8;
						ansHtmls += '</label>&nbsp;';
					}
					if(selfCheckAns.ans9 != null )
					{
						ansHtmls += '<label class="radio-inline"><input type="radio" name="';
						ansHtmls += ansIndex;
						ansHtmls += 're';
						ansHtmls += index;
						ansHtmls += '" id="';
						ansHtmls += ansIndex;
						ansHtmls += 're9" value="8">&nbsp;';
						ansHtmls += selfCheckAns.ans9;
						ansHtmls += '</label>&nbsp;';
					}
					if(selfCheckAns.ans10 != null )
					{
						ansHtmls += '<label class="radio-inline"><input type="radio" name="';
						ansHtmls += ansIndex;
						ansHtmls += 're';
						ansHtmls += index;
						ansHtmls += '" id="';
						ansHtmls += ansIndex;
						ansHtmls += 're10" value="9">&nbsp;';
						ansHtmls += selfCheckAns.ans10;
						ansHtmls += '</label>&nbsp;';
					}


					document.getElementById(ansIndex).innerHTML = ansHtmls;
					ansHtmls = "";
				})
			}
		})
   }

   $("#selfCheckSubmit").on("click", function(){
		if($('input:radio:checked').length <= $('#hidLastAns').val())
		{
			alert('모든 항목을 체크해주세요');
		}
		else
		{
			$('#check-form').submit();
		}

	   });

   </script>
</html>
