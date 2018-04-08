<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/custom-functions.tld" prefix="fn"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/common/css/movieFinder.css?ver=1">
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/httpRequest.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">

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

function loadDeleteWishList(movie_nameParam,idParam) {
	var movie_name = movie_nameParam;
	var id = idParam;
	var params = "movie_name=" + encodeURIComponent(movie_name)+"&id="+encodeURIComponent(id);
	sendRequest("<%=request.getContextPath()%>/wishlist/deleteWishList", params, loadedDeleteWishList, "GET");
}

function loadedDeleteWishList() {
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
function likeCheck() {
	alert("로그인 후 이용할 수 있습니다.")
}

</script>

</head>

<style>
.movieFinder_table {
	background: url(../common/image/mypage_Image/ubuntu_color.png);
	background-size: 100% 100%;
	width : 100%;
	/* border-spacing : 10px; */
	min-width: 875px;
	font-family: 'NanumBarunGothicBold';
	color:white;
}
</style>
<body>
<div class="movieFinder_container"> 
</div>

    <div>
   <c:if test="${movieChart ne null}">
    	<c:set var="i" value="0" />
		<c:set var="j" value="3" />
		<table align = "center" cellpadding= "50px" cellspacing="50px" >
		<c:forEach var = "a" begin="0" end="${size-1}">
				<c:if test="${i%j == 0 }">
				<tr>
				</c:if>
				
				<c:set var="movie_name" value="${movieChart.movieNm[a]}"/>
				<td class="movieTable_td">
					 <li class="finder_li">
					 <div class="rank_poster"> 
					 <strong class="rank">[${a+1 }위]</strong>
                    <div> 
                        <a href="movieDetail?movieCd=${movieChart.movieCd[a]}">
                            <span>
                                <img src="<%=request.getContextPath()%>/common/image/movieFinderDefaultImage/defaultPoster.jpg" style="width:100%;">
                            </span>
                        </a>
                    </div>
                    
                    <div class="rank_contents">
                         <a href="movieDetail?movieCd=${movieChart.movieCd[a]}">
                            <strong style="color:#88387f;">${movieChart.movieNm[a]}</strong>
                        </a>

                        <div>
                            <strong>예매율<span> : 12</span></strong>
                            <div class="egg-gage small">
								<span class="egg great"></span>
								<span class="percent">추천수</span>
							</div>
                        </div>

                        <span>
                            <strong>
                                	${movieChart.openDt[a]}
                                <span>개봉</span>
                            </strong>
                        </span>
                        <br>
                        <span> 
                        <!-- 위시리스트 value값으로 영화이름을 넘겨줌. --> 
                        
                     
                        <c:if test="${id ne null}" >
                           <!-- 로그인한 사람인지 체크하는지 확인 로그인한 사람은 영화를 찜할수도 안할수도 있으니 2가지 경우로 나누어짐 -->
                        <c:choose>
							<c:when test="${ fn:contains(movieNameCheckWithId,movieChart.movieNm[a])}">
								<!-- 유저가 가지고 있는 좋아요 목록중에 무비차트에 해당하는 영화 이름이 존재하면 -->
								 <button class="movieFinder_btn_like" onclick='loadDeleteWishList("${movieChart.movieNm[a]}","${id}")'></button>
                            		<span class="count"> 
                                		<strong>${likeCount[a]}</strong><span>명이 선택</span> 
                       				</span> 
							</c:when>
							<c:otherwise>
								 <button class="movieFinder_btn_unlike" onclick='loadInsertWishList("${movieChart.movieNm[a]}","${id}")'></button>
                          			<span class="count"> 
                                			<strong>${likeCount[a]}</strong><span>명이 선택</span> 
                            		</span>
							</c:otherwise>
						</c:choose> 
						</c:if>
								
						 <c:if test="${id eq null}" >
						 <button class="movieFinder_btn_unlike" onclick='likeCheck()'></button>
                          			<span class="count"> 
                                			<strong>${likeCount[a]}</strong><span>명이 선택</span> 
                            		</span>
						 </c:if>
						 	<a href="#"><image class="reservation" src="<%=request.getContextPath()%>/common/image/evaluationImage/reservation_button.png" style="width:50px; height:auto;"></image></a>
                            <!-- 예매 파라미터 값으로 영화이름 넘겨줌 ${movieChart.movieNm[a]}-->
                        </span>
                    </div>
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
	</div>
		
</body>
<!-- 체크박스의 아이디와 장르를 어떻게 하나...  -->
</html>