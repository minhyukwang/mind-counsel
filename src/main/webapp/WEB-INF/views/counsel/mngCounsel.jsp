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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
	<!--  결제 모듈 Lib -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/check.js"></script>
  <style>
  #counselTb_previous{
  				padding-right:4.6em;
				margin-right:0.5em;
  }
  </style>

  </head>
  <body>
 	<%@include file="/WEB-INF/views/decorator/header.jsp" %>
 	<div class="container-contact100" style="z-index:2; background:#f7d2bd; display:none">
			<div class="wrap-contact100">
				<button class="btn-hide-contact100">
					<i class="zmdi zmdi-close"></i>
				</button>

				<div class="contact100-form-title" style="background-image: url(${pageContext.request.contextPath}/images/bg-02.jpg);">
					<span id="consRegTitle"></span>
				</div>

				<form class="contact100-form validate-form" id="form" method="post" onsubmit="return check();">
					<input type="hidden" id="cons_seq" name ='cons_seq'>
					<input type="hidden" id="cons_reg_yn" name="cons_reg_yn">
					<input type="hidden" id="cons_timestamp" name="cons_timestamp">

					<div class="wrap-input100 validate-input">
				 		<input id="mem_id" class="input100" type="text" name="mem_id" style="height:2.5em" disabled>
						<span class="focus-input100"></span>
						<label class="label-input100 " for="mem_id">
							<span class="lnr lnr-pointer-right"></span>
						</label>
					</div>

					<div class="wrap-input100 validate-input">
				 		<input id="mem_name" class="input100" type="text" name="mem_name" style="height:2.5em"  disabled>
						<span class="focus-input100"></span>
						<label class="label-input100 " for="mem_name">
							<span class="lnr lnr-pointer-right"></span>
						</label>
					</div>
					<div class="wrap-input100 validate-input" id="consRegDiv">
					</div>
					<div class="container-contact100-form-btn">

						<button class="contact100-form-btn">
							등록
						</button>
					</div>
				</form>
			</div>
		</div>
	<div class="bodyPart">


    <div class="container">
	  <div class="counselList">
      <div class="blog-header">
      <h1 class="title-part">상담관리</h1>
      </div>
      <hr style= width:100%"/>
      <div class="row">
        <div class="col-md-12 blog-main">
          <div class="blog-post">
			<br>
          	<div class="table-responsive">
            	<table class=table-base style="text-align:center;" id="counselTb">
					<colgroup>
						<c:if test="${login.auth=='A'}">
							<col style="width:6%">
							<col style="width:11%">
							<col style="width:9%">
							<col style="width:9%">
							<col style="width:9%">
							<col style="width:10%">
							<col style="width:8.5%">
							<col style="width:8.5%">
							<col style="width:8.5%">
							<col style="width:8.5%">
							<col style="width:6%">
							<col style="width:6%">
						</c:if>
						<c:if test="${fn:substring(login.auth, 0, 1) == 'M'}">
							<col style="width:6%">
							<col style="width:11%">
							<col style="width:9%">
							<col style="width:9%">
							<col style="width:9%">
							<col style="width:10%">
							<col style="width:8.5%">
							<col style="width:8.5%">
							<col style="width:8.5%">
							<col style="width:8.5%">
							<col style="width:6%">
							<col style="width:6%">
						</c:if>
						<c:if test="${login.auth=='G'}">
							<col style="width:11%">
							<col style="width:12%">
							<%-- <col style="width:12%"> --%>
							<col style="width:12%">
							<col style="width:20%">
							<col style="width:10%">
							<col style="width:12%">
							<col style="width:10">
						</c:if>
					</colgroup>
					<thead>
						<tr>
						<c:if test="${login.auth=='A'}">
							<th scope="row">번호</th>
							<th scope="row">진행상태</th>
							<th scope="row">상담사ID</th>
							<th scope="row">회원ID</th>
							<th scope="row">회원이름</th>
							<th scope="row">회원닉네임</th>
							<th scope="row">상담코스</th>
							<th scope="row">상담차수</th>
							<th scope="row">상담일시</th>
							<th scope="row">상담시작</th>
							<th scope="row">결제</th>
							<th scope="row">환불</th>
						</c:if>
						<c:if test="${fn:substring(login.auth, 0, 1) == 'M'}">
							<th scope="row">번호</th>
							<th scope="row">진행상태</th>
							<th scope="row">상담사ID</th>
							<th scope="row">회원ID</th>
							<th scope="row">회원이름</th>
							<th scope="row">회원닉네임</th>
							<th scope="row">상담코스</th>
							<th scope="row">상담차수</th>
							<th scope="row">상담일시</th>
							<th scope="row">상담시작</th>
							<th scope="row">결제여부</th>
							<th scope="row">환불</th>
						</c:if>
						<c:if test="${login.auth=='G'}">
							<th scope="row">번호</th>
							<th scope="row">진행상태</th>
							<th scope="row">상담사ID</th>
							<th scope="row">상담코스</th>
							<th scope="row">상담차수</th>
							<th scope="row">상담일시</th>
							<th scope="row">상담시작</th>
							<th scope="row">결제하기</th>
						</c:if>
						</tr>
						</thead>
						<tbody id = "counselListTbody">
						</tbody>
					</table>
					<!-- <div style="margin-top:-1.7em"></div> -->
					<!-- <button class="btn-show-contact100" id="regBtn" style="position:relative; top:-2em">상담 등록하기</button> -->

				</div>
          </div>
          <!-- /.blog-post -->
        </div><!-- /.blog-main -->
      </div><!-- /.row -->
      </div>
    </div><!-- /.container -->
	</div><!-- /.bodyPart -->
<input type="hidden" id="tutorUserId"/>
<input type="hidden" id="chatSeq"/>
<input type="hidden" id="mem_nick"/>
<input type="hidden" id="mem_pic"/>
<input type="hidden" id="counseler_pic"/>
<input type="hidden" id="counseler_nick"/>
<input type="hidden" id="cons_comp_yn"/>
<%@include file="/WEB-INF/views/decorator/footer.jsp" %>
</body>
  <script>
  var cons_course_id = [];
  var cons_course_nm = [];
  $(document).ready(function(){
		loadCounselCourseList();
		loadCounselList();
		//initTable();
		$("#regBtn").click(function(){
		//	document.location.href = "${pageContext.request.contextPath}/counsel/regCounsel";
		});
		$("#form").submit(function(event){
			$("#mem_id").removeAttr("disabled");
			$("#mem_name").removeAttr("disabled");
		})
	});
   function check(){
		if($("#consTime").length)
		{
			var timestamp = $("#consDate").val()+" "+$("#consTime").val().substring(0,2)+":"+$("#consTime").val().substring(2,4);
			var check = $("#consTime").val().substring(0,2)+":"+$("#consTime").val().substring(2,4);
			$("#cons_timestamp").val(timestamp);
			if(!timeCheck(check))
			{
				alert("시간타입을맞춰주세요");
				return false;
			}
		}
		if($("#consDate").val() == "")
		{
			alert("날짜를 입력하십시오.")
			return false;
		}

	   if($("#consCourseId").length){
		   if($("#consCourseId").val() ==null){
	           return false;
	       }
	   }
   }

    // 테이블 초기 설정
    function initTable()
    {
    	$("#counselTb").dataTable({
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
		    displayLength: 10
		    // 현재 상태를 보존
	        //stateSave: true
	        //scrollX: true
    	})
    }
	// DB에서 데이터 List 호출
	function loadCounselList() {
		// 상담관리 목록 호출
		var htmls = "";
		var data={"auth":"${login.auth}", "mem_id":"${login.mem_id}"};
		$.ajax({
			type: "post",
			data: data,
			url:"${pageContext.request.contextPath}/counsel/getCounselList",
			success: function(result){
				if( result.length < 1)
				{
					initTable();
				}
				else
				{
					$.each(result, function( index, result ){
						if("${login.auth}"=='A' || "${fn:substring(login.auth, 0, 1)}" == 'M')
						{
							if(result.cons_reg_yn=='Y')
							{
								htmls += '<tr><td>';
								htmls += result.cons_seq;
								htmls += '</td><td>';
								if(result.cons_comp_yn=='Y')
								{
									htmls += '상담완료';
								}
								else
								{
									htmls += '<a onclick=javascript:completeCounsel("';
									htmls += result.cons_seq
									htmls += '"); >상담등록완료</a>';
								}
								htmls += '</td><td>';
								htmls += result.created_id;
								htmls += '</td><td>';
								htmls += result.mem_id;
								htmls += '</td><td>';
								htmls += result.mem_name;
								htmls += '</td><td>';
								htmls += result.mem_nick;
								htmls += '</td><td>';
								htmls += result.cons_course_nm;
								htmls += '</td><td>';
								htmls += result.cons_num;
								htmls += '</td><td>';
								if(result.cons_timestamp!=null)
									htmls += result.cons_timestamp.substr(0,16);
								else
								{
									htmls += '<a onclick=javascript:regCounselDate("';
									htmls += result.cons_seq+'","'+result.mem_id+'","'+result.mem_name
									htmls += '"); >일정등록</a>';
								}
								htmls += '</td><td>';
								//if(result.cons_comp_yn == 'N'&&result.timeGap !=null && result.timeGap > 10 && result.pay_yn =='Y' && result.refund_yn != 'Y')
								//{
									htmls += '<a onclick=javascript:startChat("';
									htmls += result.mem_id+'","'+result.mem_nick+'","'+result.mem_pic+'","'+result.cons_seq+'","'+null+'","'+result.cons_comp_yn;
									htmls += '");>시작하기</a>';

								/*} else if(result.cons_comp_yn == 'Y')
								{
									htmls += '<a onclick=javascript:startChat("';
									htmls += result.mem_id+'","'+result.mem_nick+'","'+result.mem_pic+'","'+result.cons_seq+'","'+null+'","'+result.cons_comp_yn;
									htmls += '");>내역보기</a>';
								} */
								htmls += '</td><td>' ;
								if(result.pay_yn =='Y' && result.refund_yn != 'Y')
									htmls += '완료';
								htmls += '</td><td>';
								if(result.pay_yn == 'Y' && result.cons_comp_yn == 'N')
								{
									htmls += '<a onclick=javascript:refundCounsel("';
									htmls += result.cons_pay_seq;
									htmls += '");>Click</a>';
								}else if(result.pay_yn == 'Y' && result.cons_comp_yn == 'Y' && result.refund_yn == 'Y')
									htmls += '완료';
								htmls += '</td></tr>';
							}else
							{
								htmls += '<tr><td>';
								htmls += result.cons_seq;
								htmls += '</td><td>';
								htmls += '<a onclick=javascript:regCounsel("';
								htmls += result.cons_seq+'","'+result.mem_id+'","'+result.mem_name+'","'+result.cons_reg_yn
								htmls += '"); >대기중</a>';
								htmls += '</td><td>';
								htmls += result.created_id;
								htmls += '</td><td>';
								htmls += result.mem_id;
								htmls += '</td><td>';
								htmls += result.mem_name;
								htmls += '</td><td>';
								htmls += result.mem_nick;
								htmls += '</td><td>';
								htmls += '</td><td>';
								htmls += '</td><td>';
								htmls += '</td><td>';
								htmls += '</td><td>';
//								htmls += result.pay_yn;
								htmls += '</td><td>';
//								htmls += result.refund_yn;
								htmls += '</td></tr>';
							}
						}else
						{
							if(result.cons_reg_yn=='Y')
							{
								htmls += '<tr><td>';
								htmls += result.cons_seq;
								htmls += '</td><td>';
								if(result.cons_comp_yn=='Y')
								{
									htmls += '상담완료';
								}
								else
								{
									htmls += '상담등록완료';
								}
								htmls += '</td><td>';
								htmls += result.created_id;
								htmls += '</td><td>';
								htmls += result.cons_course_nm;
								htmls += '</td><td>';
								htmls += result.cons_num;
								htmls += '</td><td>';
								if(result.cons_timestamp !=null)
									htmls += result.cons_timestamp.substr(0,16);
								else
									htmls += "상담대기중"
								htmls += '</td><td>';
								//if(result.cons_comp_yn == 'N'&&result.timeGap !=null && result.timeGap > 10 && result.pay_yn =='Y' && result.refund_yn != 'Y')
								//{
									htmls += '<a onclick=javascript:startChat("';
									htmls += result.created_id+'","'+result.mem_nick+'","'+result.mem_pic+'","'+result.cons_seq+'","'+result.created_id+'","'+result.cons_comp_yn;
									htmls += '");>시작하기</a>';
								/*}else if(result.cons_comp_yn == 'Y')
								{
									htmls += '<a onclick=javascript:startChat("';
									htmls += result.created_id+'","'+result.mem_nick+'","'+result.mem_pic+'","'+result.cons_seq+'","'+result.created_id+'","'+result.cons_comp_yn;
									htmls += '");>내역보기</a>';
								}*/
								htmls += '</td><td>';
								if(result.pay_yn =='N')
								{
									htmls += '<a onclick=javascript:payCounsel(';
									htmls += result.cons_pay_seq;
									htmls += ');>Click</a>';
								}
								else
								{
									htmls += "결제완료"
									htmls += '</td></tr>';
								}
							}else
							{
								htmls += '<tr><td>';
								htmls += result.cons_seq;
								htmls += '</td><td>';
								htmls += result.created_id;
								htmls += '</td><td>';
								htmls += '대기중';
								htmls += '</td><td>';
								htmls += '</td><td>';
								htmls += '</td><td>';
								htmls += '</td><td>';
								htmls += '</td><td>';
								htmls += '</td><td>';
								htmls += '</td></tr>';
							}
						}
					})
					$('#counselListTbody').html(htmls);
					initTable();
				}
			}
		})
	}

	function payCounsel(cons_pay_seq)
	{
		{
			var data = {"cons_pay_seq" : cons_pay_seq};
			$.ajax({
				type: "post",
				data:data,
				dataType:"json",
				url:"${pageContext.request.contextPath}/counsel/getCounselPayInfo",
				success: function(result){
					var con = confirm("결제 금액 : " + result.paid_amount + "원. 확인시 결제창으로 이동합니다.");
					if(con == true)
					{
						var IMP = window.IMP; // 생략가능
						IMP.init('imp11415877'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

						IMP.request_pay({
						    pg : 'inicis', // version 1.1.0부터 지원.
						    pay_method : 'card',
						    merchant_uid : 'merchant_' + new Date().getTime(),
						    name : '온라인상담',
						    amount : result.paid_amount,
						    buyer_email : '${login.mem_email}',
						    buyer_name : '${login.mem_id}',
						    buyer_tel : '${login.mem_phone}',
						    buyer_addr : result.manager_id,
						    //buyer_postcode : '123-456',
						    m_redirect_url : 'http://www.solcounsel.com/counsel/mngCounsel'
						}, function(rsp) {
						    if ( rsp.success ) {
						        var msg = '결제가 완료되었습니다.';
						        msg += '고유ID : ' + rsp.imp_uid;
						        msg += '상점 거래ID : ' + rsp.merchant_uid;
						        msg += '결제 금액 : ' + rsp.paid_amount;
						        msg += '카드 승인번호 : ' + rsp.apply_num;

						        updateCounselPayInfo(result.pay_seq, rsp);
						    } else {
						        var msg = '결제에 실패하였습니다.';
						        msg += '에러내용 : ' + rsp.error_msg;
						        return false;
						    }
						    alert(msg);
						});
					}
				}
				})
		}
	}

	function refundCounsel(cons_pay_seq)
	{
		var data = {"cons_pay_seq" : cons_pay_seq};
		var con = confirm("환불 처리 하시겠습니까? 확인 시 환불처리 됩니다.");
		if(con == true)
		{
			$.ajax({
				type: "post",
				data:data,
				dataType:"json",
				url:"${pageContext.request.contextPath}/counsel/refundCounsel",
				success: function(result){
					if( result.code == 0 )
					{
						alert("정상적으로 환불처리 되었습니다.");
						return;
					}
					else if (result.code == 1 )
					{
						alert("이미 상담이 진행되어 환불처리가 되지 않습니다.");
						return;
					}
					else if (result.code == 2 )
					{
						alert("결제 정보에 문제가 있습니다. 관리자에게 문의하세요.");
						return;
					}
					else
					{
						alert("환불 중 에러가 발생하였습니다. 에러코드 : " + result.code);
					}
				}
			})
		}
	}

	function refundCounselAction(result)
	{
		alert(result);
	}


	function updateCounselPayInfo(pay_seq, rsp)
	{
		var data = {"pay_seq" : pay_seq,
				"pg" : "inicis",
				"pay_method" : "card",
				"imp_uid" : rsp.imp_uid,
				"merchant_uid" : rsp.merchant_uid,
				"apply_num" : rsp.apply_num
				};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/counsel/updateSuccessCounselPay",
			success: function(result){
				//alert("DB 저장성공");
			}
	})
	}

	/* 상담완료처리 */
	function completeCounsel(cons_seq){
		if(confirm("상담완료처리합니다."))
		{
			var data = {"cons_seq":cons_seq};
			$.ajax({
				type: "post",
				data:data,
				dataType : "text",
				url: "${pageContext.request.contextPath}/counsel/completeCounsel",
				success: function(result){
					location.reload();
				}
	    	});
		}else
			return false;
	}
	/* 상담코스 목록 호출 */
	function loadCounselCourseList() {
		$.ajax({
			type: "post",
			url:"${pageContext.request.contextPath}/counsel/getCourseList",
			success: function(result){
				if( result.length < 1)
				{

				}
				else
				{
					$.each(result, function( index, result ){
						cons_course_id[index] = result.cons_course_id;
						cons_course_nm[index] = result.cons_course_nm;
					})
				}
			}
		})
	}

	/*상담일정등록 Form*/
	function regCounselDate(cons_seq, mem_id, mem_name, cons_reg_yn){
		$("#consRegTitle").html("상담일정등록");
		var htmls="";
		if(!$("#consDateRegDiv").length)
		{
			$("#consRegDiv").after('<div class="wrap-input100 validate-input" id="consDateRegDiv"></div>');
			$("#consDateRegDiv").html("<input class='input100' id='consTime' type='text' style='height:2.5em' placeholder='시간입력(4자리)'>");
		}
		htmls += "<input class='input100' id= 'consDate' type='text' style='height:2.5em' placeholder='일정선택'>";

		$("#consRegDiv").html(htmls);
		$("#cons_seq").val(cons_seq);
        $("#mem_id").val(mem_id);
        $("#mem_name").val(mem_name);
        $("#consDate").datepicker({ dateFormat: 'yy-mm-dd' });
		$('.container-contact100').fadeIn(300);
        $('.counselList').fadeOut(100);
	}

	/*상담등록 Form*/
	function regCounsel(cons_seq, mem_id, mem_name, cons_reg_yn){
		$("#consRegTitle").html("상담등록");
		if($("#consDateRegDiv").length)
		{
			$("#consDateRegDiv").remove();
		}
		var htmls = '<select id="consCourseId" name="cons_course_id" class="input100" style="height:2.5em" type="select"></select>';
		htmls += '<span class="focus-input100" id="cons_comp_yn_span"></span>';
		htmls += '<label class="label-input100 " for="cons_comp_yn">';
		htmls += '</label>';
		var htmls2='';
		htmls2 = "<option value='' selected disabled hidden >상담코스[필수]</option>";
		for(var i=0; i<cons_course_id.length ; i++)
		{
			htmls2 += "<option value='"+cons_course_id[i]+"'>"+cons_course_nm[i]+"</option>";
		}
		$("#consRegDiv").html(htmls);
		$("#consCourseId").html(htmls2);

		$("#cons_reg_yn").val(cons_reg_yn)
		$("#cons_seq").val(cons_seq);
        $("#mem_id").val(mem_id);
        $("#mem_name").val(mem_name);
		$('.container-contact100').fadeIn(300);
        $('.counselList').fadeOut(100);
	}
	function updateCounsel(cons_seq, mem_id, mem_name, cons_course_id,cons_course_nm, cons_num){
//        $("#cons_course_id").val(cons_course_id);
		$("#cons_seq").val(cons_seq);
		$("#mem_id").val(mem_id);
        $("#mem_name").val(mem_name);
        $("#cons_course_nm").val(cons_course_nm);
        $("#cons_num").val(cons_num);
        $('.container-contact100').fadeIn(300);
        $('.counselList').fadeOut(100);
	}
	function startChat(memId, memNick, memPic, consSeq, counselerId, cons_comp_yn){
		if(cons_comp_yn == 'Y')
		{
			$("#cons_comp_yn").val(cons_comp_yn);
		}else{
			$("#cons_comp_yn").val("");
		}
		/*Counseler정보 가져오기*/
		var data = {"mem_id":counselerId};
		if (counselerId !=null)
		{
			$.ajax({
				type: "post",
				data:data,
				dataType : "json",
				url: "${pageContext.request.contextPath}/member/getMember",
				success: function(result){
					$("#counseler_nick").val(result.mem_nick);
					$("#counseler_pic").val(result.mem_pic);
				}
			});
		}

		/*채팅방이 없으면 생성, 있으면 불러오는 Logic*/
		$("#mem_nick").val(memNick);
		$("#mem_pic").val(memPic);
		$("#tutorUserId").val(memId);
		var chatSeq=0;
		var data2 = {"cons_seq":consSeq};
		$.ajax({
			type: "post",
			data:data2,
			dataType : "text",
			url: "${pageContext.request.contextPath}/counsel/getChatSeq",
			success: function(result){
				chatSeq=result;
				$("#chatSeq").val(chatSeq);
				var user_id='${login.mem_id}';
				var data3 = {"created_id":user_id, "chat_topic":memId, "chat_seq":chatSeq, "cons_seq":consSeq };
				$.ajax({
					type: "post",
					data:data3,
					dataType : "text",
					url: "${pageContext.request.contextPath}/counsel/regChatRoom",
					success: function(result2){
						$("#chatSeq").val(result2);
					}
		    	});
			var option = 'width=391,height=530,scrollbars=no,resizable=no,status=yes,menubar=no,toolbar=no,top=50,left=300';
			window.open("${pageContext.request.contextPath}/counsel/chat", "a", option);
			}
    	});
	}
   </script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
	<script async src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
</html>