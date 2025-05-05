<%@ page import="java.sql.*" %>

<%
    if("GET".equalsIgnoreCase(request.getMethod())) {
        String paymentId = request.getParameter("payment_id");
        String amount = request.getParameter("amount");
        int id = (Integer)session.getAttribute("id");
        
        Connection con = null;
        try {
            // 1. Initialize database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/chocolate", 
                "root", 
                "rootroot");
            
            // Start transaction
            con.setAutoCommit(false);
            
            // 2. Create order record
            String orderQuery = "INSERT INTO orders (id, total_amount, status, payment_id) VALUES (?, ?, 'Completed', ?)";
            PreparedStatement orderStmt = con.prepareStatement(orderQuery, Statement.RETURN_GENERATED_KEYS);
            orderStmt.setInt(1, id);
            orderStmt.setBigDecimal(2, new java.math.BigDecimal(amount).divide(new java.math.BigDecimal(100)));
            orderStmt.setString(3, paymentId);
            orderStmt.executeUpdate();
            
            // Get generated order ID
            ResultSet rs = orderStmt.getGeneratedKeys();
            int orderId = 0;
            if(rs.next()) {
                orderId = rs.getInt(1);
            }
            
            // 3. Move cart items to order_items
            String itemsQuery = "INSERT INTO order_items (oid, pid, quantity, price) " +
                              "SELECT ?, c.pid, c.quantity, p.price " +
                              "FROM cart c JOIN product p ON c.pid = p.pid " +
                              "WHERE c.id = ?";
            PreparedStatement itemsStmt = con.prepareStatement(itemsQuery);
            itemsStmt.setInt(1, orderId);
            itemsStmt.setInt(2, id);
            itemsStmt.executeUpdate();
            
            // 4. Clear cart
            String clearCart = "DELETE FROM cart WHERE id = ?";
            PreparedStatement clearStmt = con.prepareStatement(clearCart);
            clearStmt.setInt(1, id);
            clearStmt.executeUpdate();
            
            // Commit transaction
            con.commit();
            response.sendRedirect("order-success.jsp?oid=" + orderId);
            
        } catch(Exception e) {
            if(con != null) {
                try {
                    con.rollback();
                } catch(SQLException ex) {}
            }
            e.printStackTrace();
            response.sendRedirect("payment-failed.jsp?error=database_error");
        } finally {
            if(con != null) {
                try { 
                    con.close(); 
                } catch(SQLException e) {}
            }
        }
    }
%>