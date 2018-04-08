<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="w3-table-all  w3-center"  style="width:100%;"   > 
     <tr> 
      <td width="200" border bgcolor="#FFFFFF">• 이 름</td>
      <td width="400" border bgcolor="#FFFFFF">  
       ${name}
      </td>
    </tr> 
     <tr>
    <td border bgcolor="#FFFFFF">• 휴대전화</td>&nbsp; &nbsp; &nbsp; 
    <td border bgcolor="#FFFFFF"> ${mobile}
				
		
</td> 
    </tr>
   
 <tr> 
      <td width="200" border bgcolor="#FFFFFF">• E-Mail</td>
      <td width="400" border bgcolor="#FFFFFF"> 
           ${email}

      </td>
    </tr>
    
  </table>
</body>
</html>