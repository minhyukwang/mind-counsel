<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title></title>
<!-- handlebars -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.0.7/handlebars.min.js"></script>

<!-- check member -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/check.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/login.css?20190813" rel="stylesheet">
</head>
<body>
	<%@include file="/WEB-INF/views/decorator/header.jsp"%>
	<div class="bodyPart">
		<div class="container">
			<form id="form" method="post" class="form-signin">
				<h1 class="form-signin-heading" style="left:5.3em">회원가입</h1>
				<input type="text" name="mem_id" id="mem_id" class="form-control bottom-control"  placeholder="아이디" required  autofocus /> <span id="idCheckResult"></span>
				<input type="password" name="mem_pwd" id="mem_pwd" class="form-control bottom-control" placeholder="비밀번호" required autofocus /><span id="pwCheckResult"></span>
				<input type="text" name="mem_nick" id="mem_nick" class="form-control bottom-control" placeholder="닉네임" required autofocus  />
				<input type="email" name="mem_email" id="mem_email" class="form-control" placeholder="이메일" required  autofocus />
				<input type="button" id="regiBtn" class="btn-login" value="가입하기" style="position:relative; margin-top:5px; margin-bottom:1em;"/>
				<input type="submit" id="subBtn" hidden />
				<span>※이메일은 계정찾기에 사용되므로 정확히 기입해주세요.</span>
			</form>
		</div>
		<!-- /container -->
	</div>
	<%@include file="/WEB-INF/views/decorator/footer.jsp" %>
</body>

<script>
$(document).ready(function(){

	$("#regiBtn").on("click",function(){
		var id = $("#mem_id").val();
		var pw = $("#mem_pwd").val();
		var fontStyle={"color":"red",
						"font-size":"0.8em"}
		if (checkId(id)) {
			$.ajax({
				url: "${pageContext.request.contextPath}/member/check",
				data: {mem_id:$("#mem_id").val()},
				dataType: "text",
				success: function(result) {
					if (result == "true") {
						if ($("#mem_id").val() != "") {
							$("#idCheckResult").html("사용 가능한 아이디입니다.");
							$("#idCheckResult").css({"font-size":"0.8em"});
						}
						if(!checkPwd(pw, fontStyle)){
							return false;
						}
						$("#subBtn").click();
					} else {
						$("#idCheckResult").html("이미 사용중인 아이디입니다.");
						$("#idCheckResult").css(fontStyle);
					}
				},
				error: function() {
					alert("ID check error");
				}
			})
		} else {
			$("#idCheckResult").html("ID는 4자초과 20자 이하로 영문자, 숫자 또는 언더바(_)만 사용 가능합니다.");
			$("#idCheckResult").css(fontStyle);
			return false;
		}
	});
});
</script>
</html>

