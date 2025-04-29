// GetCartCountServlet.java


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/GetCartCountServlet")
public class GetCartCountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Integer id = (Integer) session.getAttribute("id");
        String fname = (String) session.getAttribute("fname");
        
        if (id == null && fname == null) {
            response.getWriter().write("0");
            return;
        }
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chocolate", "root", "rootroot");
            
            PreparedStatement ps = con.prepareStatement("SELECT SUM(quantity) as total FROM cart WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                int count = rs.getInt("total");
                response.getWriter().write(String.valueOf(count));
            } else {
                response.getWriter().write("0");
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("0");
        }
    }
}