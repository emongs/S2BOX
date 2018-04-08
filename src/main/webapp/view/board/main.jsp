<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
* {
	box-sizing: border-box;
}
body {
	font-family: Verdana, sans-serif;
	margin: 0
}
/* ===============배너 스타일 */
.column2 {
	height: 530px;
	margin-top: 90px;
}
/* ===============차트 제목, 예고편 제목  스타일 */
.column3 {
	width: 80%;
	height: 80px;
	border-bottom: 5px double;
	border-top: 5px double;
	line-height: 50px;
	
}
/* ======================차트  스타일 */
.colum4 {
	
	width: 25%;
	float: left;
	margin-left: 10%;
	height: 400px;
	background-color: gray;
}

.colum5 {
	
	width: 30%;
	float: left;
	height: 400px;
	background-color: green;
}
.colum6 {
	
	width: 25%;
	float: left;
	height: 400px;
	background-color: orange;
}
.row2:after {
	content: "";
	display: table;
	clear: both;
}
/* ===============예고편  스타일 */
.colum7 {
	margin-left: 10%;
	width: 65%;
	float: left;
	height: 400px;
	background-color: red;
}
.colum8 {
	width: 15%;
	float: left;
	height: 400px;
	background-color: purple;
}
.row3:after {
	content: "";
	display: table;
	clear: both;
}
/* ===============슬라이드쇼  스타일 */
button {
	border: none;
	cursor: pointer;
	font-family: Tahoma, Geneva, sans-serif;
	text-decoration: none;
}
button:hover {
	opacity: 0.8;
}
/* ===============슬라이드쇼  스타일 */

/* Slideshow container */
.slideshow-container {
  width:80%;
  height: 550px;
  margin-left: 10%;
  /* position: relative; */
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 70%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  border-style: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
  margin-right: 10%;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* The dots/bullets/indicators */
.dot {
 cursor: pointer;
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #4C0B5F;
	border-radius: 70%;
	display: inline-block;
	transition: background-color 0.6s ease;
	border-style: none;
	text-align: center;
	
}

.active, .dot:hover {
  background-color: #717171;
}

 /* Fading animation */
/* .fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
} */

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
</style>
</head>
<body>
	<div class="row">
		<div class="column2">
			<div class="slideshow-container">
				<div class="mySlides fade">
					<img src="<%=request.getContextPath()%>/common/image/mainImage/1.jpg"
						style="width: 100%"height="520px">
				</div>
				<div class="mySlides fade">
					<img src="<%=request.getContextPath()%>/common/image/mainImage/2.jpg"
						style="width: 100%"height="520px">
				</div>
				<div class="mySlides fade">
					<img src="<%=request.getContextPath()%>/common/image/mainImage/3.jpg"
						style="width: 100%"height="520px">
				</div>
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
			    <a class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<div style="text-align: center; margin-top: -4%;" >
				<span class="dot" onclick="currentSlide(1)"></span> 
				<span class="dot" onclick="currentSlide(2)"></span> 
				<span class="dot" onclick="currentSlide(3)"></span>
			</div>
		</div>
	</div>
	<center>
		<br> <br>
		<div class="column3"style=" margin-top: -1%;">
		<h2>Movie Chart</h2></div>
		<br>
		<div class="row2">
			<div class="colum4">차트1</div>
			<div class="colum5">차트2</div>
			<div class="colum6">차트3</div>
		</div>
		<br>
		<div class="column3"><h2>Trailer& Banner</h2></div>
		<br>
		<div class="row3">
			<a href="javascript:frame1.location.reload()" style="width: 100%;"></a>
			<div class="colum7">
				<iframe name="frame1" width="100%" height="400px" id="ifrm"></iframe>
			</div>
			<div class="colum8">

				<img src="<%=request.getContextPath()%>/common/image/mainImage/arh.jpg"
					width="100%;" height="100%">
			</div>
		</div>
		<br>
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
					"https://www.youtube.com/embed/-zabRKMQ88c?rel=0&amp;showinfo=0",
					"https://www.youtube.com/embed/5Z6XSZcV27Q?rel=0&amp;showinfo=0",
					"https://www.youtube.com/embed/WkL6B5TEKak?rel=0&amp;showinfo=0",
					"https://www.youtube.com/embed/8Tyj7CbplnY?rel=0&amp;showinfo=0" ];
			var ifr = document.getElementById("ifrm");
			ifr.contentWindow.location = Url[Math.floor(Math.random()
					* Url.length)];
		}

		window.onload = function() {
			frameLoaction();
		}
	</script>

</body>
</html>
