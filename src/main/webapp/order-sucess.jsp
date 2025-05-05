<%@ page import="java.sql.*" %>
<%
    String orderId = request.getParameter("oid");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <style>
        .confirmation-container {
            max-width: 600px;
            margin: 40px auto;
            padding: 30px;
            border: 1px solid #4CAF50;
            border-radius: 5px;
            text-align: center;
        }
        .success-icon {
            color: #4CAF50;
            font-size: 50px;
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <div class="success-icon">✓</div>
        <h2>Order Confirmed!</h2>
        <p>Thank you for your purchase. Your order has been placed successfully.</p>
        
        <div class="order-details">
            <h3>Order Details</h3>
            <p><strong>Order ID:</strong> <%= orderId %></p>
            <p>We've sent a confirmation email with your order details.</p>
        </div>
        
        <div class="actions">
            <a href="order-history.jsp" class="btn">View Order History</a>
            <a href="index.jsp" class="btn">Continue Shopping</a>
        </div>
    </div>
</body>
</html>