

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/plain");
        try {
            int cartId = Integer.parseInt(request.getParameter("cid"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/chocolate", "root", "rootroot");
            
            String sql = "UPDATE cart SET quantity = ? WHERE cid = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, cartId);
            
            int rows = ps.executeUpdate();
            if(rows > 0) {
                response.getWriter().write("success");
            } else {
                response.getWriter().write("error: Cart item not found");
            }
            
            ps.close();
            con.close();
        } catch(Exception e) {
            response.getWriter().write("error: " + e.getMessage());
        }
    }
}