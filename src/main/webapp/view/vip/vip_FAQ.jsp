<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.vipContent {
	margin-top: 80px;
	width: 70%;
	margin-left: 15%;
	height: 620px;
}

.vipA1 {
	height: 110px;
}

.vipA2 {
	height: 500px;
}

button {
	border: none;
	cursor: pointer;
	font-family: Tahoma, Geneva, sans-serif;
	transition: 0.4s;
}

button:hover {
	opacity: 0.8;
}

.panel {
	padding: 0 18px;
	background-color: #eaeaea;
	max-height: 0;
	overflow: hidden;
	transition: max-height 0.2s ease-out;
}
</style>

</head>
<body>
	<div class="vipContent">
		<br>
		<div class="vipA1">
			<h3>VIP FAQ</h3>
			고객님께서 궁금하신 내용을 먼저 확인해주세용♥<br>
			<p>
			<form action="vip_FAQ" method="post">
				&nbsp; <input type="text" id="searchtext" name="searchtext"
					minlength="2" maxlength="20" value="">
				<button type="submit" id="btn_search">
					<span>검색하기</span>
				</button>
			</form>
			</p>

		</div>
		<br>
		<div class="vipA2">
			<div
				style="text-align: left; font-size: 12px; font-style: normal; font-weight: bold; border-bottom-style: solid;">
				번호&nbsp;&nbsp;&nbsp;&nbsp;제목</div>
			<table>
				<c:forEach var="article" items="${articleList}">
					<tr>
						<em style="font-weight: bold;">${number}</em>
						<c:set var="number" value="${number-1}" />
					</tr>&nbsp;&nbsp;
				<button class="accordion"
						style="background-color: white; padding: 7px; outline: none; font-size: 14px; text-align: left;">
						<div href="#"
							style="text-decoration: none; font-style: normal; border-style: none; float: left; font-size: 13px; font-weight: bold;">${article.reader}</div>
					</button>
					<div class="panel"
						style="background-color: white; font-size: 12px; text-align: left; border-bottom-style: solid; border-bottom-width: 1px; font: gray;">&nbsp;&nbsp;&nbsp;
						${article.title}</div>
				</c:forEach>
			</table>
		</div>

	</div>
	<div style="text-decoration: none; height: 10px">
		<center>
			<c:if test="${count > 0 }">
				<c:if test="${startPage > bottomLine }">
					<a href="vip_FAQ?pageNum=${startPage -bottomLine }"
						style="text-decoration: none; display: none;">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<a href="vip_FAQ?pageNum=${i }"> <c:if
							test="${i!=currentPage }"> [${i }]</c:if> <c:if
							test="${i == currentPage }">
							<font color='black'> [${i }]</font>
						</c:if></a>
				</c:forEach>
				<c:if test="${endPage<pageCount }">
					<a href="vip_FAQ?pageNum=${startPage+bottomLine }"
						style="text-decoration: none;">[다음]</a>
				</c:if>
			</c:if>
		</center>
	</div>



</body>
</html>
<script>
		var acc = document.getElementsByClassName("accordion");
		var i;

		for (i = 0; i < acc.length; i++) {
			acc[i].onclick = function() {
				this.classList.toggle("active");
				var panel = this.nextElementSibling;
				if (panel.style.maxHeight) {
					panel.style.maxHeight = null;
				} else {
					panel.style.maxHeight = panel.scrollHeight + "px";
				}
			}
		}
	</script>




