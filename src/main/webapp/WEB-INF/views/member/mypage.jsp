<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myInfo.css?20190902">
<link href="${pageContext.request.contextPath}/resources/css/login.css?20190813" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/check.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/decorator/header.jsp"%>
	<div class="bodyPart">
		<div class="container">
			<div class="user_box">
			<div class="_user_image" >
				<form id="imgForm" action="uploadForm" method="post" enctype="multipart/form-data">
					<input type="file" name="file" id="selectFile" hidden />
				</form>
				<c:choose>
					<c:when test="${param.mem_pic==null}">
						<c:if test="${login.mem_pic==''}">
							<img id="user_img"src="${pageContext.request.contextPath}/images/default_user.png" alt="">
						</c:if>
						<c:if test="${login.mem_pic!=''}">
							<img id="user_img" src="${pageContext.request.contextPath}/images/display?imageName=${login.mem_pic}"  />
						</c:if>
						<c:if test="${param.mem_id==null or login.mem_id==param.mem_id}">
							<div class="_user_background" id="edit_img">
								<p>프로필사진 변경</p>
							</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<c:if test="${param.mem_pic==null}">
							<img id="user_img"src="${pageContext.request.contextPath}/images/default_user.png" alt="">
						</c:if>
						<c:if test="${param.mem_pic!=null}">
							<img id="user_img" src="${pageContext.request.contextPath}/images/display?imageName=${param.mem_pic}"  />
						</c:if>
						<c:if test="${param.mem_id==null or login.mem_id==param.mem_id}">
							<div class="_user_background" id="edit_img">
								<p>프로필사진 변경</p>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
				<span id="saveImg" style="font-size:0.8em; position:relative;
				top:3.5em; left:6.2em; color:black; cursor:pointer; font-weight:600">저장하기</span>
				<input type="hidden" id="mem_pic"/>
			<c:if test="${param.mem_id!=null}">
			<c:choose>
				<c:when test="${param.mem_id!=login.mem_id}">
					<span style="font-size:1.2em; position:absolute; top:4.5em; left:10em">${param.mem_nick}</span>
					<button class="self-check-btn" id="addFollowBtn" style="position:relative; top:-3.5em; left:54em">팔로우</button>
					<button class="self-check-btn" id="addBlockBtn" style="position:relative; top:-3.2em; left:54em">차단</button>
					<div class="_user_look_info clearfix" style="position:relative; top:-1em; left:-19em;">
						<!-- <a href="empty_look_info"> -->
						<a class="viewTimeline" id="">
							<dl><dt>타임라인</dt></dl>
						</a>
						 <a class="viewFollowings" id="">
							<dl><dt>팔로잉</dt></dl>
						</a>
						<a class="viewFollowers" id="">
							<dl><dt>팔로워</dt></dl>
						</a>
					</div>
				</c:when>
				<c:otherwise>
					<span style="font-size:1.2em; position:absolute; top:4.5em; left:10em">${login.mem_nick}</span>
						<div class="_user_look_info clearfix" style="position:relative; top:3em; left:-6.2em;">
							<!-- <a href="empty_look_info"> -->
							<a class="viewTimeline" id="">
								<dl><dt>타임라인</dt></dl>
							</a>
							 <a class="viewFollowings" id="">
								<dl><dt>팔로잉</dt></dl>
							</a>
							 <a class="viewFollowers" id="">
								<dl><dt>팔로워</dt></dl>
							</a>
							 <a class="" id="viewBlockList">
								<dl><dt>언팔로우</dt></dl>
							</a>
							<a class="" id="eidtMyInfo">
								<dl><dt>내정보수정</dt></dl>
							</a>
							<a class="" id="editPassword">
								<dl><dt>비밀번호변경</dt></dl>
							</a>
					</div>
				</c:otherwise>
			</c:choose>
			</c:if>
			<c:if test="${param.mem_id==null}">
						<span style="font-size:1.2em; position:absolute; top:4.5em; left:10em">${login.mem_nick}</span>
						<div class="_user_look_info clearfix" style="position:relative; top:3em; left:-6.2em;">
							<!-- <a href="empty_look_info"> -->
							<a class="viewTimeline" id="">
								<dl><dt>타임라인</dt></dl>
							</a>
							 <a class="viewFollowings" id="">
								<dl><dt>팔로잉</dt></dl>
							</a>
							 <a class="viewFollowers" id="">
								<dl><dt>팔로워</dt></dl>
							</a>
							 <a class="" id="viewBlockList">
								<dl><dt>언팔로우</dt></dl>
							</a>
							<a class="" id="eidtMyInfo">
								<dl><dt>내정보수정</dt></dl>
							</a>
							<a class="" id="editPassword">
								<dl><dt>비밀번호변경</dt></dl>
							</a>
					</div>
			</c:if>
		</div>
		<input type="hidden" id = "hidCurBoardSeq" value="0" />
 		<div class="user-activity" id="timeLine_box" style="margin-top:2em">
        </div>
		<div class="edit_box" style="margin-top:2em; margin-bottom:2em; padding-bottom:2em;height:auto" id="following_box">
			<h3 style="position:relative; left:5em; top:1.5em" >팔로잉</h3>
			<div id="following_list_div" style="margin-top:0.8em; margin-left:5em; margin-bottom:2em; margin-right:4em"></div>
		</div>
		<div class="edit_box" style="margin-top:2em; margin-bottom:2em; padding-bottom:2em;height:auto" id="follower_box">
			<h3 style="position:relative; left:5em; top:1.5em">팔로워</h3>
			<div id="follower_list_div" style="margin-top:0.8em; margin-left:5em; margin-bottom:2em; margin-right:4em"></div>
		</div>
		<div class="edit_box" style="margin-top:2em; margin-bottom:2em; padding-bottom:2em;height:auto" id="block_box">
			<h3 style="position:relative; left:5em; top:1.5em" >언팔로우</h3>
			<div id="block_list_div" style="margin-top:0.8em; margin-left:5em; margin-bottom:2em; margin-right:4em"></div>
		</div>
		<div class="edit_box" style="margin-top:2em; height:auto;" id="changePwd_box">
		<form id="form" method="post" class="form-signin" style="margin-top:2em">
		<h3 style="margin-bottom:2em;">비밀번호변경</h3>
				<input type="password" name="curr_pw" id="curr_pw" class="form-control bottom-control"  placeholder="현재 비밀번호" required  autofocus /> <span id="currPwdCheck"></span>
				<input type="password" name="new_pw" id="new_pw" class="form-control bottom-control"  placeholder="새 비밀번호" required  autofocus /><span id="pwCheckResult"></span>
				<input type="password" name="new_pw_ch" id="new_pw_ch" class="form-control bottom-control" placeholder="새 비밀번호확인" required autofocus /><span id="pwdCheckResult"></span>
				<input type="button" id="changePwBtn" class="btn-login" value="비밀번호변경" style="position:relative; margin-top:5px; margin-bottom:1em;"/>
				<input type="hidden" id="isPwdSame" />
			</form>
		</div>
		<div class="edit_box" style="margin-top:2em;margin-bottom:2em;height:auto" id="changeMyInfo_box">
		<form id="form2" method="post" class="form-signin" style="margin-top:2em;">
		<h3 style="margin-bottom:2em;">내 정보수정</h3>
				<label style="margin-bottom:0.3em;">이름</label><input type="text" name="mem_name" id="mem_name" class="form-control bottom-control"   />
				<label style="margin-bottom:0.3em; margin-top:0.3em">닉네임</label><input type="text" name="mem_nick" id="mem_nick" class="form-control bottom-control"     />
				<label style="margin-bottom:0.3em; margin-top:0.3em">성별</label>
				<select id="mem_gender" name="mem_gender" class="form-control bottom-control" style="height:2.7em" type="select">
						<option value="" selected disabled hidden >선택</option>
						<option value="M">남자</option>
						<option value="W">여자</option>
				</select>
				<label style="margin-bottom:0.3em; margin-top:0.3em">전화번호</label><input type="text" name="mem_phone" id="mem_phone" class="form-control bottom-control"  />
				<label style="margin-bottom:0.3em; margin-top:0.3em">이메일</label><input type="text" name="mem_email" id="mem_email" class="form-control bottom-control"  />
				<!-- <input type="text" name="mem_gender" id="mem_gender" class="form-control bottom-control" placeholder="성별" required  /> -->
				<label style="margin-bottom:0.3em; margin-top:0.3em">생년월일(6자리)</label><input type="text" name="mem_date" id="mem_date" class="form-control bottom-control"  />
				<c:if test="${fn:substring(login.auth, 0, 1) == 'M'}">
				<label style="margin-bottom:0.3em; margin-top:0.3em">소개</label>
				<textarea rows="8" cols="8" name="mem_intro"  class="form-control bottom-control"  id="mem_intro" >${login.mem_intro}</textarea>
				</c:if>
				<c:if test="${fn:substring(login.auth, 0, 1) == 'G'}">
				<input type="hidden" name="mem_intro"  class="form-control bottom-control"  id="mem_intro">
				</c:if>
				<input type="button" id="changeMyInfoBtn" class="btn-login" value="내 정보수정" style="position:relative; margin-top:5px; margin-bottom:1em;"/>
			</form>
		</div>

	</div>
	<!-- /.container -->
	</div>
	<!-- /.bodyPart -->
<script id="template" type="text/x-handlebars-template">
<img src="{{imgsrc}}" alt="Attachment" />
<a href="{{imgsrc}}">{{imageName}}</a>
<small data-src="{{fullName}}" style="cursor: pointer">X</small>
</script>
</body>
<script>
window.name = "mypage";
	// 페이징처리 관련 멤버변수 bool
	var bool = true;
	var cnt;
	$(document).ready(function() {
		cnt=0;
		if('${param.mem_id}'!="")
		{
			checkFriend();
		}
		$("#saveImg").hide();
		$("#changePwd_box").hide();
		$("#changeMyInfo_box").hide();
		$("#block_box").hide();
		$("#follower_box").hide();
		$("#following_box").hide();
		loadTimelineContents();
		setMyInfo();
		getFriendList("getBlockList","#block_list_div");
		getFriendList("getFollowingList","#following_list_div");
		getFriendList("getFollowerList","#follower_list_div");
	});

	/* 내정보 Set*/
	function setMyInfo(){
		$("#mem_name").val('${login.mem_name}');
		$("#mem_nick").val('${login.mem_nick}');
		$("#mem_phone").val('${login.mem_phone}');
		$("#mem_email").val('${login.mem_email}');
		$("#mem_gender").val('${login.mem_gender}');
		$("#mem_date").val('${login.mem_date}');
	}

	/* 팔로우, 차단 여부 체크 */
	function checkFriend()
	{
		var data = {
				"mem_id" : "${login.mem_id}",
				"friend_id" : "${param.mem_id}"
			};
		$.ajax({
			url: "${pageContext.request.contextPath}/friends/checkFriend",
			data: data,
			type: "post",
			dataType: "json",
			success: function(result) {
				if(result.checkFollow)
				{
					$("#addFollowBtn").html("팔로우취소");
					$("#addFollowBtn").css("width", "6em");
				}
				if(result.checkBlock)
				{
					$("#addBlockBtn").html("차단취소");
					$("#addBlockBtn").css("width", "5.5em");
				}
			},
			error: function() {
				alert("다시 입력해주십시오.");
			}
		})
	}

	/* 팔로우하기   */
	$("#addFollowBtn").click(function(){
		var flag="";
		if($("#addFollowBtn").html()=="팔로우"){
			$("#addBlockBtn").html("차단");
			$("#addFollowBtn").html("팔로우취소");
			$("#addFollowBtn").css("width", "6em");
		}else{
			flag="following";
			$("#addFollowBtn").html("팔로우");
			$("#addFollowBtn").css("width", "5em");
		}
		var data = {
			"mem_id" : "${login.mem_id}",
			"friend_id" : "${param.mem_id}",
			"flag" : flag
		};
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/friends/doFollow",
			dataType : "json",
			data : data,
			success : function(result) {
//				alert("success");
			}
		});
	});

	/* 차단하기 */
	$("#addBlockBtn").click(function(){
		var flag="block";
		if($("#addBlockBtn").html()=="차단"){
			$("#addFollowBtn").html("팔로우");
			$("#addBlockBtn").html("차단취소");
			$("#addBlockBtn").css("width", "5em");

		}else{
			flag="unblock";
			$("#addBlockBtn").html("차단");
			$("#addBlockBtn").css("width", "4em");
		}
		var data = {
			"mem_id" : "${login.mem_id}",
			"friend_id" : "${param.mem_id}",
			"flag" : flag
		};
			$.ajax({
				type : "post",
				url : "${pageContext.request.contextPath}/friends/doBlock",
				dataType : "json",
				data : data,
				success : function(result) {
//					alert("success")
				}
			})
	});

	/* 내 정보 수정 DB */
	$("#changeMyInfoBtn").click(function(){
		var mem_name = $("#mem_name").val();
		var mem_nick = $("#mem_nick").val();
		var mem_phone = $("#mem_phone").val();
		var mem_email = $("#mem_email").val();
		var mem_gender = $("#mem_gender").val();
		var mem_date = $("#mem_date").val();
		var mem_intro = $("#mem_intro").val();
		if (mem_email == '')
			mem_email = '${login.mem_email}';
		if (mem_date == '')
			mem_date = '${login.mem_date}';
		if(!checkEmail(mem_email))
		{
			alert("이메일 형식이 잘못되었습니다.");
			$("#mem_email").val("");
			return false;
		}

		if(mem_date.length){
			if(!checkBirthday(mem_date))
			{
				alert("생년월일 형식이 잘못되었습니다.");
				$("#mem_date").val("");
				return false;
			}
		}
		var data = {"mem_id":"${login.mem_id}",
					"mem_name":mem_name,
					"mem_nick":mem_nick,
					"mem_phone":mem_phone,
					"mem_email":mem_email,
					"mem_gender":mem_gender,
					"mem_date":mem_date,
					"mem_intro":mem_intro};
		$.ajax({
			url: "${pageContext.request.contextPath}/member/updateMyInfo",
			data: data,
			type: "post",
			dataType: "text",
			success: function(result) {
				alert("수정 완료되었습니다.");
			/* 	$("#mem_name").val('${login.mem_name}');
				$("#mem_nick").val('${login.mem_nick}');
				$("#mem_phone").val('${login.mem_phone}');
				$("#mem_email").val('${login.mem_email}');
				$("#mem_gender").val('${login.mem_gender}');
				$("#mem_date").val('${login.mem_date}');
				$("#mem_intro").val('${login.mem_intro}'); */
			},
			error: function() {
				//alert("다시 입력해주십시오.");
			}
		})
	});

	/* 타임라인보기 */
	$(".viewTimeline").click(function(){
		$("#following_box").hide();
		$("#block_box").hide();
		$("#user-container").hide();
		$("#changePwd_box").hide();
		$("#changeMyInfo_box").hide();
		$("#follower_box").hide();
		$("#timeLine_box").show();
		$("#user-container").show();
	});

	/* 팔로워보기 */
	$(".viewFollowers").click(function(){
		$("#timeLine_box").hide();
		$("#user-container").hide();
		$("#following_box").hide();
		$("#block_box").hide();
		$("#changePwd_box").hide();
		$("#changeMyInfo_box").hide();
		$("#follower_box").show();
	});

	/* 팔로잉보기 */
	$(".viewFollowings").click(function(){
		$("#timeLine_box").hide();
		$("#user-container").hide();
		$("#follower_box").hide();
		$("#block_box").hide();
		$("#changePwd_box").hide();
		$("#changeMyInfo_box").hide();
		$("#following_box").show();
	});

	/* 차단목록보기 */
	$("#viewBlockList").click(function(){
		$("#timeLine_box").hide();
		$("#user-container").hide();
		$("#follower_box").hide();
		$("#following_box").hide();
		$("#changePwd_box").hide();
		$("#changeMyInfo_box").hide();
		$("#block_box").show();
	});
	/* 내 정보수정 */
	$("#eidtMyInfo").click(function(){
		$("#timeLine_box").hide();
		$("#user-container").hide();
		$("#follower_box").hide();
		$("#following_box").hide();
		$("#block_box").hide();
		$("#changePwd_box").hide();
		$("#changeMyInfo_box").show();
	});

	/* 비밀번호변경 */
	$("#editPassword").click(function(){
		$("#timeLine_box").hide();
		$("#user-container").hide();
		$("#follower_box").hide();
		$("#following_box").hide();
		$("#block_box").hide();
		$("#changeMyInfo_box").hide();
		$("#changePwd_box").show();
	});

	$("#changePwBtn").on("click",function(){
		$("#currPwdCheck").html("");
		var curr_pw = $("#curr_pw").val();
		var fontStyle={"color":"red",
				"font-size":"0.8em"}
		if('${login.mem_pwd}'==curr_pw)
		{
			var new_pw = $("#new_pw").val();
			var new_pw_ch = $("#new_pw_ch").val();
			var data = {"mem_id":"${login.mem_id}", "mem_pwd":new_pw};
			if(checkPwd(new_pw, fontStyle)){
				checkPwdAgain(new_pw,new_pw_ch);
				$.ajax({
					url: "${pageContext.request.contextPath}/member/changePw",
					data: data,
					type: "post",
					dataType: "text",
					success: function(result) {
						alert("비밀번호가 변경되었습니다.");
						$("#curr_pw").val("");
						$("#new_pw").val("");
						$("#new_pw_ch").val("");
						$("#pwCheckResult").val("");
						$("#pwdCheckResult").val("");
					},
					error: function() {
						alert("비밀번호변경 실패하였습니다.");
					}
				})
			}
		}else
		{
			$("#currPwdCheck").html("현재 비밀번호가 틀렸습니다.");
			$("#currPwdCheck").css({color:"red"});
			$("#currPwdCheck").css({"font-size":"0.8em"});
			$("#curr_pw").val("");
		}
	});



	/* 이미지미리보기 */
	 $("#selectFile").on('change', function(){
        readURL(this);
        $("#saveImg").show();
    });

	/* User이미지등록 */
	var template = Handlebars.compile($("#template").html());
	$("#edit_img").on("click", function(event){
		$("#selectFile").click();
	$("#saveImg").click(function(){
		event.preventDefault();
		var form = $("#imgForm")[0];
		var formData = new FormData(form);
		console.log(formData);
		$.ajax({
			url: "${pageContext.request.contextPath}/images/member",
			data: formData,
			enctype: "multipart/form-data",
			timeout: 600000,
			dataType: "text",
			processData: false,
			contentType: false,
			type: "POST",
			success: function(data) {
//				alert(data);
//				alert("이미지 업로드 완료");
				console.log(data);
				var info = getFileInfo(data);
				var html = template(info);
				$("#mem_pic").val(data);
				$("#uploadedImage").append(html);
				updateMemPic();
			}
		})
	});
	})

	/* 이미지 미리보기 */
    function readURL(input) {
        if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
              $('#user_img').attr('src', e.target.result);
           }
           reader.readAsDataURL(input.files[0]);
        }

    }

	function updateMemPic(){
		var data = {"mem_id":"${login.mem_id}", "mem_pic":$("#mem_pic").val()};
		$.ajax({
			url: "${pageContext.request.contextPath}/member/updateMemPic",
			data: data,
			type: "post",
			dataType: "text",
			success: function(result) {
			},
			error: function() {
			}
		})
	}

	$("#followBtn").on("click", function() {
		doFollow();
	});
	$("#blockBtn").on("click", function() {
		doBlock();
	});

	/* 친구리스트 DB조회 */
	function getFriendList(urlType, divType) {
		var mem_id;
		if ('${param.mem_id}'!="")
			mem_id = '${param.mem_id}';
		else
			mem_id = '${login.mem_id}';
		var htmls="";
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/friends/"+urlType,
			dataType : "json",
			data : {
				mem_id : mem_id
			},
			success : function(result) {
				console.log(result);
				$.each(result, function(index, result) {
						htmls += '<form class="user-info-form" action="${pageContext.request.contextPath}/member/mypage" id="user-info-form-';
				 		htmls += cnt;
				 		htmls += '" enctype="multipart/form-data" name="user-info" method="post"  enctype="multipart/form-data">';
				 		htmls += '<input type="hidden" name="mem_id" value="';
				 		htmls += result.mem_id;
				 		htmls += '" />'
			 			htmls += '<input type="hidden" name="mem_pic" value="';
				 		htmls += result.mem_pic;
				 		htmls += '" />'
			 			htmls += '<input type="hidden" name="mem_nick" value="';
				 		htmls += result.mem_nick;
				 		htmls += '" />';
				 		htmls += '</form>';
						htmls += '<div class="user-info-container" style="position:relative;top:2em; padding-top:5.5px;height:50px;border-bottom:0.1px solid #dee2e6">';
						htmls += '<a href="javascript:void(0);" onclick=javascript:redirectMypage("'+cnt+'") class="user_info_wrap"><span class="user_profile" >';
				 		if(result.mem_pic=='')
							htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
						else
							htmls += '<img id="user_img" src="${pageContext.request.contextPath}/images/display?imageName='+result.mem_pic+'"/>';
						htmls += '</span><div class="user_cont"><strong class="user_name" style="position:relative; top:-1.8em; left:3.2em;">';
				 		htmls += result.mem_nick;
				 		htmls += '</strong><span class="user_time">';
				 		htmls += '</span></div></a></div>';
						cnt++;
				})
				$(divType).html(htmls);

			}
		})
	}

	function redirectMypage(formId){
		var form = "user-info-form-"+formId;
		document.getElementById(form).submit();
	}
	/* 타임라인 */
	function loadTimelineContents()
	{
		var htmls = "";
		var imageUrl="${pageContext.request.contextPath}";
		var user_id;
		// identity = Y : (로그인 id = 유저) , N : (로그인 id != 유저)
		var identity;
		if ('${param.mem_id}'!="" && '${param.mem_id}' != '${login.mem_id}')
		{
			user_id = '${param.mem_id}';
			identity = "N"
		}
		else
		{
			user_id = '${login.mem_id}';
			identity = "Y"
		}

		var data = {"user_id" : user_id,
				"identity" : identity};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/getMypageTimelineList",
			success: function(result){
				 $.each(result, function( index, board )
				 {
					$('#hidCurBoardSeq').val(board.board_seq);
					// 기본 글 load
			 		htmls += '<div class="_item user-container" style="display:"";" id="user-container-';
			 		htmls += board.board_seq;
			 		htmls += '">';
			 		htmls += '<div class="user-info-container"><a href="" class="user_info_wrap"><span class="user_profile" >'
			 		// 회원사진 적용
			 		if( board.mem_pic == null || board.mem_pic == '' )
			 		{
				 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
			 		}
			 		else
		 			{
			 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
			 			htmls += board.mem_pic;
			 			htmls += '" alt="">';
		 			}

			 		htmls += '</span><div class="user_cont"><strong class="user_name">';
			 		htmls += board.mem_nick;
			 		htmls += '</strong><span class="user_time">';
			 		if( board.up_time.length > 10 )
		 			{
			 			htmls += board.created_timestamp.substr(0,10);
		 			}
			 		else
		 			{
			 			htmls += board.up_time;
		 			}
			 		htmls += '</span></div></a></div><div class="post_menu">';
			 		if( board.created_id == '${login.mem_id}' )
		 			{
				 		htmls += '<a class="post-edit"  href="javascript:modifyPost(';
				 		htmls += board.board_seq;
				 		htmls += ');" style="width:35px; position: relative; display: inline-block;  margin-right:0.3em; margin-left:0.1em;"><dl>수정</dl></a>';
				 		htmls += '<a class="post-delete" href="javascript:deletePost(';
				 		htmls += board.board_seq;
				 		htmls += ');" style="width:35px; position: relative; display: inline-block;  "><dl>삭제</dl></a>';
		 			}
			 		// htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
			 		htmls += '</div><div class="post_contents" ><div class="post_text"><div class="user_text">';
			 		htmls += '<a class="post_all" id = "post-contents-';
			 		htmls += board.board_seq;
			 		htmls += '" href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
			 		htmls += board.board_seq;
			 		htmls += '" ><pre style="white-space:pre-wrap;">';
			 		htmls += board.contents;
			 		htmls += '</pre></a></div></div></div><div class="post_countView clearfix"><div class="count_like">';
			 		
			 		if( board.like_count == 0 )
		 			{
			 			htmls += '<a href="javascript:likeEmptyEvent();">공감해요 ';
				 		htmls += board.like_count;
				 		htmls += '개</a>';
		 			}
			 		else
			 		{
			 			htmls += '<a href="javascript:loadLikeListPopup(';
				 		htmls += board.board_seq;
				 		htmls += ');" >공감해요 ';
				 		htmls += board.like_count;
				 		htmls += '개</a>';
			 		}
			 		
			 		htmls += '</div><div class="count_com"><a href=""> 댓글 ';
			 		htmls += board.comment_count;
			 		htmls += '개</a></div></div><div class="post_count clearfix"><div class="post_count_inner clearfix"><div class="ico_like">';
			 		htmls += '<a class="ico_post"  href= "javascript:void(0);" onclick = "javascript:upLike(';
			 		htmls += board.board_seq;
			 		htmls += ',';
			 		htmls += board.like_count;
			 		htmls += ');"><i class="material-icons" style="color:red;">favorite_border</i></a></div>';
			 		htmls += '<div class="ico_comment"><a href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
			 		htmls += board.board_seq;
			 		htmls +='"><i class="material-icons" style="color:gray;">insert_comment</i></a></div></div></div></div></div>';

			 	// 수정 글 load hidden
			 		htmls += '<div class="_item user-container" style="display:none;" id="user-modify-';
			 		htmls += board.board_seq;
			 		htmls += '">';

			 		htmls += '<div class="user-info-container"><a href="" class="user_info_wrap"><span class="user_profile" >'

			 		// 회원사진 적용
			 		if( board.mem_pic == null || board.mem_pic == '' )
			 		{
				 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
			 		}
			 		else
		 			{
			 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
			 			htmls += board.mem_pic;
			 			htmls += '" alt="">';
		 			}
			 		htmls += '</span><div class="user_cont"><strong class="user_name">';
			 		htmls += board.mem_nick;
			 		htmls += '</strong><span class="user_time">';
			 		if( board.up_time.length > 10 )
		 			{
			 			htmls += board.created_timestamp.substr(0,10);
		 			}
			 		else
		 			{
			 			htmls += board.up_time;
		 			}
			 		htmls += '</span></div></a></div><div class="post_menu">';
			 		htmls += '<input class="btn_edit_submit" type="button" onclick = "javascript:modifySubmit(';
			 		htmls += board.board_seq;
			 		htmls += ');" value="수정" style="float:right;position:relative; height:2.3em; left:0em; top:-1.4em;" ></div>';
			 		htmls += '<div class="post_contents" ><div class="post_text"><div class="profile-container"><textarea  onkeydown="resize(this)"';
			 		htmls += 'onkeyup="resize(this)" style="width:100%; margin-left:0.8em;" name="contents" id="modify-post-';
			 		htmls += board.board_seq;
			 		htmls += '" contenteditable="true">';
			 		htmls += board.contents;
			 		htmls += '</textarea></div>';
			 		htmls += '</div></div></div>';

				 })
			$('#timeLine_box').html(htmls);
			}
		})
	}

	$(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
		var maxHeight = $(document).height();
	    var currentScroll = $(window).scrollTop() + $(window).height();

		if (maxHeight <= currentScroll+20) {
			if(bool)
			{
				appendTimeline();
			}
	    }
	});

	// 타임라인 페이지 추가 append load
	function appendTimeline()
	{
		bool = false;
		var htmls = "";
		var imageUrl="${pageContext.request.contextPath}";
		var boardSeq = $("#hidCurBoardSeq").val();
		var user_id;
		// identity = Y : (로그인 id = 유저) , N : (로그인 id != 유저)
		var identity;
		if ('${param.mem_id}'!="" && '${param.mem_id}' != '${login.mem_id}')
		{
			user_id = '${param.mem_id}';
			identity = "N"
		}
		else
		{
			user_id = '${login.mem_id}';
			identity = "Y"
		}

		var data = {"user_id" : user_id,
				"identity" : identity,
				"boardSeq" : boardSeq};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/appendMypageTimelineList",
			success: function(result){
				 $.each(result, function( index, board )
				 {
					$('#hidCurBoardSeq').val(board.board_seq);
					//기본글 load
					htmls += '<div class="_item user-container" style="display:"";" id="user-container-';
			 		htmls += board.board_seq;
			 		htmls += '">';
			 		htmls += '<div class="user-info-container"><a href="" class="user_info_wrap"><span class="user_profile" >'
			 		// 회원사진 적용
			 		if( board.mem_pic == null || board.mem_pic == '' )
			 		{
				 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
			 		}
			 		else
		 			{
			 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
			 			htmls += board.mem_pic;
			 			htmls += '" alt="">';
		 			}
			 		htmls += '</span><div class="user_cont"><strong class="user_name">';
			 		htmls += board.mem_nick;
			 		htmls += '</strong><span class="user_time">';
			 		if( board.up_time.length > 10 )
		 			{
			 			htmls += board.created_timestamp.substr(0,10);
		 			}
			 		else
		 			{
			 			htmls += board.up_time;
		 			}
			 		htmls += '</span></div></a></div><div class="post_menu">';
			 		if( board.created_id == '${login.mem_id}' )
		 			{
				 		htmls += '<a class="post-edit"  href="javascript:modifyPost(';
				 		htmls += board.board_seq;
				 		htmls += ');" style="width:35px; position: relative; display: inline-block;  margin-right:0.3em; margin-left:0.1em;"><dl>수정</dl></a>';
				 		htmls += '<a class="post-delete" href="javascript:deletePost(';
				 		htmls += board.board_seq;
				 		htmls += ');" style="width:35px; position: relative; display: inline-block;  "><dl>삭제</dl></a>';
		 			}
			 		htmls += '</div><div class="post_contents" ><div class="post_text"><div class="user_text">';
			 		htmls += '<a class="post_all" href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
			 		htmls += board.board_seq;
			 		htmls += '" ><pre style="white-space:pre-wrap;">';
			 		htmls += board.contents;
			 		htmls += '</pre></a></div></div></div><div class="post_countView clearfix"><div class="count_like">';
			 		if( board.like_count == 0 )
		 			{
			 			htmls += '<a href="javascript:likeEmptyEvent();">공감해요 ';
				 		htmls += board.like_count;
				 		htmls += '개</a>';
		 			}
			 		else
			 		{
			 			htmls += '<a href="javascript:loadLikeListPopup(';
				 		htmls += board.board_seq;
				 		htmls += ');" >공감해요 ';
				 		htmls += board.like_count;
				 		htmls += '개</a>';
			 		}
			 		
			 		htmls += '</div><div class="count_com"><a href=""> 댓글 ';
			 		htmls += board.comment_count;
			 		htmls += '개</a></div></div><div class="post_count clearfix"><div class="post_count_inner clearfix"><div class="ico_like">';
			 		htmls += '<a class="ico_post"  href= "javascript:void(0);" id= "ossn-like-18968" onclick = "javascript:upLike(';
			 		htmls += board.board_seq;
			 		htmls += ',';
			 		htmls += board.like_count;
			 		htmls += ');"><i class="material-icons" style="color:red;">favorite_border</i></a></div>';
			 		htmls += '<div class="ico_comment"><a href="${pageContext.request.contextPath}/board/timelineContents?board_seq=';
			 		htmls += board.board_seq;
			 		htmls += '"><i class="material-icons" style="color:gray;">insert_comment</i></a></div></div></div></div></div>';

			 	// 수정 글 load hidden
			 		htmls += '<div class="_item user-container" style="display:none;" id="user-modify-';
			 		htmls += board.board_seq;
			 		htmls += '">';

			 		htmls += '<div class="user-info-container"><a href="" class="user_info_wrap"><span class="user_profile" >'
			 		// 회원사진 적용
			 		if( board.mem_pic == null || board.mem_pic == '' )
			 		{
				 		htmls += '<img src="${pageContext.request.contextPath}/images/default_user.png" alt="">';
			 		}
			 		else
		 			{
			 			htmls += '<img src="${pageContext.request.contextPath}/images/display?imageName=';
			 			htmls += board.mem_pic;
			 			htmls += '" alt="">';
		 			}
			 		htmls += '</span><div class="user_cont"><strong class="user_name">';
			 		htmls += board.mem_nick;
			 		htmls += '</strong><span class="user_time">';
			 		if( board.up_time.length > 10 )
		 			{
			 			htmls += board.created_timestamp.substr(0,10);
		 			}
			 		else
		 			{
			 			htmls += board.up_time;
		 			}
			 		htmls += '</span></div></a></div><div class="post_menu">';
			 		htmls += '<input class="btn_edit_submit" type="button" onclick = "javascript:modifySubmit(';
			 		htmls += board.board_seq;
			 		htmls += ');" value="수정" style="float:right;position:relative; height:2.3em; left:0em; top:-1.4em;" ></div>';
			 		htmls += '<div class="post_contents" ><div class="post_text"><div class="profile-container"><textarea  onkeydown="resize(this)"';
			 		htmls += 'onkeyup="resize(this)" style="width:100%; margin-left:0.8em;" name="contents" id="modify-post-';
			 		htmls += board.board_seq;
			 		htmls += '" contenteditable="true">';
			 		htmls += board.contents;
			 		htmls += '</textarea></div>';
			 		htmls += '</div></div></div>';

				 })
			$('#timeLine_box').append(htmls);
			bool = true;
			}
		})
	}

	function upLike(seq, cnt)
	{
		var data = {"seq" : seq, "likeCnt" :  cnt};
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/timelineUpLike",
			success: function(result){
				if( result.data_yn == "Y" )
				{
					//location.reload();
				}
				else
				{
					alert("이미 좋아요를 눌렀습니다.");
					return;
				}
			}
		})
	}
	// 게시글 삭제 event
	function deletePost(seq)
	{
		var data = {"seq" : seq};
		var con = confirm("게시글을 정말 삭제하시겠습니까?")
		if(con == true)
		{
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/deletePost",
			success: function(result){
				if( result.data_yn == "Y" )
				{
					location.reload();
				}
			}
		})
		}
	}

	// 게시글 수정 event
	function modifyPost(seq)
	{
		var baseId = "user-container-" + seq;
		var modiId = "user-modify-" + seq;
		document.getElementById(baseId).style.display="none";
		document.getElementById(modiId).style.display="";
	}

	// 게시글 수정 submit event
	function modifySubmit(seq)
	{
		var modiPostId = "modify-post-" + seq;
		var midiId = document.getElementById(modiPostId);
		var contents = midiId.value;
		var data = {"seq" : seq, "contents" :contents};
		var con = confirm("게시글을 정말 수정하시겠습니까?")
		if(con == true)
		{
		$.ajax({
			type: "post",
			data:data,
			dataType:"json",
			url:"${pageContext.request.contextPath}/board/modifyPost",
			success: function(result){
				if( result.data_yn == "Y" )
				{
					var baseId = "user-container-" + seq;
					var modiId = "user-modify-" + seq;
					var postId = "post-contents-" + seq;
					//document.getElementById(postId).html = contents;
					document.getElementById(baseId).style.display="";
					document.getElementById(modiId).style.display="none";
					location.reload();
				}
			}
		})
		}
	}
	// Like List popup
	function loadLikeListPopup(seq)
	{
		var option = 'width=460,height=200,scrollbars=no,resizable=no,status=yes,location=no,menubar=no,toolbar=no,top=340,left=476';
		window.open("${pageContext.request.contextPath}/board/pop/likeList?board_seq="+seq, "a", option);

	}
	function likeEmptyEvent()
	{
		alert("공감한 사람이 없어요. 좋아요를 눌러주세요~");
	}
</script>
</html>

