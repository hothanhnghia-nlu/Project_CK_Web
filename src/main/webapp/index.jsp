<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>--%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		 <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

		<title>Trang chủ</title>

		<!-- Google font -->
		<link rel="stylesheet" href="assets/fonts/css/all.css">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/laptop-icon.png" />

		<!-- Bootstrap -->
		<link rel="stylesheet" href="assets/css/bootstrap.min.css">
		<!-- Slick -->
		<link type="text/css" rel="stylesheet" href="assets/css/slick.css"/>
		<link type="text/css" rel="stylesheet" href="assets/css/slick-theme.css"/>

		<!-- nouislider -->
		<link type="text/css" rel="stylesheet" href="assets/css/nouislider.min.css"/>

		<!-- Font Awesome Icon -->
		<link rel="stylesheet" href="assets/css/font-awesome.min.css">

		<!-- Custom stlylesheet -->
		<link type="text/css" rel="stylesheet" href="assets/css/style.css"/>

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->

    </head>
	<body>
	<!-- HEADER -->
	<jsp:include page="header.jsp"/>
	<!-- /HEADER -->

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
						<div class="item">
							<a href="#"><img src="assets/img/banner 6.jpg" alt="Khai xuân laptop"></a>
						</div>

						<div class="item">
							<a href="#"><img src="assets/img/banner 6.jpg" alt="Sale laptop Noel"></a>
						</div>

						<div class="item active">
							<a href="#"><img src="assets/img/banner 3.jpg" alt="Ưu đãi laptop"></a>
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
						<a href="#"><img src="assets/img/banner 4.jpg" alt="Macbook"></a>
					</div>
					<div class="banner2">
						<a href="#"><img src="assets/img/banner 5.jpg" alt="Laptop Gaming"></a>
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
							<div id="tab3" class="tab-pane fade in active">
								<div class="products-slick" data-nav="#slick-nav-2">
									<%List<Product> listTop = (List<Product>) request.getAttribute("listTop");
										for (Product p : listTop) {
									%>

									<!-- product -->
									<div class="col-md-4 col-xs-6">
										<div class="product">
											<div class="product-img">
												<img src="<%=p.getImage()%>" alt="">
												<div class="product-label">
													<!-- <span class="sale">-30%</span> -->
													<% boolean check = p.getDiscount()!=0 ? true :false;
														if(check==true){%>
													<span class="sale">-<%=(int)((1.0-(double)p.getDiscount()/(double)p.getPrice())*100)%>%</span>
													<%}%>
													<span class="new">NEW</span>

												</div>
											</div>
											<div class="product-body">
												<p class="product-category"><%=p.getBrand()%>
												</p>
												<h3 class="product-name"><a href="detail?pid=<%=p.getProductID()%>"><%=p.getName()%>
												</a></h3>

												<% if(check==true){%>
												<h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getDiscount())%></h4>
												<del class="product-old-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getPrice())%></del>
												<%} else {%>
												<h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getPrice())%></h4>
												<br>
												<%}%>

												<div class="product-rating">
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
												</div>
												<div class="product-btns">
													<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
															class="tooltipp">Yêu thích</span></button>
													<button class="add-to-compare"><i class="fa fa-exchange"></i><span
															class="tooltipp">So sánh</span></button>
													<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span>
													</button>
												</div>
											</div>
											<div class="add-to-cart">
												<a href="cart/add?pid=<%=p.getProductID()%>" class="add-to-cart-btn">Thêm vào giỏ hàng</a>
											</div>
										</div>
									</div>
									<!-- /product -->
									<div class="clearfix visible-sm visible-xs"></div>
									<%}%>
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
										<%List<Product> listNew = (List<Product>) request.getAttribute("listNew");
											for (Product p : listNew) {
										%>

										<!-- product -->
										<div class="col-md-4 col-xs-6">
											<div class="product">
												<div class="product-img">
													<img src="<%=p.getImage()%>" alt="">
													<div class="product-label">
														<!-- <span class="sale">-30%</span> -->
														<% boolean check = p.getDiscount()!=0 ? true :false;
															if(check==true){%>
														<span class="sale">-<%=(int)((1.0-(double)p.getDiscount()/(double)p.getPrice())*100)%>%</span>
														<%}%>
														<span class="new">NEW</span>

													</div>
												</div>
												<div class="product-body">
													<p class="product-category"><%=p.getBrand()%>
													</p>
													<h3 class="product-name"><a href="detail?pid=<%=p.getProductID()%>"><%=p.getName()%>
													</a></h3>

													<% if(check==true){%>
													<h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getDiscount())%></h4>
													<del class="product-old-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getPrice())%></del>
													<%} else {%>
													<h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getPrice())%></h4>
													<br>
													<%}%>

													<div class="product-rating">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
													<div class="product-btns">
														<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
																class="tooltipp">Yêu thích</span></button>
														<button class="add-to-compare"><i class="fa fa-exchange"></i><span
																class="tooltipp">So sánh</span></button>
														<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span>
														</button>
													</div>
												</div>
												<div class="add-to-cart">
													<a href="cart/add?pid=<%=p.getProductID()%>" class="add-to-cart-btn">Thêm vào giỏ hàng</a>
												</div>
											</div>
										</div>
										<!-- /product -->
										<div class="clearfix visible-sm visible-xs"></div>
										<%}%>
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
										<%List<Product> listSeller = (List<Product>) request.getAttribute("listSeller");
											for (Product p : listSeller) {
										%>

										<!-- product -->
										<div class="col-md-4 col-xs-6">
											<div class="product">
												<div class="product-img">
													<img src="<%=p.getImage()%>" alt="">
													<div class="product-label">
														<!-- <span class="sale">-30%</span> -->
														<% boolean check = p.getDiscount()!=0 ? true :false;
															if(check==true){%>
														<span class="sale">-<%=(int)((1.0-(double)p.getDiscount()/(double)p.getPrice())*100)%>%</span>
														<%}%>
														<span class="new">NEW</span>

													</div>
												</div>
												<div class="product-body">
													<p class="product-category"><%=p.getBrand()%>
													</p>
													<h3 class="product-name"><a href="detail?pid=<%=p.getProductID()%>"><%=p.getName()%>
													</a></h3>

													<% if(check==true){%>
													<h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getDiscount())%></h4>
													<del class="product-old-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getPrice())%></del>
													<%} else {%>
													<h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getPrice())%></h4>
													<br>
													<%}%>

													<div class="product-rating">
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
													</div>
													<div class="product-btns">
														<button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span
																class="tooltipp">Yêu thích</span></button>
														<button class="add-to-compare"><i class="fa fa-exchange"></i><span
																class="tooltipp">So sánh</span></button>
														<button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem nhanh</span>
														</button>
													</div>
												</div>
												<div class="add-to-cart">
													<a href="cart/add?pid=<%=p.getProductID()%>" class="add-to-cart-btn">Thêm vào giỏ hàng</a>
												</div>
											</div>
										</div>
										<!-- /product -->
										<%}%>
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

	<!-- FOOTER -->
	<jsp:include page="footer.jsp"/>
	<!-- /FOOTER -->

	<!--BACKTOP-->
	<div id="backtop">
		<i class="fa fa-arrow-up"></i>
	</div>
	<!--/BACKTOP-->

	<!-- jQuery Plugins -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/slick.min.js"></script>
	<script src="assets/js/nouislider.min.js"></script>
	<script src="assets/js/jquery.zoom.min.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/backtop.js"></script>
	</body>
</html>
