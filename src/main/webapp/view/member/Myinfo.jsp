<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<style type="text/css">
.menu_all {
	float: left;
	width: 58%;
	height: 600px;
	float: left;
	margin-top: -3%;
	font-weight: 600;
}

.row_menu:after {
	content: "";
	display: table;
	clear: both;
	width: 70%;
}

.info_na1 {
	float: left;
	width: 30%;
	height: 50px;
	line-height: 50px;
	border-top: solid #E1E1E1;
	border-bottom:1px solid #E1E1E1;
}

.info_na2 {
	float: left;
	width: 70%;
	height: 50px;
	line-height: 50px;
	border-top: solid #E1E1E1;
	border-bottom:1px solid #E1E1E1;
}
.info_na1_1 {
	float: left;
	width: 30%;
	height: 50px;
	line-height: 50px;
	border-bottom:1px solid #E1E1E1;
}

.info_na2_1 {
	float: left;
	width: 70%;
	height: 50px;
	line-height: 60px;
	border-bottom:1px solid #E1E1E1;
}
.info_na1_2 {
	float: left;
	width: 30%;
	height: 100px;
	line-height: 60px;
	border-bottom:1px solid #E1E1E1;
}

.info_na2_2 {
	float: left;
	width: 70%;
	height: 100px;
	line-height: 60px;
	border-bottom:1px solid #E1E1E1;
}
.info_na3 {
	float: left;
	width: 30%;
	height: 280px;
	line-height: 50px;
	border-bottom: solid #E1E1E1;
}
.info_na4{
	float: left;
	width: 70%;
	height: 280px;
	border-bottom: solid #E1E1E1;
}
.confirm7{
margin-top:2%;
height: 50px;
width: 70%;
float: right;
}
.btn_input{
	border: none;
	width: 75px;
	height: 25px;
	background-color: gray;
	color: white;
		font-weight: 600;
}
</style>
<head>
</head>
<body>
	<div class="row_menu">
		<div class="menu_all">
			<h3>나의 정보</h3>
			<h4>나의 프로필/S2Box정보</h4>
			<div>
				<form method="post" action="ModifyPro2" name="userinput"
					onSubmit="return checkIt()">
					<div style="width: 100%;margin-left: 5%;">
						<div class="info_na1">이 름</div>
						<div class="info_na2">${name}</div>
						<div class="info_na1_1">아이디</div>
						<div class="info_na2_1">
							${memId} <br> <input type="hidden" name="idchk">
						</div>
						<div class="info_na1_2">닉네임</div>
						<div class="info_na2_2">
							한글, 영문, 숫자 혼용 가능 (한글 기준 10자 이내)<br> <input type="text"
								name="nickname" size="25" maxlength="12" value="${nickname}">
						</div>
						<div class="info_na3">프로필이미지</div>
						<div class="info_na4">
							각 서비스(이벤트, 매거진, 영화리뷰 등)의 리뷰 및 덧글작성시 <br>등록하신 대표이미지가 노출됩니다.<br>
							프로필 이미지 종류를 선택해 주세요.<br>
							 <c:if test="${filename!=null}">
								<img src="<%=request.getContextPath()%>/view/fileSave/${member.filename}"
									style="width:200px; height:200px;"
									>
							</c:if>
							<c:if test="${filename==null}">
								<img
									src="<%=request.getContextPath()%>/common/image/memberImage/m6.png" 
									style="width:200px; height:200px;">"
									
							</c:if>
						</div>
						<div class="confirm7"><br>
							<input class="btn_input" style="margin-left: 50%; " type="submit" name="confirm" value="변경하기">
							 <input class="btn_input" type="button" value="취소하기" onclick="javascript:history.back()">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>
</html>