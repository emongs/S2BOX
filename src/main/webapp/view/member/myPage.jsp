<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style type="text/css">
.menu_all {
	float: left;
	width: 58%;
	height: 600px;
	float: left;
}

.row_menu:after {
	content: "";
	display: table;
	clear: both;
	width: 70%;
}

.menu {
	border: 1px solid #ccc;
	height: 220px;
	width: 90%;
	margin-left: 10%;
	margin-top: -2%;
}

.myreserve {
	border: 3px solid #ccc;
	height: 130px;
	width: 90%;
	margin-left: 10%;
}

.myQA {
	border: 3px solid #ccc;
	height: 130px;
	width: 90%;
	margin-left: 10%;
}

.m1 {
	margin-top: 18px;
	margin-left: 8%;
	width: 20%;
	height: 70%;
	float: left;
}

.m2 {
	margin-top: 18px;
	width: 20%;
	height: 70%;
	float: left;
	margin-left: 2%;
}

.m3 {
	margin-top: 18px;
	width: 20%;
	height: 70%;
	float: left;
	margin-left: 2%;
}

.m4 {
	margin-top: 18px;
	width: 20%;
	height: 70%;
	float: left;
	margin-left: 2%;
}

.vip_tit1 {
	display: block;
	font-size: 110%;
	width: 55%;
	margin-left: 10%;
	margin-right: 22.5%;
}

.tit1_h2 {
	width: 100%;
	float: left;
	margin-bottom: 10px;
	letter-spacing: -2px;
	font-family: 'Nanum Barun Gothic Bold'
}

.hr1 {
	width: 100%;
	color: #e1e1e1;
	border: 1px solid;
}
</style>
</head>
<body>
	<div class="row_menu">
		<div class="menu_all">
			<div class="menu">
				<div class="m1">

					<img src="<%=request.getContextPath()%>/common/image/memberImage/m1.png"
						width="80%" height="190px">
				</div>
				<div class="m2">
					<img src="<%=request.getContextPath()%>/common/image/memberImage/m2.png"
						width="80%" height="190px">
				</div>
				<div class="m3">
					<img src="<%=request.getContextPath()%>/common/image/memberImage/m3.png"
						width="80%" height="190px">
				</div>
				<div class="m4">
					<img src="<%=request.getContextPath()%>/common/image/memberImage/m4.png"
						width="80%" height="190px">

				</div>

			</div>
			<!-- 예매내역 부분   -->
			<div style="margin-top: 50px;">
				<div class="vip_tit1">
					<h2 class="tit1_h2">MY 예매내역</h2>
					<hr class="hr1">
				</div>
				<div class="myreserve">고객님의 최근 예매내역이 존재하지 않습니다.</div>
			</div>
			<!-- 문의내역 부분   -->
			<div style="margin-top: 50px;">
				<div class="vip_tit1">
					<h2 class="tit1_h2">MY Q&A</h2>
					<hr class="hr1">
				</div>
				<div class="myQA">고객님의 1:1 문의내역이 존재하지 않습니다.</div>
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>
			</div>

		</div>
	</div>
</body>
</html>