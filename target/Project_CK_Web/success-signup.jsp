<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Đăng ký</title>

  <!-- Google font -->
  <link rel="stylesheet" href="fonts/css/all.css">

  <!-- Bootstrap -->
  <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

  <!-- Slick -->
  <link type="text/css" rel="stylesheet" href="css/slick.css"/>
  <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

  <!-- nouislider -->
  <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

  <!-- Font Awesome Icon -->
  <link rel="stylesheet" href="css/font-awesome.min.css">

  <!-- Custom stlylesheet -->
  <link type="text/css" rel="stylesheet" href="css/style.css"/>

  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

</head>
<body>
<!-- HEADER -->
<header>
  <!-- MAIN HEADER -->
  <div id="header">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <!-- LOGO -->
        <div class="col-md-3">
          <div class="header-logo">
            <a href="home.jsp" class="logo">
              <img src="img/logo.png" alt="">
            </a>
          </div>
        </div>
        <!-- /LOGO -->

        <!-- SEARCH BAR -->
        <div class="col-md-6">
          <div class="header-search">
            <form>
              <input class="input" placeholder="Nhập tên sản phẩm cần tìm...">
              <button class="search-btn">Tìm kiếm</button>
            </form>
          </div>
        </div>
        <!-- /SEARCH BAR -->

        <!-- Account -->
        <div class="col-md-3 clearfix">
          <div class="header-ctn">
            <!-- Account -->
            <div>
              <a href="login.jsp">
                <i class="fa fa-user"></i>
                <span>Đăng nhập</span>
              </a>
            </div>
            <!-- /Account -->

            <!-- Cart -->
            <div class="dropdown">
              <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                <i class="fa fa-shopping-cart"></i>
                <span>Giỏ hàng</span>
                <div class="qty">0</div>
              </a>
            </div>
            <!-- /Cart -->

            <!-- Menu Toogle -->
            <div class="menu-toggle">
              <a href="#">
                <i class="fa fa-bars"></i>
                <span>Menu</span>
              </a>
            </div>
            <!-- /Menu Toogle -->
          </div>
        </div>
        <!-- /ACCOUNT -->
      </div>
      <!-- row -->
    </div>
    <!-- container -->
  </div>
  <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->

<!-- NAVIGATION -->
<nav id="navigation">
  <!-- container -->
  <div class="container">
    <!-- responsive-nav -->
    <div id="responsive-nav">
      <!-- NAV -->
      <ul class="main-nav nav navbar-nav">
        <li class="active"><a href="home.jsp">Trang chủ</a></li>
        <li><a href="gaming-category.jsp">Latop Gaming <i class="fa fa-angle-down"></i></a>
          <ul class="dropdown">
            <li><a href="#">Msi</a></li>
            <li><a href="#">Dell</a></li>
            <li><a href="#">Lenovo</a></li>
            <li><a href="#">HP</a></li>
            <li><a href="#">Asus</a></li>
            <li><a href="#">Acer</a></li>
          </ul>
        </li>
        <li><a href="graphic-category.jsp">Laptop Đồ Họa <i class="fa fa-angle-down"></i></a>
          <ul class="dropdown">
            <li><a href="#">Dell</a></li>
            <li><a href="#">Lenovo</a></li>
            <li><a href="#">HP</a></li>
          </ul>
        </li>
        <li><a href="office-category.jsp">Laptop Văn Phòng <i class="fa fa-angle-down"></i></a>
          <ul class="dropdown">
            <li><a href="#">Msi</a></li>
            <li><a href="#">Dell</a></li>
            <li><a href="#">Lenovo</a></li>
            <li><a href="#">HP</a></li>
            <li><a href="#">Asus</a></li>
            <li><a href="#">Acer</a></li>
          </ul>
        </li>
        <li><a href="mac-category.jsp">Macbook <i class="fa fa-angle-down"></i></a>
          <ul class="dropdown">
            <li><a href="#">Macbook Air</a></li>
            <li><a href="#">Macbook Pro</a></li>
          </ul>
        </li>

        <li><a href="contact.jsp">Liên hệ</a></li>
      </ul>
      <!-- /NAV -->
    </div>
    <!-- /responsive-nav -->
  </div>
  <!-- /container -->
</nav>
<!-- /NAVIGATION -->

<!-- SECTION -->
<div class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <div class="col-md-12">
        <div class="load_image text-center">
          <img src="img/icon_check.png" alt="">
        </div>
        <div class="success_order text-center">
          <h3>Chúc mừng bạn đã đăng ký tài khoản thành công!</h3>
          <h4>Vui lòng quay lại trang Đăng nhập</h4>
          <a href="login.jsp" class="primary-btn">Đăng nhập</a>
        </div>
      </div>
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /SECTION -->

<!-- NEWSLETTER -->
<div id="newsletter" class="section">
  <!-- container -->
  <div class="container">
    <!-- row -->
    <div class="row">
      <div class="col-md-12">
        <div class="newsletter">
          <p>Đăng ký để nhận <strong>ƯU ĐÃI</strong></p>
          <form>
            <input class="input" type="email" placeholder="Nhập email của bạn">
            <button class="newsletter-btn"><i class="fa fa-envelope"></i> Đăng ký</button>
          </form>
          <ul class="newsletter-follow">
            <li>
              <a href="#"><i class="fa fa-facebook"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-twitter"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-instagram"></i></a>
            </li>
            <li>
              <a href="#"><i class="fa fa-pinterest"></i></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
</div>
<!-- /NEWSLETTER -->

<!-- FOOTER -->
<footer id="footer">
  <!-- top footer -->
  <div class="section">
    <!-- container -->
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">GIỚI THIỆU</h3>
            <p>CỬA HÀNG LAPTOP UY TÍN HÀNG ĐẦU VIỆT NAM</p>
            <ul class="footer-links">
              <li><a href="#"><i class="fa fa-map-marker"></i>Kp.6, Phường Linh Trung, TP Thủ Đức, TP. Hồ
                Chí Minh</a></li>
              <li><a href="#"><i class="fa fa-phone"></i>02812345678</a></li>
              <li><a href="#"><i class="fa fa-envelope-o"></i>nlu@hcmuaf.edu.vn</a></li>
            </ul>
          </div>
        </div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">CHUYÊN CUNG CẤP</h3>
            <ul class="footer-links">
              <li><a href="gaming-category.jsp">Laptop Gaming</a></li>
              <li><a href="graphic-category.jsp">Laptop Đồ Họa</a></li>
              <li><a href="office-category.jsp">Laptop Văn Phòng</a></li>
              <li><a href="mac-category.jsp">Macbook</a></li>
            </ul>
          </div>
        </div>

        <div class="clearfix visible-xs"></div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">THÔNG TIN</h3>
            <ul class="footer-links">
              <li><a href="#">Về chúng tôi</a></li>
              <li><a href="contact.jsp">Liên hệ</a></li>
              <li><a href="#">Chính sách</a></li>
              <li><a href="#">Giao trả hàng</a></li>
              <li><a href="#">Điều khoản</a></li>
            </ul>
          </div>
        </div>

        <div class="col-md-3 col-xs-6">
          <div class="footer">
            <h3 class="footer-title">DỊCH VỤ</h3>
            <ul class="footer-links">
              <li><a href="#">Tài khoản</a></li>
              <li><a href="cart.jsp">Giỏ hàng</a></li>
              <li><a href="#">Yêu thích</a></li>
              <li><a href="#">Hỗ trợ</a></li>
            </ul>
          </div>
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /top footer -->

  <!-- bottom footer -->
  <div id="bottom-footer" class="section">
    <div class="container">
      <!-- row -->
      <div class="row">
        <div class="col-md-12 text-center">
          <ul class="footer-payments">
            <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
            <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
            <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
          </ul>
          <span class="copyright">
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Cửa hàng Laptop uy tín hàng đầu Việt Nam
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							</span>
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>

</body>
</html>