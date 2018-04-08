<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>게시판</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>
	<center>
		<p>
			<b>글내용 보기</b>
		</p>
		<div class="w3-container">
			<table class="w3-table-all" style="width: 80%;">
				<tr height="30">
					<td width="125" align="center">글번호</td>
					<td width="125" align="center">${article.num}</td>
				<td width="125">조회수</td>
			<td width="125" align="center">${article.readcount}</td>
				</tr>
				<tr height="30">
					<td width="125">작성자</td>
			<td width="125" align="center">${article.writer}</td>
			<td width="125" align="center">작성일</td>
				<td align="center" width="125" >
				${article.reg_date}</td></tr>
				<tr height="30">
					<td width="125">타입</td>
			<td width="125" align="center">${article.type}</td>
			<td width="125" align="center">구분</td>
				<td align="center" width="125" >
				${article.cases}</td></tr>
				
				<tr height="30">
					<td align="center" width="125">글제목</td>
					<td align="center" width="375" colspan="3">
					${article.subject}</td>
				</tr><tr height="30">
					<td align="center" width="125">글내용</td>
					<td align="left" width="375" colspan="3">
					
					
					<pre>
         ${article.content}</pre>
         
         
         
         </td>
				</tr>
				
			<tr><td>&nbsp;</td><td>
<img 
src="<%=request.getContextPath()%>/fileSave/${article.filename}">
</td></tr>	
		
		
				
				<tr height="30">
			<td colspan="4" class="w3-center"><input type="button"
			value="글수정" 
				onclick="document.location.href='updateForm?num=${article.num}&pageNum=${pageNum}'">
						&nbsp;&nbsp;&nbsp;&nbsp;
		 <input type="button" value="글삭제"
		onclick="document.location.href=
        'deleteForm?num=${article.num}&pageNum=${pageNum}'">
		&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="답글쓰기"
		onclick="document.location.href
		='writeForm?num=${article.num}&ref=${article.ref}&re_step=${article.re_step}&re_level=${article.re_level}&pageNum=${pageNum}'">
		&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="글목록"
		onclick="document.location.href='list?pageNum=${pageNum}'">
					</td></tr></table>
		</div></center></body></html>

