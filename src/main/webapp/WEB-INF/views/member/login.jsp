<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title></title>
<link href="${pageContext.request.contextPath}/resources/css/login.css?20190813" rel="stylesheet">
</head>
<body>
	<%@include file="/WEB-INF/views/decorator/header.jsp"%>
	<div class="bodyPart">
		<div class="container">
			<form class="form-signin" method="post" action="${pageContext.request.contextPath}/member/loginPOST">
				<h1 class="form-signin-heading">Sign In</h1>
				<label for="mem_id" class="sr-only">Email address</label>
				<input type="text" name="mem_id" id="mem_id" placeholder="아이디" class="form-control" required autofocus>
				<label for="mem_pwd" class="sr-only">Password</label>
				<input type="password" name="mem_pwd" id="mem_pwd" class="form-control" placeholder="비밀번호" required>
				<c:if test="${isfail}">
					<div>
						<p style="color: red; font-size:0.8em">없는 아이디이거나 비밀번호가 틀렸습니다.</p>
					</div>
					<%
						session.setAttribute("isfail", "false");
					%>
				</c:if>

				<!-- 자동로그인기능
				 <div class="checkbox">
					<input type="checkbox" id="useCookie"  name="useCookie" >
					<label for="useCookie">RememberMe</label>
				</div>
				-->
				<input type="submit" value="로그인" class="btn-login"style="position:relative; top:0.5em;"/>
				<a href="${pageContext.request.contextPath}/member/find" style="position:relative; left:3.5em; top:2em;">계정찾기</a>
				<span style="position:relative; left:9.3em; top:0.8em;">|</span>
				<a href="${pageContext.request.contextPath}/member/register" style="position:relative;  left:11.1em; top:-0.05em;">회원가입</a>
			</form>
		</div>
		<!-- /container -->
	</div>
	<%@include file="/WEB-INF/views/decorator/footer.jsp" %>
</body>
</html>