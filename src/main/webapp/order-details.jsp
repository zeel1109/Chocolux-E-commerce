<%@ page import="java.sql.*" %>
<%
    String orderId = request.getParameter("oid");
    ResultSet rs = null;
    Connection con = null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Details</title>
</head>
<body>
    <h1>Order Details #<%= orderId %></h1>
    
    <table border="1">
        <tr>
            <th>Product</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
        </tr>
    <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chocolate", "root", "rootroot");
            
            String sql = "SELECT p.pname, oi.quantity, oi.price " +
                         "FROM order_items oi JOIN product p ON oi.pid = p.pid " +
                         "WHERE oi.oid = ?";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(orderId));
            rs = stmt.executeQuery();
            
            while(rs.next()) {
    %>
        <tr>
            <td><%= rs.getString("pname") %></td>
            <td><%= rs.getInt("quantity") %></td>
            <td>₹<%= rs.getBigDecimal("price") %></td>
            <td>₹<%= rs.getInt("quantity") * rs.getBigDecimal("price").doubleValue() %></td>
        </tr>
    <%
            }
        } catch(Exception e) {
            e.printStackTrace();
        } finally {
            if(rs != null) rs.close();
            if(con != null) con.close();
        }
    %>
    </table>
    
    <a href="order-history.jsp">Back to Order History</a>
</body>
</html>