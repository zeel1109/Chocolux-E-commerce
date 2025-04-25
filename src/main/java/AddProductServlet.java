import java.io.*;


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

@WebServlet("/AddProductServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,    // 1 MB
    maxFileSize = 1024 * 1024 * 5,     // 5 MB
    maxRequestSize = 1024 * 1024 * 10  // 10 MB
)
public class AddProductServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException{
        
        // Configure upload directory
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        // Get form data
        String pname = request.getParameter("pname");
        String bidStr = request.getParameter("bid");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");
        String weight = request.getParameter("weight");
        String description = request.getParameter("description");
        String isActiveStr = request.getParameter("is_active");

        // Parse and validate data
        int bid = 0, quantity = 0, isActive = 0;
        double price = 0.0;
        
        try {
            bid = Integer.parseInt(bidStr);
            price = Double.parseDouble(priceStr);
            quantity = Integer.parseInt(quantityStr);
            isActive = (isActiveStr != null) ? 1 : 0;
        } catch (NumberFormatException e) {
            response.sendRedirect("products.jsp?error=Invalid numeric input");
            return;
        }

        // Handle file upload
        String dbImagePath = null;
        try {
            Part filePart = request.getPart("image_path");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = new File(filePart.getSubmittedFileName()).getName();
                
                // Validate file type
                if (!fileName.toLowerCase().matches(".*\\.(jpg|jpeg|png|gif)$")) {
                    response.sendRedirect("products.jsp?error=Only image files are allowed (JPG, PNG, GIF)");
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
            response.sendRedirect("products.jsp?error=File upload failed: " + e.getMessage());
            return;
        }

        // Database insertion
        Connection con = null;
        try {
            // Load driver and establish connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/chocolate", 
                "root", 
                "rootroot");
            
            // Start transaction
            con.setAutoCommit(false);
            
            String sql = "INSERT INTO product (pname, bid, description, price, weight, quantity, image_path, is_active) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, pname);
                ps.setInt(2, bid);
                ps.setString(3, description);
                ps.setDouble(4, price);
                ps.setString(5, weight);
                ps.setInt(6, quantity);
                ps.setString(7, dbImagePath);
                ps.setInt(8, isActive);

                int result = ps.executeUpdate();
                
                if (result > 0) {
                    con.commit();
                    response.sendRedirect("products.jsp?success=Product added successfully");
                } else {
                    con.rollback();
                    response.sendRedirect("products.jsp?error=Failed to add product");
                }
            }
        } catch (Exception e) {
            if (con != null) {
                try { con.rollback(); } catch (Exception ex) {}
            }
            response.sendRedirect("products.jsp?error=Database error: " + e.getMessage());
        } finally {
            if (con != null) {
                try { con.close(); } catch (Exception e) {}
            }
        }
    }
}