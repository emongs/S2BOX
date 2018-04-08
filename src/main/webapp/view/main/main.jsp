<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/main_eh.css?ver=1">
<title>Insert title here</title>

</head>
<body>
	<div>
		<div class="colum2">
			<div class="slideshow-container">
				<div class="mySlides fade">
					<img src="<%=request.getContextPath()%>/common/image/mainImage/7.png" >
				</div>
				<div class="mySlides fade">
					<img src="<%=request.getContextPath()%>/common/image/mainImage/8.png" >
				</div>
				<div class="mySlides fade">
					<img src="<%=request.getContextPath()%>/common/image/mainImage/9.png" >
				</div>
				<div class="mySlides fade">
					<img src="<%=request.getContextPath()%>/common/image/mainImage/7.png" >
				</div>
				<div class="mySlides fade">
					<img src="<%=request.getContextPath()%>/common/image/mainImage/8.png" >
				</div>
			</div>
			<div class="dot_div">
				<span class="dot" onclick="currentSlide(1)"></span> 
				<span class="dot" onclick="currentSlide(2)"></span> 
				<span class="dot" onclick="currentSlide(3)"></span>
				<span class="dot" onclick="currentSlide(4)"></span>
				<span class="dot" onclick="currentSlide(5)"></span>
			</div>
		</div>
	<center>
		<br> <br>
		<div class="colum3">
		<h2>MOVIE CHART</h2></div>
		<br>
		<div class="row2">
			<div class="colum4">
<!-- ==========================================================================차트 -->
			<div class="colum_1">
				<div> 
			<img src="<%=request.getContextPath()%>/common/image/mainImage/re.png"> </div>
			 <div class="colum_2" >예매순 </div>
			 </div>
			<br><div class="colum_3">
				<table>
			 	 	 <%int i=1; %>
			 	 	 <c:forEach var ="item2" items="${str2}">
			 	 		<tr>
			 	 		<td><div class="str2"><%=i%>위</div></td>
			 	 		<td><div class="item2">${item2}</div></td>
			 	 		</tr><%i++; %>
			 		</c:forEach> 
			 		</table>
		 		</div>
			</div>
			<div class="colum5">
			<div class="colum_1" >
				<div class="col4_1"> 
			<img src="<%=request.getContextPath()%>/common/image/mainImage/po.png"> </div>
			 <div class="colum_2">인기순 </div>
			 </div>
			<br><div class="colum_3" >
				<table>
			 	 	 <%int n=1; %>
			 	 	 <c:forEach var ="item1" items="${str1}">
			 	 		<tr>
			 	 		<td><div class="str1"><%=n%>위</div></td>
			 	 		<td><div class="item2">${item1}</div></td>
			 	 		</tr><%n++; %>
			 		</c:forEach> 
			 		</table>
		 		</div>	
			</div>
			<div class="colum6">
			<div class="colum_1">
				<div> 
			<img src="<%=request.getContextPath()%>/common/image/mainImage/st.png"> </div>
			 <div class="colum_2">평점순</div>
			 </div><br>
			 <div class="colum_3">
			 	 	<table>
			 	 	 <%int m=1; %>
			 	 	 <c:forEach var ="item3" items="${str3}">
			 	 		<tr>
			 	 		<td><div class="str3"><%=m%>위</div></td>
			 	 		<td><div class="item2">${item3}</div></td>
			 	 		</tr><%m++; %>
			 		</c:forEach> 
			 		</table>
					</div>		 			
			</div>
		</div>
 <!-- ==========================================================================트레일러  -->
		<br>
		<div class="colum3"><h2>TRAILER&BANNER</h2></div>
		<br>
		<div class="row3">
			<a href="javascript:frame1.location.reload()" style="width: 100%;"></a>
			<div class="colum7">
				<iframe name="frame1" id="ifrm"></iframe>
			</div>
			<div class="colum8">
				<img src="<%=request.getContextPath()%>/common/image/mainImage/arh.jpg">
			</div>
		</div>
		
		<br>
		</div>
	</center>
	<script>
	var slideIndex = 1;
	showSlides(slideIndex);

	function plusSlides(n) {
	  showSlides(slideIndex += n);
	}

	function currentSlide(n) {
	  showSlides(slideIndex = n);
	}

	function showSlides(n) {
	  var i;
	  var slides = document.getElementsByClassName("mySlides");
	  var dots = document.getElementsByClassName("dot");
	  if (n > slides.length) {slideIndex = 1}    
	  if (n < 1) {slideIndex = slides.length}
	  for (i = 0; i < slides.length; i++) {
	      slides[i].style.display = "none";  
	  }
	  for (i = 0; i < dots.length; i++) {
	      dots[i].className = dots[i].className.replace(" active", "");
	  }
	  slides[slideIndex-1].style.display = "block";  
	  dots[slideIndex-1].className += " active";
	
			setTimeout('showSlides (slideIndex +=1)', 3000);
	}
	</script>

	<script>
		function frameLoaction() {
			var Url = [
					"https://www.youtube.com/embed/-zabRKMQ88c?rel=0&amp;showinfo=0",  //어벤져스 인피니티 워 
					"https://www.youtube.com/embed/5Z6XSZcV27Q?rel=0&amp;showinfo=0", //신과함꼐
					"https://www.youtube.com/embed/WkL6B5TEKak?rel=0&amp;showinfo=0", // 램페이지
					"https://www.youtube.com/embed/8Tyj7CbplnY?rel=0&amp;showinfo=0",// 레디플레이어 원
					"https://www.youtube.com/embed/y_t4g6iGPL4?rel=0&amp;showinfo=0"] //콘스탄틴 
			var ifr = document.getElementById("ifrm");
			ifr.contentWindow.location = Url[Math.floor(Math.random()
					* Url.length)];
		}

		window.onload = function() {
			frameLoaction();
		}
	</script>
	<script type="text/javascript">
	
	</script>

</body>
</html>
