<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>ChocoLux</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!--slick slider stylesheet -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:400,600,700&display=swap" rel="stylesheet" />
  <!-- slick slider -->
  <link rel="stylesheet" href="css/slick-theme.css" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
<style>
    /* Smooth scrolling for the entire page */
    html {
      scroll-behavior: smooth;
    }
    
    /* Animation delay classes */
    .delay-100 { animation-delay: 100ms; }
    .delay-200 { animation-delay: 200ms; }
    .delay-300 { animation-delay: 300ms; }
    .delay-400 { animation-delay: 400ms; }
    .delay-500 { animation-delay: 500ms; }
    

    
    
    /* Chocolate-themed animation colors */
    .chocolate-gradient {
      background: linear-gradient(45deg, #8b4513, #6b3410);
    }
    
    /* Custom animation for chocolate elements */
    .chocolate-float {
      animation: chocolateFloat 3s ease-in-out infinite;
    }
    
    @keyframes chocolateFloat {
      0%, 100% {
        transform: translateY(0);
      }
      50% {
        transform: translateY(-10px);
      }
    }

    /* Enhanced chocolate animations */
    .chocolate-pulse {
      animation: chocolatePulse 2s ease-in-out infinite;
    }
    
    @keyframes chocolatePulse {
      0%, 100% {
        transform: scale(1);
      }
      50% {
        transform: scale(1.05);
      }
    }
    
    .chocolate-rotate {
      animation: chocolateRotate 8s linear infinite;
    }
    
    @keyframes chocolateRotate {
      0% {
        transform: rotate(0deg);
      }
      100% {
        transform: rotate(360deg);
      }
    }
    
    .chocolate-shake {
      animation: chocolateShake 0.8s ease-in-out;
    }
    
    @keyframes chocolateShake {
      0%, 100% {
        transform: translateX(0);
      }
      10%, 30%, 50%, 70%, 90% {
        transform: translateX(-5px);
      }
      20%, 40%, 60%, 80% {
        transform: translateX(5px);
      }
    }
    
    .chocolate-fade-in {
      animation: chocolateFadeIn 1s ease-in-out;
    }
    
    @keyframes chocolateFadeIn {
      0% {
        opacity: 0;
        transform: translateY(20px);
      }
      100% {
        opacity: 1;
        transform: translateY(0);
      }
    }
    
    .chocolate-slide-in {
      animation: chocolateSlideIn 0.8s ease-out;
    }
    
    @keyframes chocolateSlideIn {
      0% {
        transform: translateX(-50px);
        opacity: 0;
      }
      100% {
        transform: translateX(0);
        opacity: 1;
      }
    }
    
    .chocolate-slide-in-right {
      animation: chocolateSlideInRight 0.8s ease-out;
    }
    
    @keyframes chocolateSlideInRight {
      0% {
        transform: translateX(50px);
        opacity: 0;
      }
      100% {
        transform: translateX(0);
        opacity: 1;
      }
    }
    
    .chocolate-bounce {
      animation: chocolateBounce 1s ease-in-out;
    }
    
    @keyframes chocolateBounce {
      0%, 20%, 50%, 80%, 100% {
        transform: translateY(0);
      }
      40% {
        transform: translateY(-20px);
      }
      60% {
        transform: translateY(-10px);
      }
    }
    
    .chocolate-glow {
      animation: chocolateGlow 2s ease-in-out infinite;
    }
    
    @keyframes chocolateGlow {
      0%, 100% {
        box-shadow: 0 0 5px rgba(139, 69, 19, 0.5);
      }
      50% {
        box-shadow: 0 0 20px rgba(139, 69, 19, 0.8);
      }
    }
    
    .chocolate-color-change {
      animation: chocolateColorChange 8s infinite;
    }
    
    @keyframes chocolateColorChange {
      0% {
        color: #8b4513;
      }
      25% {
        color: #6b3410;
      }
      50% {
        color: #4a2c2a;
      }
      75% {
        color: #6b3410;
      }
      100% {
        color: #8b4513;
      }
    }

    /* Custom dropdown styling */
    .dropdown-menu {
      background: #ffffff;
      border: 1px solid #d4a76a;
      border-radius: 8px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      padding: 10px 0;
      min-width: 200px;
    }

    .dropdown-item {
      color: black !important;
      padding: 8px 20px;
      transition: all 0.3s ease;
      font-size: 14px;
      position: relative;
      overflow: hidden;
      font-weight: 500;
    }

    .dropdown-item:hover {
      background: rgba(212, 167, 106, 0.1);
      color: #6b3410 !important;
      transform: translateX(5px);
    }

    .dropdown-item::before {
      content: '';
      position: absolute;
      left: 0;
      top: 0;
      height: 100%;
      width: 3px;
      background: #d4a76a;
      transform: scaleY(0);
      transition: transform 0.3s ease;
    }

    .dropdown-item:hover::before {
      transform: scaleY(1);
    }

    .dropdown-toggle::after {
      border-top-color: #8b4513;
    }

    /* Brand and Slider Typography */
    .navbar-brand {
      font-family: 'Raleway', sans-serif;
      font-weight: 700;
      font-size: 2.2rem;
      color: #8b4513;
      text-transform: uppercase;
      letter-spacing: 2px;
      position: relative;
      transition: all 0.3s ease;
    }

    .navbar-brand::after {
      content: '';
      position: absolute;
      bottom: -5px;
      left: 0;
      width: 100%;
      height: 2px;
      background: linear-gradient(to right, #8b4513, #d4a76a);
      transform: scaleX(0);
      transition: transform 0.3s ease;
    }

    .navbar-brand:hover {
      color: #6b3410;
    }

    .navbar-brand:hover::after {
      transform: scaleX(1);
    }

    .nav-link {
      font-weight: 600;
      font-family: 'Montserrat', sans-serif;
    }

    .heading_container h2 {
      font-weight: 700;
      font-family: 'Montserrat', sans-serif;
    }

    .detail-box h1, 
    .detail-box h2, 
    .detail-box h3, 
    .detail-box h4, 
    .detail-box h5, 
    .detail-box h6 {
      font-weight: 700;
      font-family: 'Montserrat', sans-serif;
    }

    .detail_box h1 {
      font-family: 'Playfair Display', serif;
      font-weight: 700;
      font-size: 3.5rem;
      color: white;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
      margin-bottom: 1rem;
    }

    .detail_box h1 span {
      font-family: 'Dancing Script', cursive;
      font-size: 4rem;
      color: white;
      display: block;
      margin-top: 0.5rem;
    }

    .detail_box a {
      font-family: 'Montserrat', sans-serif;
      font-weight: 600;
      font-size: 1.1rem;
      color: #8b4513;
      transition: all 0.3s ease;
    }

    .detail_box a:hover {
      color: #6b3410;
      transform: translateX(5px);
    }

    .detail_box a img {
      transition: transform 0.3s ease;
    }

    .detail_box a:hover img {
      transform: translateX(5px);
    }

    .nav-item.dropdown:hover .dropdown-menu {
      display: block;
      animation: fadeInDown 0.3s ease;
    }
    .info_section {
    background-color: #411900;
    color: #ffffff;
}
.cart-badge {
      position: absolute;
      top: -8px;
      right: -8px;
      background: #e74c3c;
      color: white;
      border-radius: 50%;
      width: 20px;
      height: 20px;
      font-size: 12px;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .layout_padding {
  padding: 60px 0;
}

.layout_padding2 {
  padding: 30px 0;
}
    @keyframes fadeInDown {
      from {
        opacity: 0;
        transform: translateY(-10px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
  </style>
</head>

<body>

  <div class="main_body_content">

    <div class="hero_area">
      <!-- header section strats -->
      <header class="header_section">
        <div class="container-fluid">
          <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand" href="index.jsp">
              ChocoLux
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class=""> </span>
            </button>

            <div class="collapse navbar-collapse " id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="about.jsp"> About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="chocolate.jsp">Chocolates</a>
                </li>
                <li class="nav-item dropdown">
  <a class="nav-link dropdown-toggle chocolate-slide-in delay-400" href="#" id="shopDropdown" 
     role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Shop All
  </a>
  <div class="dropdown-menu" aria-labelledby="shopDropdown" style="color: black;">
    <%@ page import="java.sql.*" %>
    <%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/chocolate","root","rootroot");
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT bname FROM brand");
        while(rs.next()) {
            String brandName = rs.getString("bname");
            String brandPage = brandName.toLowerCase().replace(" ", "-") + ".jsp";
    %>
            <a class="dropdown-item" href="<%= brandPage %>" style="color: black;">
                <%= brandName %>
            </a>
    <%
        }
        
        // 5. Close Resources
        rs.close();
        stmt.close();
        con.close();
    } catch(Exception e) {
        e.printStackTrace();
    }
    %>
  </div>
</li>
                <!-- <li class="nav-item">
                  <a class="nav-link" href="testimonial.jsp">Testimonial</a>
                </li> -->
                <li class="nav-item">
                  <a class="nav-link" href="contact.jsp">Contact Us</a>
                </li>
              </ul>
              
              <div class="quote_btn-container">
                <!-- <form class="form-inline">
              
                </form> -->
                <div class="quote_btn-container">
			  <%
			    String fname = (String) session.getAttribute("fname");
			    String lname = (String) session.getAttribute("lname");
			
			    if (fname != null && lname != null) {
			  %>
			    <!-- Show full name -->
			    <span style="color: brown; font-weight: bold; margin-right: 15px;">
			      Welcome, <%= fname %> <%= lname %> !!
			    </span>
			   
			       <ul class="navbar-nav ml-auto">
			     <li class="nav-item">
                  <a class="nav-link" href="logout.jsp"> Logout</a>
                </li>
                </ul>
                 <a class="chocolate-pulse" href="cart.jsp">
                  <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                  <span class="cart-badge">0</span>
                </a>
			  <%
			    }
			  %>
			</div>
              </div>
            </div>
          </nav>
        </div>
      </header>
      <!-- end header section -->
      <!-- slider section -->
      <section class="slider_section ">
        <div id="customCarousel1" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <div class="carousel-item active">
              <div class="container">
                <div class="row">
                  <div class="col-md-6">
                    <div class="detail_box">
                      <h1>
                        Chocolate <br>
                        <span>
                          Yummy
                        </span>
                      </h1>
                     <a href="#">
                        <span style="font-family: 'Didot, serif', cursive; font-size: 40px;">
                          Read More
                        </span>
                        <img src="images/white-arrow.png" alt="">
                      </a>
                    </div>
                  </div>
                  <div class="col-md-4 ml-auto">
                    <div class="img-box">
                      <img src="images/slider-img.png" alt="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item ">
              <div class="container">
                <div class="row">
                  <div class="col-md-6">
                    <div class="detail_box">
                      <h1>
                        Chocolate <br>
                        <span>
                          Crispy
                        </span>
                      </h1>
                      <a href="#">
                        <span style="font-family: 'Didot, serif', cursive; font-size: 40px;">
                          Read More
                        </span>
                        <img src="images/white-arrow.png" alt="">
                      </a>
                    </div>
                  </div>
                  <div class="col-md-4 ml-auto">
                    <div class="img-box">
                      <img src="images/product.png" alt="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="carousel-item ">
              <div class="container">
                <div class="row">
                  <div class="col-md-6">
                    <div class="detail_box">
                      <h1>
                        Chocolate <br>
                        <span>
                          Crunchy
                        </span>
                      </h1>
                      <a href="#">
                        <span style="font-family: 'Didot, serif', cursive; font-size: 40px;">
                          Read More
                        </span>
                        <img src="images/white-arrow.png" alt="">
                      </a>
                    </div>
                  </div>
                  <div class="col-md-4 ml-auto">
                    <div class="img-box">
                      <img src="images/Farero-removebg-preview.png" alt="">
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="carousel_btn-box">
          <a class="carousel-control-prev" href="#customCarousel1" role="button" data-slide="prev">
            <i class="fa fa-arrow-left" aria-hidden="true"></i>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#customCarousel1" role="button" data-slide="next">
            <i class="fa fa-arrow-right" aria-hidden="true"></i>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </section>
      <!-- end slider section -->
    </div>

  <!-- about section -->

    <section class="about_section layout_padding ">
      <div class="container  ">
        <div class="row">
          <div class="col-md-6">
            <div class="detail-box">
              <div class="heading_container">
                <h2>
                  About Our Company
                </h2>
              </div>
              <p>
               Welcome to CHOCOLUX!! — A luxurious fusion of technology and taste, crafted to streamline every layer of your chocolate business. Designed with precision and passion, this intelligent platform empowers chocolatiers to manage inventory effortlessly, process customer orders with ease, and enhance the online shopping experience. <br>From rich product displays to smooth order tracking and real-time stock updates, every feature is tailored to match the elegance of the Chocolux brand. Whether you’re running a single boutique or a growing chain, Chocolux Management System brings efficiency, elegance, and indulgence to your fingertips — because managing chocolate should be as delightful as enjoying it.</p>
              <a href="#">
                <span style="font-family: 'Didot, serif', cursive; font-size: 30px;">
                  Read More
                </span>
                <img src="images/color-arrow.png" alt="">
              </a>
            </div>
          </div>
          <div class="col-md-6">
            <div class="img-box">
              <img src="images/about-img.png" alt="">
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- end about section -->
    <!-- chocolate section -->

   <section class="chocolate_section" id="chocolate">
      <div class="container">
        <div class="heading_container chocolate-fade-in" data-aos="fade-up">
          <h2>
            Our chocolate products
          </h2>
          <p>
            Many desktop publishing packages and web pagend web page editors now use Lorem Ipsum as their
          </p>
        </div>
      </div>
      <div class="container">
        <div class="chocolate_container">
          <div class="box chocolate-fade-in" data-aos="zoom-in" data-aos-delay="100">
            <div class="img-box chocolate-pulse">
              <img src="images/Farero.png" style="height: 100%;;" alt="">
            </div>
            <div class="detail-box">
              <h6>
                farrero Rocher <span>chocolate</span>
              </h6>
              <h5>
               &#8377;180
              </h5>
              <a href="" class="chocolate-bounce">
                BUY NOW
              </a>
            </div>
          </div>
          <div class="box chocolate-fade-in" data-aos="zoom-in" data-aos-delay="200">
            <div class="img-box chocolate-pulse">
              <img src="images/kitkat.png" alt="" style="height: 100%;">
            </div>
            <div class="detail-box">
              <h6>
                Nestle's <span>Kitkat</span>
              </h6>
              <h5>
               &#8377;20
              </h5>
              <a href="" class="chocolate-bounce">
                BUY NOW
              </a>
            </div>
          </div>
          <div class="box chocolate-fade-in" data-aos="zoom-in" data-aos-delay="300">
            <div class="img-box chocolate-pulse">
              <img src="images/61F7bkodbqL.jpg" alt="">
            </div>
            <div class="detail-box">
              <h6>
                Cadbury Dairy Milk <span>Silk Oreo</span>
              </h6>
              <h5>
               &#8377;100
              </h5>
              <a href="" class="chocolate-bounce">
                BUY NOW
              </a>
            </div>
          </div>
          <div class="box" data-aos="zoom-in" data-aos-duration="800" data-aos-delay="400">
            <div class="img-box">
              <img src="images/Hersheys.png" alt="" class="chocolate-float" style="height: 100%;">
            </div>
            <div class="detail-box">
              <h6>
                Hershey's <span>chocolate</span>
              </h6>
              <h5>
                &#8377;70
              </h5>
              <a href="">
                BUY NOW
              </a>
            </div>
          </div>
          <div class="box" data-aos="zoom-in" data-aos-duration="800" data-aos-delay="500">
            <div class="img-box">
              <img src="images/9b739ac8-da43-4562-a7cc-3f04ca18fa30.e0cfc90c91e190da6ae81b030068cc19.webp" alt="" class="chocolate-float">
            </div>
            <div class="detail-box">
              <h6>
                Milka <span>chocolate</span>
              </h6>
              <h5>
                &#8377;120
              </h5>
              <a href="">
                BUY NOW
              </a>
            </div>
          </div>
          <div class="box" data-aos="zoom-in" data-aos-duration="800" data-aos-delay="600">
            <div class="img-box">
              <img src="images/Toblerone.png" alt="" class="chocolate-float">
            </div>
            <div class="detail-box">
              <h6>
                Toblerone <span>chocolate</span>
              </h6>
              <h5>
                &#8377;250
              </h5>
              <a href="">
                BUY NOW
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end chocolate section -->

    <!-- offer section -->

    <section class="offer_section layout_padding">
      <div class="container">
        <div class="box">
          <div class="detail-box">
            <h2>
              Offers on chocolates
            </h2>
            <h3>
              Get 5% Offer <br>
              any Chocolate items
            </h3>
            <a href="">
              Buy Now
            </a>
          </div>
          <div class="img-box">
            <img src="images/offer-img.png" alt="">
          </div>
        </div>
        <div class="btn-box">
          <a href="">
            <span>
              See More
            </span>
            <img src="images/color-arrow.png" alt="">
          </a>
        </div>
      </div>
    </section>

    <!-- end offer section -->

    <!-- client section -->

    <section class="client_section">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-4 ml-auto">
            <div class="img-box sub_img-box">
              <img src="images/client-chocolate.png" alt="">
            </div>
          </div>
          <div class="col-lg-6 px-0">
            <div class="client_container">
              <div class="heading_container">
                <h2>
                  Testimonial
                </h2>
              </div>
              <div id="customCarousel2" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <div class="box">
                      <div class="img-box">
                        <img src="images/client-img.jpg" alt="">
                      </div>
                      <div class="detail-box">
                        <h4>
                          Gero Miliya
                        </h4>
                        <p>
                          long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it haslong established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it haslong established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has
                        </p>
                        <i class="fa fa-quote-left" aria-hidden="true"></i>
                      </div>
                    </div>
                  </div>
                  <div class="carousel-item">
                    <div class="box">
                      <div class="img-box">
                        <img src="images/client-img.jpg" alt="">
                      </div>
                      <div class="detail-box">
                        <h4>
                          Gero Miliya
                        </h4>
                        <p>
                          long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it haslong established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it haslong established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has
                        </p>
                        <i class="fa fa-quote-left" aria-hidden="true"></i>
                      </div>
                    </div>
                  </div>
                  <div class="carousel-item">
                    <div class="box">
                      <div class="img-box">
                        <img src="images/client-img.jpg" alt="">
                      </div>
                      <div class="detail-box">
                        <h4>
                          Gero Miliya
                        </h4>
                        <p>
                          long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it haslong established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it haslong established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has
                        </p>
                        <i class="fa fa-quote-left" aria-hidden="true"></i>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="carousel_btn-box">
                  <a class="carousel-control-prev" href="#customCarousel2" role="button" data-slide="prev">
                    <i class="fa fa-arrow-left" aria-hidden="true"></i>
                    <span class="sr-only">Previous</span>
                  </a>
                  <a class="carousel-control-next" href="#customCarousel2" role="button" data-slide="next">
                    <i class="fa fa-arrow-right" aria-hidden="true"></i>
                    <span class="sr-only">Next</span>
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- end client section -->


    <!-- contact section -->

    <section class="contact_section layout_padding">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-5 col-lg-4 offset-md-1 offset-lg-2">
            <div class="form_container">
              <div class="heading_container">
                <h2>
                  Contact Us
                </h2>
              </div>
              <form action="">
                <div>
                  <input type="text" placeholder="Full Name " />
                </div>
                <div>
                  <input type="text" placeholder="Phone number" />
                </div>
                <div>
                  <input type="email" placeholder="Email" />
                </div>
                <div>
                  <input type="text" class="message-box" placeholder="Message" />
                </div>
                <div class="d-flex ">
                  <button>
                    SEND NOW
                  </button>
                </div>
              </form>
            </div>
          </div>
          <div class="col-md-6  px-0">
            <div class="map_container">
              <div class="map">
                <div id="googleMap"></div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- end contact section -->


    <!-- info section -->
    <section class="info_section layout_padding2">
      <div class="container">
        <div class="row info_form_social_row">
          <div class="col-md-8 col-lg-9">
            <div class="info_form">
              <form action="">
                <input type="email" placeholder="Enter your email">
                <button>
                  <i class="fa fa-arrow-right" aria-hidden="true"></i>
                </button>
              </form>
            </div>
          </div>
          <div class="col-md-4 col-lg-3">

            <div class="social_box">
              <a href="">
                <i class="fa fa-facebook" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-twitter" aria-hidden="true"></i>
              </a>
              <a href="">
                <i class="fa fa-linkedin" aria-hidden="true"></i>
              </a>
            </div>
          </div>
        </div>
        <div class="row info_main_row">
          <div class="col-md-6 col-lg-3">
            <div class="info_links">
              <h4>
                Menu
              </h4>
             <div class="info_links_menu">
                <a href="index.jsp">
                  Home
                </a>
                <a href="about.jsp">
                  About
                </a>
                <a href="chocolate.jsp">
                  Chocolates
                </a>
                <a href="testimonial.jsp">
                  Testimonial
                </a>
                <a href="contact.jsp">
                  Contact us
                </a>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="info_insta">
              <h4>
                Instagram
              </h4>
              <div class="insta_box">
                <div class="img-box">
                  <img src="images/insta-img.png" alt="">
                </div>
                <p>
                  long established fact that a reader
                </p>
              </div>
              <div class="insta_box">
                <div class="img-box">
                  <img src="images/insta-img.png" alt="">
                </div>
                <p>
                  long established fact that a reader
                </p>
              </div>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <div class="info_detail">
              <h4>
                Company
              </h4>
              <p class="mb-0">
                when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to
              </p>
            </div>
          </div>
          <div class="col-md-6 col-lg-3">
            <h4>
              Contact Us
            </h4>
            <div class="info_contact">
              <a href="">
                <i class="fa fa-map-marker" aria-hidden="true"></i>
                <span>
                  Location
                </span>
              </a>
              <a href="">
                <i class="fa fa-phone" aria-hidden="true"></i>
                <span>
                  Call +01 1234567890
                </span>
              </a>
              <a href="">
                <i class="fa fa-envelope"></i>
                <span>
                  demo@gmail.com
                </span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- end info_section -->

  </div>

  <!-- footer section -->
  <footer class="container-fluid footer_section">
    <div class="container">
      <div class="col-md-11 col-lg-8 mx-auto">
        <p>
          &copy; <span id="displayYear"></span> All Rights Reserved By
          <a href="https://html.design/">Free Html Templates</a>
        </p>
      </div>
    </div>
  </footer>
  <!-- footer section -->

  <!-- jQery -->
  <script  src="js/jquery-3.4.1.min.js"></script>
  <!-- bootstrap js -->
  <script  src="js/bootstrap.js"></script>
  <!-- slick slider -->
  <script  src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
  <!-- custom js -->
  <script  src="js/custom.js"></script>
  <!-- Google Map -->
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCh39n5U-4IoWpsVGUHWdqB6puEkhRLdmI&callback=myMap"></script>
  <!-- End Google Map -->

</body>

</html>