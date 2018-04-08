<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>http://www.blueb.co.kr</title>
<meta charset="UTF-8" />
<link href='http://fonts.googleapis.com/css?family=Raleway'
	rel='stylesheet' type='text/css'>

<style>
.seaTabs * {
	box-sizing: border-box;
}

.seaTabs_switch {
	overflow: hidden;
}

.seaTabs_tab {
	float: left;
	cursor: pointer;
}

.seaTabs_switch_active {
	cursor: default;
}

.seaTabs_item {
	display: none;
}

.seaTabs_content_active {
	display: block;
}

.seaTabs_switch {
	
}

.seaTabs_tab {
	padding: 10px 20px;
	border-width: 1px 1px 1px 0px;
	border-style: solid;
	border-color: #ccc;
	background: #eaeaea;
}

.seaTabs_tab:first-child {
	border-left: 1px solid #ccc;
	border-top-left-radius: 5px;
}

.seaTabs_tab:last-child {
	border-top-right-radius: 5px;
}

.seaTabs_content {
	margin-top: -1px;
}

.seaTabs_item {
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 0 0 5px 5px;
}

.seaTabs_switch_active {
	border-right: 100px;
	border-bottom: 1px solid #fff;
	background: #fff;
	color: #FF8000;
}

form {
	position: relative;
	margin-left: 35%;
	margin-right: 30%;
	width: 750px;
	height: 400px;
	text-align: left;
}

.login {
	width: 200px;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

.btn {
	color: #FF8000;
	padding: 14px 20px;
	margin: 8px 0;
	border: 1px solid #FF8000;
	cursor: pointer;
	width: 270px;
	background: #fff;
	font-size: 1.0em;
}

.btn:hover {
	opacity: 0.8;
}
</style>


</head>
<body>



	<div class="seaTabs" style="margin: 10% 20% 10% 20%;">
		<div class="seaTabs_switch">
			<div class="seaTabs_tab seaTabs_switch_active">
				<strong>비밀번호 찾기</strong>
			</div>
			<div class="seaTabs_tab">
				<strong>아이디 찾기</strong>
			</div>

		</div>
		<div class="seaTabs_content">
			<div class="seaTabs_item seaTabs_content_active">
				비밀번호가 기억나지 않으세요? 다음 항목을 입력해주세요.
				<form action="<%=request.getContextPath()%>/member/password"
					method="post">
					<div class="container">
						<br>
						<br>
						<br> <label><b>아이디&nbsp;&nbsp;&nbsp; </b></label> <input
							type="text" name="id" class="login" required> <br> <label><b>
								이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label> <input type="text"
							name="name" class="login" required> <br>
						<label><b>생년월일</b></label>
    <input type="text" size="5" name="birth" class="login" required > 
        <br><br> 


						<button type="submit" class="btn">조회</button>
						<br>



					</div>

				</form>


			</div>
			<div class="seaTabs_item">
				아이디가 기억나지 않으세요? 다음 항목을 입력해주세요.
				<form action="<%=request.getContextPath()%>/member/id"
					method="post">
					<div class="container">
						<br> <br> <br> <label><b>
								이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label> <input type="text"
							name="name" class="login" required> <br> <label><b>휴대폰
								번호</b></label> <select name="mobile1">

							<option value="010" selected> 010 </option>
							<option value="011"> 011 </option>
							<option value="016"> 016 </option>
							<option value="017"> 017 </option>
							<option value="018"> 018 </option>
							<option value="019"> 019 </option>
						</select>
						<h8>-</h8>
						<input type="mobile1" name="mobile2" size="5">
						<h8>-</h8>
						<input type="mobile3" name="mobile3" size="5"> <br> <br>

						<button type="submit" class="btn">조회</button>
						<br>



					</div>

				</form>

			</div>

		</div>
	</div>


	<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script>
		$(function() {
			$('.seaTabs_tab').each(
					function(item) {
						$(this).click(
								function() {
									$(this).addClass('seaTabs_switch_active')
											.siblings().removeClass(
													'seaTabs_switch_active');
									$($('.seaTabs_item')[item]).addClass(
											'seaTabs_content_active')
											.siblings().removeClass(
													'seaTabs_content_active');
								});
					});
		});
	</script>


</body>
</html>
