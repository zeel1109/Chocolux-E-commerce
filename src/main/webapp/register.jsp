<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.regex.*,java.sql.*" %>

<%
String errorMessage = "";
String msg = "";

if(request.getMethod().equalsIgnoreCase("post")) {
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String contact = request.getParameter("contact");
    String password = request.getParameter("password");
    String cpassword = request.getParameter("confirm_password");
    
    boolean isValid = true;

    if(fname == null || fname.trim().equals("") ||
       lname == null || lname.trim().equals("") ||
       email == null || email.trim().equals("") ||
       contact == null || contact.trim().equals("") ||
       password == null || password.trim().equals("") ||
       cpassword == null || cpassword.trim().equals("")) {
        isValid = false;
        errorMessage = "All fields are required.";
    } else if(!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
        isValid = false;
        errorMessage = "Invalid email format.";
    } else if(!contact.matches("^[1-9][0-9]{9}$")) {
        isValid = false;
        errorMessage = "Contact number must be 10 digits and cannot start with 0.";
    } else if(!password.equals(cpassword)) {
        isValid = false;
        errorMessage = "Passwords do not match.";
    }

    if(isValid) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/chocolate", "root", "rootroot");

            PreparedStatement checkEmail = con.prepareStatement("SELECT * FROM register WHERE email = ?");
            checkEmail.setString(1, email);
            ResultSet rs = checkEmail.executeQuery();
            if(rs.next()) {
                errorMessage = "Email already registered.";
            } else {
                PreparedStatement ps = con.prepareStatement("INSERT INTO register (fname, lname, email, contact, password) VALUES (?, ?, ?, ?, ?)");
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, email);
                ps.setString(4, contact);
                ps.setString(5, password); // You should hash this in real applications

                int result = ps.executeUpdate();
                if(result > 0) {
                    msg = "Registration successful!";
                } else {
                    errorMessage = "Registration failed. Please try again.";
                }
            }

        } catch(Exception e) {
            e.printStackTrace();
            errorMessage = "Database error: " + e.getMessage();
        }
    }
} // ← This closes the initial "if(request.getMethod()...)" block
%>

<!-- Display messages after the Java logic is done -->



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - Chocolux</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <style>
        .auth-container {
            min-height: 100vh;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: flex-start;
            padding: 20px;
            overflow: hidden;
            background: url('images/WhatsApp Image 2025-04-15 at 10.07.10.jpeg') center/cover no-repeat fixed;
        }
        .video-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -2;
            background: #4a2c2a; /* Fallback color if video fails to load */
        }
        .video-error {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            text-align: center;
            z-index: -1;
            display: none;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            z-index: -1;
        }
        .auth-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: linear-gradient(to left, rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.3));
            z-index: 0;
        }
        .auth-card {
            background: rgba(74, 44, 42, 0.85);
            border-radius: 15px;
            padding: 40px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            width: 100%;
            max-width: 450px;
            position: relative;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(139, 69, 19, 0.3);
            transform: translateY(20px);
            opacity: 0;
            animation: slideUp 0.8s ease forwards;
            margin-left: 50px;
            z-index: 1;
        }
        .auth-card::before {
            content: '';
            position: absolute;
            top: -10px;
            left: -10px;
            right: -10px;
            bottom: -10px;
            background: linear-gradient(45deg, #ece4de, #4a2c2a);
            z-index: -1;
            border-radius: 20px;
            opacity: 0.3;
            animation: borderGlow 3s ease-in-out infinite;
        }
        .auth-card h2 {
            color: #b6aa9b;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2.2rem;
            position: relative;
            overflow: hidden;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.3);
        }
        .auth-card h2::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 50%;
            transform: translateX(-50%);
            width: 0;
            height: 2px;
            background: #d4a76a;
            animation: expandWidth 1s ease forwards 0.5s;
        }
        .form-control {
            border: 2px solid rgba(139, 69, 19, 0.3);
            border-radius: 8px;
            padding: 12px;
            margin-bottom: 20px;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.1);
            color: #fff;
            transform: translateX(-20px);
            opacity: 0;
            animation: slideIn 0.5s ease forwards;
        }
        .form-control::placeholder {
            color: rgba(255, 255, 255, 0.7);
        }
        .form-control:focus {
            border-color: #d4a76a;
            box-shadow: 0 0 0 0.2rem rgba(212, 167, 106, 0.25);
            transform: translateY(-2px);
            background: rgba(255, 255, 255, 0.15);
        }
        .btn-chocolate {
            background: linear-gradient(45deg, #b9b8b8, #4f4540);
            color: #fff;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            width: 100%;
            font-size: 1.1rem;
            font-weight: bold;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            transform: translateY(20px);
            opacity: 0;
            animation: slideUp 0.5s ease forwards 0.4s;
            text-shadow: 1px 1px 2px rgba(0, 0, 0, 0.2);
        }
        .btn-chocolate::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.4), transparent);
            transition: 0.5s;
        }
        .btn-chocolate:hover::before {
            left: 100%;
        }
        .btn-chocolate:hover {
            background: linear-gradient(45deg, #b18e78, #5ec9b9);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(139, 69, 19, 0.3);
        }
        .auth-links {
            text-align: center;
            margin-top: 20px;
            transform: translateY(20px);
            opacity: 0;
            animation: slideUp 0.5s ease forwards 0.6s;
            color: #fff;
        }
        .auth-links a {
            color: #f3e7d7;
            text-decoration: none;
            transition: color 0.3s ease;
            position: relative;
            font-weight: 500;
        }
        .auth-links a::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 1px;
            background: #d4a76a;
            transition: width 0.3s ease;
        }
        .auth-links a:hover::after {
            width: 100%;
        }
        .auth-links a:hover {
            color: #c6955c;
        }
        .chocolate-icon {
            text-align: center;
            margin-bottom: 20px;
            position: relative;
            animation: fadeIn 1s ease forwards;
        }
        .chocolate-icon::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 50px;
            height: 2px;
            background: linear-gradient(90deg, transparent, #d4a76a, transparent);
            animation: expandWidth 1s ease forwards 0.3s;
        }
        .chocolate-icon i {
            font-size: 3rem;
            color: #e9dac7;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
            animation: pulse 2s ease-in-out infinite;
        }
        .form-row {
            display: flex;
            gap: 15px;
        }
        .form-row .form-group {
            flex: 1;
        }
        
        @keyframes slideUp {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }
        
        @keyframes slideIn {
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }
        
        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }
        
        @keyframes expandWidth {
            to {
                width: 100px;
            }
        }
        
        @keyframes pulse {
            0%, 100% {
                opacity: 0.6;
                transform: scale(1);
            }
            50% {
                opacity: 1;
                transform: scale(1.05);
            }
        }
        
        @keyframes borderGlow {
            0%, 100% {
                opacity: 0.3;
            }
            50% {
                opacity: 0.5;
            }
        }
    </style>
</head>
<body>
<div class="auth-container">
    <video class="video-background" autoplay muted loop playsinline onerror="this.style.display='none'; document.querySelector('.video-error').style.display='block';">
        <source src="videos/vecteezy_chocolate-falling-on-black-background-copy-space-right-side_4559645.mp4" type="video/mp4">
    </video>
    <div class="video-error">
        Video failed to load. Please check the file path and format.
    </div>
    <div class="overlay"></div>
    <div class="auth-card">
        <div class="chocolate-icon">
            <i class="fa fa-heart"></i>
        </div>
        <h2>Create Account</h2>

		<% if (!errorMessage.equals("")) { %>
    <p style="color:red;"><%= errorMessage %></p>
<% } else if (!msg.equals("")) { %>
    <p style="color:while;"><%= msg %></p>
<% } %>

        <form method="post">
            <div class="form-row">
                <div class="form-group">
                    <input type="text" class="form-control" name="fname" placeholder="First Name" required>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="lname" placeholder="Last Name" required>
                </div>
            </div>
            <div class="form-group">
                <input type="email" class="form-control" name="email" placeholder="Email Address" required>
            </div>
            <div class="form-group">
                <input type="text" class="form-control" name="contact" placeholder="Contact No" required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password" required>
            </div>
            <button type="submit" class="btn btn-chocolate">Register</button>
            <div class="auth-links">
                <p>Already have an account? <a href="login.jsp">Login</a></p>
            </div>
        </form>
    </div>
</div>
</body>
</html>