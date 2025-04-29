
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddToCartServlet")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/plain");
        HttpSession session = request.getSession(false);
        Integer id = (Integer) session.getAttribute("id");
String fname = (String) session.getAttribute("fname");
        
        if (id == null && fname == null) {
            response.getWriter().write("error: Not logged in");
            return;
        }
        
        try {
            int productId = Integer.parseInt(request.getParameter("pid"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/chocolate", "root", "rootroot")) {
                
                // Check if item already in cart
                String checkSql = "SELECT quantity FROM cart WHERE id=? AND pid=?";
                try (PreparedStatement checkStmt = con.prepareStatement(checkSql)) {
                    checkStmt.setInt(1, id);
                    checkStmt.setInt(2, productId);
                    
                    if (checkStmt.executeQuery().next()) {
                        // Update existing
                        String updateSql = "UPDATE cart SET quantity=quantity+? WHERE id=? AND pid=?";
                        try (PreparedStatement updateStmt = con.prepareStatement(updateSql)) {
                            updateStmt.setInt(1, quantity);
                            updateStmt.setInt(2, id);
                            updateStmt.setInt(3, productId);
                            updateStmt.executeUpdate();
                        }
                    } else {
                        // Insert new
                        String insertSql = "INSERT INTO cart (id, pid, quantity) VALUES (?, ?, ?)";
                        try (PreparedStatement insertStmt = con.prepareStatement(insertSql)) {
                            insertStmt.setInt(1, id);
                            insertStmt.setInt(2, productId);
                            insertStmt.setInt(3, quantity);
                            insertStmt.executeUpdate();
                        }
                    }
                }
                
                response.getWriter().write("success");
            }
        } catch (NumberFormatException e) {
            response.getWriter().write("error: Invalid product ID or quantity");
        } catch (ClassNotFoundException e) {
            response.getWriter().write("error: JDBC driver not found");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("error: Database error - " + e.getMessage());
        }
    }
}