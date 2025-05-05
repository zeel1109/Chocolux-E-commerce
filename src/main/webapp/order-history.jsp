<%@ page import="java.sql.*" %>
<%
    int userId = (Integer)session.getAttribute("id");
    ResultSet rs = null;
    Connection con = null;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order History</title>
    <style>
        .order-table {
            width: 100%;
            border-collapse: collapse;
        }
        .order-table th, .order-table td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
    </style>
</head>
<body>
    <h1>Your Order History</h1>
    
    <table class="order-table">
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Date</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chocolate", "root", "rootroot");
                
                String sql = "SELECT oid, order_date, total_amount, status FROM orders WHERE id = ? ORDER BY order_date DESC";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setInt(1, userId);
                rs = stmt.executeQuery();
                
                while(rs.next()) {
        %>
            <tr>
                <td><%= rs.getInt("oid") %></td>
                <td><%= rs.getTimestamp("order_date") %></td>
                <td>₹<%= rs.getBigDecimal("total_amount") %></td>
                <td><%= rs.getString("status") %></td>
                <td><a href="order-details.jsp?oid=<%= rs.getInt("oid") %>">View Details</a></td>
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
        </tbody>
    </table>
</body>
</html>