<%@page import="model.BranchDto"%>
<%@page import="model.LeagueDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>

<%@ page import="java.util.Date"%>
<%
String url = request.getServletPath();
session.setAttribute("url",url);
	//2020_01_02 수정부분
	String includeurl = "header.jsp";
	String uss = (String) session.getAttribute("id");
	String log = "로그인";
	if (uss == null)
		uss = "GUEST";
	else {
		log = "로그아웃";
		includeurl = "sign_login.jsp";
	}
	//수정부분 끝
	//2020.01.14 로그인 id 수정
	String yid = (String) session.getAttribute("id");
%>

<%
	ArrayList<BranchDto> leaguebranchlist = (ArrayList<BranchDto>)request.getAttribute("LeagueBranchList");
	request.setAttribute("LeagueBranchList", leaguebranchlist);
%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="Generator" content="EditPlus®">
<meta name="Author" content="">
<meta name="Keywords" content="">
<meta name="Description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>league_join_step1</title>

<link rel="stylesheet" href="css/boardpop.css">


<link rel="stylesheet" href="css/footer.css">
<link rel="stylesheet" href="css/borderRightLeft.css" media="screen">
<!-- 광호Q&A -->
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!--용병리스트 게시판 css파일 수정 2020.01.08-->
<link rel="stylesheet" href="yonglist_1_body.css">
<!----------------------------바디 스타일------------------------------------>

<!--기본적인 body등의 css-->
<link rel="stylesheet" href="css/basicStyle.css" media="screen">
<link rel="stylesheet" href="css/navmid33.css">

<!--서브메뉴부르는css-->
<link rel="stylesheet" href="css/style2.css" media="screen">

<!--배너2 자동슬라이드-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.infinitecarousel.js"></script>


<!----------------------------서브메뉴마우스오버기능-------------------------->
<link rel="stylesheet" type="text/css" href="css/subMenuMouseOver.css">
<!-- 20200116 용병 버튼 크기 조절 by 문경이형 -->
<link rel="stylesheet" href="css/signbutton.css"> 
<!----------------------------회원가입스크립트랑 스타일(따로 빼면 에러)-------------------------->
<script type='text/javascript'>
	$(function() {
		$('#forgot_username_link').tipsy({
			gravity : 'w'
		});
	});
</script>
<link href="css/front.css" media="screen, projection" rel="stylesheet" type="text/css">
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
		/* $(document).mouseup(function(e) {
			if ($(e.target).parent("a.signin").length == 0) {
				$(".signin").removeClass("menu-open");
				$("fieldset#signin_menu").hide();
			}
		}); */

	});
</script>

<!----------------------------회원가입스크립트랑 스타일여기까지------------------------------------>
<script>
	/*스크롤 내리면 메뉴 위치 이동하는 기능------따로빼면 작동xxxxxx*/
	$(function() {
		var shrinkHeader = 30;
		var shrinkhollow = 465;
		$(window).scroll(function() {
			var scroll = getCurrentScroll();
			if (scroll >= shrinkHeader) {
				$('#navtop').addClass('shrink');
			} else {
				$('#navtop').removeClass('shrink');
			}
			if (scroll >= shrinkhollow) {
				$('#navtop').addClass('shrinkhollow');
			} else {
				$('#navtop').removeClass('shrinkhollow');
			}
		});
		function getCurrentScroll() {
			return window.pageYOffset || document.documentElement.scrollTop;
		}
	});
</script>
<!--2020.01.09Overray css추가 -->
<link rel="stylesheet" href="css/qnaOverray.css">
<!----------------------------오버레이 화면 띄우는 스크립트------------------------------------>
<script>						
	function selectOne(index,yid) {
		$.ajax({
		type:"get",
		
		url:"./yongSelectOne.jsp",       
		data:{
	
			index:index,
			yid:yid
		},	
		success:whenSuccess2,
		error:whenError2
		});
	}
		function whenSuccess2(resdata){
			console.log(resdata);
			$("#innerpop").html(resdata);
		}
		function whenError2(){
			alert("리스트에러");
		}
</script>
<style>

.h_tit {
    position: relative;
    margin-bottom: 45px;
    padding-bottom: 24px;
    font-size: 60px;
    font-family: 'NanumBarunGothicL';
    line-height: 60px;
    text-align: center;
}
.h_tit {
}
h1, h2, h3, h4, h5, h6 {
    font-weight: normal;
}
.h_tit:after {
    content: "";
    display: block;
    position: absolute;
    bottom: 0;
    left: 50%;
    margin-left: -49px;
    width: 98px;
    height: 2px;
    background: #bfc4cc;
}
.rese_wrap .rese_start {
    margin: 0 auto;
    max-width: 800px;
}
.rese_wrap .rese_start .tit {
    padding-left: 113px;
    background: #2c3c57 url(img/bg_rese_start.png) no-repeat 0 0;
    color: #fff;
    font-size: 28px;
    line-height: 113px;
    text-align: center;
    border-radius: 15px 15px 0 0;
    letter-spacing: -0.4px;
}
.rese_wrap .rese_start .start_wrap {
    padding: 93px 0 87px 0;
    border: 2px solid #bfc4cc;
    border-top: 0;
    background: #f2f2f2;
    border-radius: 0 0 15px 15px;
}
.rese_wrap .rese_start .start_wrap .cont {
    margin: 0 auto;
    width: 390px;
}
.rese_wrap .rese_start .start_wrap .cont .select:first-child {
    margin-top: 0;
}
.rese_wrap .rese_start .start_wrap .cont .select {
    margin-top: 14px;
    height: 47px;
}
.select {
    display: inline-block;
    position: relative;
    padding: 0;
    height: 40px;
    border: 1px solid #e0e0e0;
    background: #fff;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
}
.select:after {
    content: "";
    display: block;
    position: absolute;
    right: 12px;
    top: 50%;
    margin-top: -4px;
    width: 13px;
    height: 8px;
    background: url(img/select_arrow.png) no-repeat center center;
    background-size: 11px auto;
}
.rese_start{
	margin: 0;
    padding: 0;
}
.tit{
	margin: 0;
}
.rese_wrap .rese_start .start_wrap .cont .select label {
    line-height: 45px;
}
.select label {
    position: absolute;
    top: 0px;
    right: 20px;
    bottom: 0;
    left: 10px;
    color: #404040;
    font-size: 16px;
    line-height: 38px;
    text-align: left;
}
.rese_wrap .rese_start .start_wrap .cont .select select {
    height: 45px;
    line-height: 45px;
}
.select select {
    position: relative;
    z-index: 1;
    padding: 0 4px;
    width: 100%;
    height: 38px;
    line-height: 38px;
    vertical-align: top;
    
    filter: alpha(opacity=0);
}
select {
    margin: 0;
    border: 1px solid #999;
    line-height: 22px;
    height: 22px;
    color: #a6a6a6;
    font-weight: bold;
}
option {
    font-weight: normal;
    display: block;
    white-space: pre;
    min-height: 1.2em;
    padding: 0px 2px 1px;
}
.rese_wrap .rese_start .start_wrap .cont .btn_wrap {
    margin-top: 34px;
}
.btn_wrap {
    margin-top: 20px;
    text-align: center;
    font-size: 0;
    line-height: 0;
}
.btn_wrap:after {
    content: "";
    display: block;
    clear: both;
}
.rese_wrap .rese_start .start_wrap .cont .btn_wrap .btn_big {
    width: 100%;
}

.btn_wrap .btn_base:first-child, .btn_wrap .btn_big:first-child {
    margin-left: 0 !important;
}
.btn_wrap .btn_base, .btn_wrap .btn_big {
    margin-left: 10px;
}
a:visited {
    text-decoration: none;
}
.btn_big {
    position: relative;
    display: inline-block;
    padding: 0 15px;
    width: 333px;
    background: #2c3c57;
    color: #fff !important;
    font-size: 23px;
    line-height: 80px;
    text-align: center;
    vertical-align: middle;
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-transition: all 0.25s ease-out;
    -moz-transition: all 0.25s ease-out;
    -ms-transition: all 0.25s ease-out;
    -o-transition: all 0.25s ease-out;
    transition: all 0.25s ease-out;
}
a {
    color: #000;
    text-decoration: none;
}
a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}

</style>
</head>
<body>
	<!-- 유즈빈 사용 -->
	
	
	
	<header>
		<jsp:include page="<%=includeurl%>" />
	</header>
	<div id="mainleft">


		<div id="leftbanner">
			<div id="banner1">
				<a href="introduce_page.jsp" >
					<img src="img/20191211.jpg" width="100%" height="100%" />
				</a>
			</div>

			<div id="banner3">
				<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d25325.265446899888!2d127.02924799651784!3d37.492391917303266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca5bed583f92d%3A0xc93c837d2875ade6!2z7ZKL7IK07J6l!5e0!3m2!1sko!2skr!4v1575961834128!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border: 0;" allowfullscreen=""></iframe>
			</div>
		</div>
	</div>
	<section id="main">
		<section id="mainright">
			<div id="matList">
			
				<div class="cbox">
					<div class="rese_wrap">
				<h3 class="h_tit">지점선택</h3>
				<div class="rese_start">
					<p class="tit">선수 등록에 앞서 지점을 선택해 주세요.</p>
					<div class="start_wrap">
						<div class="cont">
							<form id="reg_form" name="reg_form" method="post" action="league.do?command=league_join_step2">
							<span class="select" style="width:100%">
								<label for="select01">지점선택</label>
								<select id="select01" name="branch_name" class="select_box">
									<option value="">지점선택</option>
									
									<%for(int i=0; i<leaguebranchlist.size(); i++){ %>
										<option value=<%=leaguebranchlist.get(i).getBranch_name() %>><%=leaguebranchlist.get(i).getBranch_name() %></option>
									<%} %>
										
										
								</select>
								<input type=hidden id="branchNo" name="branchNo" value="" />
								<input type=hidden id="id" name="id" value="<%=uss %>" />
							</span>
							</form>
							<div class="btn_wrap">
								<a href="javascript:void(0);" onClick="leaguesubmit()" class="btn_big">선수 등록</a>
							</div>
						</div>
					</div>
					<script>
						function leaguesubmit() {
							if($("#branchNo").val()==""){
								alert("구장을 다시 선택해주세요.");
								$("#select01 option:eq(0)").attr("selected","selected");
							}else{
								reg_form=document.getElementById("reg_form");
								reg_form.submit();
								
							}
							
							
						}
						$(document).ready(function() {
							$("#select01").change(function(e) {
								var x = this.selectedIndex;
								var y = this.options;
								var idx = y[x].index;
								console.log("선택한 index:"+idx);
								var branchNoList = [];
								<%for(int i=0; i<leaguebranchlist.size(); i++){ %>
									branchNoList[<%=i%>]='<%=leaguebranchlist.get(i).getBranch_no()%>'
								<%}%>
								console.log("지점넘버 리스트:"+branchNoList);
								$("#branchNo").val(branchNoList[idx-1]);
							});
						});
					</script>
				</div>

			</div>
				</div>
			</div>
			
		</section>
	</section>
	<footer id="footer">
		<jsp:include page="Footer.jsp" />
	</footer>
</body>
</html>
