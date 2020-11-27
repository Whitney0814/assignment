<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/css.css"/>
</head>
<body>
	<%@include file="page/header.jsp" %>
	<%@include file="page/nav.jsp" %>
	
	<section>
		<%
		String section = request.getParameter("section") != null ? request.getParameter("section") : ""; 
		
		switch(section) {
		case "payment_create": %><%@include file="section/payment_create.jsp" %><%
			break;
		case "sales_list_by_category": %><%@include file="section/sales_list_by_category.jsp" %><%
			break;
		case "sales_list_by_product": %><%@include file="section/sales_list_by_product.jsp" %><%
			break;
		case "sales_list": %><%@include file="section/sales_list.jsp" %><%
			break;
		default:%>
<pre>이 프로그램은 쇼핑몰을 관리해주는 프로그램입니다.</pre>
<%
			break;
		}
		%>
	</section> 
	<%@include file="page/footer.jsp" %>
</body>
</html>