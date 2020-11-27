<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<%
String product_name = request.getParameter("product");
String amount = request.getParameter("amount");
String date = request.getParameter("date");

try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32/xe", "smc_user_5", "1234");
    Statement stmt = conn.createStatement();
    
    ResultSet rs = stmt.executeQuery("SELECT PRICE FROM PRODUCT");
    rs.next();
    int sale_price = rs.getInt(1);
    rs.close();
    System.out.println(sale_price);
    String query = "INSERT INTO SALE VALUES(SEQ_SALE.NEXTVAL, %s, '%s', %d, %s)";
     
    ResultSet insert_rs = stmt.executeQuery(String.format(query, product_name, date, sale_price*Integer.parseInt(amount), amount));
    %><%=String.format(query, product_name, date, sale_price*Integer.parseInt(amount), amount) %><%
	
    stmt.close();
    conn.close();
	}
catch (Exception e) {
    e.printStackTrace();
}
%>