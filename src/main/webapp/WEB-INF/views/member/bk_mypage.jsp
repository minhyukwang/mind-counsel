<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/upload.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/decorator/header.jsp"%>
	<div class="bodyPart">
		<div class="container">
			<div class="user_container">
				<div class="user_header_img">
					<a id="profile_user_cover" href="javascript:void(0);" onclick="Ossn.Clk('.coverfile');"
						style="background-image: url(http://cat.pan.camp/cover/abc123/c0a098c779a3cfa34523c03148ec4591.jpg)">
						<div class="_header_bg">
							<p>
								<span></span>커버사진 변경
							</p>
						</div>
					</a>
					<form id="upload-cover" style="display: none;" method="post"
						enctype="multipart/form-data">
						<input type="file" name="coverphoto" class="coverfile"
							onchange="Ossn.Clk('#upload-cover .upload');"> <input
							type="hidden" name="ossn_ts" value="1564215033"> <input
							type="hidden" name="ossn_token"
							value="04d9ad2c17dca368c7d9a3744e9768bd"> <input
							type="submit" class="upload">
					</form>
					<span class="_setting">설정</span>
					<!--
			<button id=followBtn>팔로우 하기</button>
			<button id=blockBtn>차단 하기</button>
			<button id=followerBtn>팔로워 보기</button>
			<button id=follwingBtn>팔로잉 보기</button>
			<button id=blockListBtn>차단리스트 보기</button> -->
				</div>
			</div>
			<div class="_user_info_wrap clearfix">
				<!-- <div class="_user_img">
					<a id="user_profile"
					style="background: url(http://cat.pan.camp/avatar/abc123/larger/811b71be7affbcedaa96398df72e0f4e.jpeg) no-repeat center center; background-size: cover">
						<div class="_user_bg">
							<p>
								<span></span>프로필사진 변경
							</p>
					</a>
				</div> -->

				<div id="imageModal" class="modal fade" role="dialog">

				</div>



				<!-- <form id="upload-photo" style="display: none;" method="post"
					enctype="multipart/form-data">
					<input type="file" name="userphoto" class="pfile"
						onchange="Ossn.Clk('#upload-photo .upload');"> <input
						type="hidden" name="ossn_ts" value="1564215033"> <input
						type="hidden" name="ossn_token"
						value="04d9ad2c17dca368c7d9a3744e9768bd"> <input
						type="submit" class="upload">
				</form> -->
			</div>
			<div class="_user_name clearfix">
				<h3 class="_user_id"></h3>
			</div>
			<div class="_user_txt clearfix">
				<h1 class="_user_profile"></h1>
			</div>
			<div class="_user_txt clearfix">
				<h1 class="_user_profile"></h1>
			</div>
			<div class="_user_look_info clearfix">
				<a href="http://cat.pan.camp/u/abc123">
					<dl>
						<dt>업로드</dt>
						<dd>0</dd>
					</dl>
				</a> <a href="http://cat.pan.camp/u/abc123/followee">
					<dl>
						<dt>팔로잉</dt>
						<dd>1</dd>
					</dl>
				</a> <a href="javascript:void(0);" class="empty_look_info">
					<dl>
						<dt>팔로워</dt>
						<dd>0</dd>
					</dl>
				</a> <a href="javascript:void(0);" class="empty_look_info">
					<dl>
						<dt>북마크</dt>
						<dd>0</dd>
					</dl>
				</a>

			</div>

<script id="template" type="text/x-handlebars-template">
<img src="{{imgsrc}}" alt="Attachment" />
<a href="{{imgsrc}}">{{imageName}}</a>
<small data-src="{{fullName}}" style="cursor: pointer">X</small>
</script>

				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">PICTURE</h4>
						</div>
						<div class="modal-body">
							<form id="imgForm" action="uploadForm" method="post" enctype="multipart/form-data">
								<input type="file" name="file" />
							</form>
						</div>
						<div class="modal-footer">
							<input type="button" id="btnUpload" value="UPLOAD" />
							<input type="button" data-dismiss="modal" value="CLOSE" />
						</div>
					</div>
				</div>

		</div>
	</div>
	<!-- /.container -->
	</div>
	<!-- /.bodyPart -->
</body>
<script>
	$(document).ready(function() {
		var template = Handlebars.compile($("#template").html());
		$("#btnUpload").on("click", function(event){
			event.preventDefault();
			var form = $("#imgForm")[0];
			var formData = new FormData(form);
			console.log(formData);

			$.ajax({
				url: "${pageContext.request.contextPath}/images/upload",
				data: formData,
				enctype: "multipart/form-data",
				timeout: 600000,
				dataType: "text",
				processData: false,
				contentType: false,
				type: "POST",
				success: function(data) {
					alert("이미지 업로드 완료");
					console.log(data);
					var info = getFileInfo(data);
					var html = template(info);
			//		$("#mem_pic").val(data);
					$("#uploadedImage").append(html);
				}
			})
		});
		$("#followerBtn").on("click", function() {
			getFollower();
		});
		$("#follwingBtn").on("click", function() {
			getFollowing();
		});
		$("#blockListBtn").on("click", function() {
			getBlockList();
		});
		$("#followBtn").on("click", function() {
			doFollow();
		});
		$("#blockBtn").on("click", function() {
			doBlock();
		});
	});

	function doFollow() {

		var data = {
			"mem_id" : "${login.mem_id}",
			"friend_id" : $("#temp").val()
		};

		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/friends/doFollow",
			dataType : "json",
			data : data,
			success : function(result) {
				alert("success");
			}
		})
	}
	function doBlock() {
		var data = {
			"mem_id" : "${login.mem_id}",
			"friend_id" : $("#temp").val()
		};

		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/friends/doBlock",
			dataType : "json",
			data : data,
			success : function(result) {
				alert("success")
			}
		})
	}

	function getFollower() {

		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/friends/getFollowers",
			dataType : "json",
			data : {
				mem_id : "${login.mem_id}"
			},
			success : function(result) {
				$.each(result,
						function(index, result) {
							$("#followers").html(
									"<strong>" + result.mem_id
											+ "</strong> followers");
						})
				console.log(result);
			}
		})

	}

	function getFollowing() {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/friends/getFollowings",
			dataType : "json",
			data : {
				mem_id : "${login.mem_id}"
			},
			success : function(result) {
				$.each(result, function(index, result) {
					$("#followings").html(
							"<strong>" + result.friend_id
									+ "</strong> followers");
				})
				console.log(result);
			}
		})
	}
	function getBlockList() {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/friends/getBlockList",
			dataType : "json",
			data : {
				mem_id : "${login.mem_id}"
			},
			success : function(result) {
				$.each(result, function(index, result) {
					$("#blockList").html(
							"<strong>" + result.friend_id
									+ "</strong> followers");
				})
				console.log(result)
			}
		})
	}
</script>
</html>



<!-- 	<div class="_user_info_wrap clearfix" style="z-index:1;" >


				<div id="imageModal" class="modal fade" role="dialog">

				</div>

	<div class="user_header_img">
					<a id="profile_user_cover" href="javascript:void(0);" onclick="Ossn.Clk('.coverfile');"
						style="background-image: url(http://cat.pan.camp/cover/abc123/c0a098c779a3cfa34523c03148ec4591.jpg)">
						<div class="_header_bg">
							<p>
								<span></span>커버사진 변경
							</p>
						</div>
					</a>
					<form id="upload-cover" style="display: none;" method="post"
						enctype="multipart/form-data">
						<input type="file" name="coverphoto" class="coverfile"
							onchange="Ossn.Clk('#upload-cover .upload');"> <input
							type="hidden" name="ossn_ts" value="1564215033"> <input
							type="hidden" name="ossn_token"
							value="04d9ad2c17dca368c7d9a3744e9768bd"> <input
							type="submit" class="upload">
					</form>
					<span class="_setting">설정</span> -->
					<!--
			<button id=followBtn>팔로우 하기</button>
			<button id=blockBtn>차단 하기</button>
			<button id=followerBtn>팔로워 보기</button>
			<button id=follwingBtn>팔로잉 보기</button>
			<button id=blockListBtn>차단리스트 보기</button> -->


				<!-- <form id="upload-photo" style="display: none;" method="post"
					enctype="multipart/form-data">
					<input type="file" name="userphoto" class="pfile"
						onchange="Ossn.Clk('#upload-photo .upload');"> <input
						type="hidden" name="ossn_ts" value="1564215033"> <input
						type="hidden" name="ossn_token"
						value="04d9ad2c17dca368c7d9a3744e9768bd"> <input
						type="submit" class="upload">
				</form> -->
			<!-- </div>
			<div class="_user_name clearfix">
				<h3 class="_user_id"></h3>
			</div>
			<div class="_user_txt clearfix">
				<h1 class="_user_profile"></h1>
			</div>
			<div class="_user_txt clearfix">
				<h1 class="_user_profile"></h1>
			</div>
			-->

<script id="template" type="text/x-handlebars-template">
<img src="{{imgsrc}}" alt="Attachment" />
<a href="{{imgsrc}}">{{imageName}}</a>
<small data-src="{{fullName}}" style="cursor: pointer">X</small>
</script>

				<!-- <div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">PICTURE</h4>
						</div>
						<div class="modal-body">
							<form id="imgForm" action="uploadForm" method="post" enctype="multipart/form-data">
								<input type="file" name="file" />
							</form>
						</div>
						<div class="modal-footer">
							<input type="button" id="btnUpload" value="UPLOAD" />
							<input type="button" data-dismiss="modal" value="CLOSE" />
						</div>
					</div>
				</div> -->
