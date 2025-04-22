<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Orders Management - ChocoLux</title>
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
        
        /* Orders Card */
        .orders-card {
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
        
        /* Order Info */
        .order-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .order-id {
            font-weight: 600;
            color: var(--dark-brown);
            margin-bottom: 0.2rem;
        }
        
        .order-date {
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
        
        .status-pending { background: #fff3cd; color: #856404; }
        .status-processing { background: #cce5ff; color: #004085; }
        .status-completed { background: #d4edda; color: #155724; }
        .status-cancelled { background: #f8d7da; color: #721c24; }
        
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
        
        /* Filter Dropdown */
        .filter-dropdown {
            background: white;
            border: none;
            border-radius: 8px;
            padding: 0.75rem 1rem;
            color: var(--dark-brown);
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .filter-dropdown:focus {
            outline: none;
            box-shadow: 0 0 0 2px var(--accent-color);
        }
        
        /* Order Total */
        .order-total {
            font-weight: 600;
            color: var(--primary-color);
        }
        
        /* Customer Info */
        .customer-info {
            display: flex;
            flex-direction: column;
        }
        
        .customer-name {
            font-weight: 500;
            color: var(--dark-brown);
        }
        
        .customer-email {
            font-size: 0.85rem;
            color: var(--primary-color);
            opacity: 0.8;
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
            <a class="menu-item " href="add-brand.jsp">
                <i class="fas fa-trademark"></i> Brands
            </a>
            <a href="products.jsp" class="menu-item">
                <i class="fas fa-box"></i>
                Products
            </a>
            <a href="orders.jsp" class="menu-item active">
                <i class="fas fa-shopping-cart"></i>
                Orders
            </a>
            <a href="customers.jsp" class="menu-item">
                <i class="fas fa-users"></i>
                Customers
            </a>
            <!-- <a href="settings.html" class="menu-item">
                <i class="fas fa-cog"></i>
                Settings
            </a>
            <a href="logout.html" class="menu-item">
                <i class="fas fa-sign-out-alt"></i>
                Logout
            </a> -->
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1 class="page-title">Orders Management</h1>
        
        <!-- Header Actions -->
        <div class="header-actions">
            <div class="search-box">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search orders...">
            </div>
            <select class="filter-dropdown">
                <option value="all">All Orders</option>
                <option value="pending">Pending</option>
                <option value="processing">Processing</option>
                <option value="completed">Completed</option>
                <option value="cancelled">Cancelled</option>
            </select>
        </div>
        
        <!-- Orders Table -->
        <div class="orders-card">
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Date</th>
                            <th>Total</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <div class="order-info">
                                    <div class="order-id">#ORD-2024-001</div>
                                    <div class="order-date">2024-04-20 10:30 AM</div>
                                </div>
                            </td>
                            <td>
                                <div class="customer-info">
                                    <div class="customer-name">John Doe</div>
                                    <div class="customer-email">john.doe@example.com</div>
                                </div>
                            </td>
                            <td>Apr 20, 2024</td>
                            <td class="order-total">$124.99</td>
                            <td><span class="status-badge status-processing">Processing</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-action btn-view" title="View"><i class="fas fa-eye"></i></button>
                                    <button class="btn btn-action btn-edit" title="Edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn btn-action btn-delete" title="Delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="order-info">
                                    <div class="order-id">#ORD-2024-002</div>
                                    <div class="order-date">2024-04-19 15:45 PM</div>
                                </div>
                            </td>
                            <td>
                                <div class="customer-info">
                                    <div class="customer-name">Jane Smith</div>
                                    <div class="customer-email">jane.smith@example.com</div>
                                </div>
                            </td>
                            <td>Apr 19, 2024</td>
                            <td class="order-total">$89.99</td>
                            <td><span class="status-badge status-completed">Completed</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-action btn-view" title="View"><i class="fas fa-eye"></i></button>
                                    <button class="btn btn-action btn-edit" title="Edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn btn-action btn-delete" title="Delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="order-info">
                                    <div class="order-id">#ORD-2024-003</div>
                                    <div class="order-date">2024-04-18 09:15 AM</div>
                                </div>
                            </td>
                            <td>
                                <div class="customer-info">
                                    <div class="customer-name">Mike Johnson</div>
                                    <div class="customer-email">mike.johnson@example.com</div>
                                </div>
                            </td>
                            <td>Apr 18, 2024</td>
                            <td class="order-total">$199.99</td>
                            <td><span class="status-badge status-pending">Pending</span></td>
                            <td>
                                <div class="action-buttons">
                                    <button class="btn btn-action btn-view" title="View"><i class="fas fa-eye"></i></button>
                                    <button class="btn btn-action btn-edit" title="Edit"><i class="fas fa-edit"></i></button>
                                    <button class="btn btn-action btn-delete" title="Delete"><i class="fas fa-trash"></i></button>
                                </div>
                            </td>
                        </tr>
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
</body>
</html> 