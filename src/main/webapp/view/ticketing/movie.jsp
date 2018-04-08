<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/semantic/semantic.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"
	integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/semantic/semantic.js"></script> --%>

<style type="">
* {
	box-sizing: border-box;
}

body {
	font-family: Verdana, sans-serif;
	margin: 0
}
/* ===============배너 스타일 */

/* ===============차트 제목, 예고편 제목  스타일 */
.rown {
	background-color: black;
}

/* 맨 위에 버튼 */
.t2 {
	margin-top: 80px;
	margin-left: 10%;
	margin-right: 10%;
	height: 60px;
	border-bottom-style: double;
	border-bottom-width: 5px;
	border-color: gray;
	margin-bottom: 2px;
}
/* 영화 select 부분  */
.t3 {
	width: 20%;
	float: left;
	margin-left: 10%;
	height: 500px;
	margin-right: 2px;
	background-color: #FEF1F2;
}

.t3-1 {
	height: 25px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
	background-color: #30204B;
	color: #F6DEDE;
	text-align: center;
}

.t3-2 {
	height: 475px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
}
/* 극장select 부분 */
.t4 {
	width: 22%;
	float: left;
	height: 500px;
	margin-right: 2px;
	background-color: #FEF1F2;
}

.t4-1 {
	height: 25px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
	background-color: #30204B;
	border-color: silver;
	color: #F6DEDE;
	text-align: center;
}

.t4-2 {
	height: 475px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
}
/* 날짜 select 부분 */
.t5 {
	width: 8%;
	float: left;
	height: 500px;
	margin-right: 2px;
	background-color: #FEF1F2;
}

.t5-1 {
	height: 25px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
	background-color: #30204B;
	border-color: silver;
	color: #F6DEDE;
	text-align: center;
}

.t5-2 {
	height: 475px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
}
/*  시간 select 부분 */
.t6 {
	width: 30%;
	float: left;
	height: 500px;
	background-color: #FEF1F2;
}

.t6-1 {
	height: 25px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
	background-color: #30204B;
	border-color: silver;
	color: #F6DEDE;
	text-align: center;
}

.t6-2 {
	height: 475px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
}

.rown2:after {
	content: "";
	display: table;
	clear: both;
}
/* ===============예고편  스타일 */
.t7 {
	width: 100%;
	height: 100px;
	background-color: gray;
	margin-top: 2px;
}

.tt0 {
	float: left;
}

.tt1 {
	float: left;
	margin-top: 6px;
	height: 430px;
	max-height: 430px
}

button {
	cursor: pointer;
	font-family: Tahoma, Geneva, sans-serif;
	text-decoration: none;
	background-color: white;
	border-style: 1px solid;
	border-color: gray;
}

button:hover {
	opacity: 0.8;
	color: #5D3A74;
	border-style: 1px solid;
	border-color: #492A5D;
}

button:active {
	background-color: red;
}

</style>
</head>
<body>
<body>
	<div class="t2">
		<button type="button" style="margin-left: 1%; float: right;">예매
			가이드</button>
		<button type="button" style="margin-left: 1%; float: right;">제휴
			할인혜택</button>
		<button type="button" style="margin-left: 1%; float: right;">상영시간표</button>
		<button type="button" style="float: right;">다시 예매하기</button>
	</div>
	<div class="rown2">

		<!-- ================영화 부분 입니다아아아아================================= -->
		<div class="t3">
			<div class="t3-1">영화</div>
			<div class="t3-2">
				<div>
					<div style="width: 100%;">
						<center>
							<button type="button" onclick="ShowTabex('0')"
								style="width: 25%;">전체</button>
							<button type="button" onclick="ShowTabex('1')"
								style="width: 38%;">아트하우스</button>
							<button type="button" onclick="ShowTabex('2')"
								style="width: 30%;">특별관</button>
						</center>
					</div>
				</div>
				<div style="text-align: center;">
					<!-- ==================='전쳬' div 안으로============== -->
					<div id="tab_0" style="width: 100%; display: block;">

						<div style="width: 100%; margin-top: 5px;">
							<center>
								<button onclick="ShowTabex3('0')"
									style="cursor: pointer; width: 38%;">예매율 순</button>
								<button onclick="ShowTabex3('1')"
									style="cursor: pointer; width: 38%;">가나다 순</button>
							</center>
						</div>
						<div style="text-align: center;">
							<div id="tab3_0" style="width: 100%; display: block;">예매율 순
								보여짐</div>
							<div id="tab3_1" style="width: 100%; display: none;">가나다 순
								보여짐</div>
						</div>
					</div>

					<div id="tab_1" style="width: 100%; display: none;">아트하우스</div>
					<div id="tab_2" style="width: 100%; display: none;">특별관</div>
				</div>
			</div>
		</div>
		<!-- ================극장 부분 입니다아아아아================================= -->
		<div class="t4">
			<div class="t4-1">극장</div>
			<div class="t4-2">
				<div>
					<div style="width: 100%;">
						<center>
							<button type="button" onclick="ShowTabex2('0')"
								style="width: 25%;">전체</button>
							<button type="button" onclick="ShowTabex2('1')"
								style="width: 38%;">아트하우스</button>
							<button type="button" onclick="ShowTabex2('2')"
								style="width: 30%;">특별관</button>
						</center>
					</div>
				</div>
				<div
					style="text-align: center; height: 300px; margin-top: 6px; margin-left: 6px;">
					<div id="tab2_0" style="width: 100%; display: block;">

						<div class="tt0" style="width: 45%; margin-top: 5px;">
							<center>
								<button type="button" onclick="ShowTabex4('0')"
									style="width: 100%; height: 35px; font-size: 12px;">서울(29)</button>
								<button type="button" onclick="ShowTabex4('1')"
									style="width: 100%; height: 35px; font-size: 12px;">경기(34)</button>
								<button type="button" onclick="ShowTabex4('2')"
									style="width: 100%; height: 35px; font-size: 12px;">인천(9)</button>
								<button type="button" onclick="ShowTabex4('3')"
									style="width: 100%; height: 35px; font-size: 12px;">강원(4)</button>
								<button type="button" onclick="ShowTabex4('4')"
									style="width: 100%; height: 35px; font-size: 12px;">대전/충청(15)</button>
								<button type="button" onclick="ShowTabex4('5')"
									style="width: 100%; height: 35px; font-size: 12px;">대구(9)</button>
								<button type="button" onclick="ShowTabex4('6')"
									style="width: 100%; height: 35px; font-size: 12px;">부산/울산(12)</button>
								<button type="button" onclick="ShowTabex4('7')"
									style="width: 100%; height: 35px; font-size: 12px;">경상(14)</button>
								<button type="button" onclick="ShowTabex4('8')"
									style="width: 100%; height: 35px; font-size: 12px;">광주/전라/제주(17)</button>
							</center>
						</div>
						<div class="tt1" style="width: 50%; margin-left: 6px;">
							<div id="tab4_0"
								style="width: 100%; height: 100%; overflow-y: scroll;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">강남</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">강동</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">강변</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">구로</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">군자</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대학로</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">명동</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">명동역</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">목동</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">미아</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">불광</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">상봉</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">상암</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">성신여대</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">송파</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">신촌아트레온</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">씨네스셰프
									압구정</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">씨네스셰프
									용산아이파크몰</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">압구정</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">여의도</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">영등포</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">왕십리</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">용산
									아이파크몰</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">중계</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">천호</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">청담</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">피카디리1958</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">하계</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">홍대</button>

							</div>
							<div id="tab4_1"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">경기광주</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">광명철산</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">구리</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">김포</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">김포운양</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">김포풍무</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">동백</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">동수원</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">동탄</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">범계</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">부천</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">부천역</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">북수원</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">신본</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">서현</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">소풍</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">수원</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">시흥</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">야탑</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">역곡</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">오리</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">의정부</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">의정부태흥</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">이천</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">일산</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">죽전</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">파주문산</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">판교</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">평택</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">평택비전</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">평택소사</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">화정</button>

							</div>
							<div id="tab4_2"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">계양</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">남주안</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">부평</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">얀수역</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">인천</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">인천공항</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">인천논현</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">인천연수</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">주안역</button>
							</div>
							<div id="tab4_3"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">강릉</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">원주</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">춘천</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">춘천명동</button>
							</div>
							<div id="tab4_4"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">당진</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대전</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대전가오</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대전탄방</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대전터미널</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">서산</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">세종</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">유성노은</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">유성온천</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">천안</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">천안펜타포트</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">청주지웰시티</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">청주(북문)</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">청주(서문)</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">홍성</button>
							</div>
							<div id="tab4_5"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대구</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대구수성</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대구스타디움</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대구아카데미</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대구월성</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대구이시아</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대구칠곡</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대구한일</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대구연대</button>
							</div>
							<div id="tab4_6"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">남포</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대연</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대한</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">동래</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">서면</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">센텀시티</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">씨네드셰프
									센텀시티</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">아시아드</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">울산삼산</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">하단</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">해운대</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">화명</button>
							</div>
							<div id="tab4_7"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">거제</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">구미</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">김천율곡</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">김해</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">김해장유</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">마산</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">북포항</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">안동</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">양산물금</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">진주</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">창원</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">창원더시티</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">통영</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">포항</button>
							</div>
							<div id="tab4_8"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">광양</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">광양아울렛
								</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">광주상무</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">광주용봉</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">광주첨단</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">광주충장로</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">광주터미널</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">나주</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">목포</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">순천</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">여수웅천</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">익산</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">전주고사</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">전주효자</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">정읍</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">제주</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">제주노형</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">화명</button>
							</div>

						</div>
					</div>
					<div id="tab2_1" style="width: 100%; display: none;">
						<div class="tt0" style="width: 45%; margin-top: 5px;">
							<center>
								<button type="button" onclick="ShowTabex5('0')"
									style="width: 100%; height: 35px; font-size: 12px;">서울(9)</button>
								<button type="button" onclick="ShowTabex5('1')"
									style="width: 100%; height: 35px; font-size: 12px;">경기(3)</button>
								<button type="button" onclick="ShowTabex5('2')"
									style="width: 100%; height: 35px; font-size: 12px;">인천(1)</button>
								<button type="button" onclick="ShowTabex5('3')"
									style="width: 100%; height: 35px; font-size: 12px;">강원(0)</button>
								<button type="button" onclick="ShowTabex5('4')"
									style="width: 100%; height: 35px; font-size: 12px;">대전/충청(2)</button>
								<button type="button" onclick="ShowTabex5('5')"
									style="width: 100%; height: 35px; font-size: 12px;">대구(1)</button>
								<button type="button" onclick="ShowTabex5('6')"
									style="width: 100%; height: 35px; font-size: 12px;">부산/울산(1)</button>
								<button type="button" onclick="ShowTabex5('7')"
									style="width: 100%; height: 35px; font-size: 12px;">경상(0)</button>
								<button type="button" onclick="ShowTabex5('8')"
									style="width: 100%; height: 35px; font-size: 12px;">광주/전라/제주(1)</button>
							</center>
						</div>
						<div class="tt1" style="width: 50%; margin-left: 6px;">
							<div id="tab5_0" style="width: 100%; display: block;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">강변</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">구로</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">명동역</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">상암</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">신촌아트레온</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">압구정</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">여의도</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">용산
									아이파크몰</button>
							</div>
							<div id="tab5_1" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">동수원</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">소풍</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">오리</button>
							</div>
							<div id="tab5_2" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">인천</button>
							</div>
							<div id="tab5_3" style="width: 100%; display: none;">없음</div>
							<div id="tab5_4" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대전</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">천안펜타포트</button>
							</div>
							<div id="tab5_5" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대구</button>
							</div>
							<div id="tab5_6" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">서면</button>
							</div>
							<div id="tab5_7" style="width: 100%; display: none;">없음</div>
							<div id="tab5_8" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">광주터미널</button>
							</div>
						</div>
					</div>
					<div id="tab2_2" style="width: 100%; display: none;">
						<!-- overflow-y:scroll; -->
						<div class="tt0" style="width: 45%; margin-top: 5px;">
							<center>
								<button type="button" onclick="ShowTabex6('0')"
									style="width: 100%; height: 35px; font-size: 12px;">4DX(2)</button>
								<button type="button" onclick="ShowTabex6('1')"
									style="width: 100%; height: 35px; font-size: 12px;">IMAX(19)</button>
								<button type="button" onclick="ShowTabex6('2')"
									style="width: 100%; height: 35px; font-size: 12px;">STARIUM(1)</button>
								<button type="button" onclick="ShowTabex6('3')"
									style="width: 100%; height: 35px; font-size: 12px;">CINE
									DE CHEF(3)</button>
								<button type="button" onclick="ShowTabex6('4')"
									style="width: 100%; height: 35px; font-size: 12px;">GOLD
									CLASS(5)</button>
								<button type="button" onclick="ShowTabex6('5')"
									style="width: 100%; height: 35px; font-size: 12px;">BRAND(1)</button>
								<button type="button" onclick="ShowTabex6('6')"
									style="width: 100%; height: 35px; font-size: 12px;">PREMIUM(7)</button>
								<button type="button" onclick="ShowTabex6('7')"
									style="width: 100%; height: 35px; font-size: 12px;">CINE
									KIDS(2)</button>
								<button type="button" onclick="ShowTabex6('8')"
									style="width: 100%; height: 35px; font-size: 12px;">Sphere(2)</button>
								<button type="button" onclick="ShowTabex6('9')"
									style="width: 100%; height: 35px; font-size: 12px;">REMPER
									CINEMA(3)</button>
								<button type="button" onclick="ShowTabex6('10')"
									style="width: 100%; height: 35px; font-size: 12px;">ScreenX(4)</button>
							</center>
						</div>
						<div class="tt1" style="width: 50%; margin-left: 6px;">
							<div id="tab6_0" style="width: 100%; display: block;"></div>
							<div id="tab6_1" style="width: 100%; display: none;">2</div>
							<div id="tab6_2" style="width: 100%; display: none;">3</div>
							<div id="tab6_3" style="width: 100%; display: none;">4</div>
							<div id="tab6_4" style="width: 100%; display: none;">5</div>
							<div id="tab6_5" style="width: 100%; display: none;">6</div>
							<div id="tab6_6" style="width: 100%; display: none;">6</div>
							<div id="tab6_7" style="width: 100%; display: none;">7</div>
							<div id="tab6_8" style="width: 100%; display: none;">8</div>
							<div id="tab6_9" style="width: 100%; display: none;">9</div>
							<div id="tab6_10" style="width: 100%; display: none;">10</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- ================날짜 부분 입니다아아아아================================= -->
		<div class="t5">
			<div class="t5-1">날짜</div>
			<div class="t5-2">5-2</div>
		</div>
		<!-- ================시간 부분 입니다아아아아================================= -->
		<div class="t6">
			<div class="t6-1">시간</div>
			<div class="t6-2">6-2</div>
		</div>
	</div>
	<div class="t7">
		<div style="float: left; width: 15%; margin-left: 12%">영화선택</div>
		<div style="float: left; width: 15%;">극장선택</div>
		<div style="float: left; width: 10%;">좌석선택 > 결제</div>
		<div style="float: right; width: 10%; margin-right: 20%;">
			<button type="button">좌석선택</button>
		</div>
	</div>
	<script>
		/* 영화 부분입니다 */
		function ShowTabex(val) {
			for (i = 0; i < 3; i++) {
				var tb = document.getElementById('tab_' + i);
				if (i != val)
					tb.style.display = "none";
				else
					tb.style.display = "block";
			}
		}
	</script>
	<script>
		/* 극장부분입니다 */
		function ShowTabex2(val) {
			for (i = 0; i < 3; i++) {
				var tb = document.getElementById('tab2_' + i);
				if (i != val)
					tb.style.display = "none";
				else
					tb.style.display = "block";
			}
		}
	</script>
	<script>
		/* 영화 안에 '전체'부분 입니다 */
		function ShowTabex3(val) {
			for (i = 0; i < 2; i++) {
				var tb = document.getElementById('tab3_' + i);
				if (i != val)
					tb.style.display = "none";
				else
					tb.style.display = "block";
			}
		}
	</script>
	<script>
		function ShowTabex4(val) {
			for (i = 0; i < 9; i++) {
				var tb = document.getElementById('tab4_' + i);
				if (i != val)
					tb.style.display = "none";
				else
					tb.style.display = "block";
			}
		}
	</script>
	<script>
		function ShowTabex5(val) {
			for (i = 0; i < 9; i++) {
				var tb = document.getElementById('tab5_' + i);
				if (i != val)
					tb.style.display = "none";
				else
					tb.style.display = "block";
			}
		}
	</script>
	<script>
		function ShowTabex6(val) {
			for (i = 0; i < 11; i++) {
				var tb = document.getElementById('tab6_' + i);
				if (i != val)
					tb.style.display = "none";
				else
					tb.style.display = "block";
			}
		}
	</script>

</body>
</html>