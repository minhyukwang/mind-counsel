<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>WelcomePage</title>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/fontawesome-5.5/css/all.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/slick/slick.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/slick/slick-theme.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/magnific-popup/magnific-popup.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/template-style1.css" />
<link href="https://fonts.googleapis.com/css?family=Dancing+Script|Great+Vibes&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.navbar-toggler:not(:disabled):not(.disabled) {
    cursor: pointer;
}
.collapse:not(.show) {
    display: none;
}
</style>
</head>
<body>
	<!-- Hero section -->
	<section id="hero" class="text-white tm-font-big tm-parallax">
	<!-- Navigation -->
	<nav class="navbar navbar-expand-md tm-navbar" id="tmNav">
	<div class="container">
		<div class="tm-next">
			<a href="#hero" class="navbar-brand" style="font-family:Great Vibes, cursive;">Sol Counsel</a>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<i class="fas fa-bars navbar-toggler-icon"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link tm-nav-link"
					href="#introduction" id="headerBtn" style="font-size:0.93em" >Introduction</a></li>
<%--				<li class="nav-item"><a class="nav-link tm-nav-link"--%>
<%--					href="#work" id="headerBtn" style="font-size:0.93em" >Our Work</a></li>--%>
<%--				<li class="nav-item"><a class="nav-link tm-nav-link"--%>
<%--					href="#contact" id="headerBtn" style="font-size:0.93em">Contact Us</a></li>--%>
				<li class="nav-item"><a class="nav-link tm-nav-link"
					style="cursor:pointer; font-size:0.93em" id="snsBtn">SNS Page</a></li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="text-center tm-hero-text-container">
		<div class="tm-hero-text-container-inner">
			<h1 class="tm-hero-title"></h1>
			<p class="tm-hero-subtitle">
				 <br />
			</p>
		</div>
	</div>

	<div class="tm-next tm-intro-next">
		<a href="#introduction" class="text-center tm-down-arrow-link"> <i
			class="fas fa-3x fa-caret-down tm-down-arrow"></i>
		</a>
	</div>
	</section>

	<section id="introduction" class="tm-section-pad-top">
	<div class="container">
		<div class="row">
			<div class="col-lg-6">
				<img src="${pageContext.request.contextPath}/images/main1.jpg"
					alt="Image" class="img-fluid tm-intro-img" />
			</div>
			<div class="col-lg-6">
				<div class="tm-intro-text-container">
					<h2 class="tm-text-primary mb-4 tm-section-title">Introduction</h2>
					<p class="mb-4 tm-intro-text">
						안녕하세요. 이 웹사이트를 다음과 같이 사용해 보세요.
						Hello.
						Try this website as follows:
					</p>
					<p class="mb-4 tm-intro-text">
						이 웹사이트는 크게 4가지 영역으로 구성되어 있습니다.
						여러분이 사용하고 싶은 영역을 선택하셔서 마음껏 활용해 보세요.<br>
						This website is comprised of four main areas.
						You can Choose the area you want to use and make the most of it.
					</p>
					<div class="tm-next">
						<a href="#work" class="tm-intro-text tm-btn-primary">Read More</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<section id="work" class="tm-section-pad-top">
<%--	<div id="row">--%>
<%--		<div class="text-center col-12">--%>
<%--			<h2 class="tm-text-primary tm-section-title mb-4">Our Work</h2>--%>
<%--		</div>--%>
<%--	</div>--%>
	<div id="row" style="margin-top:-2em;">
		<div class="row tm-section-pad-top">
			<div class="text-center col-12">
				<i class="material-icons" style="font-size:3em; color:#3496d8; margin-bottom:0.5em" > border_color </i>
				<h4 class="text-center tm-text-primary mb-4">1. 나의 정신건강 점검해보기</h4>
				<p>
				       여기에 있는 각종 척도를 사용하여 여러분의 정신건강 영역에 대해 자유롭게 점검해 보세요.<br>
					혹시 전문가의 도움이 필요하다면 원하시는 전문가에게 쪽지로 질문하세요.<br>
					쪽지를 보내실 때 일부 서비스는 유료입니다. 꼭 확인해 주세요. </p>
				<p>
				<h4 class="text-center tm-text-primary mb-4">1. Check your mental health areas</h4>
				<p style="font-size:0.9em">
				    Use the various scales here to freely check your mental health areas <br>
					If you need professional help, send a note to an expert here who you wants your help and ask them about it.<br>
					When you send a note, some of the services you send notes will be charged. So Please check it out before sending a note.</p>
			</div>

			<div class="text-center col-12" style="margin-top:3em;">
				<i class="material-icons" style="font-size:3em; color:#3496d8; margin-bottom:0.5em" > supervisor_account </i>
				<h4 class="text-center tm-text-primary mb-4">2. 게시판에서 고민을 나누고 때로는친구들에게 힘이 되어 주기</h4>
				<p>이 게시판은 여러분이 그 누구에게도 하기 힘든 여러분만의 고민을 마음껏 털어 놓고 비슷한 고민을 가진 친구들과 함께 대화할 수 있는 곳입니다.<br>
				     여러분의 고민을 먼저 털어놔 보세요. 친구들이 여러분의 게시글에 댓글을 남겨 줄거예요. 그리고 댓글로 서로 소통해 보세요.<br>
				    만약 여러분의 고민에 대해 친구들과 소통을 하다가 전문가와 상담을 원하시면 원하시는 전문가에게 쪽지를 주세요.</p>
				<h4 class="text-center tm-text-primary mb-4">2. Share your concerns on the bulletin board and sometimes support  others here.</h4>
				<p style="font-size:0.9em"> This bulletin board is where you can  share your own concerns that you can't do to anyone and you can talk to with your friends who have similar concerns and at this bulletin board.<br>
				    You can talk about your worries(concerns) first. Then Other people here will leave comments on your posts. And then you might communicate with each other through comments.<br>
				    You can also see other people's concerns on the bulletin board and talk to with them through  the comments.<br>
				    If you have been communicating with others about your concerns and then if you want to talk to an expert about your that problem, give a note to the expert you want.</p>
			</div>
			<div class="text-center col-12" style="margin-top:3em;">
				<i class="material-icons" style="font-size:3em; color:#3496d8; margin-bottom:0.5em"> message </i>
				<h4 class="text-center tm-text-primary mb-4">3. 정신건강 전문가에게 쪽지로 궁금증 해결하기</h4>
				<p>선택하신 전문가에게 쪽지를 보내세요. <br>
				 대부분의 쪽지는 무료로 사용하실 수 있지만, 다음의 경우는 유료로 결제 후 쪽지를 보내주세요. <br>
				 무료: 50분 이상 진행되는 정기 상담을 원하실 경우 상담신청에 대한 내용은 무료쪽지를 사용합니다. 앱 사용 중 불편사항에 대한 내용을 sol 에게 이야기 하고 싶으실 때 sol 에게 무료 쪽지를 주세요. <br>
				 유료: 50분 이상 진행되는 상담은 원하지 않으나 그에 준하는 내용으로 전문가의 답변을 원하실 경우 질문 쪽지 하나에 5,000원을 결재하시고 쪽지를 보내주시면 전문가의 답변을 받으실 수 있습니다.<br>
				 단, 질문을 보내실 때는 최대한 구체적으로 내용을 보내주시면 전문적인 답변을 드리는데 더 도움이 되겠습니다.<br>
				 쪽지에 대한 답변은 최대한 빨리 보내드리도록 하겠습니다. 일부 내용의 경우 전문적인 답변 제공을 위해 시간이 소요될 수 있습니다.  </p>
				 <h4 class="text-center tm-text-primary mb-4">3. Solve Your questions with a note to a mental health expert</h4>
				<p style="font-size:0.9em">
				 Please send a note to the expert you have chosen. Most of the notes are free of charge, but please send us a note after payment in the following cases: <br>
				 free : If when you want regular counseling for more than 50 minutes, the note to request counseling is free.<br>
				 If you want to talk to Sol about any inconvenience you were feel while using this website and app, give sol a free message.<br>
				 Charged: If you do not want to have a counseling lasting more than 50 minutes,<br>
				 and but  if you want to receive an expert's response to a similar level of content, you can receive an expert's response by paying 5,000 won for one question note.<br>
				 When you send a question to an expert, exper will be more helpful in providing  professional answers for you if you send the details as much as possible.<br>
				 I'll send you an answer to the note as soon as possible. Some content may take time to provide professional answers. </p>
			</div>
			<div class="text-center col-12" style="margin-top:3em;">
				<i class="material-icons"  style="font-size:3em; color:#3496d8; margin-bottom:0.5em">event_note</i>
				<h4 class="text-center tm-text-primary mb-4">4. 정신건강 전문가와 지속적으로 상담하기 </h4>
				<p>전문가와의 상담은 1회당 50분가량 상담 진행 가능 하며 1회 신청시 2만원, 3회 신청시 5만원, 5회 신청시 8만원의 상담료를 지불하시면 됩니다. <br>
				      전문가와의 상담을 원하시면 전문가의 프로필을 확인 하신후 상담하고 싶은 전문가에게 쪽지를 보내세요. <br>
				      상담은 예약제로 운영이 됩니다. 무료 쪽지를 이용하셔서 전문가와 시간을 예약하신 후 상담료를 결재 하시기 바랍니다.</p>
				<h4 class="text-center tm-text-primary mb-4">4. Counsel a mental health experts continually </h4>
				<p style="font-size:0.9em">Counsel with experts lasts 50 minutes per session. You can pay 20,000 won for one session, 50,000 won for three sessions, and 80,000 won for five sessions. <br>
				   If you want to counsel with an expert, check the professional's profile and send a note to the expert you want to counsel to. <br>
				   Counsel is running  on a reservation basis. Please use a free note to schedule a time with an expert and pay the counsel’s fees.</p>
			</div>
		</div>
		</div>
	</section>

	<div class="container tm-container-gallery">

		<div class="row">
			<div class="col-12">
				<div class="mx-auto tm-gallery-container">
					<div class="grid tm-gallery">
						<a
							href="${pageContext.request.contextPath}/images/gallery-img-01.jpg">
							<figure class="effect-honey tm-gallery-item"> <img
								src="${pageContext.request.contextPath}/images/gallery-tn-01.jpg"
								alt="Image" class="img-fluid"> <figcaption>
							<h2>
								<i>Dreamy <span>Honey</span> Now
								</i>
							</h2>
							</figcaption> </figure>
						</a> <a
							href="${pageContext.request.contextPath}/images/gallery-img-02.jpg">
							<figure class="effect-honey tm-gallery-item"> <img
								src="${pageContext.request.contextPath}/images/gallery-tn-02.jpg"
								alt="Image" class="img-fluid"> <figcaption>
							<h2>
								<i>Second <span>Honey</span> Now
								</i>
							</h2>
							</figcaption> </figure>
						</a> <a
							href="${pageContext.request.contextPath}/images/gallery-img-03.jpg">
							<figure class="effect-honey tm-gallery-item"> <img
								src="${pageContext.request.contextPath}/images/gallery-tn-03.jpg"
								alt="Image" class="img-fluid"> <figcaption>
							<h2>
								<i>Third <span>Honey</span> Now
								</i>
							</h2>
							</figcaption> </figure>
						</a> <a
							href="${pageContext.request.contextPath}/images/gallery-img-04.jpg">
							<figure class="effect-honey tm-gallery-item"> <img
								src="${pageContext.request.contextPath}/images/gallery-tn-04.jpg"
								alt="Image" class="img-fluid"> <figcaption>
							<h2>
								<i>Dreamy <span>Honey</span> Now
								</i>
							</h2>
							</figcaption> </figure>
						</a> <a
							href="${pageContext.request.contextPath}/images/gallery-img-05.jpg">
							<figure class="effect-honey tm-gallery-item"> <img
								src="${pageContext.request.contextPath}/images/gallery-tn-05.jpg"
								alt="Image" class="img-fluid"> <figcaption>
							<h2>
								<i>Fifth <span>Honey</span> Now
								</i>
							</h2>
							</figcaption> </figure>
						</a> <a
							href="${pageContext.request.contextPath}/images/gallery-img-06.jpg">
							<figure class="effect-honey tm-gallery-item"> <img
								src="${pageContext.request.contextPath}/images/gallery-tn-06.jpg"
								alt="Image" class="img-fluid"> <figcaption>
							<h2>
								<i>Sixth <span>Honey</span> Now
								</i>
							</h2>
							</figcaption> </figure>
						</a> <a
							href="${pageContext.request.contextPath}/images/gallery-img-01.jpg">
							<figure class="effect-honey tm-gallery-item"> <img
								src="${pageContext.request.contextPath}/images/gallery-tn-01.jpg"
								alt="Image" class="img-fluid"> <figcaption>
							<h2>
								<i>Dreamy <span>Honey</span> Now
								</i>
							</h2>
							</figcaption> </figure>
						</a> <a
							href="${pageContext.request.contextPath}/images/gallery-img-02.jpg">
							<figure class="effect-honey tm-gallery-item"> <img
								src="${pageContext.request.contextPath}/images/gallery-tn-02.jpg"
								alt="Image" class="img-fluid"> <figcaption>
							<h2>
								<i>Eighth <span>Honey</span> Now
								</i>
							</h2>
							</figcaption> </figure>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Contact -->
	<section id="contact" class="tm-section-pad-top tm-parallax-2">
	<div class="container tm-container-contact">
		<div class="row">
			<div class="col-12">
				<h2 class="mb-4 tm-section-title">Contact Us</h2>
				<div class="mb-5 tm-underline">
					<div class="tm-underline-inner"></div>
				</div>
				<p class="mb-5">Nullam tincidunt, lacus a suscipit luctus, elit
					turpis tincidunt dui, non tempus sem turpis vitae lorem. Maecenas
					eget odio in sapien ultrices viverra vitae vel leo. Curabitur at
					elit eu risus pharetra pellentesque at at velit.</p>
			</div>

			<div
				class="col-sm-12 col-md-6 d-flex align-items-center tm-contact-item">
				<a href="tel:0100200340" class="tm-contact-item-link"> <i
					class="fas fa-3x fa-phone mr-4"></i> <span class="mb-0">010-020-0340</span>
				</a>
			</div>
			<div
				class="col-sm-12 col-md-6 d-flex align-items-center tm-contact-item">
				<a href="mailto:info@company.co" class="tm-contact-item-link"> <i
					class="fas fa-3x fa-envelope mr-4"></i> <span class="mb-0">info@company.co</span>
				</a>
			</div>
			<div
				class="col-sm-12 col-md-6 d-flex align-items-center tm-contact-item">
				<a href="https://www.google.com/maps" class="tm-contact-item-link">
					<i class="fas fa-3x fa-map-marker-alt mr-4"></i> <span class="mb-0">Location
						on Maps</span>
				</a>
			</div>
			<div
				class="col-sm-12 col-md-6 d-flex align-items-center tm-contact-item">
				<form action="" method="get">
					<input name="email" type="email" placeholder="Subscribe your email"
						class="tm-input" required />
					<button type="submit" class="btn tm-btn-submit">Submit</button>
				</form>
			</div>
		</div>
	</div>
	<footer class="text-center small tm-footer">
	<p class="mb-0" style="font-size:12px; font-family: Dotum,'돋움',Helvetica;">
	상호: 솔카운셀   |  사업자등록번호: 222-14-48450  |  대표자명: 이솔지</p>
	<p class="mb-0" style="font-size:12px; font-family: Dotum,'돋움',Helvetica;">
	전화번호: 010-8501-6612  |  소재지: 부산광역시 수영구 민락로34번길 32</p>
	<p class="mb-0">
		Copyright &copy; 2019 Company Name - Design: <a rel="nofollow"
			href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
	</p>
	</footer> </section>
	<!-- scripts -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/slick/slick.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/magnific-popup/jquery.magnific-popup.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.singlePageNav.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script>
		function getOffSet() {
			var _offset = 450;
			var windowHeight = window.innerHeight;

			if (windowHeight > 500) {
				_offset = 400;
			}
			if (windowHeight > 680) {
				_offset = 300
			}
			if (windowHeight > 830) {
				_offset = 210;
			}

			return _offset;
		}

		function setParallaxPosition($doc, multiplier, $object) {
			var offset = getOffSet();
			var from_top = $doc.scrollTop(), bg_css = 'center '
					+ (multiplier * from_top - offset) + 'px';
			$object.css({
				"background-position" : bg_css
			});
		}

		// Parallax function
		// Adapted based on https://codepen.io/roborich/pen/wpAsm
		var background_image_parallax = function($object, multiplier, forceSet) {
			multiplier = typeof multiplier !== 'undefined' ? multiplier : 0.5;
			multiplier = 1 - multiplier;
			var $doc = $(document);
			// $object.css({"background-attatchment" : "fixed"});

			if (forceSet) {
				setParallaxPosition($doc, multiplier, $object);
			} else {
				$(window).scroll(function() {
					setParallaxPosition($doc, multiplier, $object);
				});
			}
		};

		var background_image_parallax_2 = function($object, multiplier) {
			multiplier = typeof multiplier !== 'undefined' ? multiplier : 0.5;
			multiplier = 1 - multiplier;
			var $doc = $(document);
			$object.css({
				"background-attachment" : "fixed"
			});
			$(window).scroll(
					function() {
						var firstTop = $object.offset().top, pos = $(window)
								.scrollTop(), yPos = Math
								.round((multiplier * (firstTop - pos)) - 186);

						var bg_css = 'center ' + yPos + 'px';

						$object.css({
							"background-position" : bg_css
						});
					});
		};

		$(function() {
			$('.navbar-collapse').removeClass('hide');
			// Hero Section - Background Parallax
			background_image_parallax($(".tm-parallax"), 0.30, false);
			background_image_parallax_2($("#contact"), 0.80);

			// Handle window resize
			window.addEventListener('resize', function() {
				background_image_parallax($(".tm-parallax"), 0.30, true);
			}, true);

			// Detect window scroll and update navbar
			$(window).scroll(function(e) {
				if ($(document).scrollTop() > 120) {
					$('.tm-navbar').addClass("scroll");
				} else {
					$('.tm-navbar').removeClass("scroll");
				}
			});

			// Close mobile menu after click
			$('#tmNav a').on('click', function() {
				$('.navbar-collapse').removeClass('show');
			})

			$('#snsBtn').on('click', function() {
				if ("${login.mem_id}"==null )
					window.location.href = "${pageContext.request.contextPath}/member/login";
				else
					window.location.href = "${pageContext.request.contextPath}/board/timeline";
			})

			// Scroll to corresponding section with animation
			$('#tmNav').singlePageNav();

			// Add smooth scrolling to all links
			// https://www.w3schools.com/howto/howto_css_smooth_scroll.asp
			$("#headerBtn").on('click', function(event) {
				if (this.hash !== "") {
					event.preventDefault();
					var hash = this.hash;

					$('html, body').animate({
						scrollTop : $(hash).offset().top
					}, 400, function() {
						window.location.hash = hash;
					});
				} // End if
			});

			// Pop up
			$('.tm-gallery').magnificPopup({
				delegate : 'a',
				type : 'image',
				gallery : {
					enabled : true
				}
			});

			// Gallery
			$('.tm-gallery').slick({
				dots : true,
				infinite : false,
				slidesToShow : 5,
				slidesToScroll : 2,
				responsive : [ {
					breakpoint : 1199,
					settings : {
						slidesToShow : 4,
						slidesToScroll : 2
					}
				}, {
					breakpoint : 991,
					settings : {
						slidesToShow : 3,
						slidesToScroll : 2
					}
				}, {
					breakpoint : 767,
					settings : {
						slidesToShow : 2,
						slidesToScroll : 1
					}
				}, {
					breakpoint : 480,
					settings : {
						slidesToShow : 1,
						slidesToScroll : 1
					}
				} ]
			});
		});
	</script>



</body>
</html>