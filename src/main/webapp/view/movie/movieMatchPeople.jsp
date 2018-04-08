<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel = "stylesheet" type = "text/css" href ="<%=request.getContextPath()%>/common/css/movieFinder.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인물</title>
</head>
<body>
<div class="movieFinder_container">
	<h2>영화 상세정보 페이지에서 인물이름을 클릭했을때 그 배우가 참여한 영화를 보여주는 페이지.</h2>
	<h1>movieMatchPeople.jsp</h1>

		<c:forEach var='item' items='${map.movieCd}' varStatus="idx">
			<tr>
				<td>${item}</td>
				<td><a href="movieDetail?movieCd=${item}">${map.movieNm[idx.index]}</a></td>
			<tr>
		</c:forEach>

		
		<c:set var="i" value="0" />
		<c:set var="j" value="3" />
		<table align = "center" cellpadding= "50px" cellspacing="50px" >
		<c:forEach var='item' items='${map.movieCd}' varStatus="idx">
				<c:if test="${i%j == 0 }">
					<tr>
				</c:if>
				<td class="movieTable_td">
					 <li style="list-style: none;">
                    <div>
                        <a href="movieDetail?movieCd=${item}">
                            <span>
                                <img src="<%=request.getContextPath()%>/movieFinderDefaultImage/defaultPoster.jpg" width="185" height="260">
                            </span>
                        </a>
                    </div>
                    <div>
                         <a href="movieDetail?movieCd=${item}">
                            <strong>${map.movieNm[idx.index]}</strong>
                        </a>
                    </div>    
                </li> 
            </td>
				<c:if test="${i%j == j-1 }">
					</tr>
				</c:if>
				<c:set var="i" value="${i+1 }" />
		</c:forEach>

	</table>
	</div>
</body>
</html>