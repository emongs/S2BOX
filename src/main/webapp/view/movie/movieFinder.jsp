<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/WEB-INF/custom-functions.tld" prefix="fn" %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<link rel = "stylesheet" type = "text/css" href ="<%=request.getContextPath()%>/common/css/movieFinder.css?ver=1">
 <script type="text/javascript" src="<%=request.getContextPath()%>/js/httpRequest.js"></script>
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



$(document).ready(function(){
    //최상단 체크박스 클릭
    var selectGenre = ".";
    var selectNation = ".";
    var selectGrade = ".";
    <c:forEach items = "${genre}" var = "i">
		selectGenre += "${i}" + ".";
	</c:forEach>
	
    <c:forEach items = "${grade}" var = "i">
		selectGrade += "${i}" + ".";
	</c:forEach>
	
    <c:forEach items = "${nation}" var = "i">
		selectNation += "${i}" + ".";
	</c:forEach>
	//alert(selectGenre);
	
    var genrelength = $("input[name=genre]").length;

     for (var i = 0 ; i < genrelength ; i++) {
    	 var indexgenre = $("input[name=genre]")[i].value;
    	
    	 if(selectGenre.indexOf("."+indexgenre+".")>=0) {
    		 //alert(indexgenre);
    		 $("input[name=genre]")[i].checked=true;
    	 }
     } 
     
     var gradelength = $("input[name=grade]").length;

     for (var i = 0 ; i < gradelength ; i++) {
    	 var indexgrade = $("input[name=grade]")[i].value;
    	
    	 if(selectGrade.indexOf("."+indexgrade+".")>=0) {
    		// alert(indexgenre);
    		 $("input[name=grade]")[i].checked=true;
    	 }
     } 
     
     var nationlength = $("input[name=nation]").length;

     for (var i = 0 ; i < nationlength ; i++) {
    	 var indexnation = $("input[name=nation]")[i].value;
    	
    	 if(selectNation.indexOf("."+indexnation+".")>=0) {
    		 //alert(indexnation);
    		 $("input[name=nation]")[i].checked=true;
    	 }
     } 
     
     var findType = "${findType}";
     var name = "${name}";
     var startYear = "${startYear}";
     var endYear = "${endYear}";
     
     $("input[name=name]").val(name);
     $("input[name=startYear]").val(startYear);
     $("input[name=endYear]").val(endYear);
     $("select[name=findType]").val(findType);
     
})

$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#genreAll").click(function(){
        //클릭되었으면
        if($("#genreAll").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=genre]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=genre]").prop("checked",false);
        }
    })
})

$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#nationAll").click(function(){
        //클릭되었으면
        if($("#nationAll").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=nation]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=nation]").prop("checked",false);
        }
    })
})

$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#gradeAll").click(function(){
        //클릭되었으면
        if($("#gradeAll").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=grade]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=grade]").prop("checked",false);
        }
    })
})

function notCheckedToSelectAll(){
    var genreFlag = true;
	var gradeFlag = true;
	var nationFlag = true;
	//var startYear = document.getElementsByName("startYear")[0].value;
	//var endYear = document.getElementsByName("endYear")[0].value; 
	
	//var len = document.getElementsByName("startYear")[0].length;
	//alert("len : " + len);
	//
	//if(len == undefined) {
	//	alert("null");
	//}
	
         //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
         if($("input[name=grade]").is(":checked")) {
        	 gradeFlag = false;
         }
         
         if($("input[name=genre]").is(":checked")) {
        	 genreFlag = false;
         }
         
         if($("input[name=nation]").is(":checked")) {
        	 nationFlag = false;
         }
         
         if(nationFlag) {
        	 $("input[name=nation]").prop("checked",true);
         }
         
         if(gradeFlag) {
        	 $("input[name=grade]").prop("checked",true);
         }
         
         if(genreFlag) {
        	 $("input[name=genre]").prop("checked",true);
         }
         
        // alert(document.getElementsByName("startYear")[0].value);
	
	document.frm.submit();
}
// 파라미터로 넘어온 값들이 있을거아니야 그러면 그거를 체크로 바꿔줘야지...


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
 <form action="movieFinderRes" method="GET" name="frm" onsubmit='notCheckedToSelectAll()'>
        <table align="center" class="movieFinder_table" cellpadding="10px">
            <tr>
                <td class="td_title">영화검색</td>
				
				
                <td>
               		<ul class="finder_ul">
						<li class="finder_li" >
							<select name="findType" name="findType" style="height:25px;">
			                        <option value="1">영화이름</option>
			                        <option value="2">주연배우</option>
			                        <option value="3">감독명</option>
			                </select> <input type="text" value="" name="name" name="name" style="height:25px;">
               		 	</li>
                	</ul>
                </td>
            </tr>

            <tr>
                <td class="td_title">장르</td>

                <td>
                    <ul class="finder_ul">
                        <li class="finder_li"><input type="checkbox" id = "genreAll">전체</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="asdf">아트하우스</li>
                    </ul>

                    <ul class="finder_ul">
                        <li class="finder_li"><input type="checkbox" name="genre" value="드라마">드라마</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="코미디">코미디</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="액션">액션</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="멜로/로맨스">멜로/로맨스</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="스릴러">스릴러</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="미스터리">미스터리</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="공포(호러)">공포(호러)</li>
                    </ul>

                    <ul class="finder_ul">
                        <li class="finder_li"><input type="checkbox" name="genre" value="어드벤처">어드벤처</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="범죄">범죄</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="가족">가족</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="판타지">판타지</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="SF">SF</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="서부극(웨스턴)">서부극(웨스턴)</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="사극">사극</li>
                    </ul>

                    <ul class="finder_ul">
                        <li class="finder_li"><input type="checkbox" name="genre" value="애니메이션">애니메이션</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="다큐멘터리">다큐멘터리</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="전쟁">전쟁</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="뮤지컬">뮤지컬</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="성인물(에로)">성인물(에로)</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="공연">공연</li>
                        <li class="finder_li"><input type="checkbox" name="genre" value="기타">기타</li>
                    </ul>

                </td>


            </tr>
            
            
            <tr>
                <td class="td_title">제작국가</td>

                <td>
                    <ul class="finder_ul">
                        <li class="finder_li"><input type="checkbox" id = "nationAll">전체</li>
                        <li class="finder_li"><input type="checkbox" name = "nation" value="한국">한국</li>
                        <li class="finder_li"><input type="checkbox" name = "nation" value="미국">미국</li>
                        <li class="finder_li"><input type="checkbox" name = "nation" value="일본">일본</li>
                        <li class="finder_li"><input type="checkbox" name = "nation" value="중국">중국</li>
                        <li class="finder_li"><input type="checkbox" name = "nation" value="홍콩">홍콩</li>
                        <li class="finder_li"><input type="checkbox" name = "nation" value="프랑스">프랑스</li>
                        <li class="finder_li"><input type="checkbox" name = "nation" value="영국">영국</li>
                        <li class="finder_li"><input type="checkbox" name = "nation" value="독일">독일</li>
                        <li class="finder_li"><input type="checkbox" name = "nation" value="인도">인도</li>
                        <li class="finder_li"><input type="checkbox" name = "nation" value="기타">기타</li>
                   		<li class="finder_li"></li>
                   		<li class="finder_li"></li>
                    </ul>
                </td>
            </tr>
 	
            
            <tr>
                <td class="td_title">관람등급</td>

                <td>
                    <ul class="finder_ul">
                        <li class="finder_li"><input type="checkbox" id = "gradeAll">전체</li>
                        <li class="finder_li"><input type="checkbox" name = "grade" value="전체관람가">전체관람가</li>
                        <li class="finder_li"><input type="checkbox" name = "grade" value="12세이상관람가">12세 관람가</li>
                        <li class="finder_li"><input type="checkbox" name = "grade" value="15세이상관람가">15세 관람가</li>
                        <li class="finder_li"><input type="checkbox" name = "grade" value="청소년관람불가">청소년 관람불가</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <td class="td_title">제작년도</td>

                <td>
                	<ul class="finder_ul">
                		<li class="finder_li">
		                <input type="text" name="startYear" style="height:25px;"> - <input type="text" name="endYear" style="height:25px;">
                		</li>
                	</ul>
                </td>
            </tr>
            
        </table>
        <div style="margin-top:10px;">        	
        	<button type="submit" class="mf_submit_btn">조회</button>
        </div>
        
    </form>
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