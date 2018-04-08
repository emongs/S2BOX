<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">

<%
request.setCharacterEncoding("UTF-8");
%>

<script type="text/javascript" src="/S2_BOX/js/httpRequest.js"></script>
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
}
/* 영화 select 부분  */
.t3 {
	width: 20%;
	float: left;
	margin-left: 10%;
	height: 500px;
	margin-right: 2px;
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
}

.t6-1 {
	height: 25px;
	border-style: solid;
	border-width: 1px;
	border-color: silver;
	background-color: #30204B;
	border-color: silver;
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
	margin-top:3%;
	width: 100%;
	height: 100px;
	background-color:#424242;
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
	border: none;
}
button:HOVER{
color: purple;
}
.t2 button:HOVER{
height:30px;
width:110px;
	border: 1.5px solid purple;
}
.t2 button{
	font-weight: bold;
}
<!--
복기 생성 파트-->
#unVisible {
	display: none;
}
.unVisible{
	display: none;
}
.tab3_0 td{
cursor: pointer;
}
.btn_Sheet{
background-color:#424242;
	width: 80%;
	height: 50px;
	line-height: 50px;
	float: left; 
	font-weight: bold;
	color: white;
	border: solid #e1e1e1;
	margin-bottom: -20px;
	
}
.btn_Sheet button:HOVER {
	color: #e1e1e1;
}
</style>
<!-- jQuery  -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
<body>
	<div class="t2">
		<button type="button" style="margin-left: 1%; float: right;">예매 가이드</button>
		<button type="button" style="margin-left: 1%; float: right;">상영시간표</button>
		<button type="button" style="float: right;"onclick="document.location.href='currentList'">다시 예매하기</button>
	</div>
	<div class="rown2">

		<!-- ================영화 부분 입니다아아아아================================= -->
		<div class="t3" id="ajaxMovieDiv">
			<div class="t3-1"><div>
			<img src="<%=request.getContextPath()%>/common/image/mainImage/2_1.png" height="25px" width="100%" 
			style=" position: relative; top: 0px; left: 0px; z-index: 1;"></div>
			<div class="t1_1_1" style="position: relative; top: -25px; left: 0px; z-index: 2;">영화</div></div>
			<div class="t3-2">
				<div>
					<div style="width: 90%;margin-left:5%; background-color: white; margin-top: 5px;
					margin-bottom: 5px; border:solid #e1e1e1;">
						<center>
							<button type="button" onclick="ShowTabex('0')" style="width: 25%;">전체</button>
							<button type="button" onclick="ShowTabex('1')" style="width: 38%;">아트하우스</button>
							<button type="button" onclick="ShowTabex('2')" style="width: 30%;">특별관</button>
						</center>
					</div>
				</div>
				<div style="text-align: center;">
					<!-- ==================='전쳬' div 안으로============== -->
					<div id="tab_0" style="width: 100%; display: block;">

						<div style="width: 90%;margin-left:5%; margin-top: 5px; background-color: white;">
							<button onclick="ShowTabex3('0')" style=" width: 30%; float: left;border-bottom: solid #e1e1e1;">예매율 순</button>
							<button onclick="ShowTabex3('1')" style=" width: 30%;float: left;border-bottom: solid #e1e1e1;">가나다 순</button>
							<br><br>
						</div>
						
						<div style="text-align: center;">
							<div id="tab3_0" style="width: 90%; display: block;margin-left: 5%;">
								<table id="moviediv" class="moviediv" style="font-size: 13px;">
									<c:forEach var="article" items="${articleList}">
										<tr>
											<td>icon
											</td>
											<td></td>
											<td>${article.movie_name}</td>
											<td id="unVisible" class="unVisible">${article.grade}</td> 
										</tr>
										<tr></tr>
									</c:forEach>
								</table>
							</div>
							<div id="tab3_1" style="width: 100%; display: none;">
<table id="moviemoviediv" class="moviemoviedivx" style="font-size: 13px;">
									<c:forEach var="article" items="${articleList}">
										<tr>
											<td>icon
											</td>
											<td></td>
											<td>${article.movie_name}</td>
											<td id="unVisible" class="unVisible">${article.grade}</td> 
										</tr>
										<tr></tr>
									</c:forEach>
								</table>
</div>
						</div>
					</div>

					<div id="tab_1" style="width: 100%; display: none;">아트하우스</div>
					<div id="tab_2" style="width: 100%; display: none;">특별관</div>
				</div>
			</div>
			</div>
		<!-- ================극장 부분 입니다아아아아================================= -->
		<div class="t4" id="ajaxLocalDiv">
			<div class="t4-1"><div>
			<img src="<%=request.getContextPath()%>/common/image/mainImage/2_1.png" height="25px" width="100%" 
			style=" position: relative; top: 0px; left: 0px; z-index: 1;"></div>
			<div class="t1_1_1" style="position: relative; top: -25px; left: 0px; z-index: 2;">극장</div></div>
			<div class="t4-2">
				<div>
				<div style="width: 90%;margin-left:5%; background-color: white; margin-top: 5px;
					margin-bottom: 5px; border:solid #e1e1e1;">
						<center>
							<button type="button" onclick="ShowTabex2('0')" style="width: 25%;">전체</button>
							<button type="button" onclick="ShowTabex2('1')" style="width: 38%;">아트하우스</button>
							<button type="button" onclick="ShowTabex2('2')" style="width: 30%;">특별관</button>
						</center>
					</div>
				</div>
			<div style="text-align: center; height: 300px; margin-top: 6px; margin-left: 6px;">
					<div id="tab2_0" style="width: 100%; display: block;">

						<div class="tt0" style="width: 45%; margin-top: 5px;">
							<center>
								<c:forEach var="article2" items="${articleList2}">
									<c:if test="${article2.local eq 'SU' }">
										<c:set var="sunum" value="${sunum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'KK' }">
										<c:set var="kknum" value="${kknum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'IC' }">
										<c:set var="icnum" value="${icnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'BS' }">
										<c:set var="bsnum" value="${bsnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'DK' }">
										<c:set var="dknum" value="${dknum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'DJ' }">
										<c:set var="cnum" value="${cnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'US' }">
										<c:set var="bsnum" value="${bsnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'KJ' }">
										<c:set var="jnum" value="${jnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'CN' }">
										<c:set var="cnum" value="${cnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'CB' }">
										<c:set var="cnum" value="${cnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'KN' }">
										<c:set var="knum" value="${knum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'KB' }">
										<c:set var="knum" value="${knum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'JN' }">
										<c:set var="jnum" value="${jnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'JB' }">
										<c:set var="jnum" value="${jnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'JJ' }">
										<c:set var="jnum" value="${jnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'KW' }">
										<c:set var="kwnum" value="${kwnum+1}" />
									</c:if>
								</c:forEach>
								
								<button type="button" onclick="ShowTabex4('0')"
									style="width: 100%; height: 35px; font-size: 12px;">서울(${sunum})</button>
								<button type="button" onclick="ShowTabex4('1')"
									style="width: 100%; height: 35px; font-size: 12px;">경기(${kknum})</button>
								<button type="button" onclick="ShowTabex4('2')"
									style="width: 100%; height: 35px; font-size: 12px;">인천(${icnum})</button>
								<button type="button" onclick="ShowTabex4('3')"
									style="width: 100%; height: 35px; font-size: 12px;">강원(${kwnum})</button>
								<button type="button" onclick="ShowTabex4('4')"
									style="width: 100%; height: 35px; font-size: 12px;">대전/충청(${cnum})</button>
								<button type="button" onclick="ShowTabex4('5')"
									style="width: 100%; height: 35px; font-size: 12px;">대구(${dknum})</button>
								<button type="button" onclick="ShowTabex4('6')"
									style="width: 100%; height: 35px; font-size: 12px;">부산/울산(${bsnum})</button>
								<button type="button" onclick="ShowTabex4('7')"
									style="width: 100%; height: 35px; font-size: 12px;">경상(${knum})</button>
								<button type="button" onclick="ShowTabex4('8')"
									style="width: 100%; height: 35px; font-size: 12px;">광주/전라/제주(${jnum})</button>

							</center>

						</div>
						<div class="tt1" style="width: 50%; margin-left: 6px;">
							<div id="tab4_0"
								style="width: 100%; height: 100%; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'SU' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_1"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'KK' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>

							</div>
							<div id="tab4_2"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'IC' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_3"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'KW' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>

							</div>
							<div id="tab4_4"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if
										test="${article.local eq 'CN'||article.local eq 'CB'||article.local eq 'DJ' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_5"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'DK' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_6"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'BS'||article.local eq 'US' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_7"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'KN'||article.local eq 'KB' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_8"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if
										test="${article.local eq 'JJ'||article.local eq 'JN'||article.local eq 'JB'||article.local eq 'KJ' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							 </div>
					</div>
					<div id="tab2_1" style="width: 100%; display: none;">
						<div class="tt0" style="width: 45%; margin-top: 5px;">
							<center>
								<button type="button" onclick="ShowTabex5('0')"
									style="width: 100%; height: 35px; font-size: 12px;">서울()</button>
								<button type="button" onclick="ShowTabex5('1')"
									style="width: 100%; height: 35px; font-size: 12px;">경기()</button>
								<button type="button" onclick="ShowTabex5('2')"
									style="width: 100%; height: 35px; font-size: 12px;">인천()</button>
								<button type="button" onclick="ShowTabex5('3')"
									style="width: 100%; height: 35px; font-size: 12px;">강원()</button>
								<button type="button" onclick="ShowTabex5('4')"
									style="width: 100%; height: 35px; font-size: 12px;">대전/충청()</button>
								<button type="button" onclick="ShowTabex5('5')"
									style="width: 100%; height: 35px; font-size: 12px;">대구()</button>
								<button type="button" onclick="ShowTabex5('6')"
									style="width: 100%; height: 35px; font-size: 12px;">부산/울산()</button>
								<button type="button" onclick="ShowTabex5('7')"
									style="width: 100%; height: 35px; font-size: 12px;">경상()</button>
								<button type="button" onclick="ShowTabex5('8')"
									style="width: 100%; height: 35px; font-size: 12px;">광주/전라/제주()</button>
							</center>
						</div>
						<div class="tt1" style="width: 50%; margin-left: 6px;">
							<div id="tab5_0" style="width: 100%; display: block;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">강변</button>

							</div>
							<div id="tab5_1" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">동수원</button>

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
		<div class="t5" id="ajaxDateDiv">
			<div class="t5-1"><div>
			<img src="<%=request.getContextPath()%>/common/image/mainImage/2_1.png" height="25px" width="100%" 
			style=" position: relative; top: 0px; left: 0px; z-index: 1;"></div>
			<div class="t1_1_1" style="position: relative; top: -25px; left: 0px; z-index: 2;">날짜</div></div>
			<div class="t5-2">
				<a onclick="" style="width: 100%;
				 height: 35px; font-size: 16px;text-align: center;">[${month}월]</a>
				<c:forEach var="article3" items="${articleList3}">
					<button type="button" onclick="clickDate('${article3.screen_date}','${article3.day}')"
						style="width: 100%; height: 35px; font-size: 12px;">${article3.day}
						${article3.screen_date}</button>
				</c:forEach>

			</div>
		</div>
		<!-- ================시간 부분 입니다아아아아================================= -->
		<div class="t6" id="ajaxTimeDiv">
			<div class="t6-1"><div>
			<img src="<%=request.getContextPath()%>/common/image/mainImage/2_1.png" height="25px" width="100%" 
			style=" position: relative; top: 0px; left: 0px; z-index: 1;"></div>
			<div class="t1_1_1" style="position: relative; top: -25px; left: 0px; z-index: 2;color: white;">시간</div></div>
			<div class="t6-2">
			
			</div>
		</div>
		
	</div>
	<!-- ==========좌석선택을 위한 div=========== -->
	<div class="t7">
		<div style="float: left; width: 15%; margin-left: 12%; font-weight: bold; margin-top: 1%;color: white;"> 영화선택<br> 
		   <a id="SelectedMovieName"style="font-size: 13px;margin-top: 1%;" ></a><br>
			<div id="SelectedMovieGrade"style="font-size: 13px;margin-top: 1%;"></div>
		</div>
		<div style="float: left; width: 15%;font-weight: bold;margin-top: 1%;color: white;"> 극장선택<br> 
			<div id="SelectedTheaterName"style="font-size: 13px;margin-top: 1%;"></div>
		</div>
		<div style="float: left; width: 15%;font-weight: bold;margin-top: 1%;color: white;"> 날짜선택<br>
			<div id="SelectedDateName"style="font-size: 13px;margin-top: 1%;"></div>
		</div>
		<div style="float: left; width: 15%;font-weight: bold;margin-top: 1%;color: white;"> 시간선택<br>
			<div id="SelectedTimeName"style="font-size: 13px;margin-top: 1%;"></div>
			
		</div>
		<div style="float: left; width: 15%;font-weight: bold;margin-top: 2%;color: white;">
		
		<form method="post" name="goSheetSelect" action="goSheetSelect">
		<input type="hidden" id="SelectedMovie" name="SelectedMovie"> 
		<input type="hidden" id="SelectedTheater" name="SelectedTheater">
		<input type="hidden" id="SelectedDate" name="SelectedDate">
		<input type="hidden" id="SelectedTable" name="SelectedTable">
		<input type="hidden" id="SelectedTable2" name="SelectedTable2">
		<input type="hidden" id="SelectedScreen" name="SelectedScreen">
		<button type="submit" onclick="document.location.href='goSheetSelect'"
		 class="btn_Sheet">좌석선택 ></button>
			</form>	
		</div>
		<div style="float: right; width: 10%; margin-right: 20%;margin-top: 1%;">
		
			<input type="hidden" id="levelchecker">
		</div>
	</div>
	<div id="unVisibleAjax"></div>
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
	<script>
		// 테이블의 Row 클릭시 값 가져오기
		$("#moviediv tr").click(function() {
			
			var str1 = "";
			var str2 = "";
			var tdArr = new Array(); // 배열 선언

			// 현재 클릭된 Row(<tr>)
			var tr = $(this);
			var td = tr.children();

			// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
			console.log("클릭한 Row의 모든 데이터 : " + tr.text());

			// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			// td.eq(index)를 통해 값을 가져올 수도 있다.

			var grade = td.eq(3).text();
			var movieName = td.eq(2).text();

			str2 += "등급 : " + grade;
			str1 += "제목 : " + movieName;

			document.getElementById('SelectedMovieName').innerHTML = str1;
			document.getElementById('SelectedMovieGrade').innerHTML = str2;
			document.getElementById('SelectedMovie').value = movieName;

			reservationLevelCheck();
			clickMovieName();
		});
	</script>
	<script>
	function clickTime(start_hour,start_min,end_hour,end_min,screencode){
		var str="시간 :"+start_hour+":"+start_min+"~"+end_hour+":"+end_min+"[";
		var str2=document.getElementById('ourSelectScreenName').value+"]";
		str+=str2;
		var s=start_hour+":"+start_min;
		var ss=end_hour+":"+end_min;
		document.getElementById('SelectedTable').value = s;
		document.getElementById('SelectedTable2').value = ss;
		document.getElementById('SelectedTimeName').innerHTML = str;
		document.getElementById('SelectedScreen').value = screencode;
		
		reservationLevelCheck();
	}
		function clickMovieName() {
			var movieName = document.getElementById('SelectedMovie').value;
			var params;
			if(document.getElementById('SelectedDate').value!=""&&document.getElementById('SelectedTheater').value!=""){
				//극장골랐고 날짜골랐다면 이제3단계니까 timetable그려내는 ajax call
				loadTimeTable();
			}else if(document.getElementById('SelectedDate').value!=""&&document.getElementById('SelectedTheater').value==""){
				//날짜골랐고 극장 안골랐으면날짜랑 영화갖고 극장조회
				loadTheaterByDateAndMovie();
			}else if(document.getElementById('SelectedDate').value==""&&document.getElementById('SelectedTheater').value==""){
				//영화제목을 가장먼저눌렀을 때 --> 날짜도 극장도 고르지 않음
				params = "movieName=" + encodeURIComponent(movieName);
				sendRequest("/S2_BOX/reservation/clickMovieName", params,
						clickedMovieName, "GET");
			}else if(document.getElementById('SelectedDate').value==""&&document.getElementById('SelectedTheater').value!=""){
				//날짜 안골랐고 극장 골랐으면 극장이랑 영화갖고 날짜조회
				loadDateByMovieAndTheater();
			}
		}//clickMovieName end
		function loadTheaterByDateAndMovie(){
			var movieName = document.getElementById('SelectedMovie').value;
			var screen_date="2017-12-"+document.getElementById('SelectedDate').value;
			var params = "movieName=" + encodeURIComponent(movieName)+"&screen_date="+ encodeURIComponent(screen_date);
			sendRequest("/S2_BOX/reservation/theaterByDateAndMovie", params,
					loadedLocalBydate, "GET");
		}
		

		function clickedMovieName() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					$(document).ready(function() {
						$("#ajaxLocalDiv").html(httpRequest.responseText);
						clickMovieName2();
					});
				} else {
					alert(httpRequest.status);
				}
			}
		}//clickedMovieName end
		function clickMovieName2() {

			var movieName = document.getElementById('SelectedMovie').value;
			var params = "movieName=" + encodeURIComponent(movieName);
			sendRequest("/S2_BOX/reservation/clickMovieName2", params,
					clickedMovieName2, "GET");
		}//clickMovieName2 end
		function clickedMovieName2() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					$(document).ready(function() {

						$("#ajaxDateDiv").html(httpRequest.responseText);

					});
				} else {
					alert(httpRequest.status);
				}
			}
		}//clickedMovieName2 end
		function clickTheaterName(theaterName) {//onclick 할때 parameter로 해당 영화관 이름을 주어야 함

			document.getElementById('SelectedTheater').value = theaterName;
			document.getElementById('SelectedTheaterName').innerHTML = "영화관: "
					+ theaterName;
			var theaterName = theaterName;
			var params;
			
			reservationLevelCheck();
			if (document.getElementById('SelectedMovie').value == ""
					&& document.getElementById('SelectedDate').value != "") {
				//날짜는 선택, 영화는 선택x --> 날짜값, 극장값 넘겨서 ajax로 영화div 리로드
				loadMovieByDateAndTheater();
			} else if (document.getElementById('SelectedMovie').value != ""
					&& document.getElementById('SelectedDate').value == "") {
				//영화는 선택했고 날짜는선택x --> 영화제목, 극장값 넘겨서 ajax로 date 리로드
				loadDateByMovieAndTheater();
			}else if(document.getElementById('SelectedMovie').value == ""&& document.getElementById('SelectedDate').value == ""){
				//영화도  날짜도 선택안했으면 극장만 선택한거지?
				params = "theaterName=" + encodeURIComponent(theaterName);
				//1단계진행합시다. 무비리스트만 가져옵시다
				sendRequest("/S2_BOX/reservation/clickTheaterNameLevel1", params,loadedMovieName, "GET");
			}else if(document.getElementById('SelectedMovie').value != ""&& document.getElementById('SelectedDate').value != ""){
				//3단계 진행할때
				loadTimeTable();
			}
		}//clickTheaterName  end
		function loadDateByMovieAndTheater(){
			var movieName = document.getElementById('SelectedMovie').value;
			var theaterName = document.getElementById('SelectedTheater').value;
			var params = "theaterName=" + encodeURIComponent(theaterName)
					+ "&movieName=" + encodeURIComponent(movieName);
			sendRequest("/S2_BOX/reservation/clickTheaterName", params,
					clickedMovieName2, "GET");//clickedMovieName2이거는 datediv ajax 로 같으니깐
		}
		function loadMovieByDateAndTheater(){
			var theaterName=document.getElementById('SelectedTheater').value;
			var screen_date="2017-12-"+document.getElementById('SelectedDate').value;
			var params = "theaterName=" + encodeURIComponent(theaterName)
			+ "&screen_date=" + encodeURIComponent(screen_date);
			sendRequest("/S2_BOX/reservation/movieDivByDateAndTheater", params,pureLoadedMovieName, "GET");
		}
		function loadedMovieName() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					$(document).ready(function() {
						$("#ajaxMovieDiv").html(httpRequest.responseText);
						clickTheaterNameLevel1Date();
					});
				} else {
					alert(httpRequest.status);
				}
			}
		}//loadedMovieName end
		function pureLoadedMovieName() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					$(document).ready(function() {
						$("#ajaxMovieDiv").html(httpRequest.responseText);
					});
				} else {
					alert(httpRequest.status);
				}
			}
		}//pureLoadedMovieName end
		function clickTheaterNameLevel1Date() {
			var theater_name = document.getElementById('SelectedTheater').value;
			var params = "theater_name=" + encodeURIComponent(theater_name);
			sendRequest("/S2_BOX/reservation/clickTheaterNameLevel1Date", params,
					clickedMovieName2, "GET");
		}//clickTheaterNameLevel1Date end

		//
		function clickDate(date,day) {//11일,화 이런식으로 받아옴
			
			document.getElementById('SelectedDate').value = date;
			
			var st="";
			st+="날짜:";
			st+=date;
			st+="일(";
			st+=day;
			st+=")";
			
			var xxx=document.getElementById('SelectedDateName');
			xxx.innerHTML = st;
			reservationLevelCheck();
			
			if(document.getElementById('SelectedMovie').value != ""&& document.getElementById('SelectedTheater').value != ""){
				//영화도 극장도 선택된 상태라면 3단계진행합시다.
				//timetable load해온 뒤 callback에서 moviediv localdiv ajax 연쇄콜
				
				loadTimeTable();
			}else if(document.getElementById('SelectedMovie').value == ""&& document.getElementById('SelectedTheater').value == ""){
				//영화도 안고르고 극장도 안고르고 날짜부터 골랐을 경우
				//날짜에 의존하여 날짜에 해당하는 영화목록부르는 ajax call. callback때 local부르는 ajax call
				loadMovieBydate();
			}else if(document.getElementById('SelectedMovie').value == ""&&document.getElementById('SelectedTheater').value != ""){
				//극장만 고르고 날짜 클릭했다면 날짜랑 극장으로 moviediv ajax
				loadMovieByDateAndTheater();
			}else if(document.getElementById('SelectedMovie').value != ""&&document.getElementById('SelectedTheater').value == ""){
				//영화만 고르고 날짜 클릭했다면 날짜랑 영화로 local ajax
				loadTheaterByDateAndMovie();
			}
		}//clickDate end 
		function loadTimeTable(){
			var date=document.getElementById('SelectedDate').value;
			var screen_date = "2017-12-"+date;
			var movieName = document.getElementById('SelectedMovie').value;
			var theaterName = document.getElementById('SelectedTheater').value;
			var params = "theaterName=" + encodeURIComponent(theaterName)
					+ "&movieName=" + encodeURIComponent(movieName)
					+ "&screen_date=" + encodeURIComponent(screen_date);
			sendRequest("/S2_BOX/reservation/clickDateLevel3", params,
					loadedTimeTable, "GET");
		}
		function loadedTimeTable() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					$(document).ready(function() {
						$("#ajaxTimeDiv").html(httpRequest.responseText);
						//callmovie  callback에서 callLocal
						//loadMovieBydate();
					});
				} else {
					alert(httpRequest.status);
				}
			}
		}//loadedTimeTable end
		function loadMovieBydate() {
			var screen_date = "2017-12-"+document.getElementById('SelectedDate').value;
			var params = "screen_date=" + encodeURIComponent(screen_date);
			sendRequest("/S2_BOX/reservation/loadMovieBydate", params,
					loadedMovieBydate, "GET");
		}//clickMovieName end
		function loadedMovieBydate() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					$(document).ready(function() {
						$("#ajaxMovieDiv").html(httpRequest.responseText);
						loadLocalBydate();
					});
				} else {
					alert(httpRequest.status);
				}
			}
		}//loadedMovieName end
		function loadLocalBydate() {
			var screen_date = "2017-12-"+document.getElementById('SelectedDate').value;
			var params = "screen_date=" + encodeURIComponent(screen_date);
			sendRequest("/S2_BOX/reservation/loadLocalBydate", params,
					loadedLocalBydate, "GET");
		}//clickMovieName end
		function loadedLocalBydate() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					$(document).ready(function() {
						$("#ajaxLocalDiv").html(httpRequest.responseText);
					});
				} else {
					alert(httpRequest.status);
				}
			}
		}//clickedMovieName end
		
		//input id=levelchecker 에 의존
		function reservationLevelCheck() {
			var nowlevel = document.getElementById('levelchecker').value;
			var flag = [ false, false, false, false ];

			if (document.getElementById('SelectedMovie').value != "") {
				flag[0] = true;
			}
			if (document.getElementById('SelectedTheater').value != "") {
				flag[1] = true;
			}
			if (document.getElementById('SelectedDate').value != "") {
				flag[2] = true;
			}
			if (document.getElementById('SelectedTable').value != "") {
				flag[3] = true;
			}
			var count = 0;
			for (var i = 0; i < 4; i++) {
				if (flag[i] == true) {
					count++;
				}
			}
			nowlevel = count;

			document.getElementById('levelchecker').value = nowlevel;
		}
		//좌석선택 button에 의존
		function selectSheetAble() {
			if (document.getElementById('levelchecker').value == 4) {
				//화면이동
			}
		}
	</script>
	<script>
		$(document).ready(function() {
			document.getElementById('levelchecker').value = 0;
			
		});
	</script>

</body>
</html>