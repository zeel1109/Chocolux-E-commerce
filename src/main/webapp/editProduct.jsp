<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product - ChocoLux</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        /* Reuse your existing styles */
        :root {
            --primary-color: #5C4033;
            --secondary-color: #8B4513;
            --accent-color: #DEB887;
            --light-brown: #F5F5F5;
            --dark-brown: #3C2A21;
            --card-bg: #E8E1D9;
            --text-color: #3C2A21;
        }
        
        body {
            background-color: var(--light-brown);
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .card {
            background: var(--card-bg);
            border-radius: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }
        
        .btn-save {
            background: var(--dark-brown);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
        }
        
        .btn-save:hover {
            background: var(--primary-color);
        }
        
        .image-preview {
            width: 100%;
            height: 200px;
            border-radius: 8px;
            border: 2px dashed var(--accent-color);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 1rem;
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card p-4">
                    <h2 class="text-center mb-4">Edit Product</h2>
                    
                    <%
                    // Get product ID from request
                    String pid = request.getParameter("pid");
                    if (pid == null || pid.isEmpty()) {
                        response.sendRedirect("products.jsp?error=Invalid+product+ID");
                        return;
                    }
                    
                    // Database connection variables
                    Connection conn = null;
                    PreparedStatement pstmt = null;
                    ResultSet rs = null;
                    
                    // Get all brands for dropdown
                    List<String[]> brands = new ArrayList<>();
                    
                    try {
                        // Load driver and establish connection
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/chocolate", 
                            "root", 
                            "rootroot");
                        
                        // Get all brands
                        pstmt = conn.prepareStatement("SELECT bid, bname FROM brand");
                        ResultSet brandRs = pstmt.executeQuery();
                        while (brandRs.next()) {
                            brands.add(new String[]{brandRs.getString("bid"), brandRs.getString("bname")});
                        }
                        brandRs.close();
                        
                        // Get product data
                        pstmt = conn.prepareStatement("SELECT p.*, b.bname FROM product p LEFT JOIN brand b ON p.bid = b.bid WHERE p.pid = ?");
                        pstmt.setInt(1, Integer.parseInt(pid));
                        rs = pstmt.executeQuery();
                        
                        if (!rs.next()) {
                            response.sendRedirect("products.jsp?error=Product+not+found");
                            return;
                        }
                    %>
                    
                    <form action="UpdateProductServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="pid" value="<%= rs.getInt("pid") %>">
                        
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="pname" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="pname" name="pname" 
                                       value="<%= rs.getString("pname") %>" required>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="bid" class="form-label">Brand</label>
                                <select class="form-select" id="bid" name="bid" required>
                                    <option value="">Select Brand</option>
                                    <% for (String[] brand : brands) { 
                                        boolean selected = brand[0].equals(String.valueOf(rs.getInt("bid")));
                                    %>
                                        <option value="<%= brand[0] %>" <%= selected ? "selected" : "" %>>
                                            <%= brand[1] %>
                                        </option>
                                    <% } %>
                                </select>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="price" class="form-label">Price</label>
                                <input type="number" step="0.01" class="form-control" id="price" name="price" 
                                       value="<%= rs.getDouble("price") %>" required>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="quantity" class="form-label">Stock Quantity</label>
                                <input type="number" class="form-control" id="quantity" name="quantity" 
                                       value="<%= rs.getInt("quantity") %>" required>
                            </div>
                            
                            <div class="col-md-6">
                                <label for="weight" class="form-label">Weight</label>
                                <input type="text" class="form-control" id="weight" name="weight" 
                                       value="<%= rs.getString("weight") != null ? rs.getString("weight") : "" %>">
                            </div>
                            
                            <div class="col-md-6">
                                <label for="image_path" class="form-label">Product Image</label>
                                <input type="file" class="form-control" id="image_path" name="image_path" accept="image/*">
                                <div class="image-preview mt-2" id="imagePreview" 
                                     style="<%= rs.getString("image_path") != null ? 
                                     "background-image: url('" + rs.getString("image_path") + "')" : "" %>">
                                    <% if (rs.getString("image_path") == null) { %>
                                        <i class="fas fa-image"></i>
                                    <% } %>
                                </div>
                                <input type="hidden" name="existing_image" value="<%= rs.getString("image_path") != null ? rs.getString("image_path") : "" %>">
                            </div>
                            
                            <div class="col-12">
                                <label for="description" class="form-label">Description</label>
                                <textarea class="form-control" id="description" name="description" rows="3"><%= rs.getString("description") != null ? rs.getString("description") : "" %></textarea>
                            </div>
                            
                            <div class="col-12 form-check">
                                <input type="checkbox" class="form-check-input" id="is_active" name="is_active" 
                                       <%= rs.getInt("is_active") == 1 ? "checked" : "" %>>
                                <label class="form-check-label" for="is_active">Active</label>
                            </div>
                            
                            <div class="col-12 text-center">
                                <button type="submit" class="btn btn-save">
                                    <i class="fas fa-save me-2"></i>Update Product
                                </button>
                                <a href="products.jsp" class="btn btn-secondary ms-2">
                                    <i class="fas fa-times me-2"></i>Cancel
                                </a>
                            </div>
                        </div>
                    </form>
                    
                    <%
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.println("<div class='alert alert-danger'>Error loading product: " + e.getMessage() + "</div>");
                    } finally {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    }
                    %>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Image Preview
        document.getElementById('image_path').addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                const reader = new FileReader();
                const preview = document.getElementById('imagePreview');
                
                reader.onload = function(e) {
                    preview.style.backgroundImage = `url(${e.target.result})`;
                    preview.innerHTML = '';
                }
                reader.readAsDataURL(file);
            }
        });
    </script>
</body>
</html>