<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<style>
		#issueBoard_previous{
				padding-right:4.6em;
				margin-right:0.5em;
		}
	</style>
  </head>

  <body>
 	 <%@include file="/WEB-INF/views/decorator/header.jsp" %>
	<div class="bodyPart">
    <div class="container">

      <div class="blog-header">
        <h1 class="title-part">이슈 게시판</h1>
      </div>
      <hr style="width:100%"/>
      <div class="row">

        <div class="col-md-12 blog-main">

          <div class="blog-post" style="position:relative; top:-2.5em">
	          <!-- <div class="blog-intro">
	          	여기는 멘탈 이슈 게시판입니다.<br>
	          	관리자가 매일 멘탈 이슈에 대한 내용을 올려드립니다.<br>
	          </div> -->
	          <br>

				<br>
          	<div class="table-responsive">

            	<table class=table-base style="text-align:center;" id="issueBoard">
					<colgroup>
						<col style="width:10%">
						<col style="width:*">
						<col style="width:10%">
						<col style="width:13%">
					</colgroup>
					<thead>
						<tr>
							<th scope="row">말머리</th>
							<th scope="row">제목</th>
							<th scope="row">작성자</th>
							<th scope="row">작성일</th>
						</tr>
						</thead>
						<tbody id = "issueMainTbody">
						</tbody>
					</table>
				</div>
       <div class="blog-bottom-cif" style="text-align:right">
	          <br>
				<c:if test="${fn:substring(login.auth, 0, 1) == 'M' or login.auth eq 'A'}">
    				<button class="btn_edit_submit" style="background-color: #fbbc05; font-weight:550; float:left; position:relative; top:-4.8em; left:0em;"id="writeIssueBoard" onclick="location='${pageContext.request.contextPath}/board/writeIssue'">글작성</button>
				</c:if>
				</div>
          </div>
          <!-- /.blog-post -->
        </div><!-- /.blog-main -->


      </div><!-- /.row -->

    </div><!-- /.container -->

</div><!-- /.bodyPart -->
  </body>
  <script>
    /* var base_url = "<c:out value="${pageContext.request.contextPath}" />"; */
   $(document).ready(function(){
		//$("#issueBoard").DataTable();
		loadData();
		//initTable();
	});

    // 테이블 초기 설정
    function initTable()
    {
    	$("#issueBoard").dataTable({
    	 	// 표시 건수기능 숨기기
    	    lengthChange: false,
    	    // 검색 기능 숨기기
    	    searching: false,
    	    // 정렬 기능 숨기기
    	    ordering: false,
    	    // 정보 표시 숨기기
    	    info: false,
    	    // 페이징 기능 숨기기
    	    paging: true,
	    	//scrollY: 1000,
	        scrollCollapse: true,
    	     // 표시 건수를 10건 단위로 설정
   			//lengthMenu: [ 10, 20, 30, 40, 50 ],
 			// 페이지 당 건수 설정
 			pageLength:10,
		    // 기본 표시 건수를 10건으로 설정
		    displayLength: 10,
 
		     // 현재 상태를 보존
	        //stateSave: true
	        //scrollX: true
	       /*  pageLength: 10,
                pagingType : "full_numbers",
                bPaginate: true,
                bLengthChange: true,
                lengthMenu : [ [ 1, 3, 5, 10, -1 ], [ 1, 3, 5, 10, "All" ] ],
                responsive: true,
                bAutoWidth: false,
                processing: true,
                ordering: true,
                bServerSide: true,
                searching: false,
		    sAjaxSource : "${pageContext.request.contextPath}/board/getIssueList",
            sServerMethod: "POST",
            columns : [
                {data: "issue_board_seq"},
                {data: "title"},
                {data: "mem_nick"},
                {data: "created_timestamp"}
            ],
            columnDefs : [
                {
                    "targets": [0,1,2,3],
                    "visible": true,
                }
            ] */
    	})
    }
	// 이슈게시판 입장 및 새로고침 시 게시글 목록 호출
	function loadData() {
		var htmls = "";
		$.ajax({
			type: "post",
			url:"${pageContext.request.contextPath}/board/getIssueList",
			success: function(result){
				if( result.length < 1)
				{
					initTable();
				}
				else
				{
					$.each(result, function( index, result ){
						htmls += '<tr><td>';
						htmls += result.issue_board_seq;
						htmls += '</td><td  class="table-content-left"><a class="a-base" onclick="javascript:issueContens(';
						htmls += result.issue_board_seq;
						htmls += ');">';
						htmls += result.title;
						htmls += '</a></td><td>';
						htmls += result.mem_nick;
						htmls += '</td><td>';
						htmls += result.created_timestamp.substr(0,10);
						htmls += '</td></tr>';
					}
					)
					$('#issueMainTbody').html(htmls);
					initTable();
				}

			}
		})

	} 

	// 이슈게시판 내용 보기 이벤트
	function issueContens(seq)
	{
		document.location.href = "${pageContext.request.contextPath}/board/issueBoardContents?issue_board_seq=" + seq;
	}


   </script>
</html>
