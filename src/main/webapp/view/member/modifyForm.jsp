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

.btn {
    background: #fff;
    color: #000000;
    border: 1px solid #000000;
    cursor: pointer;
    width: 150px;
    font-family:Tahoma, Geneva, sans-serif;
}

.btn:hover {
    opacity: 0.8;
}



</style>
<body>


<div class="a">

<center> 

<div class="w3-container"> 
<form method="post" action="ModifyPro" name="userinput" 
 onSubmit="return checkIt()"> 
<h2> 회원정보 수정 </h2>

<table class="w3-table-all  w3-center"  style="width:55%; margin-bottom:5%;"> 
   
     <tr> 
      <td width="200" border bgcolor="#FFFFFF">• 이 름</td>
      <td width="400" border bgcolor="#FFFFFF">  
       ${name}
      </td>
    </tr> 
    <tr> 
      <td width="150" border bgcolor="#FFFFFF">•  아이디</td>&nbsp;&nbsp; &nbsp;  
      <td width="400"  border bgcolor="#FFFFFF"> 
       ${memId}
        <input type="hidden"   name="idchk" > &nbsp;
      
         
      </td>
    </tr>
    <tr> 
      <td width="150" border bgcolor="#FFFFFF">•  비밀번호</td>&nbsp; &nbsp; &nbsp; 
      <td width="400" border bgcolor="#FFFFFF">  
        <input type="password" name="passwd" size="25" maxlength="12" 
        placeholder="비밀번호를 입력해주세요" value="${passwd}">
        <br>
        <br>
        <h8>영문자, 숫자, 특수문자 조합하여 8~12자리, <br>아이디와 4자리 이상 동일, 반복 문자숫자 불가 
         <br>사용가능 특수 문자:!"#$%&()'+,-/;:=@[]^_~</h8>
      </td>
    
    <tr> 
      <td width="200" border bgcolor="#FFFFFF">• E-Mail</td>
      <td width="400" border bgcolor="#FFFFFF"> 
           
   
<input name="email" type="text" class="box" size="25" value="${email}"> 
<!--  <select name="email2" class="box">
    <option value="" selected>선택하세요</option>
    <option value="naver.com">naver.com</option>
    <option value="gmail.com">gmail.com</option>
    <option value="daum.net">daum.net</option>
    <option value="hanmail.com">hanmail.com</option>
    <option value="1">직접입력</option>
</select>  -->

        
      </td>
    </tr>
    
   
       
    <tr>
  <td border bgcolor="#FFFFFF">• 생년월일 </td>&nbsp;&nbsp; &nbsp;  
 
 <td border bgcolor="#FFFFFF"> 
 <input type="text" name="birth" size="25" maxlength="12" 
         value="${birth}">
     
</td>
    </tr>
   
    <tr>
    <td border bgcolor="#FFFFFF">• 휴대전화</td>&nbsp; &nbsp; &nbsp; 
    <td border bgcolor="#FFFFFF"> <input type="text" name="mobile" size="25" maxlength="12" 
         value="${mobile}">
				
		
</td> 
    </tr>
    
   <!--  <tr>
      <td colspan="2" class="w3-center" border bgcolor="#FFFFFF">  
          <input type="submit" name="confirm" value="가입하기" > 
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="취소하기" onclick="javascript:history.back()">
          
      </td>
    </tr>  -->
    <tr>
   
      <td colspan="2" class="w3-center" border bgcolor="#FFFFFF">  
          <input type="submit" name="confirm" value="변경하기" class="btn"> 
			 <input type="button" value="취소하기" onclick="javascript:history.back()" class="btn">
			</td>
   </tr>
  </table>
  </form>
</div>
</center>

</div>
</body>
</html>