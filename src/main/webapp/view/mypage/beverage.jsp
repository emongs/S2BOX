<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%> 
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../Popcorn.css" type="text/css" />
<title>Insert title here</title>
</head>
<script>

</script>
<style>

table {
		

}
.colum3 {
	width: 80%;
	height: 80px;
	float:left;
}
</style>
<div class="colum3">
<h2>MENU</h2>
</div>
<div style="float:left;">
<a href="<%=request.getContextPath()%>/event/combo">콤보세트</a>
</div>
<div style="float:left;">
<a href="<%=request.getContextPath()%>/event/popcorn">팝콘</a>
</div>
<div style="float:left;">
<a href="<%=request.getContextPath()%>/event/beverage">음료</a>
</div>
<div style="float:left;">
<a href="<%=request.getContextPath()%>/event/snack">스낵</a>
</div>
<%




String url ="http://www.cgv.co.kr/culture-event/culture-shop/?menu=21";

String line2="";
String line="";
ArrayList<String> aaa = new ArrayList();
try {
	Document doc;
	doc = Jsoup.connect(url).get();
	Elements media1 = doc.select(".sect-cultureshopmenu li");



	
	
	/*   for (Element src : media3) {

	    String templine = src.toString();
	     line+=templine;
		
	}
	for (Element src : media4) {

	    String templine = src.toString();
	     line+=templine;
		
	}   */
	

	for (Element src : media1) {
	    
	    String templine = src.html();
	    aaa.add(templine);
	   	System.out.println(templine);
	   	System.out.println("ddddddddddddddddddddddddd");
	    
	     line+=templine;
	     
		
	}
	int size = aaa.size();
	System.out.println("aaa : "  + aaa.size());
	request.setAttribute("size", size);
	request.setAttribute("aaa", aaa);
/* for (Element src : media2) {
	    
	    String templine = src.html();
	   
	    
	     line+=templine;
	     
		
	}
for (Element src : media3) {
    
    String templine = src.html();
   
    
     line+=templine;
     
	
} */
 
} catch (IOException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
/* line = line.substring(0, line.length()-1);
line = line.replace("src=\"", "src=\"https://homeideas.ikea.kr"); */

%>


<div>
<c:set var="i" value="0" />
      <c:set var="j" value="3" />
      <table border="0">
      <c:forEach var = "a" begin="0" end="${size-1}">
            <c:if test="${i%j == 0 }">
            <tr>
            </c:if>
            <td>
                ${aaa[a]}
            </td>
            <c:if test="${i%j == j-1 }">
               </tr>
            </c:if>
            <c:set var="i" value="${i+1 }" />
      </c:forEach>
      </table>
</div>



</body>
</html>