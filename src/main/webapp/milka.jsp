<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="KitKat, chocolates, Nestlé, wafer, milk chocolate" />
  <meta name="description" content="Discover the premium KitKat chocolates collection at ChocoLux" />
  <meta name="author" content="" />

  <title>KitKat - ChocoLux</title>

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
  <!--slick slider stylesheet -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick-theme.min.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,600,700&display=swap" rel="stylesheet" />
  <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet">
  <!-- slick slider -->

  <link rel="stylesheet" href="css/slick-theme.css" />
  <!-- font awesome style -->
  <link href="css/font-awesome.min.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="css/responsive.css" rel="stylesheet" />
  <!-- AOS Animation Library -->
  <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">

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
      color: #8b4513;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
      margin-bottom: 1rem;
    }

    .detail_box h1 span {
      font-family: 'Dancing Script', cursive;
      font-size: 4rem;
      color: #d4a76a;
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

    /* Product page specific styles */
    .product-hero {
      background: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('images/Milka-2.webp');
      height: 400px;
      display: flex;
      align-items: center;
      justify-content: center;
      color: white;
      text-align: center;
      margin-bottom: 50px;
      position: relative;
      overflow: hidden;
    }

    .product-hero h1 {
      font-size: 3.5rem;
      font-weight: 700;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
    }

    .product-hero h1 {
      font-size: 3.5rem;
      font-weight: 700;
      text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.5);
      position: relative;
      z-index: 1;
    }

    .product-hero p {
      font-size: 1.2rem;
      max-width: 600px;
      margin: 0 auto;
      position: relative;
      z-index: 1;
    }

    .product-details {
      padding: 50px 0;
    }

    .product-image {
      border-radius: 10px;
      overflow: hidden;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
    }

    .product-image:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(0, 0, 0, 0.2);
    }

    .product-info h2 {
      color: #8b4513;
      margin-bottom: 20px;
    }

    .product-price {
      font-size: 1.8rem;
      color: #8b4513;
      font-weight: 700;
      margin: 20px 0;
    }

    .product-description {
      color: #666;
      line-height: 1.8;
      margin-bottom: 30px;
    }

    .quantity-selector {
      display: flex;
      align-items: center;
      margin-bottom: 30px;
    }

    .quantity-selector label {
      margin-right: 15px;
      font-weight: 600;
    }

    .quantity-control {
      display: flex;
      align-items: center;
      border: 1px solid #d4a76a;
      border-radius: 4px;
      overflow: hidden;
    }

    .quantity-btn {
      background: #f8f8f8;
      border: none;
      width: 30px;
      height: 30px;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .quantity-btn:hover {
      background: #d4a76a;
      color: white;
    }

    .quantity-input {
      width: 40px;
      height: 30px;
      border: none;
      text-align: center;
      font-weight: 600;
    }

    .add-to-cart-btn {
      background: #8b4513;
      color: white;
      border: none;
      padding: 12px 30px;
      border-radius: 4px;
      font-weight: 600;
      transition: all 0.3s ease;
      margin-right: 15px;
    }

    .add-to-cart-btn:hover {
      background: #6b3410;
      transform: translateY(-3px);
    }

    .buy-now-btn {
      background: #d4a76a;
      color: white;
      border: none;
      padding: 12px 30px;
      border-radius: 4px;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .buy-now-btn:hover {
      background: #c19a5f;
      transform: translateY(-3px);
    }

    .product-meta {
      margin-top: 30px;
      padding-top: 20px;
      border-top: 1px solid #eee;
    }

    .product-meta p {
      margin-bottom: 10px;
      color: #666;
    }

    .product-meta span {
      font-weight: 600;
      color: #333;
    }

    .related-products {
      padding: 50px 0;
      background-color: #f9f9f9;
    }

    .related-product-card {
      background: white;
      border-radius: 8px;
      overflow: hidden;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      transition: all 0.3s ease;
      margin-bottom: 30px;
    }

    .related-product-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    }

    .related-product-img {
      height: 200px;
      overflow: hidden;
    }

    .related-product-img img {
      width: 100%;
      height: 100%;
      object-fit: cover;
      transition: all 0.5s ease;
    }

    .related-product-card:hover .related-product-img img {
      transform: scale(1.1);
    }

    .related-product-info {
      padding: 20px;
    }

    .related-product-info h4 {
      margin-bottom: 10px;
      color: #333;
    }

    .related-product-price {
      color: #8b4513;
      font-weight: 600;
      margin-bottom: 15px;
    }

    .view-product-btn {
      display: inline-block;
      padding: 8px 15px;
      background: #8b4513;
      color: white;
      border-radius: 4px;
      transition: all 0.3s ease;
    }

    .view-product-btn:hover {
      background: #6b3410;
      color: white;
      text-decoration: none;
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
  </style>
</head>

<body class="sub_page">

  <div class="main_body_content">

    <div class="hero_area">
      <!-- header section strats -->
      <header class="header_section">
        <div class="container-fluid">
          <nav class="navbar navbar-expand-lg custom_nav-container ">
            <a class="navbar-brand chocolate-color-change" href="index.jsp">
              ChocoLux
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class=""> </span>
            </button>

            <div class="collapse navbar-collapse " id="navbarSupportedContent">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                  <a class="nav-link chocolate-slide-in delay-100" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                  <a class="nav-link chocolate-slide-in delay-200" href="about.jsp"> About</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link chocolate-slide-in delay-300" href="chocolate.jsp">Chocolates</a>
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
                  <a class="nav-link chocolate-slide-in delay-500" href="testimonial.html">Testimonial</a>
                </li> -->
                <li class="nav-item">
                  <a class="nav-link chocolate-slide-in delay-500" href="contact.jsp">Contact Us</a>
                </li>
              </ul>
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
          </nav>
        </div>
      </header>
      <!-- end header section -->
    </div>

    <!-- product hero section -->
    <section class="product-hero">
      <div class="container">
       <h1 data-aos="fade-up">Milka</h1>
        <p data-aos="fade-up" data-aos-delay="200">Indulge in the irresistible creaminess of Milka chocolate, crafted with Alpine milk for a smooth, melt-in-your-mouth experience. Whether you're savoring it alone or sharing with loved ones, Milka is the perfect treat for any moment.
</p>
      </div>
    </section>
    <!-- end product hero section -->

    <!-- product details section -->
    <section class="product-details">
      <div class="container">
        <div class="row">
          <div class="col-lg-6" data-aos="fade-right">
            <div class="product-image">
              <img src="uploads/1745585164650_milka547.png" alt="Milka" class="img-fluid">
            </div>
          </div>
          <div class="col-lg-6" data-aos="fade-left">
            <div class="product-info">
              <h2>Milka Hazelnut Chocolate bar</h2>
              <div class="product-price">&#8377;130</div>
              <div class="product-description">
                <p>Indulge in the irresistible creaminess of Milka chocolate, crafted with Alpine milk for a smooth, melt-in-your-mouth experience. Whether you're savoring it alone or sharing with loved ones, Milka is the perfect treat for any moment.</p>
                <p>With its signature lilac packaging and gentle charm, Milka has become one of the most beloved chocolate brands around the world.</p>
              </div>
              <div class="quantity-selector">
                <label>Quantity:</label>
                <div class="quantity-control">
                  <button class="quantity-btn">-</button>
                  <input type="text" class="quantity-input" value="1" readonly>
                  <button class="quantity-btn">+</button>
                </div>
              </div>
              <div class="d-flex">
                <button class="add-to-cart-btn">Add to Cart</button>
                <button class="buy-now-btn">Buy Now</button>
              </div>
              <div class="product-meta">
                <p><span>Brand:</span> Milka Hazelnut Chocolate bar</p>
                <p><span>Category:</span> Alpine Milk Chocolate</p>
                <p><span>Weight:</span> 100g</p>
                <p><span>Availability:</span> In Stock</p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end product details section -->

    <!-- related products section -->
    <section class="related-products">
      <div class="container">
        <div class="heading_container" data-aos="fade-up">
          <h2>
            More Milka Products
          </h2>
          <p>
            Discover our other premium Milka chocolate collections
          </p>
        </div>
        <div class="row">
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="100">
            <div class="related-product-card">
              <div class="related-product-img">
                <img src="images/9b739ac8-da43-4562-a7cc-3f04ca18fa30.e0cfc90c91e190da6ae81b030068cc19.webp" alt="Milka">
              </div>
              <div class="related-product-info">
                <h4>Milka</h4>
                <div class="related-product-price">&#8377;120</div>
                <a href="#" class="view-product-btn">View Product</a>
              </div>
            </div>
          </div>
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="200">
            <div class="related-product-card">
              <div class="related-product-img">
                <img src="images/milka-cherry-candy-funhouse.webp" alt="KitKat Chunky">
              </div>
              <div class="related-product-info">
                <h4>Milka Cherry Candy Fun-house</h4>
                <div class="related-product-price">&#8377;90</div>
                <a href="#" class="view-product-btn">View Product</a>
              </div>
            </div>
          </div>
          <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
            <div class="related-product-card">
              <div class="related-product-img">
                <img src="images/milka-cow.webp" alt="KitKat Gift Box">
              </div>
              <div class="related-product-info">
                <h4>Milka Chipsy Ahoy</h4>
                <div class="related-product-price">&#8377;130</div>
                <a href="#" class="view-product-btn">View Product</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end related products section -->

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
          <a href="https://html.design/">Coder's</a>
        </p>
      </div>
    </div>
  </footer>
  <!-- footer section -->

  <!-- jQery -->
  <script src="js/jquery-3.4.1.min.js"></script>
  <!-- bootstrap js -->
  <script src="js/bootstrap.js"></script>
  <!-- slick slider -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.5.9/slick.min.js"></script>
  <!-- custom js -->
  <script src="js/custom.js"></script>

  <!-- AOS Animation Library -->
  <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
  <script>
    // Initialize AOS first
    AOS.init({
      duration: 1000,
      easing: 'ease-in-out',
      once: false,
      mirror: true
    });

    // Quantity control
    document.addEventListener('DOMContentLoaded', function() {
        const minusBtn = document.querySelector('.quantity-control .quantity-btn:first-child');
        const plusBtn = document.querySelector('.quantity-control .quantity-btn:last-child');
        const qtyInput = document.querySelector('.quantity-control .quantity-input');

        if (minusBtn && plusBtn && qtyInput) {
            minusBtn.addEventListener('click', () => {
                let qty = parseInt(qtyInput.value);
                if (qty > 1) qtyInput.value = qty - 1;
            });

            plusBtn.addEventListener('click', () => {
                let qty = parseInt(qtyInput.value);
                qtyInput.value = qty + 1;
            });
        }

        // Cart functionality
        $(document).ready(function() {
            $('.add-to-cart-btn').click(function() {
                const quantity = parseInt($('.quantity-input').val());
                
                $.ajax({
                    url: 'AddToCartServlet',
                    type: 'POST',
                    data: {
                        pid: 1, // Correct PID for Milka
                        quantity: quantity
                    },
                    success: function(response) {
                        if(response.trim() === 'success') {
                            alert('Added to cart!');
                            updateCartBadge();
                        } else {
                            alert('Error: ' + response);
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error("Error:", error);
                        alert('Failed to add to cart');
                    }
                });
            });

            function updateCartBadge() {
                $.ajax({
                    url: 'GetCartCountServlet',
                    type: 'GET',
                    success: function(count) {
                        $('.cart-badge').text(count);
                    },
                    error: function() {
                        console.log('Error updating cart count');
                    }
                });
            }
            
            updateCartBadge();
        });
    });
</script>

</body>

</html> 