<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.last{
height: 400px;
width: 70%;
margin-left: 15%;
}
.t7_Card {
	margin-top:3%;
	width: 100%;
	height: 100px;
	background-color:#424242;
	margin-top: 2px;
}
</style>
</head>
<body>
<div>
<div class="last"> 123</div>
</div>
<div class="t7_Card">
		<div style="float: left; width: 15%; margin-left: 12%; font-weight: bold; margin-top: 1%;color: white;"> 영화선택<br> 
		   <a id="SelectedMovieName"style="font-size: 13px;margin-top: 1%;" ></a><br>
			<div id="SelectedMovieGrade"style="font-size: 13px;margin-top: 1%;"></div>
		</div>
		<div style="float: left; width: 15%;font-weight: bold;margin-top: 1%;color: white;"> 극장선택<br> 
			<div id="SelectedTheaterName"style="font-size: 13px;margin-top: 1%;"></div>
		</div>
		<div style="float: left; width: 15%;font-weight: bold;margin-top: 1%;color: white;"> 날짜선택<br>
			<div id="SelectedDateName"style="font-size: 13px;margin-top: 1%;"></div>
		</div>
		<div style="float: left; width: 15%;font-weight: bold;margin-top: 1%;color: white;"> 시간선택<br>
			<div id="SelectedTimeName"style="font-size: 13px;margin-top: 1%;"></div>
			
		</div>
		<div style="float: left; width: 15%;font-weight: bold;margin-top: 2%;color: white;">
		
		<form method="post" name="goSheetSelect" action="goSheetSelect">
		<input type="hidden" id="SelectedMovie" name="SelectedMovie"> 
		<input type="hidden" id="SelectedTheater" name="SelectedTheater">
		<input type="hidden" id="SelectedDate" name="SelectedDate">
		<input type="hidden" id="SelectedTable" name="SelectedTable">
		<input type="hidden" id="SelectedTable2" name="SelectedTable2">
		<input type="hidden" id="SelectedScreen" name="SelectedScreen">
		<button type="submit" onclick="document.location.href='goSheetSelect'"
		 class="btn_Sheet">좌석선택 ></button>
			</form>	
		</div>
		<div style="float: right; width: 10%; margin-right: 20%;margin-top: 1%;">
		
			<input type="hidden" id="levelchecker">
		</div>
	</div>
</body>
</html>