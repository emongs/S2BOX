<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="t5-1"><div>
			<img src="<%=request.getContextPath()%>/common/image/mainImage/2_1.png" height="25px" width="100%" 
			style=" position: relative; top: 0px; left: 0px; z-index: 1;"></div>
			<div class="t1_1_1" style="position: relative; top: -25px; left: 0px; z-index: 2;">날짜</div></div>
			<div class="t5-2">
				<a onclick="" style="width: 100%;
				 height: 35px; font-size: 16px;text-align: center;">[${month}월]</a>
				<c:forEach var="article3" items="${articleList3}">
					<button type="button" onclick="clickDate('${article3.screen_date}','${article3.day}')"
						style="width: 100%; height: 35px; font-size: 12px;">${article3.day}
						${article3.screen_date}</button>
				</c:forEach>

			</div>