<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>통합 매출 내역 조회</h3>

<table border="1">
	<tr>
		<td>판매 ID</td>
		<td>상품명</td>
		<td>구매 일자</td>
		<td>총 구매 금액</td>
		<td>구매 개수</td>
	</tr>
	<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32/xe", "smc_user_5", "1234");

    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT SALE_ID, PRODUCT.NAME AS NAME, PURCHASE_DATE, SALE_PRICE, AMOUNT " +
    	    "FROM PRODUCT, SALE " + 
    		"WHERE SALE.PRODUCT_ID = PRODUCT.PRODUCT_ID ");

    while (rs.next()) {
        %>
            <tr>
                <td><%=rs.getInt("SALE_ID") %></td>
                <td><%=rs.getString("NAME") %></td>
                <td><%=rs.getString("PURCHASE_DATE") %></td>
                <td><%=rs.getInt("SALE_PRICE") %></td>
                <td><%=rs.getInt("AMOUNT") %></td>
            </tr>
        <%
    }

    stmt.close();
    conn.close();
}
catch (Exception e) {
    e.printStackTrace();
}
%>
</table>