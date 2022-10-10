<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<!-- jQuery CDN-->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/chat.css?20190816">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/template-style2.css?20190816">

</head>
<body >
 <div class="chat-container">
    <div class="chat-header">
      <div class="fixed_title" style="border:0px"><span id="user_pic" class="user_info" style="width:40px; height:40px">
      </span> <span id="user_nick" style="position:relative; left:2px; top:5px; font-size:1em"></span></div>
    </div>

    <div class="chatbox">
<!--       <div class="friend-bubble bubble">
     	안녕하세요?
      </div> -->
    </div>

    <div class="text-box">
      <textarea id="message" placeholder="대화내용이 들어갑니다." autofocus></textarea>
      <button id="sendBtn">전송</button>
      <div class="clearfix"></div>
    </div>
  </div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/sockjs.min.js"></script>
<script type="text/javascript">

	$(document).ready(function() {
		/*상담 내역 클릭 시 TextArea 비활성화 */
		if(window.opener.document.getElementById("cons_comp_yn").value == 'Y')
		{
			$("#message").attr('disabled', 'disabled');
		}else{
			$("#message").removeAttr('disabled');
			if(window.opener.document.getElementById("counseler_nick").value == ''){
				if(window.opener.document.getElementById("counseler_nick").value != '${login.mem_nick}')
				{
					$("#message").removeAttr('disabled');
				}else{
					$("#message").attr('disabled', 'disabled');
				}
			}
		}
		if('${login.auth}' == 'A')
			$("#message").attr('disabled', 'disabled');
		/*상담관리화면에서 상담사 및 회원 정보 가져오기*/
		loadTutorInfo();
		/*채팅내역가져오기*/
		loadChatRecord();
		$("#sendBtn").click(function() {
			event.preventDefault();
		    sendMessage();
		    $('#message').val('');
		    event.stopPropagation();

		});
		$("#message").on('keydown', function(event) {
		    if (event.keyCode == 13)
		    if (!event.shiftKey){
		        event.preventDefault();
		    	sendMessage();
		    	$('#message').val('');
		        }
			   event.stopPropagation();
		 });
		});
	// 상담관리화면에서 상대방정보를 가져온다.
	function loadTutorInfo()
	{
		var memPic = window.opener.document.getElementById("mem_pic").value;
		var memNick = window.opener.document.getElementById("mem_nick").value;
		var counselerPic = window.opener.document.getElementById("counseler_pic").value;
		var counselerNick = window.opener.document.getElementById("counseler_nick").value;
		if (memNick !='')
		{
			if (counselerNick !='')
				$("#user_nick").html(counselerNick);
			else
			{
				if(memNick != '${login.mem_nick}')
					$("#user_nick").html(memNick);
				else
					$("#user_nick").html("Client");
			}
		}
		else
			$("#user_nick").html("Client");
		if (memPic !='')
		{
			if (counselerPic !='')
				$("#user_pic").html('<img id src="${pageContext.request.contextPath}/images/display?imageName='+counselerPic+'"/>');
			else
			{
				if(memPic != '${login.mem_pic}')
					$("#user_pic").html('<img id src="${pageContext.request.contextPath}/images/display?imageName='+memPic+'"/>');
				else
					$("#user_pic").html('<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">');
			}
		}
		else
			$("#user_pic").html('<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">');

	}

	// 지난 채팅 내역을 load 한다.
	function loadChatRecord(){
		var data={"chat_seq":window.opener.document.getElementById("chatSeq").value};
		$.ajax({
			type: "post",
			data: data,
			dataType : "json",
			url:"${pageContext.request.contextPath}/counsel/getChatRecord",
			success: function(result){
				if( result.length < 1)
				{

				}
				else
				{
					$.each(result, function( index, result ){
						if('${login.auth}' =='A'){
							$('.chatbox').append('<div class="friend-bubble bubble">'+ result.mem_nick+"=>  "+result.msg_text+'</div>');
							$('.chatbox').animate({
							   scrollTop: $('.chatbox').get(0).scrollHeight
							 }, 0);
						}else{
							if(result.mem_id == '${login.mem_id}' )
							{
								$('.chatbox').append('<div class="my-bubble bubble">'+ result.msg_text+'</div>');
								$('.chatbox').animate({
								   scrollTop: $('.chatbox').get(0).scrollHeight
								 }, 0);
							}else
							{
								 $(".chatbox").append('<div class="friend-bubble bubble">'+ result.msg_text+'</div>');
								 $('.chatbox').animate({
									   		scrollTop: $('.chatbox').get(0).scrollHeight
								}, 0);
							}
						}
					});
				}
			}
		})
	}
	// 웹소켓을 지정한 url로 연결한다.
	let sock = new SockJS("<c:url value="/chat"/>");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		 var msg = $('#message').val();
		 msg = msg.replace(/(?:\r\n|\r|\n)/g, '<br />');
		 $("#message").val(msg);
		 if(msg){
		 $('.chatbox').append('<div class="my-bubble bubble">'+ msg+'</div>');
		 $('.chatbox').animate({
		   scrollTop: $('.chatbox').get(0).scrollHeight
		 }, 100);
		 }

		 if(msg != ""){
		    message = {};
		    message.msg_text = $("#message").val()
		    message.chat_seq = window.opener.document.getElementById("chatSeq").value;
		    message.tutor_mem_id = window.opener.document.getElementById("tutorUserId").value;
		    message.mem_id = '${login.mem_id}';
		    message.mem_nick = '${login.mem_nick}';
		  }
		  sock.send(JSON.stringify(message));
	}

	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var obj = JSON.parse(data);
//		alert(window.opener.document.getElementById("chatSeq").value);
//		alert(obj.chat_seq);
	 	if(obj.tutor_mem_id=='${login.mem_id}')
		{
	 		if(window.opener.document.getElementById("chatSeq").value==obj.chat_seq){
//			alert("채팅신청정상");
	 		appendMessage(obj);
	 		}
		}
	}

	function appendMessage(msg){
		 if(msg == ''){
			 return false;
		 }else{

		 var t = getTimeStamp();
		 $(".chatbox").append('<div class="friend-bubble bubble">'+ msg.msg_text+'</div>');
		 $('.chatbox').animate({
			   		scrollTop: $('.chatbox').get(0).scrollHeight
			 		}, 100);
			/*
		 $(".chatbox").append("<div class='col-12 row' style = 'height : auto; margin-top : 5px;'><div class='col-2' style = 'float:left; padding-right:0px; padding-left : 0px;'><img id='' class='' src='' style = 'width:50px; height:50px; '><div style='font-size:9px; clear:both;'>${login.mem_nick}</div></div><div class = 'col-10' style = 'overflow : y ; margin-top : 7px; float:right;'><div class = 'col-12' style = ' background-color:#ACF3FF; padding : 10px 5px; float:left; border-radius:10px;'><span style = 'font-size : 12px;'>"+msg+"</span></div><div col-12 style = 'font-size:9px; text-align:right; float:right;'><span style ='float:right; font-size:9px; text-align:right;' >"+t+"</span></div></div></div>")
		  var chatAreaHeight = $(".chatbox").height();
		  var maxScroll = $(".chatbox").height() - chatAreaHeight;
		  $(".chatbox").scrollTop(maxScroll);
			*/
		 }
	}
	function getTimeStamp() {
		   var d = new Date();
		   var s =
		     leadingZeros(d.getFullYear(), 4) + '-' +
		     leadingZeros(d.getMonth() + 1, 2) + '-' +
		     leadingZeros(d.getDate(), 2) + ' ' +

		     leadingZeros(d.getHours(), 2) + ':' +
		     leadingZeros(d.getMinutes(), 2) + ':' +
		     leadingZeros(d.getSeconds(), 2);

		   return s;
	}
	function leadingZeros(n, digits) {
		   var zero = '';
		   n = n.toString();

		   if (n.length < digits) {
		     for (i = 0; i < digits - n.length; i++)
		       zero += '0';
		   }
		   return zero + n;
		 }
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#message").append("연결 끊김");
	}
</script>
</html>