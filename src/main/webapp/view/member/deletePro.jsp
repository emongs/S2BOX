<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check==1 }">
<meta http-equiv="Refresh" content="0; url=<%=request.getContextPath() %>/board/main">
	<script>
		session.invalidate();
		alert("회원탈퇴가 완료되었습니다.");
	</script>
</c:if>

<c:if test="${check==0 }">
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>
<c:if test="${check==-1 }">
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
</c:if>