<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
									<span>Đăng nhập</span>
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