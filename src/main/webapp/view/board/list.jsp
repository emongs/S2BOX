<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

</head>
<style>
.list{
background-color: pink;

}
a {
	text-decoration: none;
}

.join_btn{
	border: 0;
	cursor: pointer;
	background-color:#7a7a7a;
	color:white;
	margin-top:5px;
	padding:2px 8px 3px 8px;
}
</style>

<div style="margin-top: 2%; margin-left: 21%; "> &nbsp;&nbsp;&nbsp;&nbsp;
	<input id="searchtext" type="text" title="검색어 입력" placeholder="검색어를 입력해 주세요" value=""
			style="width: 350px; height: 35px;">
		<button type="button" class="join_btn" title="검색하기" id="btn_search" style="width:90px; height: 35px;">
			<span>검색하기</span>
		</button>
		<br> <br>
	</div>
	
<p style="width: 70%; margin-left: 10%;"></p>
<div style="margin-bottom: 10px; margin-left: 22%;  margin-right: 10%; word-spacing:20px;">
		
		<a href="<%=request.getContextPath()%>/board/list?boardid=1"
			class="">전체</a>&nbsp;&nbsp; <a style="color:#000;"
			href="<%=request.getContextPath()%>/board/list?boardid=2"
			class="">영화관이용</a> &nbsp;&nbsp;<a style="color:#000;"
			href="<%=request.getContextPath()%>/board/list?boardid=3"
			class="">예매&멤버쉽</a>&nbsp;&nbsp; <a style="color:#000;"
			href="<%=request.getContextPath()%>/board/list?boardid=4"
			class="">홈페이지</a>
<hr width="100%" align="right">
	</div>
<div style="margin-top: 20px; margin-left: 22%; margin-bottom: 30%;">
	<!-- <p>
		<a href="writeForm">글쓰기</a>
	</p>  -->
	<c:if test="${count == 0}">
		<table class="table-bordered" width="700">
			<tr>
				<td align="center">게시판에 저장된 글이 없습니다.</td>
		</table>
	</c:if>
	<c:if test="${count != 0}">
		<table style="width: 50%">
			<tr class="">
				<td align="center" width="50">번호</td>
				<td align="center" width="250">제 목</td>
				<td align="center" width="50">구분</td>
				<td align="center" width="50">타입</td>
				<td align="center" width="150">작성일</td>
				<td align="center" width="50">조 회</td>
			</tr>
			<c:forEach var="article" items="${articleList}">
				<tr height="100">
					<td align="center" width="50">${number}<c:set var="number"
							value="${number-1}" />
					</td>
					<td width="250"><a
						href="content?num=${article.num}&pageNum=${currentPage}">
							${article.subject}</a></td>
							<td align="center" width="100">${article.type}</td>
					<td align="center" width="100">${article.cases}</td>
					<td align="center" width="150">${article.reg_date}</td>
					<td align="center" width="50">${article.readcount}</td>	
				</tr>
			</c:forEach>

		</table>
	</c:if>	
	<div >
	<center>
		<c:if test="${count > 0 }">
			<c:if test="${startPage > bottomLine }">
				<a href="list?pageNum=${startPage - bottomLine}">[이전]</a>
			</c:if>
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<a href="list?pageNum=${i}"> <c:if test="${i != currentPage}">[${i}]</c:if>
					<c:if test="${i == currentPage}">
						<font color='red'>[${i}]</font>
					</c:if></a>
			</c:forEach>
			<c:if test="${endPage < pageCount}">
				<a href="list?pageNum=${startPage+bottomLine}">[다음]</a>
			</c:if>
		</c:if>
		<center>
	</div>
</div>
</body>
</html>



