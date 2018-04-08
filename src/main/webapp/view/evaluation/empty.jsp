<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String path=request.getContextPath(); %>
    <% int flag = Integer.parseInt(request.getParameter("flag")); %>
    <% String movie_name = (request.getParameter("movie_name")); %>
    
 <% response.sendRedirect(path+"/evaluation/Evaluation_form?flag="+flag+"&movie_name="+movie_name);%>