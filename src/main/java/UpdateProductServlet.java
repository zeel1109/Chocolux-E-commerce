

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/UpdateProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,    // 1 MB
    maxFileSize = 1024 * 1024 * 5,     // 5 MB
    maxRequestSize = 1024 * 1024 * 10  // 10 MB
)
public class UpdateProductServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Configure upload directory
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Get form data
        String pid = request.getParameter("pid");
        String pname = request.getParameter("pname");
        String bid = request.getParameter("bid");
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String weight = request.getParameter("weight");
        String description = request.getParameter("description");
        String isActive = request.getParameter("is_active");
        String existingImage = request.getParameter("existing_image");

        // Handle file upload
        String dbImagePath = existingImage;
        try {
            Part filePart = request.getPart("image_path");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = new File(filePart.getSubmittedFileName()).getName();
                
                // Validate file type
                if (!fileName.toLowerCase().matches(".*\\.(jpg|jpeg|png|gif)$")) {
                    response.sendRedirect("products.jsp?error=Only+image+files+are+allowed");
                    return;
                }
                
                // Generate unique filename
                String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
                String fullPath = uploadPath + File.separator + uniqueFileName;
                
                // Save file
                filePart.write(fullPath);
                
                // Store relative path
                dbImagePath = "uploads/" + uniqueFileName;
            }
        } catch (Exception e) {
            response.sendRedirect("editProduct.jsp?pid=" + pid + "&error=File+upload+failed");
            return;
        }

        // Database update
        Connection con = null;
        try {
            // Load driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/chocolate", 
                "root", 
                "rootroot");
            
            String sql = "UPDATE product SET pname=?, bid=?, description=?, price=?, " +
                         "weight=?, quantity=?, image_path=?, is_active=? WHERE pid=?";
            
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, pname);
                ps.setInt(2, Integer.parseInt(bid));
                ps.setString(3, description);
                ps.setDouble(4, Double.parseDouble(price));
                ps.setString(5, weight);
                ps.setInt(6, Integer.parseInt(quantity));
                ps.setString(7, dbImagePath);
                ps.setInt(8, isActive != null ? 1 : 0);
                ps.setInt(9, Integer.parseInt(pid));

                int result = ps.executeUpdate();
                
                if (result > 0) {
                    response.sendRedirect("products.jsp?success=Product+updated+successfully");
                } else {
                    response.sendRedirect("products.jsp?error=Failed+to+update+product");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("editProduct.jsp?pid=" + pid + "&error=Database+error");
        } finally {
            if (con != null) {
                try { con.close(); } catch (Exception e) {}
            }
        }
    }
}