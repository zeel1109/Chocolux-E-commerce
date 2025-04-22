<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Verification - Chocolux</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            height: 100%;
            font-family: 'Segoe UI', sans-serif;
            overflow: hidden;
            position: relative;
        }

        body {
            background: url('https://images.unsplash.com/photo-1606312618999-24933b0dbaf4?ixlib=rb-4.0.3&auto=format&fit=crop&w=1500&q=80') no-repeat center center fixed;
            background-size: cover;
            animation: bgFadeIn 4s ease-in-out forwards;
        }

        body::before {
            content: "";
            position: absolute;
            inset: 0;
            background: rgba(40, 20, 10, 0.6);
            z-index: 0;
        }

        .container {
            position: relative;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }

        .chocolate {
            position: absolute;
            width: 30px;
            height: 30px;
            background: linear-gradient(135deg, #8b4513, #4a2c2a);
            border-radius: 50%;
            opacity: 0.7;
            animation: float-chocolate 18s linear infinite;
            z-index: 2;
            filter: drop-shadow(0 2px 5px rgba(0, 0, 0, 0.4));
        }

        .chocolate:nth-child(1) { left: 10%; animation-delay: 0s; }
        .chocolate:nth-child(2) { left: 25%; animation-delay: 4s; }
        .chocolate:nth-child(3) { left: 40%; animation-delay: 2s; }
        .chocolate:nth-child(4) { left: 55%; animation-delay: 6s; }
        .chocolate:nth-child(5) { left: 70%; animation-delay: 3s; }
        .chocolate:nth-child(6) { left: 85%; animation-delay: 1s; }

        @keyframes float-chocolate {
            0% {
                transform: translateY(100vh) scale(0.8) rotate(0deg);
                opacity: 0;
            }
            50% {
                opacity: 0.8;
            }
            100% {
                transform: translateY(-10vh) scale(1.2) rotate(360deg);
                opacity: 0;
            }
        }

        @keyframes bgFadeIn {
            0% {
                filter: brightness(0.5) blur(10px);
                opacity: 0;
            }
            100% {
                filter: brightness(1) blur(0);
                opacity: 1;
            }
        }

        .form-wrapper {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            z-index: 3;
            width: 90%;
            max-width: 400px;
            border: 1px solid rgba(255, 255, 255, 0.3);
        }

        .form-wrapper h1 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #fff;
            text-align: center;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.5);
        }

        .form-wrapper p {
            color: #fff;
            text-align: center;
            margin-bottom: 20px;
            font-size: 1rem;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .otp-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }

        .otp-input {
            width: 45px;
            height: 50px;
            border: none;
            border-radius: 8px;
            background: rgba(255, 255, 255, 0.8);
            color: #333;
            font-size: 1.5rem;
            text-align: center;
            transition: all 0.3s ease;
        }

        .otp-input:focus {
            background: rgba(255, 255, 255, 0.9);
            box-shadow: 0 0 0 2px rgba(139, 69, 19, 0.5);
            outline: none;
        }

        .timer {
            text-align: center;
            color: #fff;
            font-size: 1rem;
            margin-bottom: 15px;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
        }

        button {
            padding: 12px;
            background-color: #5d4037;
            border: none;
            color: white;
            font-size: 1rem;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #4e342e;
        }

        .auth-links {
            text-align: center;
            margin-top: 15px;
            color: #fff;
            text-shadow: 1px 1px 2px rgba(0,0,0,0.5);
        }

        .auth-links a {
            color: #fff;
            text-decoration: none;
            transition: color 0.3s;
            border-bottom: 1px solid transparent;
        }

        .auth-links a:hover {
            border-bottom: 1px solid #fff;
        }

        @media (max-width: 480px) {
            .form-wrapper {
                padding: 25px 20px;
            }

            .form-wrapper h1 {
                font-size: 1.6rem;
            }

            .otp-input {
                width: 40px;
                height: 45px;
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>
<%
    Integer otp = (Integer) session.getAttribute("otp");
    String email = (String) session.getAttribute("email");
%>
    <div class="container">
        <!-- Chocolate animation -->
        <div class="chocolate"></div>
        <div class="chocolate"></div>
        <div class="chocolate"></div>
        <div class="chocolate"></div>
        <div class="chocolate"></div>
        <div class="chocolate"></div>

        <!-- OTP Verification Form -->
        <div class="form-wrapper">
            <h1>OTP Verification 🍫</h1>
            <p>We've sent a verification code to your email address. Please enter the code below.</p>
            <form action="VerifyOTP" method="post">
                <div class="otp-container">
                    <input type="text" name="otp1" class="otp-input" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
					<input type="text" name="otp2" class="otp-input" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
					<input type="text" name="otp3" class="otp-input" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
					<input type="text" name="otp4" class="otp-input" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
					<input type="text" name="otp5" class="otp-input" maxlength="1" pattern="[0-9]" inputmode="numeric" required>
					<input type="text" name="otp6" class="otp-input" maxlength="1" pattern="[0-9]" inputmode="numeric" required>

                </div>
                <div class="timer">Resend code in: <span id="countdown">02:00</span></div>
                <button type="submit">Verify Code</button>
                <div class="auth-links">
                    <p>Didn't receive the code? <a href="#" id="resend-link">Resend</a></p>
                    <p style="margin-top: 15px;"><a href="forgot-password.jsp"><i class="fa fa-arrow-left"></i> Back to Forgot Password</a></p>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Auto-focus next input when a digit is entered
        document.querySelectorAll('.otp-input').forEach((input, index) => {
            input.addEventListener('input', function() {
                if (this.value.length === 1) {
                    if (index < 5) {
                        document.querySelectorAll('.otp-input')[index + 1].focus();
                    }
                }
            });
            
            // Handle backspace
            input.addEventListener('keydown', function(e) {
                if (e.key === 'Backspace' && !this.value && index > 0) {
                    document.querySelectorAll('.otp-input')[index - 1].focus();
                }
            });
        });
        
        // Countdown timer
        function startCountdown() {
            let minutes = 2;
            let seconds = 0;
            const countdownElement = document.getElementById('countdown');
            const resendLink = document.getElementById('resend-link');
            
            resendLink.style.pointerEvents = 'none';
            resendLink.style.opacity = '0.5';
            
            const timer = setInterval(() => {
                if (seconds === 0) {
                    if (minutes === 0) {
                        clearInterval(timer);
                        countdownElement.textContent = "00:00";
                        resendLink.style.pointerEvents = 'auto';
                        resendLink.style.opacity = '1';
                        return;
                    }
                    minutes--;
                    seconds = 59;
                } else {
                    seconds--;
                }
                
                countdownElement.textContent = `${minutes.toString().padStart(2, '0')}:${seconds.toString().padStart(2, '0')}`;
            }, 1000);
        }
        
        // Start countdown when page loads
        window.addEventListener('load', startCountdown);
        
        // Handle resend link click
        document.getElementById('resend-link').addEventListener('click', function(e) {
            e.preventDefault();
            startCountdown();
            // Here you would typically make an API call to resend the code
        });
    </script>
</body>
</html> 