<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}
body {
  margin: 0;
 	
}

.menu1 {
    height:20px;
    margin-left:20%; 
    margin-top:3%;
    font-style: 12px dotum;
    
}


.menu2 {
    height:250px;
    margin-left:20%; 
    margin-top:3%;
    font-style: 12px dotum;
}


.row:after {
    content: "";
    display: table;
    clear: both;
     width: 70%;
    
}
/* button {
    border:none;
    cursor: pointer;
}
button:hover {
    opacity: 0.8;
} */

.join_btn{
	border: 0;
	cursor: pointer;
	background-color:#7a7a7a;
	color:white;
	margin-top:5px;
	padding:2px 8px 3px 8px;
}


</style>
</head>
<body>

 
 <div class="row" style="width: 70%; margin-left: 10%; margin-bottom: 30%; ">
    
  <div class="menu1">
    <h3>자주 찾는 질문</h3>
    </div>
    
  <div class="menu2">
		<h4>필요하신 문의사항이 있으신가요?</h4>
  <input id="searchtext" type="text" class="c_input" title="검색어 입력"
				placeholder="검색어를 입력해 주세요" value="" style="width: 350px; height: 35px;">&nbsp;
			<button type="button" class="join_btn" title="검색하기" id="btn_search" style="width:90px; height: 35px;">
				<span>검색하기</span>
			</button><br><br>
			
			<button type="button" class="join_btn" style=" width:200px; height: 40px; margin-right:6%;"> 나의 문의 내역 확인</button>
			<button type="button" class="join_btn" style="width:200px; height: 40px;" onclick="location.href = ' <c:url value= "/vip/vip-lounge"/>'"><span> vip 고객센터</span></button>
			
</div>
  
</div>



</body>
</html>