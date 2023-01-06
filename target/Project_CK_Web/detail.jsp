<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
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
		<link rel="stylesheet" href="assets/fonts/css/all.css">

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
	<header>
			<jsp:include page="header.jsp"/>
				<!-- BREADCRUMB -->
					<%Product p = (Product) request.getAttribute("detail");%>
				<div id="breadcrumb" class="section">
					<!-- container -->
					<div class="container">
						<!-- row -->
						<div class="row">
							<div class="col-md-12">
								<ul class="breadcrumb-tree">
									<li><a href="../../index.html">Trang chủ</a></li>
									<li class="active"><a href="mac-category.html">Macbook</a></li>
									<li class="active"><a href="#"><%=p.getName()%>></a></li>
								</ul>
							</div>
						</div>
						<!-- /row -->
					</div>
					<!-- /container -->
				</div>
				<!-- /BREADCRUMB -->

				<!-- SECTION -->
				<div class="section">
					<!-- container -->
					<div class="container">
						<!-- row -->
						<div class="row">
							<!-- Product main img -->
							<div class="col-md-5 col-md-push-1">
								<div id="product-main-img">
									<div class="product-preview">
										<img src="<%=p.getImage()%>" he alt="">
									</div>
								</div>
							</div>
							<!-- /Product main img -->

<%--							<!-- Product thumb imgs -->--%>
							<div class="col-md-2  col-md-pull-5">
<%--								<div id="product-imgs">--%>
<%--									<div class="product-preview">--%>
<%--										<img src="<%=p.getImage()%>" alt="">--%>
<%--									</div>--%>
<%--								</div>--%>
							</div>
<%--							<!-- /Product thumb imgs -->--%>

							<!-- Product details -->
							<div class="col-md-5">
								<div class="product-details">
									<h2 class="product-name"><%=p.getName()%></h2>
									<div>
										<div class="product-rating">
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star"></i>
											<i class="fa fa-star-o"></i>
										</div>
										<a class="review-link" href="#">10 đánh giá | Viết đánh giá của bạn</a>
									</div>
									<div>
										<% boolean check = p.getDiscount()!=0 ? true :false;%>
										<% if(check==true){%>
										<h3 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getDiscount())%></h3>
										<del class="product-old-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getPrice())%></del>
										<%} else {%>
										<h3 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getPrice())%></h3>
										<br>
										<%}%>
										<% check = p.getQuantity()==0 ? true :false;%>
										<% if(check==true){%>
										<span class="product-unavailable">Hết hàng</span>
										<%}%>
										<% if(check==false){%>
										<span class="product-available">Còn hàng</span>
										<%}%>
									</div>
									<div class="feature">
										<h4></h4>
										<ul>
											<li></li>
											<li></li>
											<li></li>
											<li></li>
										</ul>
									</div>
									<div class="add-to-cart">
										<div class="qty-label">
											Số lượng:
											<div class="input-number">
												<input type="number" value="1">
												<span class="qty-up">+</span>
												<span class="qty-down">-</span>
											</div>
										</div>
										<button class="add-to-cart-btn">Mua ngay</button>
									</div>
								</div>
							</div>
							<!-- /Product details -->

							<!-- Product tab -->
							<div class="col-md-12">
								<div id="product-tab">
									<!-- product tab nav -->
									<ul class="tab-nav">
<%--										<li class="active"><a data-toggle="tab" href="#tab1">MÔ TẢ</a></li>--%>
										<li><a data-toggle="tab" href="#tab2">THÔNG SỐ KỸ THUẬT</a></li>
										<li><a data-toggle="tab" href="#tab3">ĐÁNH GIÁ</a></li>
									</ul>
									<!-- /product tab nav -->

									<!-- product tab content -->
									<div class="tab-content">
										<!-- tab1  -->
										<div id="tab1" class="tab-pane fade in active">
											<div class="row">
												<div class="col-md-12">
													<h5>Thông Số Kỹ Thuật</h5>
													<textarea class="resizable_textarea form-control" readonly style="height: 300px;"><%=p.getDiscription()%></textarea>
												</div>
											</div>
										</div>
										<!-- /tab1  -->

<%--										<!-- tab2  -->--%>
<%--										<div id="tab2" class="tab-pane fade in">.--%>
<%--											<div class="row">--%>
<%--												<div class="col-md-12">--%>
<%--													<table class="table_model">--%>
<%--														<tr>--%>
<%--															<td>CPU</td>--%>
<%--															<td>Apple M2</td>--%>
<%--														</tr>--%>
<%--														<tr>--%>
<%--															<td>RAM</td>--%>
<%--															<td>8GB</td>--%>
<%--														</tr>--%>
<%--														<tr>--%>
<%--															<td>Ổ cứng</td>--%>
<%--															<td>SSD 256GB</td>--%>
<%--														</tr>--%>
<%--														<tr>--%>
<%--															<td>Card đồ họa</td>--%>
<%--															<td>Card tích hợp - 10 nhân GPU</td>--%>
<%--														</tr>--%>
<%--														<tr>--%>
<%--															<td>Màn hình</td>--%>
<%--															<td>13.3 inch Retina (2560 x 1600), Wide color, IPS, 500 nits brightness</td>--%>
<%--														</tr>--%>
<%--														<tr>--%>
<%--															<td>Camera</td>--%>
<%--															<td>720p FaceTime Camera</td>--%>
<%--														</tr>--%>
<%--														<tr>--%>
<%--															<td>Cổng kết nối</td>--%>
<%--															<td>2 x Thunderbolt 3, Jack tai nghe 3.5 mm</td>--%>
<%--														</tr>--%>
<%--														<tr>--%>
<%--															<td>Trọng lượng</td>--%>
<%--															<td>1.4kg</td>--%>
<%--														</tr>--%>
<%--														<tr>--%>
<%--															<td>Pin</td>--%>
<%--															<td>khoảng 10 tiếng</td>--%>
<%--														</tr>--%>
<%--														<tr>--%>
<%--															<td>Hệ điều hành</td>--%>
<%--															<td>Mac OS</td>--%>
<%--														</tr>--%>
<%--														<tr>--%>
<%--															<td>Kích thước</td>--%>
<%--															<td>30.41(L) x 21.24(W) x 1.56(H) cm</td>--%>
<%--														</tr>--%>
<%--													</table>--%>
<%--												</div>--%>
<%--											</div>--%>
<%--										</div>--%>
<%--										<!-- /tab2  -->--%>

										<!-- tab3  -->
										<div id="tab3" class="tab-pane fade in">
											<div class="row">
												<!-- Rating -->
												<div class="col-md-3">
													<div id="rating">
														<div class="rating-avg">
															<span>4.5</span>
															<div class="rating-stars">
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star"></i>
																<i class="fa fa-star-o"></i>
															</div>
														</div>
														<ul class="rating">
															<li>
																<div class="rating-stars">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																</div>
																<div class="rating-progress">
																	<div style="width: 80%;"></div>
																</div>
																<span class="sum">3</span>
															</li>
															<li>
																<div class="rating-stars">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star-o"></i>
																</div>
																<div class="rating-progress">
																	<div style="width: 60%;"></div>
																</div>
																<span class="sum">2</span>
															</li>
															<li>
																<div class="rating-stars">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star-o"></i>
																	<i class="fa fa-star-o"></i>
																</div>
																<div class="rating-progress">
																	<div></div>
																</div>
																<span class="sum">0</span>
															</li>
															<li>
																<div class="rating-stars">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star-o"></i>
																	<i class="fa fa-star-o"></i>
																	<i class="fa fa-star-o"></i>
																</div>
																<div class="rating-progress">
																	<div></div>
																</div>
																<span class="sum">0</span>
															</li>
															<li>
																<div class="rating-stars">
																	<i class="fa fa-star"></i>
																	<i class="fa fa-star-o"></i>
																	<i class="fa fa-star-o"></i>
																	<i class="fa fa-star-o"></i>
																	<i class="fa fa-star-o"></i>
																</div>
																<div class="rating-progress">
																	<div></div>
																</div>
																<span class="sum">0</span>
															</li>
														</ul>
													</div>
												</div>
												<!-- /Rating -->

												<!-- Reviews -->
												<div class="col-md-6">
													<div id="reviews">
														<ul class="reviews">
															<li>
																<div class="review-heading">
																	<h5 class="name">Minh</h5>
																	<p class="date">9 giờ trước</p>
																	<div class="review-rating">
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																	</div>
																</div>
																<div class="review-body">
																	<p>Tuyệt vời</p>
																</div>
															</li>
															<li>
																<div class="review-heading">
																	<h5 class="name">Hải</h5>
																	<p class="date">3 ngày trước</p>
																	<div class="review-rating">
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star-o empty"></i>
																	</div>
																</div>
																<div class="review-body">
																	<p>Dùng ok trong tầm giá</p>
																</div>
															</li>
															<li>
																<div class="review-heading">
																	<h5 class="name">Long</h5>
																	<p class="date">1 tuần trước</p>
																	<div class="review-rating">
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star"></i>
																		<i class="fa fa-star-o empty"></i>
																	</div>
																</div>
																<div class="review-body">
																	<p>Máy đẹp, phù hợp cho các tác vụ nặng</p>
																</div>
															</li>
														</ul>
														<ul class="reviews-pagination">
															<li class="active">1</li>
															<li><a href="#">2</a></li>
															<li><a href="#">3</a></li>
															<li><a href="#">4</a></li>
															<li><a href="#"><i class="fa fa-angle-right"></i></a></li>
														</ul>
													</div>
												</div>
												<!-- /Reviews -->

												<!-- Review Form -->
												<div class="col-md-3">
													<div id="review-form">
														<form class="review-form">
															<input class="input" type="text" placeholder="Nhập họ tên của bạn">
															<input class="input" type="email" placeholder="Nhập email của bạn">
															<textarea class="input" placeholder="Nhập nội dung đánh giá của bạn về sản phẩm này"></textarea>
															<div class="input-rating">
																<span>Đánh giá của bạn về sản phẩm: </span>
																<div class="stars">
																	<input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
																	<input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
																	<input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
																	<input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
																	<input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
																</div>
															</div>
															<button class="primary-btn">Gửi đánh giá</button>
														</form>
													</div>
												</div>
												<!-- /Review Form -->
											</div>
										</div>
										<!-- /tab3  -->
									</div>
									<!-- /product tab content  -->
								</div>
							</div>
							<!-- /product tab -->
						</div>
						<!-- /row -->
					</div>
					<!-- /container -->
				</div>
				<!-- /SECTION -->

				<!-- Section -->
				<div class="section">
					<!-- container -->
					<div class="container">
						<!-- row -->
						<div class="row">

							<div class="col-md-12">
								<div class="section-title text-center">
									<h3 class="title">SẢN PHẨM LIÊN QUAN</h3>
								</div>
							</div>
							<%
								List<Product> list = (List<Product>) request.getAttribute("list");
								for (Product a : list) {
							%>

							<!-- product -->
							<div class="col-md-4 col-xs-6">
								<div class="product">
									<div class="product-img">
										<img src="<%=a.getImage()%>" alt="">
										<div class="product-label">
											<!-- <span class="sale">-30%</span> -->
											<% check = a.getDiscount()!=0 ? true :false;
												if(check==true){%>
											<span class="sale">-<%=(int)((1.0-(double)a.getDiscount()/(double)a.getPrice())*100)%>%</span>
											<%}%>
											<span class="new">NEW</span>

										</div>
									</div>
									<div class="product-body">
										<p class="product-category"><%=a.getBrand()%>
										</p>
										<h3 class="product-name"><a href="detail?pid=<%=a.getProductID()%>"><%=a.getName()%>
										</a></h3>

										<% if(check==true){%>
										<h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(a.getDiscount())%></h4>
										<del class="product-old-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(a.getPrice())%></del>
										<%} else {%>
										<h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(a.getPrice())%></h4>
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
										<button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
									</div>
								</div>
							</div>
							<!-- /product -->
							<div class="clearfix visible-sm visible-xs"></div>
							<%}%>


						</div>
						<!-- /row -->
					</div>
					<!-- /container -->
				</div>
				<!-- /Section -->

			<jsp:include page="footer.jsp"/>

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
