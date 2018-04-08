<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel = "stylesheet" type = "text/css" href ="<%=request.getContextPath()%>/common/css/movieFinder.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 상세정보</title>
</head>
<body>
	<div class="movieFinder_container">
	<table>
		<tr>
			<td colspan="4">${movieInfoMap.movieNms[0]}//${movieCd}</td>
		</tr>

		<tr>
			<td colspan="4">${movieInfoMap.movieNms[1]}</td>
		</tr>



		<tr>
			<td>감독 :</td>
			<td><c:forEach var="director" items="${movieInfoMap.directors}">
					<!--  <a href></a> 감독코드-->
					<a href="movieMatchPeople?peopleNm=${director}&movieCd=${movieCd}">${director}</a>&nbsp;
				</c:forEach></td>

			<td>/ 배우 :</td>
			<td><c:forEach var="actor" varStatus="idx"
					items="${movieInfoMap.actors}">
					<%-- <a href="peopleDetail?peopleCd=${movieInfoMap.peopleCds[idx.index]}">${actor}</a>&nbsp; --%>
					<a href="movieMatchPeople?peopleNm=${actor}&movieCd=${movieCd}">${actor}</a>&nbsp;
				</c:forEach></td>
		</tr>


		<tr>
			<td>장르 :</td>
			<td><c:forEach var="genre" items="${movieInfoMap.genres}">
					${genre}
				</c:forEach></td>

			<td>/ 기본 :</td>
			<td><c:forEach var="grade" items="${movieInfoMap.grade}">
					${grade }
				</c:forEach> <c:forEach var="showTm" items="${movieInfoMap.showTm}">
					${showTm } 분
				</c:forEach> <c:forEach var="nation" items="${movieInfoMap.nations}">
					
					${nation }
				</c:forEach></td>

		</tr>

		<tr>
			<td>개봉 :</td>
			<td>${movieInfoMap.openDt[0]}
			<td>
		</tr>
		
		<tr>
		<a href="#">찜하기</a> 
		<!-- ${movieInfoMap.movieNms[0]} -->
		
		</tr>




	</table>
	
	<div>
	
	
			<ul class="movieFinder_tab-menu">
                <li><a title="현재 선택됨" href="#">주요정보 </a></li>
                <li><a href="#">트레일러</a></li>
                <li><a href="#">스틸컷</a></li>
                <li><a href="<%=request.getContextPath()%>/evaluation/eachEvaluation?movie_name=${movieInfoMap.movieNms[0]}">평점/리뷰</a></li>
                <li><a href="#">상영시간표</a></li>
            </ul>
	</div>
</div>
	

</body>
</html>