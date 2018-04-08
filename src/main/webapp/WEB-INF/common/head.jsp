<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/semantic.css">
<script
  src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script>

</head>
<style>
a {
	text-decoration: none;
}
</style>
<%
	request.setCharacterEncoding("UTF-8");

	String board = "";
	//boardid가 넘어와야 세션이 변경됨
	if (request.getParameter("boardid") != null) {
		session.setAttribute("boardid", request.getParameter("boardid"));
	}
	//boardid 설정
	String boardid = (String) session.getAttribute("boardid");
	if (boardid == null)
		boardid = "1";
	//board 게시판 이름 설정
	if (boardid.equals("1"))
		board = "a-all";
	else if (boardid.equals("2"))
		board = "a-2";
	else if (boardid.equals("3"))
		board = "a-3";
	else if (boardid.equals("4"))
		board = "a-4";
	else if (boardid.equals("5"))
		board = "b-all";
	else if (boardid.equals("6"))
		board = "b-2";
	else if (boardid.equals("7"))
		board = "b-3";
	else
		board = "b-4";
%>

<body>



	<script>
		main();
	</script>
	<br>
	<br>
	

</body>






