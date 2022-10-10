<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
<style>
/* NAV 토글 버튼 css*/
.navbar-toggler:not(:disabled):not(.disabled) {
    cursor: pointer;
}
.collapse:not(.show) {
    display: none;
}
</style>
</head>
<title>SOL COUNSEL</title>
<header>
	<%@ include file="/WEB-INF/views/common/common.jsp"%>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-md tm-navbar" id="tmNav" style="background-color: #ffb98c; z-index:100">
		<div class="container" style="z-index:1">
			<div class="tm-next" style="position:relative; left:2em">
				<c:if test="${login.mem_id==null}">
					<a href="${pageContext.request.contextPath}/member/login" class="navbar-brand"class="navbar-brand"
					style="font-family:Great Vibes, cursive;">Sol Counsel</a>
				</c:if>
				<c:if test="${login.mem_id!=null}">
					<a href="${pageContext.request.contextPath}/board/timeline"
						class="navbar-brand" style="font-family:Great Vibes;">Sol Counsel</a>
				</c:if>
			</div>
		   <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
		   aria-controls="navbarSupportedContent" aria-expanded="false"
		   aria-label="Toggle navigation" id="navBtn">
		   		<i class="fas fa-bars navbar-toggler-icon" id="iTag"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link tm-nav-link"
						style="font-family: 'Open Sans', sans-serif"
						href="${pageContext.request.contextPath}/welcome" id="welcomeNav">
						<i class="material-icons"> info </i></a></li>
					<li class="nav-item"><a class="nav-link tm-nav-link"
						style="font-family: 'Open Sans', sans-serif"
						href="${pageContext.request.contextPath}/board/timeline" id="timeLineNav">
						<i class="material-icons"> supervisor_account </i></a></li>
					<li class="nav-item"><a class="nav-link tm-nav-link"
						style="font-family: 'Open Sans', sans-serif"
						href="${pageContext.request.contextPath}/board/issueBoard" id="issueNav">
						<i class="material-icons"> local_library </i> </a></li>
					<li class="nav-item"><a class="nav-link tm-nav-link"
						style="font-family: 'Open Sans', sans-serif"
						href="${pageContext.request.contextPath}/counsel/selfCheck" id="checkNav">
						<i class="material-icons"> border_color </i></a></li>
					<li class="nav-item"><a class="nav-link tm-nav-link"
						style="font-family: 'Open Sans', sans-serif"
						href="${pageContext.request.contextPath}/counsel/mngNote" id="msgNav">
						<i class="material-icons"> message </i></a></li>
					<li class="nav-item"><a class="nav-link tm-nav-link"
						style="font-family: 'Open Sans', sans-serif"
						href="${pageContext.request.contextPath}/counsel/mngCounsel" id="counselNav">
						<i class="material-icons">event_note</i></a></li>
					<li class="nav-item"><a class="nav-link tm-nav-link"
						style="font-family: 'Open Sans', sans-serif"
						href="${pageContext.request.contextPath}/member/mypage" id="myInfoNav">
						<i class="material-icons"> person_outline </i></a></li>
					<c:if test="${login.mem_id!=null}">
						<li class="nav-item"><a class="nav-link tm-nav-link"
							href="${pageContext.request.contextPath}/member/logout"  id="logoutNav">
							<i class="material-icons"> power_settings_new </i></a></li>
					</c:if>
				</ul>
			</div>
		</div>
	</nav>
</header>
<script>
	$(document).ready(function(){

		$(window).resize(function(){
			if($(".navbar-nav").css("flex-direction")=="row")
			{
				$("#welcomeNav").html("<i class='material-icons'> info </i>");
				$("#timeLineNav").html("<i class='material-icons'> supervisor_account </i>");
				$("#issueNav").html("<i class='material-icons'> local_library </i>");
				$("#checkNav").html("<i class='material-icons'> border_color </i>");
				$("#msgNav").html("<i class='material-icons'> message </i>");
				$("#counselNav").html("<i class='material-icons'>event_note</i>");
				$("#myInfoNav").html("<i class='material-icons'> person_outline </i>");
				$("#logoutNav").html("<i class='material-icons'> power_settings_new </i>");
			}
			else
			{
				$("#welcomeNav").html("소개페이지");
				$("#timeLineNav").html("타임라인");
				$("#issueNav").html("이슈게시판");
				$("#checkNav").html("자가검진");
				$("#msgNav").html("메세지관리");
				$("#counselNav").html("상담관리");
				$("#myInfoNav").html("내정보관리");
				$("#logoutNav").html("로그아웃");
			}
		});
		$("#navBtn").mouseenter(function(){
			$("#welcomeNav").html("소개페이지");
			$("#welcomeNav").html("소개페이지");
			$("#timeLineNav").html("타임라인");
			$("#issueNav").html("이슈게시판");
			$("#checkNav").html("자가검진");
			$("#msgNav").html("메세지관리");
			$("#counselNav").html("상담관리");
			$("#myInfoNav").html("내정보관리");
			$("#logoutNav").html("로그아웃");
		});

		$("#myInfoNav").click(function(){


		})

		$("#navBtn").click(function(){
			if($("#navbarSupportedContent").attr("class")=="navbar-collapse collapse show")
				{
					$("#welcomeNav").html("<i class='material-icons'> info </i>");
					$("#timeLineNav").html("<i class='material-icons'> supervisor_account </i>");
					$("#issueNav").html("<i class='material-icons'> local_library </i>");
					$("#checkNav").html("<i class='material-icons'> border_color </i>");
					$("#msgNav").html("<i class='material-icons'> message </i>");
					$("#counselNav").html("<i class='material-icons'>event_note</i>");
					$("#myInfoNav").html("<i class='material-icons'> person_outline </i>");
					$("#logoutNav").html("<i class='material-icons'> power_settings_new </i>");
				}
			else
				{
					$("#welcomeNav").html("소개페이지");
					$("#welcomeNav").html("소개페이지");
					$("#timeLineNav").html("타임라인");
					$("#issueNav").html("이슈게시판");
					$("#checkNav").html("자가검진");
					$("#msgNav").html("메세지관리");
					$("#counselNav").html("상담관리");
					$("#myInfoNav").html("내정보관리");
					$("#logoutNav").html("로그아웃");
				}
		});
	});
</script>
