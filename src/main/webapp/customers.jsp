<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customers Management - ChocoLux</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Animate.css -->
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
        .status-badge {
    padding: 0.5rem 1rem;
    border-radius: 20px;
    font-size: 0.85rem;
    font-weight: 500;
    display: inline-block;
    transition: all 0.3s ease;
    cursor: default;
}

.status-active { 
    background: #d4edda; 
    color: #155724;
    border: 1px solid #c3e6cb;
}

.status-active:hover {
    background: #c3e6cb;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    transform: translateY(-1px);
}

.status-inactive { 
    background: #f8d7da; 
    color: #721c24;
    border: 1px solid #f5c6cb;
}

.status-inactive:hover {
    background: #f5c6cb;
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
    transform: translateY(-1px);
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
        
        /* Customers Card */
        .customers-card {
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
        
        /* Customer Info */
        .customer-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid var(--accent-color);
        }
        
        .customer-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .customer-details {
            display: flex;
            flex-direction: column;
        }
        
        .customer-name {
            font-weight: 600;
            color: var(--dark-brown);
            margin-bottom: 0.2rem;
        }
        
        .customer-email {
            font-size: 0.85rem;
            color: var(--primary-color);
            opacity: 0.8;
        }
        
        /* Status Badge */
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            display: inline-block;
        }
        
        .status-active { background: #d4edda; color: #155724; }
        .status-inactive { background: #f8d7da; color: #721c24; }
        
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
        
        /* Add Customer Button */
        .btn-add-customer {
            background: var(--dark-brown);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-add-customer:hover {
            background: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(60, 42, 33, 0.2);
        }
        
        /* Customer Stats */
        .customer-stats {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            flex: 1;
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .stat-icon {
            width: 48px;
            height: 48px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
        }
        
        .stat-icon.total { background: var(--primary-color); }
        .stat-icon.active { background: var(--accent-color); }
        .stat-icon.new { background: var(--dark-brown); }
        
        .stat-info h4 {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--dark-brown);
            margin: 0;
        }
        
        .stat-info p {
            color: var(--primary-color);
            margin: 0;
            font-size: 0.9rem;
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
            
            .customer-stats {
                flex-direction: column;
            }
        }
        
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h3 style="font-family: 'Raleway', sans-serif;">CHOCOLUX</h3>
        </div>
        <div class="sidebar-menu">
            <a href="admin.jsp" class="menu-item">
                <i class="fas fa-chart-pie"></i>
                Dashboard
            </a>
            <a class="menu-item" href="add-brand.jsp">
                <i class="fas fa-trademark"></i> Brands
            </a>
            <a href="products.jsp" class="menu-item">
                <i class="fas fa-box"></i>
                Products
            </a>
            <a href="orders.jsp" class="menu-item">
                <i class="fas fa-shopping-cart"></i>
                Orders
            </a>
            <a href="customers.jsp" class="menu-item active">
                <i class="fas fa-users"></i>
                Customers
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1 class="page-title">Customers Management</h1>
        
        <!-- Customer Stats -->
        <div class="customer-stats">
            <div class="stat-card">
                <div class="stat-icon total">
                    <i class="fas fa-users"></i>
                </div>
                <div class="stat-info">
                    <%
                        Connection statsConn = null;
                        Statement statsStmt = null;
                        ResultSet statsRs = null;
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            statsConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chocolate", "root", "rootroot");
                            statsStmt = statsConn.createStatement();
                            ResultSet totalRs = statsStmt.executeQuery("SELECT COUNT(*) AS total FROM register");
                            if(totalRs.next()) {
                    %>
                    <h4><%= totalRs.getInt("total") %></h4>
                    <%
                            }
                            totalRs.close();
                    %>
                    <p>Total Customers</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon active">
                    <i class="fas fa-user-check"></i>
                </div>
                <div class="stat-info">
                    <%
                            // Assuming all registered users are active for this example
                            // In a real app, you might have an 'active' column in your table
                            ResultSet activeRs = statsStmt.executeQuery("SELECT COUNT(*) AS active FROM register");
                            if(activeRs.next()) {
                    %>
                    <h4><%= activeRs.getInt("active") %></h4>
                    <%
                            }
                            activeRs.close();
                    %>
                    <p>Active Customers</p>
                </div>
            </div>
            <div class="stat-card">
        <div class="stat-icon new">
            <i class="fas fa-at"></i>
        </div>
        <div class="stat-info">
            <%
                    ResultSet domainRs = statsStmt.executeQuery("SELECT SUBSTRING_INDEX(email, '@', -1) AS domain, COUNT(*) AS count FROM register GROUP BY domain ORDER BY count DESC LIMIT 1");
                    if(domainRs.next()) {
            %>
            <h4><%= domainRs.getString("domain") %></h4>
            <%
                    }
                    domainRs.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                } finally {
                    if (statsRs != null) statsRs.close();
                    if (statsStmt != null) statsStmt.close();
                    if (statsConn != null) statsConn.close();
                }
            %>
            <p>Top Email Domain</p>
        </div>
    </div>
</div>
        
        <!-- Header Actions -->
        <div class="header-actions">
            <div class="search-box">
                <i class="fas fa-search"></i>
                <input type="text" id="searchInput" placeholder="Search customers..." onkeyup="searchTable()">
            </div>
        </div>
        
        <!-- Customers Table -->
        <div class="customers-card">
            <div class="table-responsive">
                <table class="table" id="customersTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>First Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Contact</th>
                            <th>Status</th>
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
                            String query = "SELECT * FROM register";
                            rs = stmt.executeQuery(query);

                            while (rs.next()) {
                                int id = rs.getInt("id");
                                String fname = rs.getString("fname");
                                String lname = rs.getString("lname");
                                String email = rs.getString("email");
                                String contact = rs.getString("contact");
                    %>
                        <tr>
                            <td><%= id %></td>
                            <td><%= fname %></td>
                            <td><%= lname %></td>
                            <td><%= email %></td>
                            <td><%= contact %></td>
                            <td>
    <span class="status-badge status-active" 
          title="Click to change status"
          onclick="toggleStatus(this)">
        Active
    </span>
</td>
                        </tr>
                    <%
                            }
                        } catch (Exception e) {
                            out.println("Error: " + e.getMessage());
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

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Search Functionality -->
    <script>
    function toggleStatus(element) {
        if (element.classList.contains('status-active')) {
            element.classList.remove('status-active');
            element.classList.add('status-inactive');
            element.textContent = 'Inactive';
            element.title = 'Customer is inactive and cannot place orders';
            // Here you would add AJAX call to update status in database
        } else {
            element.classList.remove('status-inactive');
            element.classList.add('status-active');
            element.textContent = 'Active';
            element.title = 'Customer is active and can place orders';
            // Here you would add AJAX call to update status in database
        }
    }
        function searchTable() {
            let input, filter, table, tr, td, i, j, txtValue, found;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("customersTable");
            tr = table.getElementsByTagName("tr");
            
            for (i = 1; i < tr.length; i++) { // Start from 1 to skip header row
                found = false;
                td = tr[i].getElementsByTagName("td");
                for (j = 0; j < td.length - 1; j++) { // Skip the status column
                    if (td[j]) {
                        txtValue = td[j].textContent || td[j].innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            found = true;
                            break;
                        }
                    }
                }
                if (found) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }
    </script>
</body>
</html>