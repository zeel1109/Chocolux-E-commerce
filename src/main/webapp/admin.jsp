<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - ChocoLux</title>
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
            --card-bg: rgba(232, 225, 217, 0.9);
            --text-color: #3C2A21;
            --sidebar-width: 250px;
        }
        
        body {
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(rgba(92, 64, 51, 0.3), rgba(60, 42, 33, 0.4)), url('https://images.unsplash.com/photo-1481391319762-47dff72954d9?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: var(--sidebar-width);
            background: rgba(60, 42, 33, 0.95);
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            box-shadow: 2px 0 15px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            transition: all 0.3s ease;
            padding-top: 1rem;
            backdrop-filter: blur(10px);
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
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
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
            position: relative;
        }
        
        /* Top Bar Styles */
        .top-bar {
            position: absolute;
            top: 0;
            right: 0;
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            gap: 1rem;
        }
        
        .user-profile {
            display: flex;
            align-items: center;
            gap: 1rem;
            background: rgba(255, 255, 255, 0.9);
            padding: 0.5rem 1rem;
            border-radius: 30px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }
        
        .user-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid var(--accent-color);
        }
        
        .user-info {
            display: flex;
            flex-direction: column;
        }
        
        .user-name {
            font-weight: 600;
            color: var(--dark-brown);
            font-size: 0.9rem;
        }
        
        .user-role {
            font-size: 0.8rem;
            color: var(--primary-color);
            opacity: 0.8;
        }
        
        .top-bar-btn {
            background: rgba(60, 42, 33, 0.9);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 0.9rem;
            font-weight: 500;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .top-bar-btn:hover {
            background: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(60, 42, 33, 0.2);
        }
        
        .notifications-btn {
            position: relative;
        }
        
        .notifications-badge {
            position: absolute;
            top: -5px;
            right: -5px;
            background: var(--accent-color);
            color: white;
            width: 18px;
            height: 18px;
            border-radius: 50%;
            font-size: 0.7rem;
            display: flex;
            align-items: center;
            justify-content: center;
            border: 2px solid white;
        }
        
        .page-title {
            color: white;
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 2rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
            position: relative;
        }
        
        /* Dashboard Cards */
        .dashboard-card {
            background: var(--card-bg);
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            border: none;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
        }
        
        .card-title {
            color: var(--dark-brown);
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }
        
        .card-title i {
            font-size: 1.2rem;
            color: var(--accent-color);
        }
        
        .card-value {
            font-size: 2.5rem;
            font-weight: 700;
            color: var(--dark-brown);
            margin-bottom: 0;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.1);
        }
        
        /* Table Styles */
        .table {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            overflow: hidden;
            backdrop-filter: blur(10px);
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
        
        .table tbody tr:hover {
            background-color: rgba(222, 184, 135, 0.1);
        }
        
        /* Status Badges */
        .status-badge {
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        
        .status-delivered { 
            background: linear-gradient(135deg, #d4edda, #c3e6cb);
            color: #155724;
        }
        .status-processing { 
            background: linear-gradient(135deg, #fff3cd, #ffeeba);
            color: #856404;
        }
        .status-shipped { 
            background: linear-gradient(135deg, #cce5ff, #b8daff);
            color: #004085;
        }
        
        /* Stats Icon */
        .stats-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
            margin-bottom: 1rem;
            background: linear-gradient(135deg, var(--accent-color), var(--primary-color));
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        
        /* Chart Container */
        .chart-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }
        
        /* Quick Actions */
        .quick-actions {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1rem;
            margin-bottom: 1.5rem;
        }
        
        .quick-action-btn {
            background: rgba(255, 255, 255, 0.95);
            border: none;
            padding: 1rem;
            border-radius: 10px;
            display: flex;
            align-items: center;
            gap: 1rem;
            transition: all 0.3s ease;
            text-decoration: none;
            color: var(--dark-brown);
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        
        .quick-action-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
            color: var(--primary-color);
        }
        
        .quick-action-icon {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            color: white;
        }
        
        .quick-action-text {
            font-weight: 500;
        }
        
        /* Product Card */
        .product-card {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }
        
        .product-card:hover {
            transform: translateX(5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .product-image {
            width: 60px;
            height: 60px;
            border-radius: 10px;
            object-fit: cover;
        }
        
        .product-info {
            flex: 1;
        }
        
        .product-name {
            font-weight: 600;
            margin-bottom: 0.2rem;
        }
        
        .product-stats {
            display: flex;
            gap: 1rem;
            font-size: 0.9rem;
            color: var(--primary-color);
        }
        
        /* Activity Feed */
        .activity-item {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 10px;
            margin-bottom: 1rem;
            transition: all 0.3s ease;
        }
        
        .activity-item:hover {
            transform: translateX(5px);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }
        
        .activity-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            color: white;
        }
        
        .activity-details {
            flex: 1;
        }
        
        .activity-text {
            margin-bottom: 0.2rem;
        }
        
        .activity-time {
            font-size: 0.8rem;
            color: var(--primary-color);
            opacity: 0.8;
        }
        
        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }
            
            .main-content {
                margin-left: 0;
            }
            
            .top-bar {
                position: relative;
                padding: 1rem 0;
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .user-profile {
                width: 100%;
                justify-content: center;
            }
        }

        /* Featured Chocolate Styles */
        .featured-chocolate {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 15px;
            padding: 1.5rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .featured-image-container {
            position: relative;
            border-radius: 10px;
            overflow: hidden;
            height: 300px;
        }

        .featured-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.3s ease;
        }

        .featured-image-container:hover .featured-image {
            transform: scale(1.05);
        }

        .featured-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(to top, rgba(60, 42, 33, 0.9), transparent);
            padding: 2rem 1.5rem 1.5rem;
            color: white;
        }

        .featured-overlay h3 {
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .featured-overlay p {
            font-size: 1rem;
            opacity: 0.9;
            margin: 0;
        }

        .featured-stats {
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 1.5rem;
        }

        .featured-stats h4 {
            color: var(--dark-brown);
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
        }

        .featured-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .featured-list li {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.75rem 0;
            color: var(--dark-brown);
            font-weight: 500;
            border-bottom: 1px solid rgba(60, 42, 33, 0.1);
        }

        .featured-list li:last-child {
            border-bottom: none;
        }

        .featured-list i {
            color: var(--accent-color);
            font-size: 1.1rem;
        }

        @media (max-width: 768px) {
            .featured-image-container {
                height: 200px;
                margin-bottom: 1.5rem;
            }

            .featured-stats {
                padding: 1rem;
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
            <a href="admin.jsp" class="menu-item active">
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
        <!-- Top Bar -->
        <div class="top-bar">
            <!-- <button class="top-bar-btn notifications-btn">
                <i class="fas fa-bell"></i>
                <span class="notifications-badge">3</span>
            </button> -->
            <div class="user-profile">
                <img src="https://ui-avatars.com/api/?name=Admin+User&background=DEB887&color=5C4033" alt="Admin" class="user-avatar">
                <div class="user-info">
                    <span class="user-name">Admin User</span>
                    <span class="user-role">Administrator</span>
                </div>
            </div>
           <button class="btn btn-danger top-bar-btn" onclick="window.location.href='logout.jsp'">
    <i class="fas fa-sign-out-alt"></i> Logout
</button>


        </div>

        <h1 class="page-title">Dashboard Overview</h1>
        
        <!-- Quick Actions -->
        <div class="quick-actions">
            <a href="add-brand.jsp" class="quick-action-btn">
                <div class="quick-action-icon" style="background: var(--primary-color);">
                    <i class="fas fa-plus"></i>
                </div>
                <span class="quick-action-text">Add New Brand</span>
            </a>
            <a href="products.jsp" class="quick-action-btn">
                <div class="quick-action-icon" style="background: var(--accent-color);">
                    <i class="fas fa-box"></i>
                </div>
                <span class="quick-action-text">Manage Products</span>
            </a>
            <a href="orders.jsp" class="quick-action-btn">
                <div class="quick-action-icon" style="background: var(--dark-brown);">
                    <i class="fas fa-shopping-cart"></i>
                </div>
                <span class="quick-action-text">View Orders</span>
            </a>
            <a href="customers.jsp" class="quick-action-btn">
                <div class="quick-action-icon" style="background: var(--secondary-color);">
                    <i class="fas fa-users"></i>
                </div>
                <span class="quick-action-text">Customer List</span>
            </a>
        </div>

        <!-- Stats Cards -->
        <div class="row">
            <div class="col-md-3">
                <div class="dashboard-card">
                    <div class="card-title">
                        <i class="fas fa-shopping-cart"></i>
                        Total Orders
                    </div>
                    <h3 class="card-value">1,234</h3>
                    <p class="text-success mb-0">+12% from last month</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="dashboard-card">
                    <div class="card-title">
                        <i class="fas fa-dollar-sign"></i>
                        Total Revenue
                    </div>
                    <h3 class="card-value">4500</h3>
                    <p class="text-success mb-0">+8% from last month</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="dashboard-card">
                    <div class="card-title">
                        <i class="fas fa-users"></i>
                        Total Customers
                    </div>
                    <h3 class="card-value">2459</h3>
                    <p class="text-success mb-0">+5% from last month</p>
                </div>
            </div>
            <div class="col-md-3">
                <div class="dashboard-card">
                    <div class="card-title">
                        <i class="fas fa-box"></i>
                        Total Products
                    </div>
                    <h3 class="card-value">156</h3>
                    <p class="text-success mb-0">+3 new this week</p>
                </div>
            </div>
        </div>

        <!-- Sales Analytics and Recent Orders -->
        <div class="row">
            <div class="col-md-8">
                <div class="chart-container">
                    <h4 class="mb-4">Sales Analytics</h4>
                    <canvas id="salesChart" height="300"></canvas>
                </div>
            </div>
            <div class="col-md-4">
                <div class="chart-container">
                    <h4 class="mb-4">Recent Orders</h4>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Order ID</th>
                                    <th>Customer</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>#ORD-001</td>
                                    <td>John Doe</td>
                                    <td>129.99</td>
                                </tr>
                                <tr>
                                    <td>#ORD-002</td>
                                    <td>Jane Smith</td>
                                    <td>$89.99</td>
                                </tr>
                                <tr>
                                    <td>#ORD-003</td>
                                    <td>Mike Johnson</td>
                                    <td>$199.99</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Top Products and Customer Activity -->
        <div class="row">
            <div class="col-md-6">
                <div class="chart-container">
                    <h4 class="mb-4">Top Products</h4>
                    <div class="product-card">
                        <img src="admin/images/Ferrero-Rocher-banner2.jpg" alt="Premium Dark Chocolate" class="product-image">
                        <div class="product-info">
                            <div class="product-name">Premium Dark Chocolate</div>
                            <div class="product-stats">
                                <span>Sales: 156</span>
                                <span>Revenue: $2,340</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-card">
                        <img src="admin/images/Ferrero-Rocher-banner2.jpg" alt="Milk Chocolate Box" class="product-image">
                        <div class="product-info">
                            <div class="product-name">Milk Chocolate Box</div>
                            <div class="product-stats">
                                <span>Sales: 128</span>
                                <span>Revenue: $1,920</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-card">
                        <img src="admin/images/Ferrero-Rocher-banner2.jpg" alt="Assorted Truffles" class="product-image">
                        <div class="product-info">
                            <div class="product-name">Assorted Truffles</div>
                            <div class="product-stats">
                                <span>Sales: 98</span>
                                <span>Revenue: $1,470</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="chart-container">
                    <h4 class="mb-4">Recent Activity</h4>
                    <div class="activity-item">
                        <div class="activity-icon" style="background: var(--primary-color);">
                            <i class="fas fa-shopping-cart"></i>
                        </div>
                        <div class="activity-details">
                            <div class="activity-text">New order #ORD-004 placed by Sarah Wilson</div>
                            <div class="activity-time">2 minutes ago</div>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon" style="background: var(--accent-color);">
                            <i class="fas fa-user-plus"></i>
                        </div>
                        <div class="activity-details">
                            <div class="activity-text">New customer registered: Michael Brown</div>
                            <div class="activity-time">15 minutes ago</div>
                        </div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-icon" style="background: var(--dark-brown);">
                            <i class="fas fa-box"></i>
                        </div>
                        <div class="activity-details">
                            <div class="activity-text">New product added: White Chocolate Collection</div>
                            <div class="activity-time">1 hour ago</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Featured Chocolate -->
        <div class="featured-chocolate mt-4">
            <div class="row">
                <div class="col-md-6">
                    <div class="featured-image-container">
                        <img src="images/Ferrero-Rocher-banner2.jpg" alt="Featured Chocolate" class="featured-image">
                        <div class="featured-overlay">
                            <h3>Featured Product</h3>
                            <p>Premium Chocolate Collection</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="featured-stats">
                        <h4>Product Highlights</h4>
                        <ul class="featured-list">
                            <li><i class="fas fa-star"></i> Best Selling Product</li>
                            <li><i class="fas fa-chart-line"></i> 45% Sales Increase</li>
                            <li><i class="fas fa-heart"></i> Customer Favorite</li>
                            <li><i class="fas fa-tag"></i> Special Edition</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Sales Chart
        const ctx = document.getElementById('salesChart').getContext('2d');
        const salesChart = new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Sales',
                    data: [12000, 19000, 15000, 25000, 22000, 30000],
                    borderColor: '#5C4033',
                    backgroundColor: 'rgba(92, 64, 51, 0.1)',
                    tension: 0.4,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0, 0, 0, 0.1)'
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });
       /* document.querySelector('.top-bar-btn').addEventListener('click', function(e) {
            e.preventDefault(); // THIS will stop it from redirecting!
        });*/
       /*  document.querySelectorAll('.top-bar-btn:not([href="logout.jsp"])').forEach(btn => {
            btn.addEventListener('click', function(e) {
                e.preventDefault();
            });
        });
 */
    </script>
</body>
</html> 