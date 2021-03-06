<%@page import="model.TeamDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String url = request.getServletPath();
	session.setAttribute("url", url);
	String includeurl = "adminH.jsp";
	String logid = (String) session.getAttribute("admin_id");
	//out.println(uss);
	String log = "로그인";
	if (logid == null)
		logid = "GUEST";
	else {
		log = "로그아웃";
		includeurl = "adminH.jsp";
	}
	//수정부분 끝
%>

<%
	String admin_id = (String) session.getAttribute("admin_id");
	String admin_name = (String) session.getAttribute("admin_name");
%>
<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<title>글쓰기</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/js/datepicker.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/common/form_check.js"></script>
<link rel="stylesheet" type="text/css" href="css\join.css" />
<link rel="stylesheet" href="css/galboardstyle.css">
<link rel="stylesheet" href="css/classic.css">
<link rel="stylesheet" href="css/classic.date.css">
<link rel="stylesheet" href="css/signbutton.css">
<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/signformrelocation.css">
<link rel="stylesheet" href="css/classic.time.css">
<link rel="stylesheet" href="css/style2.css" media="screen">
<link rel="stylesheet" href="css/materialFormStyles2.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<link
	href="https://fonts.googleapis.com/css?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<script src="js/materialForm.js"></script>



<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/navmid33.css">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>

<!--2020.01.03 추가 css 분리-->
<link rel="stylesheet" href="css/logform.css" media="screen">
<!--2020.01.03 추가 javascript.가입기능 분리-->
<script type="text/javascript" src="js/signjs.js"></script>
<!----------------------------alam form 추가 2020.01.06-------------------------->
<script type="text/javascript">
	$(document).ready(function() {
		$(".mypage").click(function(e) {
			e.preventDefault();
			$("fieldset#mypage_menu").toggle();
			$(".mypage").toggleClass("menu-open");
		});
		$("fieldset#mypage_menu").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if ($(e.target).parent("a.mypage").length != 0) {
				$(".mypage").removeClass("menu-open");
				$("fieldset#mypage_menu").hide();
			}
		});

	});
</script>
<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>
<!----------------------------서브메뉴마우스오버기능-------------------------->
<link rel="stylesheet" type="text/css" href="css/subMenuMouseOver.css">
<!----------------------------회원가입스크립트랑 스타일(따로 빼면 에러)-------------------------->
<script type='text/javascript'>
	$(function() {
		$('#forgot_username_link').tipsy({
			gravity : 'w'
		});
	});
</script>
<link href="css/front.css" media="screen, projection" rel="stylesheet"
	type="text/css">
<script src="js/jquery2.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$(".signin").click(function(e) {
			e.preventDefault();
			$("fieldset#signin_menu").toggle();
			$(".signin").toggleClass("menu-open");
		});

		$("fieldset#signin_menu").mouseup(function() {
			return false
		});
		$(document).mouseup(function(e) {
			if ($(e.target).parent("a.signin").length == 0) {
				$(".signin").removeClass("menu-open");
				$("fieldset#signin_menu").hide();
			}
		});

	});
</script>
<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>

<!-- -----------------다음 주소 api ----------------------------------------->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- ------------------------------------------------------------------------- -->
<!-- -------------------------ID 중복확인에 대한 ajax--------------------------------- -->
<script type="text/javascript">
	$(document).ready(function() {
		$("#id").blur(function() {
			var idReg = /^[a-zA-z]+[a-zA-z0-9]{5,13}$/g;
			if (idReg.test(join.id.value))
				callAjax();
			else {
				$("#ajaxReturn").html("6~14자 사이의 영문 대소문자와 숫자만 사용가능합니다");
			}
		});
		$("#name").blur(function() {
			if (join.name.value.length != 0)
				$("#nameReturn").html("");
			else {
				$("#nameReturn").html("이름을 입력해주세요.");
			}
		});

		$("#hp2").blur(function() {
			if (join.hp2.value.length != 0)
				$("#hpReturn").html("");
			else {
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#hp3").blur(function() {
			if (join.hp3.value.length != 0)
				$("#hpReturn").html("");
			else {
				$("#hpReturn").html("휴대폰번호를 입력하세요.");
			}
		});
		$("#em1").blur(function() {
			if (join.em1.value.length != 0)
				$("#emReturn").html("");
			else {
				$("#emReturn").html("이메일을 입력하세요.");
			}
		});
	});

	function callAjax() {

		$.ajax({
			type : "post",
			url : "./confirmId.jsp",
			data : {

				id : $('#id').val()
			},
			success : whenSuccess,
			error : whenError
		});
	}
	var confirmid = "";
	function whenSuccess(resdata) {

		var x = document.getElementById("ajaxReturn");
		$("#ajaxReturn").html(resdata);

		if (resdata.includes("이미 사용중인 ID입니다")) {
			document.join.hidden.value = "0";
			x.style.color = "red";
		}

		else {
			document.join.hidden.value = "1";
			x.style.color = "blue";
			confirmid = join.id.value;

		}
	}
	function whenError() {
		alert("Error");
	}

	//	<!--js 파일 분리가 안돼서 어쩔수없이 이곳에 사용한 용병가입 창 js 파일 2020.01.09           + 유효성 검사 2020.01.16 by 종혁형-->
	function yongjoinsubmit() {
		var getName = (/^[가-힣]+$/);
		var date_pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		var regPhone2 = /(\d{3}|\d{4})$/;
		var regPhone3 = /(\d{4}$)/;
		var yBranchlen = yongjoin.yBranch.value.length
		var yGroundlen = yongjoin.yGround.value.length
		var yMemberlen = yongjoin.yMember.value.length
		var yTel1len = yongjoin.yTel1.value.length
		var yTel2len = yongjoin.yTel2.value.length
		var yTel3len = yongjoin.yTel3.value.length
		var yMatchdatelen = yongjoin.yMatchdate.value.length
		var yTimelen = yongjoin.yTime.value.length
		var yApplylen = yongjoin.yApply.value.length
		var yTeamlen = yongjoin.yTeam.value.length

		if (yBranchlen <= 0) {
			alert("지점을 선택하세요.");
			yongjoin.yBranch.focus();

		} else if (yGroundlen <= 0) {
			alert("구장을 선택하세요.");
			yongjoin.yGround.focus();
		} else if (yMemberlen <= 1 || !getName.test(yongjoin.yMember.value)) {
			alert("이름을 정확히 입력하세요.ex)홍길동");
			yongjoin.yMember.focus();
		} else if (yTel1len <= 0 || !regPhone2.test(yongjoin.yTel2.value)
				|| !regPhone3.test(yongjoin.yTel3.value)) {
			alert("전화번호를 입력하세요.ex)010-5555-6666");
			yongjoin.yTel1.focus();
		} else if (!date_pattern.test(yongjoin.yMatchdate.value)) {
			alert("매치일정을 정확히 입력하세요.ex)2020-08-20");
			yongjoin.yMatchdate.focus();
		} else if (yTimelen <= 0) {
			alert("시간을 선택하세요.");
			yongjoin.yTime.focus();
		} else if (yApplylen <= 0) {
			alert("마감여부를 선택하세요.");
			yongjoin.yApply.focus();
		} else if (yTeamlen <= 0) {
			alert("팀 수준을 선택하세요.");
			yongjoin.yTeam.focus();
		} else {
			document.yongjoin.submit();
		}

	}
</script>

</script>
<style>
.formtotalsize {
	height: 450px;
}

.contentbox {
	width: 730px;
	resize: none;
	height: 440px;
}

.buttonmargin {
	margin-left: 45px;
	margin-top: 40px;
}

.buttongal {
	width: 120px;
	font-size: 23px;
	letter-spacing: 5px;
}
</style>
</head>
<body>



	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>
	<div id="mainleft" style="margin-right: 40px">


		<div id="leftbanner">
		
		</div>


	</div>
	<section id="main">


		<section id="mainright">
			<div id="matList">

				<div class="container margin1 fontsize" id="formOutterWrapper">
					<center>
						<div class="writeboardtitle">게시글 작성</div>
					</center>
					<div class="container" id="formInnerWrapper">
						<form action="admin_notice.adm?command=notice_insert"
							method="post" name="notice" role="form">
							<div class="form-group margin2">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<label class="labels" for="n_title"
										style="font-size: 16px; letter-spacing: normal;">제목</label> <input
										type="text" class="formInput" id="n_title" name="n_title"
										style="letter-spacing: normal; font-size: 14px;">
								</div>

							</div>
							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-1" style="">

									<label class="labels"
										style="font-size: 16px; letter-spacing: normal;"> 선택</label>
								</div>
								<div class="col-xs-6" style="">
									<select id="n_state" name="n_state">
										<option value="">선택</option>
										<option>공지사항</option>
										<option>팀갤러리 공지사항</option>
										<option>팀게시판 공지사항</option>
							
									</select>
								</div>
							</div>

							<div class="form-group formtotalsize">
								<div class="col-xs-2"></div>
								<div class="col-xs-8">
									<textarea name="n_contents" id="n_contents" class="contentbox"
										placeholder="내용을 입력하세요."
										style="letter-spacing: normal; font-size: 14px;"></textarea>
								</div>

							</div>

							<div class="form-group">
								<div class="col-xs-2"></div>
								<div class="col-xs-8"></div>
							</div>

							<div class="form-group">
								<div class="col-xs-4"></div>
								<div class="col-xs-4 buttonmargin">

									<input type="button" onclick="galwrite()" value="등록"
										class="signbutton signbutton5 buttongal"
										style="margin-top: 13px; font-size: 15px;"> <input
										type="button" value="취소"
										class="signbutton signbuttoncancel buttongal margin3"
										style="font-size: 15px; margin-top: 13px;"
										onClick="script: location.href='gal_board_list.jsp'">
								</div>
							</div>

							<input type="hidden" value="<%=admin_name%>" name="admin_name" />
						</form>
						<script>
							function galwrite() {
								notice.submit();
							}
						</script>
					</div>
				</div>
				<script src="https://code.jquery.com/jquery-2.2.3.min.js"
					integrity="sha256-a23g1Nt4dtEYOj7bR+vTu7+T8VP13humZFBJNIYoEJo="
					crossorigin="anonymous"></script>
				<script src="js/materialForm.js"></script>
			</div>
			<!-- include libraries(jQuery, bootstrap) -->
			<link
				href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css"
				rel="stylesheet">
			<script
				src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
			<script
				src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

			<!-- include summernote css/js-->
			<link
				href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css"
				rel="stylesheet">
			<script
				src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
			<script>
				$(document).ready(function() {
					$('#n_contents').summernote({
						height : 300, // set editor height
						minHeight : null, // set minimum height of editor
						maxHeight : null, // set maximum height of editor
						focus : true
					// set focus to editable area after initializing summernote
					});
				});
			</script>
		</section>


	</section>



	
</body>
</html>
