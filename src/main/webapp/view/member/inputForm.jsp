<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<title>회원가입</title>
<style type="text/css">
.join {
	width: 70%;
	margin-left: 15%;
	margin-bottom: 5%;
	padding-top: 50px;
}

.join_btn{
	border: 0;
	cursor: pointer;
	background-color:#7a7a7a;
	color:white;
	margin-top:5px;
	padding:2px 8px 3px 8px;
}

.w3-container[type="file"]{
border: 0;
	cursor: pointer;
	background-color:#7a7a7a;
	color:white;
	margin-top:5px;
	padding:2px 8px 3px 8px;
}

.w3-table-all{
height:600px;
}

.w3-table-all td{
background-color:#FFFFFF
}
</style>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script> 
   function checkIt(){ 
      var userinput = eval("document.userinput");
      if(!userinput.id.value){ 
         alert("ID를 입력하세요");
         userinput.id.focus();
         return false;
      }
      if(!userinput.passwd.value){
         alert("비밀번호를 입력하세요");
         userinput.passwd.focus();
         return false;
      }
      if(userinput.passwd.value != userinput.passwd2.value){
         alert("비밀번호를 동일하게 입력하세요");
         userinput.passwd2.focus();
         return false;
      }
      if(userinput.idchk.value != "Y"){
          alert("id중복확인을 하세요");
          userinput.idchk.focus();
          return false;
       } 
  
   } 
   
   function openConfirmid(userinput){
      if(userinput.id.value == ""){
         alert("아이디를 입력하세요");
         return; 
      }
      url = "confirmId?id=" + encodeURIComponent(userinput.id.value);
       
      open(url, "confirm","toolbar = no,location=no, status= no, menubar = no,"
            +"resizable=no, width = 300, height = 200"); 
   }
   
  
    
</script>


	<div class="join">

		<center>
			<!-- <p class="w3-left"   style="padding-left:30px;" >회원가입></p>-->
			<div class="w3-container">
				<form method="post" action="inputPro" name="userinput" enctype="multipart/form-data"
					onSubmit="return checkIt()">

					<h1>회원가입</h1>

					<br> <img
						src="<%=request.getContextPath()%>/common/image/memberImage/picture1.png"> <img
						src="<%=request.getContextPath()%>/common/image/memberImage/picture2.png"> <img
						src="<%=request.getContextPath()%>/common/image/memberImage/picture3.png"> <img
						src="<%=request.getContextPath()%>/common/image/memberImage/picture4.png"> <br>
					<br>
					<h6>S Box 회원가입 과정입니다. 본인인증과 약관동의, 회원정보 입력, 가입완료 단계를 거칩니다.</h6> 
					<br>
					<table class="w3-table-all  w3-center" style="width: 80%; ">

						<tr>
							<td class="left_txt" width="200" >이 름</td>
							<td width="400"><input type="text"
								name="name" size="15" maxlength="10"></td>
						</tr>
						<tr>
							<td class="left_txt" width="150">아이디</td>&nbsp;&nbsp;
							&nbsp;
							<td width="400">
								<input type="text" name="id" size="10" maxlength="12">
								<input type="hidden" name="idchk"> &nbsp;
								<input class="join_btn" type="button" name="confirm_id" value="ID중복확인" OnClick="openConfirmid(this.form)">
							</td>
						</tr>
						<tr>
							<td class="left_txt" width="150" >비밀번호</td>&nbsp; &nbsp;
							&nbsp;
							<td width="400" ><input
								type="password" name="passwd" size="25" maxlength="12"
								placeholder="비밀번호를 입력해주세요"> <br> <br> <h8>영문자,
								숫자, 특수문자 조합하여 8~12자리, 아이디와 4자리 이상 동일, 반복 문자숫자 불가 <br>
								사용가능 특수 문자:!"#$%&()'+,-/;:=@[]^_~</h8></td>
						<tr>

							<td class="left_txt" width="150" >비밀번호 확인</td>&nbsp;
							&nbsp; &nbsp;
							<td width="400" ><input
								type="password" name="passwd2" size="25" maxlength="12"
								placeholder="비밀번호를 재입력해주세요"> <br></td>
						</tr>

						<tr>
							<td class="left_txt" width="200" >E-Mail</td>
							<td width="400" ><input
								name="email1" type="text" class="box" size="15"  maxlength="15"> @ <select
								name="email2" class="box">
									<option value="" selected>선택하세요</option>
									<option value="naver.com">naver.com</option>
									<option value="gmail.com">gmail.com</option>
									<option value="daum.net">daum.net</option>
									<option value="hanmail.com">hanmail.com</option>
									<option value="1">직접입력</option>
							</select></td>
						</tr>



						<tr>
							<td class="left_txt" >생년월일</td>&nbsp;&nbsp; &nbsp;

							<td ><select name="birth1">

									<%for(int i=2010; i>=1900; i--){ %>
									<option value="<%=i %>"><%=i %></option>
									<%} %>
							</select>년&nbsp; <select name="birth2">
									<%for(int i=1; i<=12; i++){ %>
									<option value="<%=i %>"><%=i %></option>
									<%} %>
							</select>월&nbsp; <select name="birth3">
									<%for(int i=1; i<=31; i++){ %>
									<option value="<%=i %>"><%=i %></option>
									<%} %>
							</select>일<br>
							<br> <h8>설정하신 생일을 기준으로 15일 전 생일쿠폰이 발행됩니다.</h8></td>
						</tr>

						<tr>
							<td class="left_txt" >휴대전화</td>&nbsp; &nbsp; &nbsp;
							<td ><select name="mobile1">

									<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> <h8>-</h8> <input type="mobile2" name="mobile2" size="5" maxlength="6">
								<h8>-</h8> <input type="mobile3" name="mobile3" size="5"  maxlength="6">
								<br> <br> <h8>주문 및 배송, 쿠폰, 이벤트 정보 등을 제공 받으실 수
								있습니다.</h8> 
								<input type="hidden" name="nickname"> 
								</td>
						</tr>
 <tr> 
      <td width="150" class="left_txt" >프로필이미지</td>&nbsp; &nbsp; &nbsp; 
      <td width="400" >  
      	<input type="file" size = "40" maxlength = "30" name = "uploadfile" >   
      </td>
    
   </tr>
						<!--  <tr>
      <td colspan="2" class="w3-center" >  
          <input type="submit" name="confirm" value="가입하기" > 
          <input type="reset" name="reset" value="다시입력">
          <input type="button" value="취소하기" onclick="javascript:history.back()">
          
      </td>
    </tr>  -->
						<tr>

							<td colspan="2" class="w3-center" >
								<input class="join_btn" type="submit" name="confirm" value="가입하기">
								<input class="join_btn" type="button" value="취소하기" onclick="javascript:history.back()">
							</td>
						</tr>
					</table>
				</form>
			</div>
		</center>

	</div>
</body>
</html>