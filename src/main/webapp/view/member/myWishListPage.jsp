<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/httpRequest.js"></script>
<script>
function loadInsertWishList(movie_nameParam,idParam) {
	var movie_name = movie_nameParam;
	var id = idParam;
	var params = "movie_name=" + encodeURIComponent(movie_name)+"&id="+encodeURIComponent(id);
	sendRequest("<%=request.getContextPath()%>/wishlist/addWishList", params, loadedInsertWishList, "GET");
}

function loadedInsertWishList() {
	if (httpRequest.readyState == 4) {
		if (httpRequest.status == 200) {
			$(document).ready(function(){	
				window.location.reload();
			});
		} else {
			alert(httpRequest.status);
		}
	}
}
</script>
<style>
.movieFinder_btn_like {
	background : url(../image/movieFinderDefaultImage/like.png) no-repeat;	
	height : 30px;
	width : 30px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>위시리스트</h1>
<!-- ajax 붙이자 -->

	
	
	 <c:if test="${wishList ne null}">
    	<c:set var="i" value="0" />
		<c:set var="j" value="3" />
		<table align = "center" cellpadding= "50px" cellspacing="50px" >
		<c:forEach var = "a" begin="0" end="${size-1}">
				<c:if test="${i%j == 0 }">
					<tr>
				</c:if>
				<td class="movieTable_td">
					 <li>
                    <div>
                        <a href="movieNameToDetail?movieNm=${wishList[a].movieNm}&genre=${wishList[a].genre}&nations=${wishList[a].nations}">
                            <span>
                                <img src="<%=request.getContextPath()%>/common/image/movieFinderDefaultImage/defaultPoster.jpg" width="185" height="260">
                            </span>
                        </a>
                    </div>
                    
                    <div>
                        <a href="movieNameToDetail?movieNm=${wishList[a].movieNm}&genre=${wishList[a].genre}&nations=${wishList[a].nations}">
                            <strong>${wishList[a].movieNm}</strong>
                        </a>

                        <span> 
                             <button class="movieFinder_btn_like" onclick='loadDeleteWishList("${movieChart.movieNm[a]}","${id}")'></button>
                            		<span class="count"> 
                                		<strong><i>${likeCount[a]}</i><span>명이 선택</span></strong> 
                       				</span>
                            <a href="#">예매</a>
                        </span>
                    </div>    
                </li> 
            </td>
				<c:if test="${i%j == j-1 }">
					</tr>
				</c:if>
				<c:set var="i" value="${i+1 }" />
		</c:forEach>
		</table>
	</c:if>
</body>
</html>