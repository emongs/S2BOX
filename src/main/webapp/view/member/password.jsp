<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html> 
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
form {
     border: 3px solid #D8D8D8;
    margin-top:10%;
    position: relative;
    margin-left:25%;
    width: 750px;
    height: 400px;
    font-family:Tahoma, Geneva, sans-serif;
}


.container {
    padding: 16px;
}

.btn {
    background: #fff;
    color: #FF8000;
    padding: 14px 21px;
    margin: 8px 0;
    border: 1px solid #FF8000;
    cursor: pointer;
    width: 300px;
    font-family:Tahoma, Geneva, sans-serif;
}

.btn:hover {
    opacity: 0.8;
}
</style>
<body>

<c:if test="${xxx eq ''}"> 
<form>
 <div class="container" align="center" style="padding-top:150px;">
 
 등록되지 않은 회원입니다. <br><br>
 <input type="button" class="btn" value="뒤로가기" onclick="javascript:history.back()">
 
 </div>

</form>
<!-- <meta http-equiv="Refresh" content="0;url=../member/passwordForm"> -->

</c:if> 

<c:if test="${xxx ne ''}">
<form action="<%= request.getContextPath() %>/member/loginForm" method = "post">
 <div class="container" align="center" style="padding-top:150px;">
 
  ${id}님의<br> 
   비밀번호는 ${xxx} 입니다. 
   <br><br>
  <button type="submit" class="btn" ><font size="+0.5">로그인하기</font></button>
 </div>

</form>
 
  <!-- <meta http-equiv="Refresh" content="0; url=../member/loginForm"> -->
  <!--  <script> 
      location.href('../member/loginForm'); 
</script>  --> 
</c:if>


</body>
</html>