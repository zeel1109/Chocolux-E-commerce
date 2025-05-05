<%@ page import="java.sql.*" %>
<%
    // Database connection
    String url = "jdbc:mysql://localhost:3306/chocolate";
    String user = "root";
    String password = "rootroot";
    
    int id = (Integer)session.getAttribute("id");
    double totalAmount = 0;
    int itemCount = 0;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(url, user, password);
        
        // First check if cart has items
        String countQuery = "SELECT COUNT(*) as item_count FROM cart WHERE id = ?";
        PreparedStatement countStmt = con.prepareStatement(countQuery);
        countStmt.setInt(1, id);
        ResultSet countRs = countStmt.executeQuery();
        
        if(countRs.next()) {
            itemCount = countRs.getInt("item_count");
        }
        countRs.close();
        countStmt.close();
        
        if(itemCount == 0) {
            response.sendRedirect("error.jsp?msg=empty_cart");
            return;
        }
        
        // Calculate cart total with correct table joins
        String totalQuery = "SELECT SUM(p.price * c.quantity) as total " +
                           "FROM cart c " +
                           "JOIN product p ON c.pid = p.pid " +
                           "WHERE c.id = ?";
        
        PreparedStatement totalStmt = con.prepareStatement(totalQuery);
        totalStmt.setInt(1, id);
        ResultSet totalRs = totalStmt.executeQuery();
        
        if(totalRs.next()) {
            totalAmount = totalRs.getDouble("total");
            if(totalRs.wasNull() || totalAmount <= 0) {
                response.sendRedirect("error.jsp?msg=empty_cart");
                return;
            }
        }
        
        // Store in session
        session.setAttribute("cartTotal", totalAmount);
        
        totalRs.close();
        totalStmt.close();
        con.close();
        
        // Redirect to checkout
        response.sendRedirect("checkout.jsp");
        return;
        
    } catch(Exception e) {
        e.printStackTrace();
        response.sendRedirect("error.jsp?msg=cart_error&details=" + e.getMessage());
        return;
    }
%>