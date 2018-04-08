<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

</style>
<link rel = "stylesheet" type = "text/css" href ="<%=request.getContextPath()%>/common/css/movieFinder.css">

<script type="text/javascript"
    src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">

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


<body>
<div class="sect-common">
	<div class="sect-finder">
	<h3>좋아하는 영화, 찾고싶은 영화를 S2BOX에서 찾아드립니다!</h3>
    <form action="movieFinderRes" method="GET" name="frm" onsubmit='notCheckedToSelectAll()'>
    	<fieldset>
        <table class="findertable" border="1">
            <tr cass="findertr">
                <th style="padding-left:34px;" scope="row">영화검색</th>

                <td><select id="keyword_type" name="findType" name="findType">
                        <option value="1" selected>영화이름</option>
                        <option value="2">주연배우</option>
                        <option value="3">감독명</option>
                </select> <input id="keyword" style="width:410px; padding-left: 10px;" placeholder="키워드를 입력해주세요" type="text" value="" name="name" name="name">
                </td>
            </tr>
            <tr cass="findertr">
                <th style="padding-left:34px;" scope="row">장르</th>

                <td>
                    <ul class="finder_ul">
                        <li><input type="checkbox" id ="genreAll"><label>전체</label></li>
                        <li class="collage"><input type="checkbox" name="genre" value="asdf"><label>아트하우스</label></li>
                    </ul>

                    <ul class="finder_ul">
                        <li><input type="checkbox" name="genre" value="드라마"><label>드라마</label></li>
                        <li><input type="checkbox" name="genre" value="코미디"><label>코미디</label></li>
                        <li><input type="checkbox" name="genre" value="액션"><label>액션</label></li>
                        <li><input type="checkbox" name="genre" value="멜로/로맨스"><label>멜로/로맨스</label></li>
                        <li><input type="checkbox" name="genre" value="스릴러"><label>스릴러</label></li>
                        <li><input type="checkbox" name="genre" value="미스터리"><label>미스터리</label></li>
                        <li><input type="checkbox" name="genre" value="공포(호러)"><label>공포(호러)</label></li>
                    </ul>

                    <ul class="finder_ul">
                        <li><input type="checkbox" name="genre" value="어드벤처"><label>어드벤처</label></li>
                        <li><input type="checkbox" name="genre" value="범죄"><label>범죄</label></li>
                        <li><input type="checkbox" name="genre" value="가족"><label>가족</label></li>
                        <li><input type="checkbox" name="genre" value="판타지"><label>판타지</label></li>
                        <li><input type="checkbox" name="genre" value="SF"><label>SF</label></li>
                        <li><input type="checkbox" name="genre" value="서부극(웨스턴)"><label>서부극(웨스턴)</label></li>
                        <li><input type="checkbox" name="genre" value="사극"><label>사극</label></li>
                    </ul>

                    <ul class="finder_ul">
                        <li><input type="checkbox" name="genre" value="애니메이션"><label>애니메이션</label></li>
                        <li><input type="checkbox" name="genre" value="다큐멘터리"><label>다큐멘터리</label></li>
                        <li><input type="checkbox" name="genre" value="전쟁"><label>전쟁</label></li>
                        <li><input type="checkbox" name="genre" value="뮤지컬"><label>뮤지컬</label></li>
                        <li><input type="checkbox" name="genre" value="성인물(에로)"><label>성인물(에로</label></li>
                        <li><input type="checkbox" name="genre" value="공연"><label>공연</label></li>
                        <li><input type="checkbox" name="genre" value="기타"><label>기타</label></li>
                    </ul>

                </td>


            </tr>
            
            
            <tr>
                <th style="padding-left:34px;" >제작국가</th>

                <td>
                    <ul class="finder_ul">
                        <li><input type="checkbox" id = "nationAll">전체</li>
                        <li><input type="checkbox" name = "nation" value="한국">한국</li>
                        <li><input type="checkbox" name = "nation" value="미국">미국</li>
                        <li><input type="checkbox" name = "nation" value="일본">일본</li>
                        <li><input type="checkbox" name = "nation" value="중국">중국</li>
                        <li><input type="checkbox" name = "nation" value="홍콩">홍콩</li>
                        <li><input type="checkbox" name = "nation" value="프랑스">프랑스</li>
                        <li><input type="checkbox" name = "nation" value="영국">영국</li>
                        <li><input type="checkbox" name = "nation" value="독일">독일</li>
                        <li><input type="checkbox" name = "nation" value="인도">인도</li>
                        <li><input type="checkbox" name = "nation" value="기타">기타</li>
                    </ul>
                </td>
            </tr>
 	
            
            <tr>
                <th style="padding-left:34px;" >관람등급</th>

                <td>
                    <ul class="finder_ul">
                        <li><input type="checkbox" id = "gradeAll">전체</li>
                        <li><input type="checkbox" name = "grade" value="전체관람가">전체관람가</li>
                        <li><input type="checkbox" name = "grade" value="12세이상관람가">12세 관람가</li>
                        <li><input type="checkbox" name = "grade" value="15세이상관람가">15세 관람가</li>
                        <li><input type="checkbox" name = "grade" value="청소년관람불가">청소년 관람불가</li>
                    </ul>
                </td>
            </tr>
            <tr>
                <th style="padding-left:34px;" >제작년도</th>

                <td><input type="text" id="year_start" name="startYear"> - <input type="text" id="year_end" name="endYear"></td>
            </tr>
        </table>
		<div class="wrap-submit">
        	<button type="submit" class="reound inred" id="brn_submit" value="조회"><span>조회</span></button>
        </div>
        </fieldset>
    </form>
    </div>
    </div>
    
   <c:if test="${movieChart ne null}">
    	<c:set var="i" value="0" />
		<c:set var="j" value="3" />
		<table align = "center" cellpadding= "50px" cellspacing="50px" >
		<c:forEach var = "a" begin="0" end="${size-1}">
				<c:if test="${i%j == 0 }">
					<tr>
				</c:if>
				<td class="movieTable_td">
					 <li>
					 <strong class="rank">[${a+1 }위]</strong>
                    <div>
                        <a href="movieDetail?movieCd=${movieChart.movieCd[a]}">
                            <span>
                                <img src="<%=request.getContextPath()%>/movieFinderDefaultImage/defaultPoster.jpg" width="185" height="260">
                            </span>
                        </a>
                    </div>
                    
                    <div>
                         <a href="movieDetail?movieCd=${movieChart.movieCd[a]}">
                            <strong>${movieChart.movieNm[a]}</strong>
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
                            <button class="btn-like" value="${movieChart.movieNm[a]}">영화 찜하기</button>
                            <span class="count"> 
                            	<br>
                                <strong><i>xxx</i><span>명이 선택</span></strong> 
                                <i class="corner-RT"></i><i class="corner-LT"></i><i class="corner-LB"></i><i class="corner-RB"></i><i class="corner-arrow"></i>
                            </span>
                            <a href="#">예매</a>
                            <!-- 예매 파라미터 값으로 영화이름 넘겨줌 ${movieChart.movieNm[a]}-->
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
	</div>
		
</body>
<!-- 체크박스의 아이디와 장르를 어떻게 하나...  -->
</html>