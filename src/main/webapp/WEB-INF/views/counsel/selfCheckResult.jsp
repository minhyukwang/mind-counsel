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
        <h1 class="blog-title">심리자가검진 결과</h1>
      </div>
      <hr style="border:solid; width:100%"/>
      <div class="row">

        <div class="col-md-12 blog-main">

          <div class="blog-post">
          <h2 class="blog-semi_title" id="check_name"></h2>
          <hr style="border:0.5px solid; width:100%"/>
	          <!-- <div class="blog-intro" id="check_explain">

	          </div> -->
	          <br>
	          <form class="check-form" action="${pageContext.request.contextPath}/counsel/writeSelfCheck" id="check-form" enctype="multipart/form-data" name="check_edit" method="post"  enctype='multipart/form-data'>
			<fieldset>
	          <input type="hidden" id = "hidCheckId" value="" />
	          <input type="hidden" id = "hidScore" value="" />
	          <div class="blog-post-main" style="width:100%;">
	          <div class="blog-score">
	          <h2 id="score"></h2><br><br>
	          </div>
	          <div class="table-responsive">
            	<table class="table-bordered" style="text-align:center; width:90%; overflow-y:hidden;" id="selfCheckResult" >
					<colgroup>
						<col style="width:30%">
						<col style="width:70%">
					</colgroup>
						<tbody id="scTbody">


						</tbody>
						</table>
						<div class="blog-post-check-btn" style="text-align:center;"><br>
						<p>자가 진단은 자신의 상태를 스스로 점검해 볼 수 있도록 제공된 것이므로 정신과적 진단을 대신할 수 없습니다. 자세한 사항은 전문가와 상의하시기 바랍니다. </p>
						<br>
						<input class='self-check-re-btn' type="button" id="reBtn" value="온라인 심리상담예약" >&nbsp;
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
<%@include file="/WEB-INF/views/decorator/footer.jsp" %>
  </body>
  <script>
   $(document).ready(function(){
	   $("#hidCheckId").val('${param.check_id}');
	   $("#hidScore").val('${param.score}');

	  loadData( $("#hidCheckId").val());
	});

   function loadData(checkId){
		var htmls = "";
		var scoreHtmls = "";
		var data = {"checkId" : checkId};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/counsel/getSelfCheckAppr",
			success: function(result){
				$('#check_name').html(result.selfCheck.check_name);
			//	$('#check_explain').html(result.selfCheck.check_explain);

				scoreHtmls += '점검결과 : ';
				scoreHtmls += $("#hidScore").val();
				scoreHtmls += '점';
				$('#score').html(scoreHtmls);

				if(result.selfCheck.appr1 != null )
				{
					htmls += '<tr><td>';
					htmls += result.selfCheck.appr1;
					htmls += '</td><td>';
					htmls += result.selfCheck.appr_contents1;
					htmls += '</td></tr>';
				}
				if(result.selfCheck.appr2 != null )
				{
					htmls += '<tr><td>';
					htmls += result.selfCheck.appr2;
					htmls += '</td><td>';
					htmls += result.selfCheck.appr_contents2;
					htmls += '</td></tr>';
				}
				if(result.selfCheck.appr3 != null )
				{
					htmls += '<tr><td>';
					htmls += result.selfCheck.appr3;
					htmls += '</td><td>';
					htmls += result.selfCheck.appr_contents3;
					htmls += '</td></tr>';
				}
				if(result.selfCheck.appr4 != null )
				{
					htmls += '<tr><td>';
					htmls += result.selfCheck.appr4;
					htmls += '</td><td>';
					htmls += result.selfCheck.appr_contents4;
					htmls += '</td></tr>';
				}
				if(result.selfCheck.appr5 != null )
				{
					htmls += '<tr><td>';
					htmls += result.selfCheck.appr5;
					htmls += '</td><td>';
					htmls += result.selfCheck.appr_contents5;
					htmls += '</td></tr>';
				}
				$('#scTbody').html(htmls);
			}
		})
   }
	$("#reBtn").on("click", function(){
		var con = confirm("전문가에게 온라인 상담신청 쪽지를 전송하시겠습니까?")
		if(con == true)
		{
			location.href="${pageContext.request.contextPath}/counsel/mngNote";
			/* var data = {"note_title" : "자가진단완료 온라인 상담신청",
				"send_mem_id" : '${login.mem_id}',
				"reci_mem_id" : "admin",
				"note_contents" : "자가진단 완료 온라인 상담신청",
				"co_type" : "S"};
			$.ajax({
				type: "post",
				data:data,
				dataType:"json",
				url:"${pageContext.request.contextPath}/counsel/sendNote",
				success: function(result){
				}
			}) */
		}
	});

   </script>
</html>
