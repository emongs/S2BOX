<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/S2_BOX/js/httpRequest.js"></script>
<title>좌석 선택</title>

<style type="">
.re_all {
	margin-top: 90px;
	width: 80%;
	margin-left: 10%;
	height: 700px;
	border: solid #E6E6E6;
}

.re_top {
	width: 100%;
	height: 40px;
}

.re_top_1 {
	float: left;	

}
.re_middle {
	width: 100%;
	height: 140px;
}

.re_right {
	float: left;
	width: 40%;
	margin-top: 5px;
	height: 130px;
	border-right: 1px solid gray;
	padding: 2 2px;
}

.re_right_right {
	float: left;
	width: 75%;
	height: 130px;
	margin-left: -5%;
}

.re_right_left {
	float: left;
	width: 25%;
	height: 130px;
}

.re_left {
	float: left;
	width:40%;
	margin-top: 5px;
	height: 130px;
}

.re_left_right {
	float: left;
	width: 75%;
	height: 130px;
}

.re_left_left {
	float: left;
	width: 25%;
	height: 130px;
}


.seat_btn input {
	background-color: #FFFFFF;
	border: 1px solid;
	border-color: #e1e1e1;
	margin-right: 5px;
}

.seat_btn1 input:focus {
	background-color: black;
	color: white;
	border-color: black;
}

.seat_btn1 input:active {
	background-color: black;
	color: white;
	border-color: black;
}

.seat_btn2 input:focus {
	background-color: black;
	color: white;
	border-color: black;
}

.seat_btn3 input:focus {
	background-color: black;
	color: white;
	border-color: black;
}

.seat_btn4 input:focus {
	background-color: black;
	color: white;
	border-color: black;
}

.seat_total {
	display: inline-block;
	float: left;
	width: 100%;
	height: 29px;
	margin-right: 20%;
}

.seat_txt {
	text-align: center;
	float: left;
	margin-right: 2%;
	height: 120px;
	width: 16%;
}

.seat_btn1 td {
	border: 1px solid gray;
}

.seat_btn2 td {
	border: 1px solid;
}

.seat_btn3 td {
	border: 1px solid;
}

.seat_btn4 td {
	border: 1px solid;
}

.re_bottom {
	border-top: solid #E6E6E6;
}

.re_bottom_right {
	width: 90%;
	float: left;
	height: 500px;
}

.re_bottom_left {
	width: 8%;
	float: left;
	height: 500px;
	border-left: solid #E6E6E6;
}

span {
	padding: 1px;
}

.sheetButton {
	height: 20px;
	width: 30px;
	text-align: center;
	border: none;
	background: #F3B5B5;
}
.sheetButton:disabled {
    background: #5B5353;
    
}
.sheetButton:disabled:hover {
    cursor:not-allowed
}
.rowInput {
	height: 17px;
	width: 15px;
	padding: 1px;
	margin: 3px;
	border: none;
	text-align: center;
}
.sheetButton:hover{
    border:1px solid #1c5675;
    background-color: #26759e;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#26759e), color-stop(100%, #133d5b));
    background-image: -webkit-linear-gradient(top, #26759e, #133d5b);
    background-image: -moz-linear-gradient(top, #26759e, #133d5b);
    background-image: -ms-linear-gradient(top, #26759e, #133d5b);
    background-image: -o-linear-gradient(top, #26759e, #133d5b);
    background-image: linear-gradient(top, #26759e, #133d5b);filter:progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr=#26759e, endColorstr=#133d5b);
}
button {
	cursor: pointer;
	font-family: Tahoma, Geneva, sans-serif;
	text-decoration: none;
	background-color: white;
	border-style: 1px solid;
	border-color: gray;
	border: none;
}
.re_right_left button {
	border: solid #e1e1e1;
}
.re_left_left button {
	border: solid #e1e1e1;
}

.re_t7 {
float:right;
	margin-top:5%;
	width: 20%;
	height: 40px;
	background-color:white;
	border:1px solid;
	border-color:#424242;
}
.re_t7 button:HOVER {
	height:40px;
	width:100%;
	border:solid purple;
}
</style>

<body  ondragstart="return false" onselectstart="return false">
	<div class="re_all">
		<div class="re_top"><div>
				<img src="<%=request.getContextPath()%>/common/image/mainImage/2_1.png" height="40px" width="100%" 
				style=" position: relative; top: 0px; left: 0px; z-index: 1;"></div>
				
			<div class="re_top_1"style="position: relative; top: -40px; left: 0px; 
			z-index: 2; color: white; line-height: 40px;" >인원/좌석
				<a style="text-align: right;" onclick="location.reload();">다시하기</a>
		</div>
		</div>
		
		<div class="re_middle">
			<div class="re_right">
				<div class="re_right_right">
					<div class="seat_total">
						<div class="seat_txt" onclick="check(this.style.backgroundColor)"
							style="float: left;">일반</div>
						<div class="seat_btn1" style="float: left;">
							<table>
								<tr>
									<td onclick="check(this,'일반','0')">&nbsp;0&nbsp;</td>
									<td onclick="check(this,'일반','1')">&nbsp;1&nbsp;</td>
									<td onclick="check(this,'일반','2')">&nbsp;2&nbsp;</td>
									<td onclick="check(this,'일반','3')">&nbsp;3&nbsp;</td>
									<td onclick="check(this,'일반','4')">&nbsp;4&nbsp;</td>
									<td onclick="check(this,'일반','5')">&nbsp;5&nbsp;</td>
									<td onclick="check(this,'일반','6')">&nbsp;6&nbsp;</td>
									<td onclick="check(this,'일반','7')">&nbsp;7&nbsp;</td>
									<td onclick="check(this,'일반','8')">&nbsp;8&nbsp;</td>
								</tr>
							</table>
						</div>
					</div>
					<br>
					<div class="seat_total">
						<div class="seat_txt" style="float: left;">청소년</div>
						<div class="seat_btn2" style="float: left;">
							<table>
								<tr>
									<td onclick="check1(this,'청소년','0')">&nbsp;0&nbsp;</td>
									<td onclick="check1(this,'청소년','1')">&nbsp;1&nbsp;</td>
									<td onclick="check1(this,'청소년','2')">&nbsp;2&nbsp;</td>
									<td onclick="check1(this,'청소년','3')">&nbsp;3&nbsp;</td>
									<td onclick="check1(this,'청소년','4')">&nbsp;4&nbsp;</td>
									<td onclick="check1(this,'청소년','5')">&nbsp;5&nbsp;</td>
									<td onclick="check1(this,'청소년','6')">&nbsp;6&nbsp;</td>
									<td onclick="check1(this,'청소년','7')">&nbsp;7&nbsp;</td>
									<td onclick="check1(this,'청소년','8')">&nbsp;8&nbsp;</td>
								</tr>
							</table>
						</div>
					</div>
					<br>
					<div class="seat_total">
						<div class="seat_txt" style="float: left;">어린이</div>
						<div class="seat_btn2" style="float: left;">
							<table>
								<tr>
									<td onclick="check2(this,'어린이','0')">&nbsp;0&nbsp;</td>
									<td onclick="check2(this,'어린이','1')">&nbsp;1&nbsp;</td>
									<td onclick="check2(this,'어린이','2')">&nbsp;2&nbsp;</td>
									<td onclick="check2(this,'어린이','3')">&nbsp;3&nbsp;</td>
									<td onclick="check2(this,'어린이','4')">&nbsp;4&nbsp;</td>
									<td onclick="check2(this,'어린이','5')">&nbsp;5&nbsp;</td>
									<td onclick="check2(this,'어린이','6')">&nbsp;6&nbsp;</td>
									<td onclick="check2(this,'어린이','7')">&nbsp;7&nbsp;</td>
									<td onclick="check2(this,'어린이','8')">&nbsp;8&nbsp;</td>
								</tr>
							</table>
						</div>
					</div>
					<br>
					<div class="seat_total">
						<div class="seat_txt" style="float: left;">우대</div>
						<div class="seat_btn2" style="float: left;">
							<table>
								<tr>
									<td onclick="check3(this,'우대','0')">&nbsp;0&nbsp;</td>
									<td onclick="check3(this,'우대','1')">&nbsp;1&nbsp;</td>
									<td onclick="check3(this,'우대','2')">&nbsp;2&nbsp;</td>
									<td onclick="check3(this,'우대','3')">&nbsp;3&nbsp;</td>
									<td onclick="check3(this,'우대','4')">&nbsp;4&nbsp;</td>
									<td onclick="check3(this,'우대','5')">&nbsp;5&nbsp;</td>
									<td onclick="check3(this,'우대','6')">&nbsp;6&nbsp;</td>
									<td onclick="check3(this,'우대','7')">&nbsp;7&nbsp;</td>
									<td onclick="check3(this,'우대','8')">&nbsp;8&nbsp;</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="re_right_left">
					<button type="button">관람 할인 안내</button>
				</div>
			</div>
			<div class="re_left">
				<div class="re_left_right">
					<div style="height: 50px; font-weight: bold; margin-left: 5%;margin-top: 2%;">
					영화 : ${movie_name}<br>상영관 : ${theater_name}/ 
					<c:forEach var="article" items="${screenCodeList}">
									<c:if test="${article.screen_code eq screen_code}">
					${article.screen_name} </c:if></c:forEach>(여석) 
					</div>
					<div style="height: 50px; font-weight: bold; margin-left: 5%;">
					일시 : ${screen_date} (${startTime}~${endTime})</div>
					
				</div>
				<div class="re_left_left">

					<button type="button" onclick="document.location.href='currentList'">상영시간변경하기</button>
				</div>
			</div>
		</div>
		
		<div class="re_bottom">
			
				<div style="margin-top: 1%; width: 50%; 
				margin-left: 25%; border: solid gray; margin-top: 5%;"><center>스크린</center></div>
				
				<div id="sheetDiv"
					style="margin-top: 1%; width: 90%; margin-left: 5%;
					margin-right:5%; border: solid #e1e1e1; height: 380px;"></div>
			
			 
		</div>
		
		<div>
		
		
		
		<input type="hidden" id="SelectedMovie" value="${movie_name}">
		<input type="hidden" id="SelectedTheater" value="${theater_name}">
		<input type="hidden" id="SelectedDate" value="${screen_date}">
		<input type="hidden" id="SelectedTable" value="${startTime}">
		<input type="hidden" id="SelectedScreen" value="${screen_code}">
		<input type="hidden" id="sheetStyle" value="${sheetStyle}">
		<!-- 성인,청소년,어린이,우대 순 -->
		<!-- 인원수 -->
		<form method="post" name="payment" action="goSheetSelect">
		<input type="hidden" id="peopleCount"> <input type="hidden"
			id="peopleCount1"> <input type="hidden" id="peopleCount2">
		<input type="hidden" id="peopleCount3"> <input type="hidden"
			id="totalCount">
			<!-- 여기페이지에서 예약 고른 좌석 -->
			<input type="hidden" id="updateReserved">
			<c:forEach var="article" items="${sheetInfoList}">
			<input type="hidden" id="reserved" value="${article.reserved}">
			<input type="hidden" id="sheetID" value="${article.sheet_id}">
			<!-- db조회한  reserved -->
		</c:forEach>
		</form>
		
		

		
		 <input type="hidden" id="selectCount">
		<!-- 버튼클릭플래그 -->
		<input type="hidden" id="buttonFlag" value="false"> <input
			type="hidden" id="buttonFlag1" value="false"> <input
			type="hidden" id="buttonFlag2" value="false"> <input
			type="hidden" id="buttonFlag3" value="false"><input
			type="hidden" id="sheetAbleFlag" value="false">
		</div>
		
		<div class="re_t7" onclick="payMent()"><center> <button type="button" style="line-height: 35px;">
		결제하기</button></center> </div>
	</div>
	
	<script>
		function loadSheetStyle() {
			//reserved,style_name
			var sheetStyle = document.getElementById('sheetStyle').value;
			var reserved = document.getElementById('reserved').value;

			var params = "sheetStyle=" + encodeURIComponent(sheetStyle)
					+ "&reserved=" + encodeURIComponent(reserved);
			sendRequest("/S2_BOX/reservation/loadSheetStyle", params,
					loadedSheetStyle, "GET");
		}//clickMovieName end
		function loadedSheetStyle() {
			if (httpRequest.readyState == 4) {
				if (httpRequest.status == 200) {
					$(document).ready(function() {
						$("#sheetDiv").html(httpRequest.responseText);
						
					});
				} else {
					alert(httpRequest.status);
				}
			}
		}//clickedMovieName end
	</script>
	<!--우클릭 방지 -->
	<script language=JavaScript>
		//Disable right click script
		var message = "";
		///////////////////////////////////
		function clickIE() {
			if (document.all) {
				(message);
				return false;
			}
		}

		function clickNS(e) {
			if (document.layers || (document.getElementById && !document.all)) {
				if (e.which == 2 || e.which == 3) {
					(message);
					return false;
				}
			}
		}
		if (document.layers) {
			document.captureEvents(Event.MOUSEDOWN);
			document.onmousedown = clickNS;
		} else {
			document.onmouseup = clickNS;
			document.oncontextmenu = clickIE;
		}

		document.oncontextmenu = new Function("return false")
	</script>
	<script>
		function check(th, manType, peopleCount) {
			
			var tt = document.getElementById('totalCount').value;
			tt *= 1;
			var tx = peopleCount;
			tx *= 1;

			if (document.getElementById('buttonFlag').value == "false") {
				if (tt + tx > 8) {
					alert("인원은 최대 8명입니다.");
				} else {
					document.getElementById('buttonFlag').value = "true";
					document.getElementById('peopleCount').value = peopleCount;
					document.getElementById('totalCount').value = (tt + tx)
							+ "";
					if (th.style.backgroundColor == 'gray') {
						th.style.backgroundColor = "#FFFFFF";
					} else {
						th.style.backgroundColor = "gray";
					}
				}
			} else if (document.getElementById('buttonFlag').value == "true"
					&& document.getElementById('peopleCount').value == peopleCount) {
				document.getElementById('buttonFlag').value = "false";
				document.getElementById('peopleCount').value = "";
				document.getElementById('totalCount').value = (tt - tx) + "";
				if (th.style.backgroundColor == 'gray') {
					th.style.backgroundColor = "#FFFFFF";
				} else {
					th.style.backgroundColor = "gray";
				}
			}
		}
		function check1(th, manType, peopleCount) {
			
			
			var tt = document.getElementById('totalCount').value;
			tt *= 1;
			var tx = peopleCount;
			tx *= 1;

			if (document.getElementById('buttonFlag1').value == "false") {
				if (tt + tx > 8) {
					alert("인원은 최대 8명입니다.");
				} else {
					document.getElementById('buttonFlag1').value = "true";
					document.getElementById('peopleCount1').value = peopleCount;
					document.getElementById('totalCount').value = (tt + tx)
							+ "";
					if (th.style.backgroundColor == 'gray') {
						th.style.backgroundColor = "#FFFFFF";
					} else {
						th.style.backgroundColor = "gray";
					}
				}
			} else if (document.getElementById('buttonFlag1').value == "true"
					&& document.getElementById('peopleCount1').value == peopleCount) {
				document.getElementById('buttonFlag1').value = "false";
				document.getElementById('peopleCount1').value = "";
				document.getElementById('totalCount').value = (tt - tx) + "";
				if (th.style.backgroundColor == 'gray') {
					th.style.backgroundColor = "#FFFFFF";
				} else {
					th.style.backgroundColor = "gray";
				}
			}
		}
		function check2(th, manType, peopleCount) {
			
			var tt = document.getElementById('totalCount').value;
			tt *= 1;
			var tx = peopleCount;
			tx *= 1;

			if (document.getElementById('buttonFlag2').value == "false") {
				if (tt + tx > 8) {
					alert("인원은 최대 8명입니다.");
				} else {
					document.getElementById('buttonFlag2').value = "true";
					document.getElementById('peopleCount2').value = peopleCount;
					document.getElementById('totalCount').value = (tt + tx)
							+ "";
					if (th.style.backgroundColor == 'gray') {
						th.style.backgroundColor = "#FFFFFF";
					} else {
						th.style.backgroundColor = "gray";
					}
				}
			} else if (document.getElementById('buttonFlag2').value == "true"
					&& document.getElementById('peopleCount2').value == peopleCount) {
				document.getElementById('buttonFlag2').value = "false";
				document.getElementById('peopleCount2').value = "";
				document.getElementById('totalCount').value = (tt - tx) + "";
				if (th.style.backgroundColor == 'gray') {
					th.style.backgroundColor = "#FFFFFF";
				} else {
					th.style.backgroundColor = "gray";
				}
			}
		}
		function check3(th, manType, peopleCount) {
			
			var tt = document.getElementById('totalCount').value;
			tt *= 1;
			var tx = peopleCount;
			tx *= 1;

			if (document.getElementById('buttonFlag3').value == "false") {
				if (tt + tx > 8) {
					alert("인원은 최대 8명입니다.");
				} else {
					document.getElementById('buttonFlag3').value = "true";
					document.getElementById('peopleCount3').value = peopleCount;
					document.getElementById('totalCount').value = (tt + tx)
							+ "";
					if (th.style.backgroundColor == 'gray') {
						th.style.backgroundColor = "#FFFFFF";
					} else {
						th.style.backgroundColor = "gray";
					}
				}
			} else if (document.getElementById('buttonFlag3').value == "true"
					&& document.getElementById('peopleCount3').value == peopleCount) {
				document.getElementById('buttonFlag3').value = "false";
				document.getElementById('peopleCount3').value = "";
				document.getElementById('totalCount').value = (tt - tx) + "";
				if (th.style.backgroundColor == 'gray') {
					th.style.backgroundColor = "#FFFFFF";
				} else {
					th.style.backgroundColor = "gray";
				}
			}
		}
	</script>
	<script>
	function settingButton(){
		
		var reserved=document.getElementById('reserved').value+"";
		var res=reserved.split(",");
		for (var i in res) {  
			var tmp=res[i]+"";
			
			document.getElementById(tmp).disabled = true;
			document.getElementById(tmp).background ='gray';
		}
	}
	</script>
	<script>
	function selectSheet(sheet,source){
		var sheetNumber=sheet+"";//문자열로 인식안되어도 문자열로 인식할수있게 문자열로 변환
		
		if(document.getElementById('totalCount').value==""||document.getElementById('totalCount').value=="0"||document.getElementById('totalCount').value==null){
			document.getElementById('sheetAbleFlag').value="false";
		}else{
			document.getElementById('sheetAbleFlag').value="true";
		}
		
		if(document.getElementById('sheetAbleFlag').value=="false"){
			alert("인원을 먼저 골라주십시오");
		}else{
			if(source.style.background== 'red'){//선택된적이있다면
				
				source.style.background= 'gray';//색바꾸고
				var tmp = document.getElementById('selectCount').value; //선택된적이있으니 0은아니지
				tmp *=1; //숫자로바꾸고
				tmp -=1; //1빼고
				document.getElementById('selectCount').value=tmp+"";//뺀숫자넣어주고
				//document.getElementById('updateReserved').value에서 이거제거해야됨....
				var remove=document.getElementById('updateReserved').value+"";
				var re=[];
				re=remove.split(",");
				var ret="";
				
				for (var i in re) {
					
				    if(re[i]==sheetNumber){			
				    }else if(re[i]==" "||re[i]==""){
				    }else{
				    	var str=re[i]+",";
				    	ret+=str;
				    }
				}
				ret+="";
				
				document.getElementById('updateReserved').value=ret;
			}else{
				
				var total=document.getElementById('totalCount').value+"";
				var select=document.getElementById('selectCount').value+"";
				total*=1;
				select*=1;
				var gap=(total-select);
				
				if(document.getElementById('totalCount').value==document.getElementById('selectCount').value){
					//같다면 이제 좌석선택불가
					alert("예매 가능한 인원만큼 모두 선택하셨습니다.")
				}else if(gap>=1){
					//선택가능
					var src=sheetNumber;
					sheetNumber+=",";
					var updateReserved=document.getElementById('updateReserved').value+"";//혹시모르니문자열로바꾸자
					updateReserved+=sheetNumber;
					document.getElementById('updateReserved').value=updateReserved;//update할 목록 = 예약자리에 추가
					source.style.background= 'red'; //색바꾸고
					if(document.getElementById('selectCount').value==""||document.getElementById('selectCount').value==null){
						//최초클릭이라면
						document.getElementById('selectCount').value="1";
					}else{
						var tuck =document.getElementById('selectCount').value;
						tuck*=1;
						tuck+=1;
						document.getElementById('selectCount').value=tuck+"";
						
						
					}
				}
			}	
		}
	}
	</script>
	
	<script>
		$(document).ready(function() {
			loadSheetStyle();
		});
	</script>
	<script>
	function payMent(){
		
		var a;
		var b;
		var c;
		var d;
		if(document.getElementById('peopleCount').value==null||document.getElementById('peopleCount').value==""){
			a="0";
		}else{
			a=document.getElementById('peopleCount').value+"";
		}
		if(document.getElementById('peopleCount').value==null||document.getElementById('peopleCount').value==""){
			b="0";
		}else{
			b=document.getElementById('peopleCount1').value+"";
		}
		if(document.getElementById('peopleCount').value==null||document.getElementById('peopleCount').value==""){
			c="0";
		}else{
			c=document.getElementById('peopleCount2').value+"";
		}
		if(document.getElementById('peopleCount').value==null||document.getElementById('peopleCount').value==""){
			d="0";
		}else{
			d=document.getElementById('peopleCount3').value+"";
		}
		
		a*=1;
		b*=1;
		c*=1;
		d*=1;
		var aa=a+"";
		var bb=b+"";
		var cc=c+"";
		var dd=d+"";
		var str2="일반:"+aa+"명,청소년:"+bb+"명,어린이:"+cc+"명,우대:"+dd+"명";
		var tmp =document.getElementById('updateReserved').value;
		var str=tmp+"선택 완료";
		alert(str);
		alert(str2);
		
		a=a*10000;
		b=b*7000;
		c=c*5000;
		d=d*3000;
		var total=0;
		total+=a;
		total+=b;
		total+=c;
		total+=d;
		var str3="총 결제금액:"+total+"원";
		alert(str3);
		document.location.href = '<c:url value= "/board/main"/>';
	}
	</script>
</body>
</html>