<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html><head><title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head><body >
<p class="w3-left"  style="padding-left:30px;"><%=board%>></p>
<center><div class="w3-container "><b>글삭제</b><br>
<form method="POST" name="delForm"  
action="deletePro?pageNum=${pageNum}" 
   onsubmit="return deleteSave()"> 
 <table class="table-bordered" width="360">
  <tr height="30"><td align=center  ><b>비밀번호를 입력해 주세요.</b></td>
  </tr>  <tr height="30">
     <td align=center >비밀번호 :   
   <input type="password" name="passwd" size="8" maxlength="12">
	   <input type="hidden" name="num" value="${num}">
	   </td> </tr> <tr height="30">    <td align=center >
      <input type="submit" value="글삭제" >
      <input type="button" value="글목록" 
onclick="document.location.href='list.do?pageNum=${pageNum}'">     
 </td> </tr>  </table> </form></center></div></body></html> 
