<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Forgot Password - ChocoLand</title>
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

    form {
      display: flex;
      flex-direction: column;
      gap: 15px;
    }

    input[type="email"] {
      padding: 12px;
      border-radius: 8px;
      border: none;
      font-size: 1rem;
      outline: none;
      background: rgba(255, 255, 255, 0.8);
      color: #333;
    }

    input[type="email"]::placeholder {
      color: #666;
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

    @media (max-width: 480px) {
      .form-wrapper {
        padding: 25px 20px;
      }

      .form-wrapper h1 {
        font-size: 1.6rem;
      }
    }
  </style>
</head>
<body>
<div class="container">
    <!-- Chocolate animation -->
    <div class="chocolate"></div>
    <div class="chocolate"></div>
    <div class="chocolate"></div>
    <div class="chocolate"></div>
    <div class="chocolate"></div>
    <div class="chocolate"></div>

    <!-- Forgot Password Form -->
    <div class="form-wrapper">
      <h1>Forgot Password 🍫</h1>

      <form method="post" action="SendOTPServlet">
        <input type="email" name="email" placeholder="Enter your email address" required />
        <button type="submit">Send Reset Link</button>
      </form>

      <%
        String email = request.getParameter("email");
        if (email != null) {
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;
            boolean emailFound = false;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/chocolate", "root", "rootroot");

                String query = "SELECT * FROM register WHERE email = ?";
                stmt = conn.prepareStatement(query);
                stmt.setString(1, email);
                rs = stmt.executeQuery();

                if (rs.next()) {
                    emailFound = true;
                }

                if (emailFound) {
      %>
                  <p style="color: lightgreen; text-align: center; margin-top: 15px;">✔ Reset link sent to your email!</p>
      <%
                } else {
      %>
                  <p style="color: #ffcccc; text-align: center; margin-top: 15px;">❌ Email not found. Please try again.</p>
      <%
                }

            } catch (Exception e) {
      %>
                <p style="color: red; text-align: center;">Error: <%= e.getMessage() %></p>
      <%
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception ignored) {}
                try { if (stmt != null) stmt.close(); } catch (Exception ignored) {}
                try { if (conn != null) conn.close(); } catch (Exception ignored) {}
            }
        }
      %>

    </div>
  </div>

</body>
</html>