<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
<tr>
			<td width="20" align="center" ><div class="w3-row" style="width:60%;">
					<c:forEach var="cart" items="${cartList}">
						<div class="w3-third" > 
							
								<td align="center" width="10">
						<img src="<%=request.getContextPath()%>/fileSave/${cart.filename}">
						</td>
                                <td align="center" width="10">${cart.price}</td>	
								<td><input type="button" value="delete"
											onclick="location.href='deleteCart?num=${cart.num}'"></td>
									
						</div>
					</c:forEach>
				</div></td>
		</tr>

	

</body>
</html>

