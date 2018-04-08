<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.t6-2 ul {
	text-decoration: none;
	display: inline;
	display:block;
}
.t6-2 li{

	padding:0 10px;
	display: inline;
	display:block;
}

}
.t6-2 {
	height: 475px;
	line-height: 50px;

}
</style>
<div class="t6-1">
	<div>
		<img
			src="<%=request.getContextPath()%>/common/image/mainImage/2_1.png"
			height="25px" width="100%"
			style="position: relative; top: 0px; left: 0px; z-index: 1;">
	</div>
	<div class="t1_1_1"
		style="position: relative; top: -25px; left: 0px; z-index: 2; color: white; margin-bottom: 2%;">시간</div>
</div>

<div class="t6-2">
	<c:forEach var="article" items="${distinctScreenList}">
		<c:set var="first" value="0"></c:set>
		<c:forEach var="article1" items="${timeTableList}">
			<c:if test="${article.screen_code eq article1.screen_code }">
				<div>
					
						<c:if test="${first eq 0 }">
							<div class="title_dd" style="width: 100%;height: 20px; margin-top: 2%;">
							<span class="title_d"> <span class="special">${article1.special}</span>
								<c:forEach var="article2" items="${screenCodeList}">
									<c:if test="${article2.screen_code eq article1.screen_code }">
										<span class="screen"> ${article2.screen_name}</span>
										<input type="hidden" id="ourSelectScreenName"
											value="${article2.screen_name}">
									</c:if>
								</c:forEach>
							</span>
							</div>
							<br>
						</c:if>
						
						<c:set var="first" value="${first+1}"></c:set>
						<div style=" float: left; width: 20%; ">
						<li class="start"
						onclick="clickTime('${article1.start_hour}','${article1.start_min}','${article1.end_hour}','${article1.end_min}','${article1.screen_code}')">${article1.start_hour}:${article1.start_min}</li>
					</div>
				
				</div>
			</c:if>
		</c:forEach>
	</c:forEach>
</div>