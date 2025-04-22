<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Brands - ChocoLux Admin</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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
            color: var(--text-color);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--light-brown);
            min-height: 100vh;
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
            font-family: 'Raleway', sans-serif;
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
        }
        
        .card {
            background: var(--card-bg);
            border: none;
            border-radius: 15px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
            margin-bottom: 1.5rem;
        }
        
        .card-header {
            background: var(--dark-brown);
            color: white;
            border-radius: 15px 15px 0 0 !important;
            padding: 1.5rem;
        }
        
        .form-control {
            background: white;
            border: 1px solid rgba(60, 42, 33, 0.1);
            border-radius: 8px;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
        }
        
        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 3px rgba(222, 184, 135, 0.2);
        }
        
        .btn-primary {
            background: var(--dark-brown);
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 8px;
            font-weight: 500;
            transition: all 0.3s ease;
        }
        
        .btn-primary:hover {
            background: var(--primary-color);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(60, 42, 33, 0.2);
        }

        .btn-sm {
            padding: 0.5rem 1rem;
            font-size: 0.875rem;
        }

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

        .modal-footer {
            border-top: 1px solid rgba(60, 42, 33, 0.1);
            padding: 1rem 2rem;
        }
        
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
            }
            
            .main-content {
                margin-left: 0;
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
            <a class="menu-item" href="admin.jsp">
                <i class="fas fa-tachometer-alt"></i> Dashboard
            </a>
            <a class="menu-item active" href="brands.jsp">
                <i class="fas fa-trademark"></i> Brands
            </a>
            <a class="menu-item" href="products.jsp">
                <i class="fas fa-box"></i> Products
            </a>
            <a class="menu-item" href="users.jsp">
                <i class="fas fa-users"></i> Users
            </a>
            <a class="menu-item" href="orders.jsp">
                <i class="fas fa-shopping-cart"></i> Orders
            </a>
            <!-- <a class="menu-item" href="settings.html">
                <i class="fas fa-cog"></i> Settings
            </a> -->
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Add Brand Card -->
        <div class="card">
            <div class="card-header">
                <h4 class="mb-0">Add New Brand</h4>
            </div>
            <div class="card-body">
                <form id="brandForm">
                    <div class="form-group">
                        <label for="brandName">Brand Name</label>
                        <input type="text" class="form-control" id="brandName" placeholder="Enter brand name">
                    </div>
                    <div class="text-right mt-4">
                        <button type="button" class="btn btn-light mr-2">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save Brand</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- Brands List Card -->
        <div class="card">
            <div class="card-header">
                <h4 class="mb-0">Brands List</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Brand Name</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>kitkat</td>
                                <td class="action-buttons">
                                    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editModal">
                                        <i class="fas fa-edit"></i> Edit
                                    </button>
                                    <button class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                                        <i class="fas fa-trash"></i> Delete
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Cadbury</td>
                                <td class="action-buttons">
                                    <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editModal">
                                        <i class="fas fa-edit"></i> Edit
                                    </button>
                                    <button class="btn btn-sm btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                                        <i class="fas fa-trash"></i> Delete
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Edit Modal -->
    <div class="modal fade" id="editModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Edit Brand</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <form id="editForm">
                        <div class="form-group">
                            <label for="editBrandName">Brand Name</label>
                            <input type="text" class="form-control" id="editBrandName" placeholder="Enter brand name">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Save Changes</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Delete Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Delete Brand</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete this brand? This action cannot be undone.</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Form submission
        document.getElementById('brandForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const brandName = document.getElementById('brandName').value;
            if (brandName.trim() === '') {
                alert('Please enter a brand name');
                return;
            }
            // Add your form submission logic here
            alert('Brand saved successfully!');
            document.getElementById('brandName').value = '';
        });

        // Edit form submission
        document.querySelector('#editModal .btn-primary').addEventListener('click', function() {
            const brandName = document.getElementById('editBrandName').value;
            if (brandName.trim() === '') {
                alert('Please enter a brand name');
                return;
            }
            // Add your edit submission logic here
            alert('Brand updated successfully!');
            bootstrap.Modal.getInstance(document.getElementById('editModal')).hide();
        });

        // Delete confirmation
        document.querySelector('#deleteModal .btn-danger').addEventListener('click', function() {
            // Add your delete logic here
            alert('Brand deleted successfully!');
            bootstrap.Modal.getInstance(document.getElementById('deleteModal')).hide();
        });
    </script>
</body>
</html> 