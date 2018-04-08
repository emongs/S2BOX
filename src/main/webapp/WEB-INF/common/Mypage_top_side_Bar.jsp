<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/Mypage_top_side_Bar_eh.css?ver=1"><head>
<script script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
<script type="text/javascript">
$(document).ready(function(){
  var modalLayer = $("#modalLayer");
  var modalLink = $(".modalLink");
  var modalCont = $(".modalContent");
  var marginLeft = modalCont.outerWidth()/2;
  var marginTop = modalCont.outerHeight()/2; 

  modalLink.click(function(){
    modalLayer.fadeIn("slow");
    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
    $(this).blur();
    $(".modalContent > a").focus(); 
    return false;
  });

  $(".modalContent > button").click(function(){
    modalLayer.fadeOut("slow");
    modalLink.focus();
  });      
});
</script>
<style type="text/css">

</style>
</head>
<body>
	<div class="all">
		<div class="top">
			<div class="top1">
				<img
					src="<%=request.getContextPath()%>/common/image/memberImage/m9.png"
					height="100%" width="100%">
				<div class="top2">
					<div class="top_in1">
						<div class="top_in1_1">
							<c:if test="${filename!=null}">
								<img
									src="<%=request.getContextPath()%>/view/fileSave/${member.filename}"
									style="width:150px; height:150px;"
									>
							</c:if>
							<c:if test="${filename==null}">
								<img
									src="<%=request.getContextPath()%>/common/image/memberImage/m6.png" 
									style="width:150px; height:150px;margin-left: 10%; margin-top: 8%;">"
									
							</c:if>

						</div>
						<div class="top_in1_2">
							<br>
							<div class= sideBar_1">
								<h3>${name}님</h3>
							</div>
							<div class= sideBar_1">
								ID:&nbsp;&nbsp;&nbsp;${memId}<br>
								<c:if test="${nickname!=null}">닉네임: ${nickname}</c:if>
								<c:if test="${nickname==null}">닉네임:[설정하기]</c:if>
								<a href="#modalLayer" class="modalLink"><img
									src="<%=request.getContextPath()%>/common/image/memberImage/write.png" height="20px" width="20px"
									></a>
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
																	src="<%=request.getContextPath()%>/view/fileSave/${member.filename}"
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
					</div>

					<div class="top_in2">
						<div class="inner4">
							<div class="inn">자주가는 S2Box 설정하기&nbsp;&nbsp;&nbsp;</div>
							<div class="mm" >
								<input type="text" title="통합검색" id="header_keyword"
									name="header_keyword" size="14" maxlength="15">
									 <a><%--  <img src="<%=request.getContextPath()%>/common/image/mainImage/q.png"height="22px" width="21px">
								 --%></a>
							</div>
							<br>
							<div style="margin: 30 0 0 50;">
								<div class="m5">1</div>
								<div class="m6">2</div>
								<div class="m7">3</div>
							</div>


						</div>
					</div>



				</div>
			</div>
		</div>
		
	</div>
	<div class="sideBar">
			<div>
				<a href="/user/mycgv/?g=1" title="현재 선택"><img
					src="<%=request.getContextPath()%>/common/image/memberImage/10.png"></a>
			</div>
			<br>
			<!-- ========================================================================= -->
			<div class="sideBar_1">
				<a href="/user/mycgv/myinfo/?g=1">회원정보</a>
			</div>
			<br>
			<div class="sideBar_2">
				<c:if test="${memId!=null }">
					<a href="../member/updateForm1">개인정보 변경</a>
					<br>
				</c:if>
				<c:if test="${memId==null }">
					<a href="../member/loginForm">개인정보 변경</a>
				</c:if>


				<a href="/user/mycgv/myinfo/edit-myinfo-Email-Sms.aspx?g=1">Email/SMS
					수신설정</a><br>
				<c:if test="${memId!=null }">
					<a href="../member/deleteForm">회원탈퇴</a>
				</c:if>
				<c:if test="${memId==null }">
					<a href="../member/loginForm">회원탈퇴</a>
				</c:if>
			</div>
			<br>
			<!-- ========================================================================= -->
			<div class="sideBar_3" >
				<br>
				<a href="../member/Myinfo">프로필 관리 <br></a>
			</div>
			<br>
			<!-- ========================================================================= -->
			<div class="sideBar_3">
				<br>
				<a href="/user/mycgv/inquiry/qna/list.aspx?g=1">나의 문의내역</a>
			</div>
			<br>
			<div class="sideBar_2">
				<a href="/user/mycgv/inquiry/qna/list.aspx?g=1">1:1 문의</a>
			</div>
			<br> <a href="<%=request.getContextPath()%>/cart/watched"><img
				src="<%=request.getContextPath()%>/common/image/memberImage/m8.png"></a>

		</div>
</body>
</html>