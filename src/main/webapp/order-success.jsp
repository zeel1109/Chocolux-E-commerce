<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <style>
        .success-message {
            text-align: center;
            padding: 40px;
            background-color: #f8f9fa;
            border-radius: 8px;
            max-width: 600px;
            margin: 30px auto;
        }
        .order-details {
            margin: 20px 0;
            padding: 15px;
            background-color: #e9ecef;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="success-message">
        <h2>Thank You for Your Order!</h2>
        <div class="order-details">
            <p>Order ID: <%= request.getParameter("oid") %></p>
            <p>Status: Completed</p>
        </div>
        <p>Your delicious chocolates are being prepared and will be shipped soon.</p>
        <a href="order-history.jsp" class="btn">View Order History</a>
    </div>
</body>
</html>