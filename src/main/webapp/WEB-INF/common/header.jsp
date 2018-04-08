<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/header_khj.css?ver=1">

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>


</head>
<body>

	<div class="wrap123">
		
	
		<!-- =======================================여백공간 주는 부분======================================= -->
		<div class="head"></div>
		<!-- ======================================= 로고,로그인 헤드======================================== -->
		<div class="container">
			<!-- =======================================sns 헤드======================================== -->
			<div class="extra1">
				<center>
					<a href="<%=request.getContextPath()%>/view/loginForm.jsp"
						class="loginForm" ><span>S2APP</span></a>
					<a href="<%=request.getContextPath()%>/view/inputForm"
						class="inputForm" ><span>FACEBOOK</span></a>
					<a href="<%=request.getContextPath()%>/view/myPage"
						class="mycgv required-login" data-url="/user/mycgv/"
						> <span>INSTA</span></a>
				</center>
			</div>
			<!-- =======================================로고======================================== -->
			<div class="content" style="text-align: center;">
				<a href="<c:url value= "/board/main"/>"> <img
					src="<%=request.getContextPath()%>/common/image/mainImage/logo.png"></a>
			</div>
			<!-- =======================================로그인 헤드======================================== -->
			<div class="extra2" style="text-align: center;">
				<c:if test="${memId!=null}">
					<a href="logoutPro" >로그아웃</a>
				</c:if>
				<c:if test="${memId==null}">
					<a href="<%=request.getContextPath()%>/member/loginForm"
						class="loginForm"><span>로그인</span></a>
				</c:if>
				<a href="<%=request.getContextPath()%>/member/inputForm"
					class="inputForm" ><span>회원가입</span></a>

				<c:if test="${memId!=null}">
					<a href="<%=request.getContextPath()%>/member/myPage"
						class="myPage"> 
						<span>MY S2BOX</span></a>
				</c:if>
				<c:if test="${memId==null}">
					<a href="<%=request.getContextPath()%>/member/loginForm"
						class="loginForm">
						<span>MY S2BOX</span></a>
				</c:if>


				<a href="<%=request.getContextPath()%>/vip/vip_lounge"
					class="vip_lounge" >
					<span>VIP LOUNGE</span></a> 
					<a href="<%=request.getContextPath()%>/board/customer"
					class="customer" ><span>고객센터</span></a>
			</div>
		</div>
		<!-- =======================================메뉴 헤드======================================== -->
		<div class="container2">
			<div class="extra1_2"></div>
			<div class="content2">
				<div class="dropdown" >
					<a class="dropbtn">영화</a>
					<div class="dropdown-content" style="height: 140px;">
						 <a href="<%=request.getContextPath()%>/movie/movieChart" >무비차트</a> 
						<a href="<%=request.getContextPath()%>/movie/movieTrailer">트레일러</a> 
						<a href="<%=request.getContextPath()%>/movie/movieFinder" >무비파인더</a>
						<a href= "<c:url value= "/evaluation/Evaluation_form"/>">평점</a>

					</div>
				</div>
				<div class="dropdown">
					<a class="dropbtn">예매</a>
					<div class="dropdown-content"style="height: 80px;">
						<a href="<c:url value= "/reservation/currentList"/>" style="margin-top: 5px;">빠른예매</a> 
						<a href="#">상영시간표</a> 
					</div>
				</div>
				<div class="dropdown">
					<a class="dropbtn">극장</a>
					<div class="dropdown-content"style="height: 80px;">
						<a href="<%=request.getContextPath()%>/event/gotheater"style="margin-top: 5px;">극장</a> 
						<a href="#">특별관</a> 
					</div>
				</div>
				<div class="dropdown">
					<a class="dropbtn">컬쳐</a>
					<div class="dropdown-content"style="height: 80px;">
						<a href="<%=request.getContextPath()%>/event/popcorn"style="margin-top: 5px;">티켓&팝콘</a> 
						<a href="#">메거진</a>
					</div>
				</div>
			</div>
			<!-- =======================================검색 헤드======================================== -->
			<div class="extra2_2">
				<input type="text" title="통합검색" id="header_keyword" minlength="2"
					maxlength="20" style="margin-top: 5px;"> <a> <img
					src="<%=request.getContextPath()%>/common/image/mainImage/q.png"
					style="height: 22px; width: 21 px;"></a>
			</div>
		</div>
	</div>
	<div id="quick" class="quick">
		<center>
			<button type="button" style=" margin-top: 5%;">영화차트</button>
			<button type="button">영화예매</button>
			<button type="button">login</button>
			<button type="button">MyPage</button>
			<button type="button">고객센터</button>
		</center>
	</div>


	<script type="text/javascript">
		//마지막 스크롤 TOP 위치
		var lastScrollY = 0;
		$(document).ready(function() {
			//setInterVal(사용할 함수, 1/1000초)  즉 quick함수를 1/1000초마다 실행
			setInterval(quick, 1);
		});
		function quick() {
			//현재 스크롤바 top 위치, .scrollTop() - 선택한 element의 scroll 가능한 영역에서 가장 위쪽 위치
			currentY = $(window).scrollTop();
			//위치가 틀린 경우
			if (currentY != lastScrollY) {
				//percent=움직임속도 * (현재 scrollTop위치) - (마지막 scrollTop위치) 
				percent = 0.05 * (currentY - lastScrollY);
				//percent가 0보다 크면 수를 올림  작으면 수를 내림. 
				percent = (percent > 0 ? Math.ceil(percent) : Math
						.floor(percent));
				//quick의 style:top을 현재의 top에서 percent를 더한 값(음수라면 빼)으로 바꿔준다. 
				$("#quick").css("top",
						parseInt($("#quick").css("top")) + percent);
				//현재 위치를 lastScrollY에 저장해준다.
				lastScrollY = lastScrollY + percent;
			}
		}
	</script>


</body>


</html>