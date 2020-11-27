<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>카테고리별 매출 현황</h3>



<table border="1">
	<tr>
		<td>카테고리명</td>
		<td>총 판매 금액</td>
		<td>판매 개수</td>
	</tr>
	<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32/xe", "smc_user_5", "1234");

    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT CATEGORY.NAME AS NAME, SUM(SALE_PRICE) AS SALES, SUM(AMOUNT) AS AMOUNT " + 
    		  	"FROM PRODUCT, SALE,CATEGORY " + 
    			"WHERE SALE.PRODUCT_ID = PRODUCT.PRODUCT_ID AND " +
    		  	"PRODUCT.CATEGORY_ID = CATEGORY.CATEGORY_ID " + 
    		  	"GROUP BY CATEGORY.NAME");

    while (rs.next()) {
        %>
            <tr>
                <td><%=rs.getString("NAME") %></td>
                <td><%=rs.getInt("SALES") %></td>
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