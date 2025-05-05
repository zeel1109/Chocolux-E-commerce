<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chocolux - Checkout</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        .checkout-container {
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
        }
        .checkout-btn {
            background-color: #8B4513;
            color: white;
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="checkout-container">
        <h2>Order Summary</h2>
        <p>Total Amount: ₹<span id="totalAmount"><%= String.format("%.2f", session.getAttribute("cartTotal")) %></span></p>
        
        <button id="rzp-button" class="checkout-btn">Proceed to Payment</button>
    </div>

    <script>
        document.getElementById('rzp-button').onclick = function(e) {
            const amount = <%= (Double)session.getAttribute("cartTotal") * 100 %>; // Convert to paise
            
            const options = {
                "key": "rzp_test_sQ2bGewRvh6nPz",
                "amount": amount.toString(),
                "currency": "INR",
                "name": "Chocolux",
                "description": "Order Payment",
                "image": "/images/logo.png",
                "handler": function(response) {
                    // Redirect to payment processor with payment details
                    window.location.href = "ProcessPayment.jsp?" +
                        "payment_id=" + response.razorpay_payment_id +
                        "&amount=" + amount +
                        "&order_id=" + response.razorpay_order_id;
                },
                "prefill": {
                    "name": "<%= session.getAttribute("fname") %>",
                    "email": "<%= session.getAttribute("email") %>",
                    "contact": "<%= session.getAttribute("contact") %>"
                },
                "theme": {
                    "color": "#8B4513"
                }
            };
            
            const rzp = new Razorpay(options);
            rzp.open();
            e.preventDefault();
        };
    </script>
</body>
</html>