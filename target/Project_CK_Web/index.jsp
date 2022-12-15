<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Trang chủ</title>

		<!-- Google font -->
		<link rel="stylesheet" href="fonts/css/all.css">

		<!-- Bootstrap -->
		<link rel="stylesheet" href="css/bootstrap.min.css">
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
							<a href="index.jsp" class="logo">
								<img src="./img/logo.png" alt="">
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
									<span>Tài khoản</span>
								</a>
							</div>
							<!-- /Account -->

							<!-- Cart -->
							<div class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
									<i class="fa fa-shopping-cart"></i>
									<span>Giỏ hàng</span>	
									<div class="qty">3</div>
								</a>
								<div class="cart-dropdown">
									<div class="cart-list">
										<div class="product-widget">
											<div class="product-img">
												<img src="img/dell.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">Laptop Dell Vostro</a></h3>
												<h4 class="product-price"><span class="qty">1x</span>18.890.000đ</h4>
											</div>
											<button class="delete"><i class="fa fa-close"></i></button>
										</div>

										<div class="product-widget">
											<div class="product-img">
												<img src="img/asus.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">Laptop ASUS Vivobook</a></h3>
												<h4 class="product-price"><span class="qty">1x</span>13.290.000đ</h4>
											</div>
											<button class="delete"><i class="fa fa-close"></i></button>
										</div>

										<div class="product-widget">
											<div class="product-img">
												<img src="img/macbook.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">Macbook Ari M1 2020</a></h3>
												<h4 class="product-price"><span class="qty">1x</span>27.490.000đ</h4>
											</div>
											<button class="delete"><i class="fa fa-close"></i></button>
										</div>
									</div>
									<div class="cart-summary">
										<small>3 Sản phẩm được chọn</small>
										<h5>TỔNG CỘNG: 59.670.000đ</h5>
									</div>
									<div class="cart-btns">
										<a href="cart.jsp">Xem giỏ hàng</a>
									</div>
								</div>
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
						<li class="active"><a href="index.jsp">Trang chủ</a></li>
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

	<!-- HOT DEAL SECTION -->
	<div id="ad" class="container">
		<div class="row top-sliders">
			<div class="col-md-8">
				<div id="ad-banner" class="carousel slide" data-ride="carousel">
					<!-- Indicators -->
					<ol class="carousel-indicators">
						<li data-target="#ad-banner" data-slide-to="0" class="active"></li>
						<li data-target="#ad-banner" data-slide-to="1"></li>
						<li data-target="#ad-banner" data-slide-to="2"></li>
					</ol>

					<!-- Wrapper for slides -->
					<div class="carousel-inner">
						<div class="item active">
							<a href="#"><img src="img/banner 1.jpg" alt="Sale laptop Noel"></a>
						</div>

						<div class="item">
							<a href="#"><img src="img/banner 2.jpg" alt="Khai xuân laptop"></a>
						</div>

						<div class="item">
							<a href="#"><img src="img/banner 3.jpg" alt="Ưu đãi laptop"></a>
						</div>
					</div>

					<!-- Left and right controls -->
					<button class="left carousel-control" href="#ad-banner" data-slide="prev">
						<i class="fa fa-chevron-left"></i>
						<span class="sr-only">Previous</span>
					</button>
					<button class="right carousel-control" href="#ad-banner" data-slide="next">
						<i class="fa fa-chevron-right"></i>
						<span class="sr-only">Next</span>
					</button>
				</div>
			</div>
			<div class="col-md-2">
				<div class="sub-banner">
					<div class="banner1">
						<a href="#"><img src="img/banner 4.jpg" alt="Macbook"></a>
					</div>
					<div class="banner2">
						<a href="#"><img src="img/banner 5.jpg" alt="Laptop Gaming"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /HOT DEAL SECTION -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">

				<!-- section title -->
				<div class="col-md-12">
					<div class="section-title">
						<h3 class="title title-index">Laptop nổi bật</h3>
					</div>
				</div>
				<!-- /section title -->

				<!-- Products tab & slick -->
				<div class="col-md-12">
					<div class="row">
						<div class="products-tabs">
							<!-- tab -->
							<div id="tab2" class="tab-pane fade in active">
								<div class="products-slick" data-nav="#slick-nav-2">
									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="img/product/van phong/Acer Aspire 5 A514-54.jpg" alt="">
											<div class="product-label">
												<span class="sale">-10%</span>
												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Văn phòng</p>
											<h3 class="product-name"><a href="#">Acer Aspire 5 A514-54</a></h3>
											<h4 class="product-price">14.990.000đ <del class="product-old-price">16.890.000đ</del></h4>
											<div class="product-rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star-o"></i>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
											</div>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="img/product/van phong/Asus Zenbook 14 Q408UG.jpg" alt="">
											<div class="product-label">
												<span class="sale">-25%</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Văn phòng</p>
											<h3 class="product-name"><a href="#">Asus Zenbook 14 Q408UG</a></h3>
											<h4 class="product-price">14.890.000đ <del class="product-old-price">19.890.000đ</del></h4>
											<div class="product-rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star-o"></i>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
											</div>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product/mac_dohoa/Macbook Air M1.jpg" alt="">
											<div class="product-label">
												<span class="sale">-30%</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Mac</p>
											<h3 class="product-name"><a href="#">Macbook Air M1 2020 8-Core GPU</a></h3>
											<h4 class="product-price">31.990.000đ <del class="product-old-price">34.990.000đ</del></h4>
											<div class="product-rating">
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
											</div>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product/mac_dohoa/Dell Precision 5530.jpg" alt=" ">
										</div>
										<div class="product-body">
											<p class="product-category">Đồ Hoạ</p>
											<h3 class="product-name"><a href="#">Dell Precision 5530</a></h3>
											<h4 class="product-price">23.500.000đ</h4>
											<div class="product-rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
											</div>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="img/product/gaming/Laptop MSI Gaming Alpha 15 B5EEK.jpg" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">Gaming</p>
											<h3 class="product-name"><a href="#">Laptop MSI Gaming Alpha 15 B5EEK</a></h3>
											<h4 class="product-price">32.490.000đ</h4>
											<div class="product-rating">
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
												<i class="fa fa-star"></i>
											</div>
											<div class="product-btns">
												<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
												<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
												<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
											</div>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
										</div>
									</div>
									<!-- /product -->
								</div>
							</div>
							<!-- /tab -->
						</div>
					</div>
				</div>
				<!-- /Products tab & slick -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title title-index">Laptop mới</h3>
						</div>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab1" class="tab-pane active">
									<div class="products-slick" data-nav="#slick-nav-1">
										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="img/product/mac_dohoa/HP Zbook 17 G2.jpg" alt="">
												<div class="product-label">
													<span class="sale">-30%</span>
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Đồ hoạ</p>
												<h3 class="product-name"><a href="#">HP Zbook 17 G2</a></h3>
												<h4 class="product-price">11.000.000đ<del class="product-old-price">16.300.000đ</del></h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Thêm vào yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="./img/product/van phong/Asus Zenbook 14 Q409 ZA.jpg" alt="">
												<div class="product-label">
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Văn Phòng</p>
												<h3 class="product-name"><a href="#">Asus Zenbook 14 Q409 ZA</a></h3>
												<h4 class="product-price">16.800.000đ<del class="product-old-price">23.990.000đ</del></h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="./img/product/mac_dohoa/Macbook Air M1.jpg" alt="">
												<div class="product-label">
													<span class="sale">-10%</span>
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Mac</p>
												<h3 class="product-name"><a href="#">Macbook Pro 16 inch M1 2021</a></h3>
												<h4 class="product-price">58.000.000đ <del class="product-old-price">64.490.000đ</del></h4>
												<div class="product-rating">
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="./img/product/van phong/Samsung Galaxy Book Pro 360 13.jpg" alt="">
												<div class="product-label">
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Văn Phòng</p>
												<h3 class="product-name"><a href="#">Samsung Galaxy Book Pro 360 13</a></h3>
												<h4 class="product-price">29.990.000đ</h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="./img/product/van phong/MSI Modern 15 A5M 238VN.jpg" alt="">
												<div class="product-label">
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Văn Phòng</p>
												<h3 class="product-name"><a href="#">MSI Modern 15 A5M 238VN</a></h3>
												<h4 class="product-price">16.990.000đ <del class="product-old-price">19.990.000đ</del></h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="./img/product/gaming/Laptop Asus ROG Strix Gaming G513R.jpg" alt="">
												<div class="product-label">
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Gaming</p>
												<h3 class="product-name"><a href="#">Laptop Asus ROG Strix Gaming G513R</a></h3>
												<h4 class="product-price">29.190.000đ <del class="product-old-price">29.190.000đ</del></h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
											</div>
										</div>
										<!-- /product -->
									</div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- Products tab & slick -->
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /SECTION -->


		<!-- SECTION -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">

					<!-- section title -->
					<div class="col-md-12">
						<div class="section-title">
							<h3 class="title title-index">Laptop Bán Chạy</h3>
						</div>
					</div>
					<!-- /section title -->

					<!-- Products tab & slick -->
					<div class="col-md-12">
						<div class="row">
							<div class="products-tabs">
								<!-- tab -->
								<div id="tab2" class="tab-pane fade in active">
									<div class="products-slick" data-nav="#slick-nav-2">
										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="./img/product/van phong/Asus Vivobook X515JA.jpg" alt="">
												<div class="product-label">
													<span class="sale">-30%</span>
													<span class="new">NEW</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Văn Phòng</p>
												<h3 class="product-name"><a href="#">Asus Vivobook X515JA</a></h3>
												<h4 class="product-price">9.890.000đ <del class="product-old-price">12.890.000đ</del></h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="./img/product/van phong/Lenovo ThinkPad E14.jpg" alt="">
												<div class="product-label">
													<span class="new">Old</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Văn Phòng</p>
												<h3 class="product-name"><a href="#">Lenovo ThinkPad E14</a></h3>
												<h4 class="product-price">12.900.000đ <del class="product-old-price">15.900.000đ</del></h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star-o"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="./img/product/mac_dohoa/Macbook Air M1.jpg" alt="">
												<div class="product-label">
													<span class="sale">-30%</span>
												</div>
											</div>
											<div class="product-body">
												<p class="product-category">Mac</p>
												<h3 class="product-name"><a href="#">Macbook Air M1 2020 8-Core GPU</a></h3>
												<h4 class="product-price">31.990.000đ <del class="product-old-price">34.990.000đ</del></h4>
												<div class="product-rating">
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="./img/product/mac_dohoa/Dell Precision 5530.jpg" alt=" ">
											</div>
											<div class="product-body">
												<p class="product-category">Đồ Hoạ</p>
												<h3 class="product-name"><a href="#">Dell Precision 5530</a></h3>
												<h4 class="product-price">23.500.000đ</h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
											</div>
										</div>
										<!-- /product -->

										<!-- product -->
										<div class="product">
											<div class="product-img">
												<img src="img/product/gaming/Laptop MSI Gaming Alpha 15 B5EEK.jpg" alt="">
											</div>
											<div class="product-body">
												<p class="product-category">Gaming</p>
												<h3 class="product-name"><a href="#">Laptop MSI Gaming Alpha 15 B5EEK</a></h3>
												<h4 class="product-price">32.490.000đ</h4>
												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span></button>
												</div>
											</div>
											<div class="add-to-cart">
												<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
											</div>
										</div>
										<!-- /product -->
									</div>
								</div>
								<!-- /tab -->
							</div>
						</div>
					</div>
					<!-- /Products tab & slick -->
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
								<li><a href="#"><i class="fa fa-map-marker"></i>Kp.6, Phường Linh Trung, TP Thủ Đức, TP. Hồ Chí Minh</a></li>
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

	<!--BACKTOP-->
	<div id="backtop">
		<i class="fa fa-arrow-up"></i>
	</div>
	<!--/BACKTOP-->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/backtop.js"></script>
	</body>
</html>
