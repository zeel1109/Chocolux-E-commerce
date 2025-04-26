<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Products Management - ChocoLux</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
     <style>
        :root {
            --primary-color: #5C4033;
            --secondary-color: #8B4513;
            --accent-color: #DEB887;
            --light-brown: #F5F5F5;
            --dark-brown: #3C2A21;
            --card-bg: #E8E1D9;
            --text-color: #3C2A21;
            --sidebar-width: 250px;
        }
        
        body {
            background-color: var(--light-brown);
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            background: var(--dark-brown);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            transition: all 0.3s ease;
            padding-top: 1rem;
        }
        
        .sidebar-header {
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .sidebar-header h3 {
            color: white;
            margin: 0;
            font-size: 1.5rem;
            font-weight: 600;
        }
        
        .sidebar-menu {
            padding: 20px 0;
        }
        
        .menu-item {
            padding: 12px 20px;
            display: flex;
            align-items: center;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            font-weight: 500;
        }
        
        .menu-item:hover {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            transform: translateX(5px);
        }
        
        .menu-item.active {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border-left: 4px solid var(--accent-color);
        }
        
        .menu-item i {
            margin-right: 10px;
            width: 20px;
            text-align: center;
            font-size: 1.1rem;
        }
        
        /* Main Content Styles */
        .main-content {
            margin-left: var(--sidebar-width);
            padding: 2rem;
            min-height: 100vh;
        }
        
        .page-title {
            color: var(--dark-brown);
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 2rem;
        }
        
        /* Products Card */
        .products-card {
            background: var(--card-bg);
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
        }
        
        /* Table Styles */
        .table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            margin-bottom: 0;
        }
        
        .table thead th {
            background: var(--dark-brown);
            color: white;
            font-weight: 600;
            border: none;
            padding: 1rem;
        }
        
        .table tbody td {
            padding: 1rem;
            border-color: rgba(0, 0, 0, 0.05);
            vertical-align: middle;
        }
        
        .table tbody tr {
            transition: all 0.3s ease;
        }
        
        .table tbody tr:hover {
            background-color: rgba(222, 184, 135, 0.1);
        }
        
        /* Product Info */
        .product-image {
            width: 60px;
            height: 60px;
            border-radius: 8px;
            object-fit: cover;
            border: 2px solid var(--accent-color);
        }
        
        .product-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .product-name {
            font-weight: 600;
            color: var(--dark-brown);
            margin-bottom: 0.2rem;
        }
        
        .product-category {
            color: var(--primary-color);
            font-size: 0.85rem;
            opacity: 0.8;
        }
        
        /* Status Badges */
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-block;
        }
        
        .status-in-stock { background: #d4edda; color: #155724; }
        .status-low-stock { background: #fff3cd; color: #856404; }
        .status-out-of-stock { background: #f8d7da; color: #721c24; }
        
        /* Action Buttons */
        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }
        
        .btn-action {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            color: white;
            border: none;
            transition: all 0.3s ease;
            padding: 0;
        }
        
        .btn-view { background: var(--accent-color); }
        .btn-edit { background: var(--primary-color); }
        .btn-delete { background: var(--dark-brown); }
        
        .btn-action:hover {
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        
        /* Add Product Button */
        .btn-add-product {
            background: var(--dark-brown);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-add-product:hover {
            background: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(60, 42, 33, 0.2);
        }
        
        /* Search Box */
        .search-box {
            position: relative;
            max-width: 300px;
        }
        
        .search-box input {
            width: 100%;
            padding: 0.75rem 1rem 0.75rem 2.5rem;
            border: none;
            border-radius: 8px;
            background: white;
            transition: all 0.3s ease;
        }
        
        .search-box input:focus {
            outline: none;
            box-shadow: 0 0 0 2px var(--accent-color);
        }
        
        .search-box i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--primary-color);
            opacity: 0.5;
        }
        
        /* Header Actions */
        .header-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
        }
        
        /* Pagination */
        .pagination {
            margin-top: 1.5rem;
            justify-content: center;
        }
        
        .page-link {
            color: var(--dark-brown);
            border-color: var(--accent-color);
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
        }
        
        .page-link:hover {
            background: var(--accent-color);
            color: white;
            border-color: var(--accent-color);
        }
        
        .page-item.active .page-link {
            background: var(--dark-brown);
            border-color: var(--dark-brown);
        }
        
        /* Price */
        .product-price {
            font-weight: 600;
            color: var(--primary-color);
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }
            
            .main-content {
                margin-left: 0;
            }
            
            .header-actions {
                flex-direction: column;
                gap: 1rem;
            }
            
            .search-box {
                max-width: 100%;
            }
        }
        
        /* Modal Styles */
        .modal-content {
            background: var(--card-bg);
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }
        
        .modal-header {
            background: var(--dark-brown);
            color: white;
            border-radius: 15px 15px 0 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .modal-title {
            font-weight: 600;
            font-size: 1.25rem;
        }
        
        .modal-body {
            padding: 2rem;
        }
        
        .form-label {
            color: var(--dark-brown);
            font-weight: 500;
            margin-bottom: 0.5rem;
        }
        
        .form-control {
            border: 1px solid rgba(60, 42, 33, 0.1);
            border-radius: 8px;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(222, 184, 135, 0.2);
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
            cursor: pointer;
            transition: all 0.3s ease;
            background-size: cover;
            background-position: center;
        }
        
        .image-preview:hover {
            border-color: var(--primary-color);
            background-color: rgba(222, 184, 135, 0.1);
        }
        
        .image-preview i {
            font-size: 2rem;
            color: var(--accent-color);
        }
        
        .btn-modal {
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-save {
            background: var(--dark-brown);
            color: white;
            border: none;
        }
        
        .btn-save:hover {
            background: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(60, 42, 33, 0.2);
        }
        
        .modal-footer {
            border-top: 1px solid rgba(60, 42, 33, 0.1);
            padding: 1rem 2rem;
        }
        
        .category-badge {
            background: rgba(222, 184, 135, 0.2);
            color: var(--dark-brown);
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            margin-right: 0.5rem;
            margin-bottom: 0.5rem;
            display: inline-block;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        
        .category-badge.active {
            background: var(--accent-color);
            color: white;
        }
        
        .category-badge:hover {
            transform: translateY(-2px);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
    </style></head>
<body>
<% 
String success = request.getParameter("success");
String error = request.getParameter("error");
if (success != null) { %>
    <div class="alert alert-success alert-dismissible fade show" role="alert">
        <%= success %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } 
if (error != null) { %>
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <%= error %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
<% } %>

    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h3 style="font-family: 'Raleway', sans-serif;">CHOCOLUX</h3>
        </div>
        <div class="sidebar-menu">
            <a href="admin.jsp" class="menu-item">
                <i class="fas fa-chart-pie"></i> Dashboard
            </a>
            <a href="add-brand.jsp" class="menu-item">
                <i class="fas fa-trademark"></i> Brands
            </a>
            <a href="products.jsp" class="menu-item active">
                <i class="fas fa-box"></i> Products
            </a>
            <a href="orders.jsp" class="menu-item">
                <i class="fas fa-shopping-cart"></i> Orders
            </a>
            <a href="customers.jsp" class="menu-item">
                <i class="fas fa-users"></i> Customers
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1 class="page-title">Products Management</h1>
        
        <%
        // Get all brands from DB
        List<String[]> brands = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chocolate", "root", "rootroot");
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT bid, bname FROM brand");
            while (rs.next()) {
                brands.add(new String[]{rs.getString("bid"), rs.getString("bname")});
            }
            rs.close();
            st.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        %>

        <!-- Add Product Form -->
        <div class="products-card mb-4">
            <h4 class="mb-4">Add New Product</h4>
            <form id="productForm" class="row g-3" method="post" action="AddProductServlet" enctype="multipart/form-data">
                <div class="col-md-6">
                    <label for="productName" class="form-label">Product Name</label>
                    <input type="text" class="form-control" id="productName" name="pname" required>
                </div>
                <div class="col-md-6">
                    <label for="productBrand" class="form-label">Brand</label>
                    <select class="form-select" id="productBrand" name="bid" required>
                        <option value="">Select Brand</option>
                        <% for (String[] brand : brands) { %>
                            <option value="<%= brand[0] %>"><%= brand[1] %></option>
                        <% } %>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="productPrice" class="form-label">Price</label>
                    <input type="number" step="0.01" class="form-control" id="productPrice" name="price" required>
                </div>
                <div class="col-md-6">
                    <label for="productStock" class="form-label">Stock</label>
                    <input type="number" class="form-control" id="productStock" name="quantity" required>
                </div>
                <div class="col-md-6">
                    <label for="productWeight" class="form-label">Weight</label>
                    <input type="text" class="form-control" id="productWeight" name="weight">
                </div>
                <div class="col-md-6">
                    <label for="productImage" class="form-label">Product Image</label>
                    <input type="file" class="form-control" id="productImage" name="image_path" accept="image/*">
                    <div class="image-preview mt-2" id="imagePreview">
                        <i class="fas fa-image"></i>
                    </div>
                </div>
                <div class="col-12">
                    <label for="productDescription" class="form-label">Description</label>
                    <textarea class="form-control" id="productDescription" name="description" rows="3"></textarea>
                </div>
                <div class="col-12 form-check">
                    <input type="checkbox" class="form-check-input" id="isActive" name="is_active" checked>
                    <label class="form-check-label" for="isActive">Active</label>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-add-product">
                        <i class="fas fa-plus me-2"></i>Add Product
                    </button>
                </div>
            </form>
        </div>

        <!-- Products Table -->
        <div class="products-card">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h4>Product List</h4>
                <div class="search-box">
                    <i class="fas fa-search"></i>
                    <input type="text" class="form-control" placeholder="Search products..." id="searchInput">
                </div>
            </div>
            <div class="table-responsive">
                <table class="table" id="productsTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Brand</th>
                            <th>Description</th>
                            <th>Price</th>
                            <th>Weight</th>
                            <th>Quantity</th>
                            <th>Image</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chocolate", "root", "rootroot");
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery("SELECT p.*, b.bname FROM product p LEFT JOIN brand b ON p.bid = b.bid");
                            while(rs.next()) {
                        %>
                        <tr>
                            <td><%= rs.getInt("pid") %></td>
                            <td><%= rs.getString("pname") %></td>
                            <td><%= rs.getString("bname") != null ? rs.getString("bname") : "N/A" %></td>
                            <td><%= rs.getString("description") %></td>
                            <td>$<%= String.format("%.2f", rs.getDouble("price")) %></td>
                            <td><%= rs.getString("weight") %></td>
                            <td><%= rs.getInt("quantity") %></td>
                            <td>
                                <% if(rs.getString("image_path") != null) { %>
                                    <img src="<%= rs.getString("image_path") %>" width="50" class="product-image">
                                <% } else { %>
                                    No Image
                                <% } %>
                            </td>
                            <td>
                                <span class="status-badge <%= rs.getInt("is_active") == 1 ? "status-in-stock" : "status-out-of-stock" %>">
                                    <%= rs.getInt("is_active") == 1 ? "Active" : "Inactive" %>
                                </span>
                            </td>
                            <td>
                                <div class="action-buttons">
                                    <a href="editProduct.jsp?pid=<%= rs.getInt("pid") %>" class="btn-action btn-edit">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                   <a href="<%= request.getContextPath() %>/DeleteProductServlet?pid=<%= rs.getInt("pid") %>" 
   class="btn-action btn-delete" 
   onclick="return confirm('Are you sure you want to delete this product?')">
    <i class="fas fa-trash"></i>
</a>
                                </div>
                            </td>
                        </tr>
                        <%
                            }
                        } catch (Exception e) {
                            out.println("<tr><td colspan='10' class='text-danger'>Error loading products: " + e.getMessage() + "</td></tr>");
                        } finally {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        }
                        %>
                    </tbody>
                </table>
            </div>
            
            <!-- Pagination -->
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Image Preview
        document.getElementById('productImage').addEventListener('change', function(e) {
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

        // Search Functionality
        document.getElementById('searchInput').addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
            const rows = document.querySelectorAll('#productsTable tbody tr');
            
            rows.forEach(row => {
                const text = row.textContent.toLowerCase();
                row.style.display = text.includes(searchTerm) ? '' : 'none';
            });
        });
    </script>
</body>
</html>