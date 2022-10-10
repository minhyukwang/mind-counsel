<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/iconic/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css?20190817">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/note.css?20190817">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myInfo.css?20191116">
		<!--  결제 모듈 Lib -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>
		#sendNote_previous{
				padding-right:4.6em;
				margin-right:0.5em;
		}
		#recNote_previous{
				padding-right:4.6em;
				margin-right:0.5em;
		}
		#recNote_paginate{
				margin-top:-3em;
		}
		#sendNote_paginate{
				margin-top:-3em;
		}
</style>
</head>
<body>
 	<%@include file="/WEB-INF/views/decorator/header.jsp" %>
 	<!-- 쪽지 보내기 -->
	<div class="container-contact100" style="z-index:101; background:#f7d2bd; display:none">
		<div class="wrap-contact100">
			<button class="btn-hide-contact100">
				<i class="zmdi zmdi-close"></i>
			</button>

			<div class="contact100-form-title" style="background-image: url(${pageContext.request.contextPath}/images/bg-02.jpg);">
				<span>message</span>
			</div>

			<form class="contact100-form validate-form" id="form" method="post">
				<div class="wrap-input100 validate-input">
					<input id="reci_mem_name" class="input100" type="text" placeholder="관리자" disabled >
					<input id="reci_mem_id" type="hidden" name="reci_mem_id" placeholder="관리자"  disabled >
					<span class="focus-input100"></span>
					<label class="label-input100" for="name">
						<span class="lnr lnr-user m-b-2"></span>
					</label>
				</div>

				<div class="wrap-input100 validate-input">
			 		<select id="note_type" name="co_type" class="input100" style="height:2.5em" type="select">
						<option value="" selected disabled hidden >쪽지유형[필수]</option>
						<option value="O">온라인상담신청</option>
						<option value="C">답변요청(유료)</option>
						<option value="R">환불요청</option>
					</select>
					<span class="focus-input100"></span>
					<label class="label-input100" for="note_type">
						<span class="lnr lnr-envelope m-b-5"></span>
					</label>
				</div>

				<div class="wrap-input100 validate-input">
			 		<input id="title" class="input100" type="text" name="note_title" style="height:2.5em"  placeholder="title">
					<span class="focus-input100"></span>
					<label class="label-input100 " for="title">
						<span class="lnr lnr-envelope m-b-5"></span>
					</label>
				</div>

				<div class="wrap-input100 validate-input">
					<textarea id="message" class="input100" name="note_contents" placeholder="Your comments..."></textarea>
					<span class="focus-input100"></span>
					<label class="label-input100 rs1" for="message">
						<span class="lnr lnr-bubble"></span>
					</label>
				</div>
				<div class="container-contact100-form-btn">
					<!-- <button class="contact100-form-btn" onclick="javascript:sendNote();">
						보내기
					</button> -->
					<input class="contact100-form-btn" type="button" onclick = "javascript:sendNote();" value="보내기" />
				</div>
			</form>
		</div>
	</div>

	<!--쪽지관리  -->
	<div class="bodyPart">
	    <div class="container">
		  <div class="noteList">
		  	<div class="blog-header">
		    	<h1 class="title-part">쪽지관리</h1>
		    </div>
	      	<hr style= "width:100%"/>
		      <div class="row">
		        <div class="col-md-12 blog-main" style="position:relative; top:-1em;">
		          <div class="blog-post">
					<br>
		          	<div class="table-responsive">
		          	</div>
		          	<!--Tabs  -->
		          		<ul id="tabs-titles" style="font-family: 'Stylish', sans-serif; color:black;position:relative; top:2.2em; font-size:1.1em">
			    		<%-- <c:if test="${login.auth!='A'}">
						<c:if test="${fn:substring(login.auth, 0, 1) != 'M'}"> --%>
						    <li class="current" style="margin-bottom:0.7em;">
						    	#전문가소개
						    </li>
						<%-- </c:if>
						</c:if> --%>
						<!-- default (on page load), first one is currently displayed -->
			    			<li class="" id="reciMsgBox" style="margin-bottom:0.7em;">
						        #받은쪽지함
						 	</li>
						    <li>
						        #보낸쪽지함
						    </li>
						</ul>
						<ul id="tabs-contents">
							<!-- 전문가소개 -->
							<%-- <c:if test="${login.auth!='A'}">
							<c:if test="${fn:substring(login.auth, 0, 1) != 'M'}"> --%>
							<li>
								<div class="" style="border-left:solid 0.8px #dee2e6; padding-left:3em">
									<div class="user_box" id="counselIntro" style="width:80%; position:relative; left:0em; height:50em; height:auto">

									</div>
								</div>
									<div style="position:relative; top:5em;">
										<%@include file="/WEB-INF/views/decorator/footer.jsp" %>
	    							</div>
							</li>
							<%-- </c:if>
							</c:if> --%>
						    <li>
						        <!--받은쪽지함  -->
						        <div class="content" style="border-left:solid 0.8px #dee2e6; padding-left:3em">
								        <table class=table-base id="recNote"
								        style="text-align:center; position:relative; top:-3.5em;" >
									<colgroup>
										<col style="width:10%">
									<c:if test="${login.auth=='A'}">
										<col style="width:20%">
									</c:if>
									<c:if test="${fn:substring(login.auth, 0, 1) == 'M'}">
										<col style="width:20%">
									</c:if>
										<col style="width:*">
										<col style="width:10%">
										<col style="width:13%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row">번호</th>
										<c:if test="${login.auth=='A'}">
											<th scope="row">쪽지유형</th>
										</c:if>
										<c:if test="${fn:substring(login.auth, 0, 1) == 'M'}">
											<th scope="row">쪽지유형</th>
										</c:if>
											<th scope="row" class="table-content-left" >제목</th>
											<th scope="row">보낸사람</th>
											<th scope="row">작성일</th>
										</tr>
										</thead>
										<tbody id = "recNoteListTbody">
										</tbody>
									</table>
						        </div>
						    </li>
						    <li>
							     <!--보낸쪽지함  -->
						        <div class="content" style="border-left:solid 0.8px #dee2e6; padding-left:3em">
						           <table class=table-base id="sendNote"
								        style="text-align:center; position:relative; top:-3.5em;" >
									<colgroup>
										<col style="width:10%">
									<c:if test="${login.auth=='A'}">
										<col style="width:20%">
									</c:if>
									<c:if test="${fn:substring(login.auth, 0, 1) == 'M'}">
										<col style="width:20%">
									</c:if>
										<col style="width:*">
										<col style="width:10%">
										<col style="width:13%">
									</colgroup>
									<thead>
										<tr>
											<th scope="row">번호</th>
										<c:if test="${login.auth=='A'}">
											<th scope="row">쪽지유형</th>
										</c:if>
										<c:if test="${fn:substring(login.auth, 0, 1) == 'M'}">
											<th scope="row">쪽지유형</th>
										</c:if>
											<th scope="row" class="table-content-left" >제목</th>
											<th scope="row">보낸사람</th>
											<th scope="row">작성일</th>
										</tr>
										</thead>
										<tbody id = "sendNoteListTbody">
										</tbody>
									</table>
						        </div>

						    </li>
						</ul>
						</div>
		          </div>
		          <!-- /.blog-post -->
		        </div><!-- /.blog-main -->
		      </div><!-- /.row -->
	    </div><!-- /.container -->
	</div><!-- /.bodyPart -->

</body>
  <script>
  var tabs = $('#tabs-titles li'); //grab tabs
  var contents = $('#tabs-contents li'); //grab contents

  tabs.bind('click',function(){
    contents.hide(); //hide all contents
    tabs.removeClass('current'); //remove 'current' classes
    $(contents[$(this).index()]).show(); //show tab content that matches tab title index
    $(this).addClass('current'); //add current class on clicked tab title
  });

   $(document).ready(function(){
		var mem_name="";
		var mem_id="";
		var co_type="";
		//initTable();
		loadData();

	});

	function sendNote()
	{
		$("#reci_mem_id").removeAttr("disabled");
		if($("#note_type").val()==null){
			return false;
		};

		// 유료상담신청 결제 확인
		if($("#note_type").val()=="C")
		{
			var IMP = window.IMP; // 생략가능
			IMP.init('imp11415877'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

			var con = confirm("전문가에게 유료상담 쪽지를 발송 하시겠습니까? 금액 : 5,000원. 확인시 결제창으로 이동합니다.")
			if(con == true)
			{
				IMP.request_pay({
				    pg : 'inicis', // version 1.1.0부터 지원.
				    pay_method : 'card',
				    merchant_uid : 'merchant_' + new Date().getTime(),
				    name : '유료쪽지상담',
				    amount : 5000,
				    buyer_email : '${login.mem_email}',
				    buyer_name : '${login.mem_id}',
				    buyer_tel : '${login.mem_phone}',
				    buyer_addr : $("#reci_mem_id").val(),
				    m_redirect_url : 'http://www.solcounsel.com/counsel/mngNote'
				}, function(rsp) {
				    if ( rsp.success ) {
				        var msg = '결제가 완료되었습니다.';
				        msg += '고유ID : ' + rsp.imp_uid;
				        msg += '상점 거래ID : ' + rsp.merchant_uid;
				        msg += '결제 금액 : ' + rsp.paid_amount;
				        msg += '카드 승인번호 : ' + rsp.apply_num;
				        successNotePay(rsp);
				        $("#form").submit();
				    } else {
				        var msg = '결제에 실패하였습니다.';
				        msg += '에러내용 : ' + rsp.error_msg;
				        return false;
				    }
				});
			}
			else
			{
				return false;
			}
		}
		else{
			  $("#form").submit();
		}
	}
	function successNotePay(rsp)
	{
		var data = {"pg" : "inicis",
				"pay_method" : "card",
				"imp_uid" : rsp.imp_uid,
				"merchant_uid" : rsp.merchant_uid,
				"paid_amount" :  rsp.paid_amount,
				"apply_num" : rsp.apply_num,
				"verif_comp_yn" : "N",
				"manager_id" : $("#reci_mem_id").val()};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/counsel/writeSuccessNotePay",
			success: function(result){
			}
	})
	}
    // 테이블 초기 설정
    function initTable(table)
    {
		//var tableList=["recNote","sendNote"];
		//tableList.forEach(function(table){
	    	$("#"+table).dataTable({
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
	 			pageLength:10
			    // 기본 표시 건수를 10건으로 설정
			    //displayLength: 10
			    // 현재 상태를 보존
		        //stateSave: true
		        //scrollX: true
    		});
		//})

    }

	function sendNoteForm(counselerId, counselerName){
		$("#reci_mem_name").val(counselerName);
		$("#reci_mem_id").val(counselerId);
		$('.container-contact100').fadeIn(300);
		$('.noteList').fadeOut(100);
	}

	function loadData() {
		// 전문가 목록 호출
		var consHtmls="";
		var mem_pic="";
		$.ajax({
				type: "post",
				url:"${pageContext.request.contextPath}/member/getCounselerList",
				success: function(result){
					if( result.length < 1)
					{

					}
					else
					{
						$.each(result, function( index, result ){
							if (result.mem_pic =='')
								mem_pic = "default_user.png";
							else
								mem_pic = "display?imageName="+result.mem_pic;
							if (index != 0)
								consHtmls += '<hr>';
							consHtmls += '<div class="row" style="margin-bottom:3em; margin-left:10em; margin-right:10em; margin-top:2em">'
							consHtmls += '<div class="_user_image" style="position:relative; left:18em">';
							consHtmls += '<img id="user_img" src="${pageContext.request.contextPath}/images/'+mem_pic+'" />';
							consHtmls += '</div>';
							consHtmls += '</div>';
							consHtmls += '<div class="col-lg-12" style="position:relative; left:5em">';
							consHtmls += '<div class="tm-intro-text-container" style="width:120%; margin-bottom:2em">';
							consHtmls += '<h6 class="tm-text-primary mb-4 tm-section-title" style="position:relative; left:7.5em; font-size:2em" >'+result.mem_name+'</h6>';
							//consHtmls += '<p style="font-size:1.3em; margin-bottom:0.5em">Introduce</p>'
							consHtmls += '<div class="mb-4 tm-intro-text" style="font-size:1em;width:35em; white-space: pre-line;word-break:break-all;">'+result.mem_intro+'</div>';
							consHtmls += '<div class="tm-next" style="width:12em; ">';
							consHtmls += '<a onclick=javascript:sendNoteForm("'+result.mem_id+'","'+result.mem_name+'") style="position:relative; left:10.5em;" class="tm-intro-text tm-btn-primary">쪽지보내기</a>';
							consHtmls += '</div>';
							consHtmls += '</div>';
							consHtmls += '</div>';
						})
					}
					$("#counselIntro").html(consHtmls);
				}

		})
		// 쪽지 목록 호출
		var tableBodyList=["recNoteListTbody","sendNoteListTbody"];
		tableBodyList.forEach(function(tableBody){
			var htmls = "";
			$.ajax({
				type: "post",
				data: { mem_id:"${login.mem_id}",flag:tableBody},
				url:"${pageContext.request.contextPath}/counsel/getSendNoteList",
				success: function(result){
					if( result.length < 1)
					{
						if(tableBody == "recNoteListTbody")
						{
							initTable("recNote");
						}
						else
						{
							initTable("sendNote");
						}
					}
					else
					{
						$.each(result, function( index, result ){
							htmls += '<tr><td>';
							htmls += result.note_seq;
							if("${login.auth}"=='A' || "${fn:substring(login.auth, 0, 1)}" == 'M')
							{
								if(result.co_type=='O')
								{
									htmls += '</td><td>';
									htmls += "온라인상담신청";
								}
								else if(result.co_type=='C')
								{
									htmls += '</td><td>';
									htmls += "유료답변요청";
								}
								else
								{
									htmls += '</td><td>';
									htmls += "환불요청";
								}
							}
							if(result.send_mem_id != '${login.mem_id}' && result.confirm_yn=='N')
							{
							htmls += '</td><td class="table-content-left"><a class="a-base" style="font-weight:bold"onclick="javascript:noteContents(';
							}
							else
							{
							htmls += '</td><td class="table-content-left"><a class="a-base" onclick="javascript:noteContents(';
							}
							htmls += result.note_seq+",'"+result.send_mem_id+"','"+result.mem_nick+"','"+result.co_type+"','"+tableBody+"')";
							htmls += ';">';
							htmls += result.note_title;
							htmls += '</a></td><td>';
							htmls += result.mem_nick;
							htmls += '</td><td>';
							htmls += result.created_timestamp.substr(0,10);
							htmls += '</td></tr>';
						}
						)
						$('#'+tableBody).html(htmls);
						if(tableBody == "recNoteListTbody")
						{
							initTable("recNote");
						}
						else
						{
							initTable("sendNote");
						}
					}
				}
			});
		});
	}

	// 쪽지 내용 보기 이벤트
	function noteContents(note_seq,mem_id,mem_nick, co_type, flag)
	{
		document.location.href = "${pageContext.request.contextPath}/counsel/noteContents?note_seq="
				+ note_seq+"&mem_id="+ mem_id+"&mem_name="+ mem_nick+"&co_type="+ co_type+"&flag="+ flag;
	}
   </script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
</html>
