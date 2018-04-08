<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel = "stylesheet" type = "text/css" href ="<%=request.getContextPath()%>/common/css/movieFinder.css">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="movieFinder.jsp"/><br>
<div class="movieFinder_container">
	<c:if test="${size eq 0 }">
			찾으시는 조건에 해당하는 결과는 총 ${size }건 입니다.
		</c:if>

	<c:if test="${size ne 0 }">


		<c:set var="i" value="0" />
		<c:set var="j" value="3" />
		<table align = "center" cellpadding= "50px" cellspacing="50px" >
			<c:forEach var="a" begin="0" end="${size-1}">
				<c:if test="${i%j == 0 }">
					<tr>
				</c:if>
				<td class="movieTable_td">
					 <li>
						<div>
							<a
								href="movieNameToDetail?movieNm=${li[a].movieNm}&genre=${li[a].genre}&nations=${li[a].nations}">
								<span> <img src="<%=request.getContextPath()%>/common/image/movieFinderDefaultImage/defaultPoster.jpg"
									width="185" height="260">
							</span>
							</a>
						</div> 
						 <span>${li[a].grade}</span> 
						<div>
							<a
								href="movieNameToDetail?movieNm=${li[a].movieNm}&genre=${li[a].genre}&nations=${li[a].nations}">
								<strong>${li[a].movieNm}</strong>
							</a>

						<div>
                            <strong>예매율<span> : 12</span></strong>
                            <div class="egg-gage small">
								<span class="egg great"></span>
								<span class="percent">추천수</span>
							</div>
                        </div>

							<span> <strong> ==yyyy.MM.dd== <span>개봉</span>
							</strong>
							</span> <span>
								<button class="btn-like" value="12345">영화 찜하기</button> 
								<br>
								<span class="count"> <strong><i>xxx</i><span>명이 선택</span></strong> 
								<!--  영화이름으로 넘김 ${li[a].movieNm}  -->
							</span> <a href="#">예매</a>
							<!-- 예매 : 영화이름으로 파라미터 넘김 ${li[a].movieNm} -->
							</span>
						</div>
				</li>
				</td>
				<c:if test="${i%j == j-1 }">
					</tr>
				</c:if>
				<c:set var="i" value="${i+1 }" />
			</c:forEach>
			</c:if>
		</table>
		</div>
</body>
</html>