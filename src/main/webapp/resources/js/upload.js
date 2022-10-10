function addFilePath(msg) {
	alert(msg);
	document.getElementById("imgForm").reset();
}

function checkImageType(imageName) {
	var pattern = /jpg$|gif$|png$|jpeg$/i;

	return imageName.match(pattern);
}

/*// 썸네일 생성시 원본파일명 불러오기
function getOriginal(imageName) {

	if (!checkImageType(imageName)) {
		return;
	}

	var front = imageName.substr(0, 12);
	var end = imageName.substr(14);

	return front + end;
}*/

function getFileInfo(fullName) {
	var imageName, imgsrc, imageLink;

	if (checkImageType(fullName)) {
		imgsrc = "/mj010/images/display?imageName=" + fullName;
		imageLink = fullName.substr(14);
	}

	imageName = imageLink.substr(imageLink.indexOf("_") + 1);

	return {imageName:imageName, imgsrc:imgsrc, fullName:fullName};
}

function deleteImage() {

	$.ajax({
		url: "/mj010/images/delete",
		type: "post",
		data: {imageName: $("#uploadedImage").children("small").attr("data-src")},
		dataType: "text",
		success: function(result) {
			console.log("result : " + result);
		}
	})
}

function changePic(mem_pic) {

	$.ajax({
		type: "post",
		url: "/mj010/member/changePic",
		dataType: "text",
		data: {mem_pic:mem_pic},
		success: function(result) {

			if (result == "success") {
				alert("사진 변경 완료");
			}
		}
	})
}