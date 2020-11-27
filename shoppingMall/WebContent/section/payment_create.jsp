<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<h3>판매 등록</h3>

<form name="payment_insert" action="../action/payment_insert.jsp">
	<table border="1">
		<tr>
			<td>판매한 상품</td>
			<td>
				<select name="product">
				<%
				try {
				    Class.forName("oracle.jdbc.OracleDriver");
				    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@//122.128.169.32/xe", "smc_user_5", "1234");
				
				    Statement stmt = conn.createStatement();
				    ResultSet rs = stmt.executeQuery("SELECT PRODUCT_ID, NAME FROM PRODUCT ");
				    
				    while (rs.next()) {
				        %>
				            <option value=<%=rs.getInt(1) %>><%=rs.getString(2) %></option>
				        <%
				    }
				
				    stmt.close();
				    conn.close();
				}
				catch (Exception e) {
				    e.printStackTrace();
				}
				%>
				</select>
			</td>
		</tr>
		<tr>
			<td>수량</td>
			<td><input type="text" name="amount"></td>
		</tr>
		<tr>
			<td>판매날짜</td>
			<td><input type="date" name="date"></td>
		</tr>
		<tr>
			<td><input type="button" value="등록하기" onclick="form_submit()"></td>
			<td><input type="button" value="다시쓰기" onclick="form_reset()"></td>
		</tr>
	</table>
</form>

<script>
	function form_submit() {
		alert("submit!");
		document.payment_insert.submit();
	}
	function form_reset() {
		alert("reset!");
		document.payment_insert.reset();
	}
</script>