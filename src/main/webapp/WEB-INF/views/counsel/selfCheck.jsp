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
        <h1 class="title-part">정신건강관련 자가검진</h1>
      </div>
      <hr style="width:100%"/>
      <div class="row">

        <div class="col-md-12 blog-main">

          <div class="blog-post">
	          <!-- <div class="blog-intro-image">
	          	<img src="" alt="">
	          </div> -->
	          <br>
          	<div class="table-responsive">
            	<table class=table-base style="text-align:center;" id="selfCheck">
					<colgroup>
						<col style="width:20%">
						<col style="width:*">
						<col style="width:20%">
					</colgroup>
					<thead>
						<tr>
							<th scope="row">검사명</th>
							<th scope="row">설명</th>
							<th scope="row">검사</th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td value="SC001">ADHD 평가척도</td>
							<td class="table-content-left">이 척도는 아동의 ADHD 성향에 대해 알아볼 수 있도록 교사,
							또는 부모가 아동의 모습을 관찰하여 응답하는 척도입니다.</td>
							<td><button class="self-check-btn" id="counselBtn1" style="top:0.2em">검사하기</button></td>
						</tr>
						<tr>
							<td value="SC002">Reynolds의 자살생각 척도</td>
							<td class="table-content-left">이 척도는 청소년들이 얼마나 자주 자살생각을 하는지를 측정하기 위한 척도입니다.</td>
							<td><button class="self-check-btn" id="counselBtn2" >검사하기</button></td>
						</tr>
						<tr>
							<td value="SC003">사건충격척도</td>
							<td class="table-content-left">이 척도는 스트레스를 주는 사건을 경험한 후 사람들이 겪는 어려움에 관한 것입니다.</td>
							<td><button class="self-check-btn" id="counselBtn3" >검사하기</button></td>
						</tr>
						<tr>
							<td value="SC004">강박증 척도</td>
							<td class="table-content-left">이 척도는 청소년부터 청장년층의 강박증 정도를 알아보기 위한 자가검진 척도입니다.</td>
							<td><button class="self-check-btn" id="counselBtn4" >검사하기</button></td>
						</tr>
						<tr>
							<td value="SC005">성인 상태 불안 척도</td>
							<td class="table-content-left">이 척도는 성인의 불안 상태를 측정하는 도구로, 특수한 상황을 바로 그 순간에
							어떻게 느끼는가를 묻는 20개 문항으로 구성되어 있습니다.</td>
							<td><button class="self-check-btn" id="counselBtn5" style="top:0.3em" >검사하기</button></td>
						</tr>
						<tr>
							<td value="SC006">자살생각 척도</td>
							<td class="table-content-left">이 척도는 자살과 관련되는 생각과 행동을 측정하기 위한 척도입니다.
							각 문항들은 귀하가 일상생활에서 경험할 수 있는 내용들로 구성되어 있습니다.</td>
							<td><button class="self-check-btn" id="counselBtn6" style="top:0.2em" >검사하기</button></td>
						</tr>
						<tr>
							<td value="SC007">사고지각민감상태 검사</td>
							<td class="table-content-left">이 척도는 조기정신병 상태 또는 고위험군을 선별하기 위한 척도입니다.
							각 문항을 잘 읽으시고 지난 4주 동안 자신에게 해당되는 부분에 체크해 주시기 바랍니다.</td>
							<td><button class="self-check-btn" id="counselBtn6" style="top:0.2em" >검사하기</button></td>
						</tr>
						<tr>
							<td value="SC008">지각된 스트레스 척도</td>
							<td class="table-content-left">이 척도는 일상생활에서 주관적으로 느끼는 스트레스의 정도를 평가하기 위한 척도입니다.
							각 문항들을 잘 읽고 지난 1개월 동안 문항에 해당하는 내용을 얼마나 자주 느꼈는지 체크해 주십시오.</td>
							<td><button class="self-check-btn" id="counselBtn6" style="top:0.2em" >검사하기</button></td>
						</tr>
						<tr>
							<td value="SC009">한국어판 위험음주자 선별도구</td>
							<td class="table-content-left">각 문항을 잘 잃고 지난 1년간 자신의 모습에 해당하는 대답에 체크해 주시기 바랍니다.</td>
							<td><button class="self-check-btn" id="counselBtn6" style="top:0.2em" >검사하기</button></td>
						</tr>
						<tr>
							<td value="SC010">한국판 역학연구센터 우울척도</td>
							<td class="table-content-left">이 척도는 일상생활에서 주관적으로 느끼는 우울의 정도를 평가하기 위한 척도입니다.
							각 문항들은 지난 1주일 동안의 당신의 상태에 대한 질문입니다.</td>
							<td><button class="self-check-btn" id="counselBtn6" style="top:0.2em" >검사하기</button></td>
						</tr>
						<tr>
							<td value="SC011">한국판 일반정신건강 척도</td>
							<td class="table-content-left">이 척도는 당신이 정신건강 상의 어려움을 가지고 있는지를 평가하는 척도입니다.
							각 문항은 당신의 육체적, 정신적 상태를 포함한 일반적인 건강상태에 관한 질문입니다.</td>
							<td><button class="self-check-btn" id="counselBtn6" style="top:0.2em" >검사하기</button></td>
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
		initTable();
	})

   $(".self-check-btn").on("click", function(){
	   var clickBtn = $(this);
	   var tr = clickBtn.parent().parent();
	   var tdId = tr.children().eq(0).attr('value');
	   startCheck(tdId);

	   });

   function startCheck(tdId)
   {
	   location.href="${pageContext.request.contextPath}/counsel/selfCheckDetail?tdId="+tdId;
   }

    // 테이블 초기 설정
    function initTable()
    {
    	$("#selfCheck").dataTable({
    		// 표시 건수기능 숨기기
    	    lengthChange: false,
    	    // 검색 기능 숨기기
    	    searching: false,
    	    // 정렬 기능 숨기기
    	    ordering: false,
    	    // 정보 표시 숨기기
    	    info: false,
    	    // 페이징 기능 숨기기
    	    paging: false,
	    	//scrollY: 1000,
	        scrollCollapse: true,
    	     // 표시 건수를 10건 단위로 설정
   			//lengthMenu: [ 10, 20, 30, 40, 50 ],
 			// 페이지 당 건수 설정
 			//pageLength:10
		    // 기본 표시 건수를 10건으로 설정
		    //displayLength: 10

		     // 현재 상태를 보존
	        //stateSave: true
	        //scrollX: true
    	})
    }


   </script>
</html>
