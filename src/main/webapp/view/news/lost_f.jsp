<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
    box-sizing: border-box;
}
body {
  margin: 0;
 	
}
.menu {
    float: left;
    width: 18%;
    height:250px;
    padding: 15px;
        margin-top:30px;
    
}
.menu2 {
    float: left;
    width: 82%;
     height:250px;
    padding: 15px;
    border-left-style:solid;
       margin-top:30px;

}
.row:after {
    content: "";
    display: table;
    clear: both;
     width: 70%;
    
}
button {
    border:none;
    cursor: pointer;
}
button:hover {
    opacity: 0.8;
}

</style>
</head>
<body>


<div class="row" style="width: 70%; margin-left: 10%;">
  <div class="menu">
 <center>
 
		<button type="button" onclick="location.href='customer.jsp' " style="width: 130px; height: 32px; background-color: white; border-bottom-style: solid;text-align: left;">
					<font style="font-size: 15px;">고객센터 메인</font>
		</button>
		<button type="button" onclick="location.href='question0_all.jsp' "  style="width: 130px; height: 32px; background-color: white; border-bottom-style: solid; border-bottom-width: 1px;text-align: left;">
					<font style="font-size: 15px;">자주찾는 질문</font>
		</button>
		<button type="button" onclick="location.href='news.jsp' "  style="width: 130px; height: 32px; background-color: white; border-bottom-style: solid; border-bottom-width: 1px;text-align: left;">
					<font style="font-size: 15px;">공지/뉴스</font>
		</button>
		<button type="button" onclick="location.href='email.jsp' "  style="width: 130px; height: 32px; background-color: white; border-bottom-style: solid; border-bottom-width: 1px;text-align: left;">
					<font style="font-size: 15px;">이메일 문의</font>
		</button>
		<button type="button" onclick="location.href='lost_f.jsp' "  style="width: 130px; height: 32px; background-color: white; border-bottom-style: solid; border-bottom-width: 1px;text-align: left;">
					<font style="font-size: 15px;">분실물 문의</font>
		</button>
		<button type="button" onclick="location.href='all.jsp' "  style="width: 130px; height: 32px; background-color: white;text-align: left;">
					<font style="font-size: 15px;">단체/대관 문의</font>
		</button>
 
  </center>
  </div>
    
  <div class="menu2"><h2>menu222</h2> </div>
  
</div>



</body>
</html>