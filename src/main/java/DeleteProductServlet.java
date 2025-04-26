
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String pidStr = request.getParameter("pid");
        
        if (pidStr == null || pidStr.isEmpty()) {
            response.sendRedirect("products.jsp?error=Invalid product ID");
            return;
        }
        
        try {
            int pid = Integer.parseInt(pidStr);
            
            // Database deletion
            Connection con = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/chocolate", 
                    "root", 
                    "rootroot");
                
                String sql = "DELETE FROM product WHERE pid = ?";
                
                try (PreparedStatement ps = con.prepareStatement(sql)) {
                    ps.setInt(1, pid);
                    
                    int result = ps.executeUpdate();
                    
                    if (result > 0) {
                        response.sendRedirect("products.jsp?success=Product deleted successfully");
                    } else {
                        response.sendRedirect("products.jsp?error=Product not found");
                    }
                }
            } catch (Exception e) {
                response.sendRedirect("products.jsp?error=Database error: " + e.getMessage());
            } finally {
                if (con != null) {
                    try { con.close(); } catch (Exception e) {}
                }
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("products.jsp?error=Invalid product ID format");
        }
    }
}