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
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>ChocoLux - Shopping Cart</title>

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

    /* Cart specific styles */
    .cart-section {
      padding: 80px 0;
    }

    .cart-table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0 15px;
    }

    .cart-table th {
      color: #8b4513;
      font-weight: 600;
      padding: 15px;
      text-align: left;
      border-bottom: 2px solid #d4a76a;
    }

    .cart-table td {
      padding: 15px;
      vertical-align: middle;
    }

    .cart-item {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      transition: all 0.3s ease;
    }

    .cart-item:hover {
      box-shadow: 0 5px 15px rgba(139, 69, 19, 0.1);
      transform: translateY(-3px);
    }

    .cart-item img {
      width: 80px;
      height: 80px;
      object-fit: contain;
      border-radius: 8px;
    }

    .cart-item-name {
      font-weight: 600;
      color: #333;
      margin-bottom: 5px;
    }

    .cart-item-price {
      color: #8b4513;
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

    .remove-btn {
      color: #999;
      background: none;
      border: none;
      cursor: pointer;
      transition: all 0.3s ease;
    }

    .remove-btn:hover {
      color: #e74c3c;
    }

    .cart-summary {
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      padding: 25px;
      margin-top: 30px;
    }

    .cart-summary h3 {
      color: #8b4513;
      font-weight: 600;
      margin-bottom: 20px;
      padding-bottom: 10px;
      border-bottom: 2px solid #d4a76a;
    }

    .summary-item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 15px;
      color: #666;
    }

    .summary-total {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
      padding-top: 15px;
      border-top: 2px solid #d4a76a;
      font-weight: 700;
      color: #8b4513;
      font-size: 1.2rem;
    }

    .checkout-btn {
      display: block;
      width: 100%;
      padding: 12px;
      background: #8b4513;
      color: white;
      border: none;
      border-radius: 4px;
      font-weight: 600;
      margin-top: 20px;
      transition: all 0.3s ease;
    }

    .checkout-btn:hover {
      background: #6b3410;
      transform: translateY(-3px);
    }

    .empty-cart {
      text-align: center;
      padding: 50px 0;
    }

    .empty-cart i {
      font-size: 5rem;
      color: #d4a76a;
      margin-bottom: 20px;
    }

    .empty-cart h3 {
      color: #8b4513;
      margin-bottom: 15px;
    }

    .empty-cart p {
      color: #666;
      margin-bottom: 25px;
    }

    .continue-shopping {
      display: inline-block;
      padding: 10px 25px;
      background: #8b4513;
      color: white;
      border-radius: 4px;
      font-weight: 600;
      transition: all 0.3s ease;
    }

    .continue-shopping:hover {
      background: #6b3410;
      transform: translateY(-3px);
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
    .info_section {
    background-color: #411900;
    color: #ffffff;
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
                  <a class="nav-link dropdown-toggle chocolate-slide-in delay-400" href="#" id="shopDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Shop All
                  </a>
                  <div class="dropdown-menu" aria-labelledby="shopDropdown" style="color: black;">
                    <a class="dropdown-item" href="ferrero-rocher.jsp" style="color: black;">Ferrero Rocher</a>
                    <a class="dropdown-item" href="hersheys.jsp">Hershey's</a>
                    <a class="dropdown-item" href="toblerone.jsp">Toblerone</a>
                    <a class="dropdown-item" href="cadbury.jsp">Cadbury</a>
                    <a class="dropdown-item" href="kitkat.jsp">KitKat</a>
                    <a class="dropdown-item" href="milka.jsp">Milka</a>
                  </div>
                </li>
               <!--  <li class="nav-item">
                  <a class="nav-link chocolate-slide-in delay-500" href="testimonial.html">Testimonial</a>
                </li> -->
                <li class="nav-item">
                  <a class="nav-link chocolate-slide-in delay-500" href="contact.jsp">Contact Us</a>
                </li>
              </ul>
              <div class="quote_btn-container">
                <form class="form-inline">
                 <!--  <button class="btn my-2 my-sm-0 nav_search-btn chocolate-pulse" type="submit">
                    <i class="fa fa-search" aria-hidden="true"></i>
                  </button> -->
                </form>
                <a class="chocolate-pulse" href="cart.jsp">
                  <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                  <span class="cart-badge">0</span>
                </a>
              </div>
            </div>
          </nav>
        </div>
      </header>
      <!-- end header section -->
    </div>

    <!-- cart section -->
    <section class="cart-section layout_padding">
      <div class="container">
        <div class="heading_container" data-aos="fade-up">
          <h2>
            Your Shopping Cart
          </h2>
          <p>
            Review and manage your chocolate selections
          </p>
        </div>

        <div class="row" data-aos="fade-up" data-aos-delay="100">
          <div class="col-lg-8">
            <div class="table-responsive">
              <table class="cart-table">
                <thead>
                  <tr>
                    <th>Product</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>
                      <div class="cart-item">
                        <div class="d-flex align-items-center">
                          <img src="images/Farero.png" alt="Ferrero Rocher">
                          <div class="ml-3">
                            <div class="cart-item-name">Ferrero Rocher</div>
                            <div class="cart-item-price">$5.00</div>
                          </div>
                        </div>
                      </div>
                    </td>
                    <td>$5.00</td>
                    <td>
                      <div class="quantity-control">
                        <button class="quantity-btn">-</button>
                        <input type="text" class="quantity-input" value="1" readonly>
                        <button class="quantity-btn">+</button>
                      </div>
                    </td>
                    <td>$5.00</td>
                    <td>
                      <button class="remove-btn">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                      </button>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="cart-item">
                        <div class="d-flex align-items-center">
                          <img src="images/kitkat.png" alt="KitKat">
                          <div class="ml-3">
                            <div class="cart-item-name">Nestle's KitKat</div>
                            <div class="cart-item-price">$5.00</div>
                          </div>
                        </div>
                      </div>
                    </td>
                    <td>$5.00</td>
                    <td>
                      <div class="quantity-control">
                        <button class="quantity-btn">-</button>
                        <input type="text" class="quantity-input" value="2" readonly>
                        <button class="quantity-btn">+</button>
                      </div>
                    </td>
                    <td>$10.00</td>
                    <td>
                      <button class="remove-btn">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                      </button>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <div class="cart-item">
                        <div class="d-flex align-items-center">
                          <img src="images/61F7bkodbqL.jpg" alt="Cadbury Dairy Milk">
                          <div class="ml-3">
                            <div class="cart-item-name">Cadbury Dairy Milk Silk Oreo</div>
                            <div class="cart-item-price">$5.00</div>
                          </div>
                        </div>
                      </div>
                    </td>
                    <td>$5.00</td>
                    <td>
                      <div class="quantity-control">
                        <button class="quantity-btn">-</button>
                        <input type="text" class="quantity-input" value="1" readonly>
                        <button class="quantity-btn">+</button>
                      </div>
                    </td>
                    <td>$5.00</td>
                    <td>
                      <button class="remove-btn">
                        <i class="fa fa-trash" aria-hidden="true"></i>
                      </button>
                    </td>
                  </tr>
                </tbody>
              </table>
            </div>
            <div class="d-flex justify-content-between mt-4">
              <a href="chocolate.html" class="continue-shopping">
                <i class="fa fa-arrow-left mr-2"></i> Continue Shopping
              </a>
              <button class="btn btn-outline-secondary">
                <i class="fa fa-refresh mr-2"></i> Update Cart
              </button>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="cart-summary" data-aos="fade-left">
              <h3>Order Summary</h3>
              <div class="summary-item">
                <span>Subtotal</span>
                <span>$20.00</span>
              </div>
              <div class="summary-item">
                <span>Shipping</span>
                <span>$5.00</span>
              </div>
              <div class="summary-item">
                <span>Tax</span>
                <span>$2.00</span>
              </div>
              <div class="summary-total">
                <span>Total</span>
                <span>$27.00</span>
              </div>
              <button class="checkout-btn">
                Proceed to Checkout
              </button>
              <div class="mt-3 text-center">
                <p class="mb-0">We accept:</p>
                <div class="mt-2">
                  <i class="fa fa-cc-visa mr-2" style="font-size: 24px; color: #1a1f71;"></i>
                  <i class="fa fa-cc-mastercard mr-2" style="font-size: 24px; color: #eb001b;"></i>
                  <i class="fa fa-cc-amex" style="font-size: 24px; color: #006fcf;"></i>
                </div>
              </div>
            </div>
            <div class="mt-4" data-aos="fade-left" data-aos-delay="100">
              <div class="card">
                <div class="card-body">
                  <h5 class="card-title">Have a Coupon?</h5>
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="Enter coupon code">
                    <div class="input-group-append">
                      <button class="btn btn-outline-secondary" type="button">Apply</button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- end cart section -->

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
    // Initialize AOS
    AOS.init({
      duration: 1000,
      easing: 'ease-in-out',
      once: false,
      mirror: true
    });
    
    // Smooth scroll for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
      anchor.addEventListener('click', function (e) {
        e.preventDefault();
        
        const targetId = this.getAttribute('href');
        if (targetId === '#') return;
        
        const targetElement = document.querySelector(targetId);
        if (targetElement) {
          window.scrollTo({
            top: targetElement.offsetTop - 80,
            behavior: 'smooth'
          });
        }
      });
    });

    // Cart functionality
    document.addEventListener('DOMContentLoaded', function() {
      // Quantity buttons
      const quantityBtns = document.querySelectorAll('.quantity-btn');
      quantityBtns.forEach(btn => {
        btn.addEventListener('click', function() {
          const input = this.parentElement.querySelector('.quantity-input');
          let value = parseInt(input.value);
          
          if (this.textContent === '+') {
            value++;
          } else if (this.textContent === '-' && value > 1) {
            value--;
          }
          
          input.value = value;
          updateCartTotal();
        });
      });

      // Remove buttons
      const removeBtns = document.querySelectorAll('.remove-btn');
      removeBtns.forEach(btn => {
        btn.addEventListener('click', function() {
          const row = this.closest('tr');
          row.style.opacity = '0';
          setTimeout(() => {
            row.remove();
            updateCartTotal();
            updateCartBadge();
          }, 300);
        });
      });

      // Update cart total
      function updateCartTotal() {
        // This would be replaced with actual calculation logic
        console.log('Cart updated');
      }

      // Update cart badge
      function updateCartBadge() {
        const badge = document.querySelector('.cart-badge');
        const items = document.querySelectorAll('.cart-table tbody tr');
        badge.textContent = items.length;
      }
    });
  </script>

</body>

</html> 