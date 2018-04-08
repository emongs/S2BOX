<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script>
	if(confirm("delete From wishList?")) {
		location.href="/likeTest/member/myPage";
	} else {
		history.go(-1);
	}

</script>
