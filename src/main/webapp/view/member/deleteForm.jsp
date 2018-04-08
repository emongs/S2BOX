<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<style type="text/css">
.menu_all {
	float: left;
	width: 58%;
	height: 600px;
	float: left;
	margin-top: -3%;
}

.row_menu:after {
	content: "";
	display: table;
	clear: both;
	width: 70%;
}
.content1 {
 	float: left;
   border: 1px solid #E1E1E1;
   margin-left:10%;
   height:500px;
   width: 90%;
   text-align: center;
}
</style>
<head>
</head>
<body>
<div class="row_menu">
		<div class="menu_all">
		<h3>나의 정보</h3>
		<h4>나의 프로필/S2Box정보</h4>
		<div class="content1">

            <form action="<%=request.getContextPath()%>/member/deletePro"
               method="post">
               <br>
               <br>
               <br>
               <img src="<%=request.getContextPath()%>/common/image/memberImage/ch1.png" width="100"
                  height="100">
               <h3>회원탈퇴</h3>

               회원을 탈퇴하시려면 비밀번호를 입력하셔야 합니다.<br> 탈퇴 시, 회원님의 회원정보와 현재 저장된 
                예매내역  등이 즉시 자동 소멸 됩니다.<br> <br>
               <input type="password" placeholder="비밀번호를 입력해주세요" name="passwd">
               <br>
               <br>
               <button type="submit">확인</button>
               <button>취소</button>
            </form>
         </div>
		
		</div>
		</div>

</body>
</html>