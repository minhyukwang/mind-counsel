<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML>
<html>
<head>
<title></title>
<link href="${pageContext.request.contextPath}/resources/css/login.css?20190813" rel="stylesheet">
</head>
<%@include file="/WEB-INF/views/decorator/header.jsp"%>
<div class="bodyPart">
<div class="container">
	<article class="post">
		<section>
			<div id="form"  class="form-signin">
				<h1 class="form-signin-heading" style="font-size: 1em;position:relative; left:0em; top:0.3em">이메일을입력해주세요</h1>
				<input type="email" class="form-control" name="mem_email" id="mem_email" placeholder="이메일" required/>
				<span id="findIdResult">&nbsp;</span>
				<input type="button" class="btn-login" id="btnFindID" value="아이디찾기" />
			</div>
		</section>
	</article>

	<article class="post">
		<section>
			<div id="form"  class="form-signin">
				<h1 class="form-signin-heading" style="font-size: 1em;position:relative; left:0em; top:0.3em" >아이디와이메일을 입력해주세요</h1>
				<div id="pwdDiv">
				<input type="text" class="form-control" name="mem_id" id="mem_id" placeholder="아이디" />
				<input type="text" class="form-control" name="email" id="email" placeholder="이메일" />
				<span id="findPwdResult">&nbsp;</span>
				<input type="button" class="btn-login" id="btnSendCode" value="비밀번호찾기" />
				</div>
			</div>
		</section>
	</article>
</div>
</div>
<%@include file="/WEB-INF/views/decorator/footer.jsp" %>
</body>
<script>

$(document).ready(function(){
	$("#btnFindID").on("click", function(){
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/member/findID",
			data: { mem_email:$("#mem_email").val() },
			dataType: "text",
			success: function(result){
				console.log(result);
				if (result == "no data") {
					$("#findIdResult").html("해당 이메일로 가입된 계정이 없습니다.");
				} else {
					$("#findIdResult").html("요청하신 아이디는 <strong>" + result + "</strong> 입니다.")
				}
			}
		})
	})

	$("#btnSendCode").on("click", function(){
		$("#btnSendCode").val("재전송");
		$.ajax({
			type: "post",
			url: "${pageContext.request.contextPath}/member/sendCode",
			data: {
				mem_email:$("#email").val(),
				mem_id:$("#mem_id").val()
			},
			dataType: "text",
			success: function(result){
				console.log(result);
				if (result == "discordance") {
					$("#findPwdResult").html("해당 email과 id 정보가 일치하지 않습니다. 다시 확인해주세요.");
				} else if (result == "success") {
					$("#sendCode").remove();
					$("#findPwdResult").html("인증코드가 전송되었습니다. 이메일을 확인해주세요.");
					$("#mem_id").attr("readonly", "readonly");
					$("#email").attr("readonly", "readonly");
					var str = "<div id='sendCode' class='form-signin'><div class='form-signin'>"
						+ "<input type='text' class='form-control' name='inputCode' id='inputCode' placeholder='인증코드를 입력하세요' />"
						+ "<span id='inputCodeResult'>&nbsp;</span></div>"
						+ "<div class='action'><input type='button' class='btn-login' onclick='findPwd()' value='확인' /></div></div>";
					$("#pwdDiv").after(str);
				}
			}
		})
	})

})

function findPwd() {
	$.ajax({
		type: "post",
		url: "${pageContext.request.contextPath}/member/findPwd",
		data: {
			mem_email:$("#email").val(),
			mem_id:$("#mem_id").val(),
			inputCode:$("#inputCode").val()
		},
		dataType: "text",
		success: function(result){
			console.log(result);
			if (result == "discordance") {
				$("#inputCodeResult").html("인증코드가 일치하지 않습니다. 다시 한 번 확인해주세요.");
			} else if (result == "success") {
				alert("임시 비밀번호가 메일로 전송되었습니다.");
				location.href = "${pageContext.request.contextPath}/member/login";
			}
		}
	})
}

</script>