<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>
<style>
* {
	box-sizing: border-box;
}

body {
	margin: 0;
}

.menu {
	float: left;
	width: 10%;
	height: 250px;
	padding: 15px;
	margin-top: 30px;
}
button {
	border: none;
	cursor: pointer;
}

button:hover {
	/* opacity: 0.8; */
	color:red;
}
</style>
 
</head>

<body>
		<div class="menu" style="margin-left: 10%;">
			<center>
				<button type="button" onclick="location.href = ' <c:url value= "/board/customer"/>'"
					style="width: 130px; height: 70px; background-color: white;
					 border-bottom-style: solid; text-align: left;">
					<font style="font-size: 15px;"><strong>고객센터 메인</strong></font>
				</button>
				<button type="button" onclick="location.href = ' <c:url value= "/board/list"/>'"
					style="width: 130px; height: 70px; background-color: white;
					 border-bottom-style: solid; border-bottom-width: 1px; text-align: left;">
					<font style="font-size: 15px;"><strong>자주찾는 질문</strong></font>
				</button>
				<button type="button" onclick="location.href = ' <c:url value= "/board/list2"/>'"
					style="width: 130px; height: 70px; background-color: white; 
					border-bottom-style: solid; border-bottom-width: 1px; text-align: left;">
					<font style="font-size: 15px;"><strong>공지/뉴스</strong></font>
				</button>
				<button type="button" onclick="location.href=' <c:url value= "/board/email"/>'"
					style="width: 130px; height: 70px; background-color: white;
					 border-bottom-style: solid; border-bottom-width: 1px; text-align: left;">
					<font style="font-size: 15px;"><strong>이메일 문의</strong></font>
				</button>
				<button type="button" onclick="location.href='lost_f.jsp' "
					style="width: 130px; height: 70px; background-color: white; 
					border-bottom-style: solid; border-bottom-width: 1px; text-align: left;">
					<font style="font-size: 15px;"><strong>분실물 문의</strong></font>
				</button>
				<button type="button" onclick="location.href='all.jsp' "
					style="width: 130px; height: 70px; background-color: white; text-align: left;">
					<font style="font-size: 15px;"><strong>단체/대관 문의</strong></font>
				</button>

			</center>
</div>
</body>
</html>