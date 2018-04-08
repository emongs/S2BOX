<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>위시리스트</title>
<script script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var modalLayer = $("#modalLayer");
		var modalLink = $(".modalLink");
		var modalCont = $(".modalContent");
		var marginLeft = modalCont.outerWidth() / 2;
		var marginTop = modalCont.outerHeight() / 2;

		modalLink.click(function() {
			modalLayer.fadeIn("slow");
			modalCont.css({
				"margin-top" : -marginTop,
				"margin-left" : -marginLeft
			});
			$(this).blur();
			$(".modalContent > a").focus();
			return false;
		});

		$(".modalContent > button").click(function() {
			modalLayer.fadeOut("slow");
			modalLink.focus();
		});
	});
	
	function changeImage(){
		alert("위시리스트에서 삭제되었습니다.");
	}
</script>
</head>
<style>
.mask {
	width: 100%;
	height: 100%;
	position: fixed;
	left: 0;
	top: 0;
	z-index: 10;
	background: #000;
	opacity: .5;
	filter: alpha(opacity = 50);
}

#modalLayer {
	display: none;
	position: relative;
}

#modalLayer .modalContent {
	width: 500px;
	height: 360px;
	padding: 20px;
	border: 1px solid #ccc;
	position: fixed;
	left: 50%;
	top: 50%;
	z-index: 11;
	background: #fff;
}

#modalLayer .modalContent button {
	position: absolute;
	right: 0;
	top: 0;
	cursor: pointer;
	border: none;
}

.allSide {
	width: 80%;
	margin-left: 15%;
	margin-top: 80px;
	margin-bottom: 20%;
	height: 600px;
}

.sides11:after {
	content: "";
	display: table;
	clear: both;
}

.side1 {
	border: 1px solid #ccc;
	width: 20%;
	float: left;
	height: 600px;
}

.wishlist {
	width: 70%;
	float: left;
	height: 600px;
}

.wishlist1 {
	width: 100%;
	height: 50px;
	background-color: #EFF5FB;
}

.wishlist2 {
	width: 100%;
	height: 550px;
	background-color: #FFFFFF;
}
</style>
<body>
	<div class="allSide">
		<div class="sides11">
			<div class="side1">
				<div class="side_1"
					style="background-color: #FBFBEF; width: 80%; height: 600px; margin-left: 10%;">
					<!--====================================프로필 부분 =======================================================-->
					<div
						style="background-color: #EFF5FB; height: 200px; border-radius: 10px;">
						<div style="margin-left:30%; margin-right:20%;  padding-top:20px;">
							<img src="<%=request.getContextPath()%>/fileSave/${filename}"
								width="140" height="140"
								style="border-radius: 100px; margin: 0 0 0 0;"> ${name}<br>${memId}

							<a href="#modalLayer" class="modalLink"><img
								src="<%=request.getContextPath()%>/image/write.png" width="20"
								height="20"></a>



							<div id="modalLayer">
								<div class="modalContent">
									<form method="post" action="ModifyPro2" name="userinput"
										onSubmit="return checkIt()">
										<div class="menudf">
											<div style="margin-top: 1%;">
												<form method="post" action="inputPro2" name="userinput"
													onSubmit="return checkIt()">
													<font style="font-size: 20px;"> ${name}님 </font>
											</div>
											<div>
												<div>
													<div style="float: left; width: 25%; height: 50px;">
														•닉네임</div>
													<div style="float: left; width: 75%; height: 50px;">
														한글, 영문, 숫자 혼용 가능 (한글 기준 10자 이내) <input type="text"
															name="nickname" size="25" maxlength="12"
															value="${nickname}">
													</div>
												</div>
												<div>
													<div style="float: left; width: 25%;">• 프로필이미지</div>
													<div style="float: left; width: 75%;">
														<center>
															<img
																src="<%=request.getContextPath()%>/fileSave/${member.filename}"
																width="180" height="180"
																style="border-radius: 100px; margin-top: 5%; margin-bottom: 5%; margin-right: 30%;">
														</center>
													</div>
												</div>
											</div>

											<div style="margin-top: 50%;">
												<center>
													<input type="submit" name="confirm" value="등록하기">
												</center>
											</div>

										</div>
									</form>
									<button type="button">X</button>
								</div>
							</div>

						</div>
					</div>
                          
						<a href="<%=request.getContextPath()%>/cart/watched">
							
					<div
						style="background-color: #FF0000; height: 100px; margin-top: 20px; border-radius: 10px; ">
						<div style="text-align:center;  color:#FFFFFF; padding-top: 35px;">위시리스트</div>
					</div></a>
					<a href="#">
					<div
						style="background-color: #EFF5FB; height: 100px; margin-top: 20px; border-radius: 10px;">
						<div style="text-align:center;  padding-top: 35px;">내가 본 영화</div>
					</div></a>
					<a href="#">
					<div
						style="background-color: #EFF5FB; height: 100px; margin-top: 20px; border-radius: 10px;">
						<div style="text-align:center;  padding-top: 35px;">무비다이어리</div>
					</div></a>
				</div>
			</div>



			<div class="wishlist">
				<div class="wishlist1">
					<div style="float: left; line-height: 50px">위시리스트</div>
					<div style="float: right; line-height: 50px">
						<div class="sect-sorting">
							<label for="order_type" class="hidden">정렬</label> <select
								id="order_type" name="sort_field">
								<option value="1" title="현재 선택됨" selected="">등록일 순</option>
								<option value="2">개봉일 순</option>
							</select>
							<button class="round gray" type="button">
								<span>GO</span>
							</button>
						</div>
					</div>
				</div>
				<div class="wishlist2">
<%-- <%
				int count = 1;
			%> --%>
					<tr>
						<td width="20" align="center"><div class="w3-row"
								style="width: 100%;"> 
								<c:forEach var="cart" items="${cartList}">
									<div class="w3-third">
<%-- td align="center" width="50"><%=Integer.toString(count)%></td> --%>
<td align="center" width="50">${cart.qty}</td>
										<td align="center" width="10"><img
											src="<%=request.getContextPath()%>/fileSave/${cart.filename}">
										</td>
										<td align="center" width="10">${cart.price}</td>
	<td><a href="<%=request.getContextPath()%>/cart/deleteCart?num=${cart.num}">
	<img id="image" value="delete" onclick="changeImage()"
   src="<%=request.getContextPath()%>/image/redheart.png"style="cursor: pointer width:20px; height:20px;" /></a></td>
									</div>
								</c:forEach>
							</div></td>
						
							<td colspan="4">총  ${sum} 건</td>
					</tr>
				</div>
			</div>
		</div>
	</div>
</body>
</html>