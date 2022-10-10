function checkId(id) {
	var check = /^.[a-zA-Z0-9_]{4,20}$/;

	return check.test(id);
}

function checkPwd(password, fontStyle) {
	var check = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=.]).*$/;

	if (password.length < 8 || password.length > 20 || !check.test(password)) {
		$("#pwCheckResult").html("암호 길이는 8자 초과 20자 이하로 영문자, 숫자, 특수문자를 포함합니다.");
		$("#pwCheckResult").css(fontStyle);
	} else {
		$("#pwCheckResult").html("비밀번호: 양호");
		$("#pwCheckResult").css({"font-size":"0.8em"});
	}

	return check.test(password);
}

function checkPwdAgain(pwd1, pwd2) {

	if (pwd1 != pwd2) {
		$("#pwdCheckResult").html("비밀번호: 불일치");
		$("#pwdCheckResult").css({color:"red"});
		$("#pwdCheckResult").css({"font-size":"0.8em"});
		$("#isPwdSame").val("N");
	} else {

		if (pwd1 != null && pwd1 != "") {
			/*$("#pwdCheckResult").css({color:"blue"});*/
			$("#pwdCheckResult").html("비밀번호: 일치");
			$("#pwdCheckResult").css({"font-size":"0.8em"});
			$("#isPwdSame").val("Y");
		}
	}
}

function checkEmail(email) {

	var check = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;

	return check.test(email);
}

function checkBirthday(birth){

	var check =  /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;

	return check.test(birth);

}

function timeCheck(time){

	var check = /^([1-9]|[01][0-9]|2[0-3]):([0-5][0-9])$/;;

	return check.test(time);
}
