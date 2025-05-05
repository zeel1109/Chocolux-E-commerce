<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Error</title>
    <style>
        .error-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 8px;
            background: #fff8f8;
            border: 1px solid #ffdddd;
        }
        .error-title {
            color: #d9534f;
            margin-bottom: 20px;
        }
        .error-actions {
            margin-top: 25px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="error-container">
            <h2 class="error-title">
                <i class="fa fa-exclamation-triangle"></i>
                <%= 
                    "empty_cart".equals(request.getParameter("msg")) ? 
                    "Your Cart is Empty" : 
                    "Checkout Error" 
                %>
            </h2>
            
            <p>
                <% if("empty_cart".equals(request.getParameter("msg"))) { %>
                    You don't have any items in your cart. Please add some delicious chocolates before proceeding to checkout.
                <% } else { %>
                    We encountered an error while processing your checkout: 
                    <strong><%= request.getParameter("msg") %></strong>
                <% } %>
            </p>
            
            <% if(request.getParameter("details") != null) { %>
                <div class="alert alert-secondary mt-3">
                    <small>Technical details: <%= request.getParameter("details") %></small>
                </div>
            <% } %>
            
            <div class="error-actions">
                <% if("empty_cart".equals(request.getParameter("msg"))) { %>
                    <a href="chocolate.jsp" class="btn btn-primary">
                        <i class="fa fa-arrow-left"></i> Continue Shopping
                    </a>
                <% } else { %>
                    <a href="cart.jsp" class="btn btn-primary">
                        <i class="fa fa-shopping-cart"></i> Return to Cart
                    </a>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>
