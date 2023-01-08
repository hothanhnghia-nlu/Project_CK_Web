<%@ page import="vn.edu.hcmuaf.fit.bean.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="java.util.Collection" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cart" value="sessionScope.cart"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Thanh toán đơn hàng</title>

	<!-- Google font -->
	<link rel="stylesheet" href="assets/fonts/css/all.css">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="assets/css/bootstrap.min.css"/>

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

<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
	<% Cart c = Cart.getCart(session);
		Collection<Product> list = c.getListProduct();
		request.setAttribute("list", list);
		double total = c.getTotalMoney();
		boolean checkList = list.isEmpty();
		request.setAttribute("check", checkList);
		request.setAttribute("total", total);

	%>
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb-tree">
					<li><a href="cart.jsp">Giỏ hàng</a></li>
					<li class="active">Thông tin giao hàng</li>
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
			<form id="frm" action="checkout" method="post">
				<!-- Billing Details -->
				<div class="col-md-7 billing-details">
					<div class="section-title">
						<h3 class="title">THÔNG TIN GIAO HÀNG</h3>
					</div>
					<c:if test="${sessionScope.auth == null}">

						<div class="section-title">
							<p style="margin-top: -15px">Bạn đã có tài khoản? <a href="login.jsp">Đăng nhập</a></p>
						</div>
						<div class="form-group">
							<label>Họ và tên<span><strong class="compulsory"> *</strong></span></label>
							<input class="input" type="text" name="name" placeholder="Họ và tên">
						</div>
						<div class="form-group">
							<label>Email<span><strong class="compulsory"> *</strong></span></label>
							<input class="input" type="email" name="email" placeholder="Email">
						</div>
						<div class="form-group">
							<label>Số điện thoại<span><strong class="compulsory"> *</strong></span></label>
							<input class="input" type="tel" name="phone" placeholder="Số điện thoại">
						</div>
					</c:if>

					<c:if test="${sessionScope.auth != null}">
						<div class="form-group">
							<label>Họ và tên<span><strong class="compulsory"> *</strong></span></label>
							<input class="input" type="text" name="name" value="${sessionScope.auth.fullName}">
						</div>
						<div class="form-group">
							<label>Email<span><strong class="compulsory"> *</strong></span></label>
							<input class="input" type="email" name="email" value="${sessionScope.auth.email}">
						</div>
						<div class="form-group">
							<label>Số điện thoại<span><strong class="compulsory"> *</strong></span></label>
							<input class="input" type="tel" name="phone" value="${sessionScope.auth.phoneNumber}">
						</div>
					</c:if>

					<div class="form-group">
						<label>Địa chỉ<span><strong class="compulsory"> *</strong></span></label>
						<input class="input" type="text" name="address" placeholder="Số nhà, phường/xã, quận/huyện, tỉnh/thành phố">
					</div>
					<!-- Order notes -->
					<div class="form-group">
						<label>Ghi chú</label>
						<textarea class="input" name="note" placeholder="Ghi chú (không bắt buộc)"></textarea>
					</div>
					<!-- /Order notes -->
					<div class="payments">
						<div><strong>HÌNH THỨC THANH TOÁN</strong></div><br>
						<div class="row">
							<div class="col-xs-12 select">
								<input name="collapseGroup" id="cod" type="radio" data-target="#collapseOne" value="COD">
								<label for="cod" style="font-weight: normal">Thanh toán khi nhận hàng (COD)</label><br>
								<input name="collapseGroup" id="card" type="radio" data-toggle="collapse" data-target="#collapseOne" value="CARD">
								<label for="card" style="font-weight: normal">Thanh toán qua thẻ tín dụng (Card)</label>
								<div class="panel-group" id="accordion">
									<div class="panel panel-default">
										<div id="collapseOne" class="panel-collapse collapse">
											<ul class="footer-payments text-center">
												<li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
												<li><a href="#"><i class="fa fa-credit-card"></i></a></li>
												<li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
												<li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="input-checkbox">
						<input type="checkbox" id="terms">
						<label for="terms">
							<span></span>
							Tôi đã đọc và chấp nhận các <a href="#">điều khoản</a>
						</label>
					</div>
					<input type="submit" class="primary-btn order-submit" value="XÁC NHẬN ĐẶT HÀNG" style="margin-left: 180px; margin-top: 10px">
				</div>
				<!-- /Billing Details -->

				<!-- Order Details -->
				<div class="col-md-5 order-details" style="background: #fafafa">
					<div class="section-title text-center">
						<h3 class="title">ĐƠN HÀNG CỦA BẠN</h3>
					</div>
					<div class="order-summary">
						<div class="order-col">
							<div><strong>SẢN PHẨM</strong></div>
							<div><strong>ĐƠN GIÁ</strong></div>
						</div>
						<div class="order-products">
							<c:forEach items="${list}" var="p">
								<div class="order-col">
									<div>${p.name}</div>
									<c:if test="${p.discount == 0}">
										<div><fmt:formatNumber value="${p.price}" type="currency"/></div>
									</c:if>
									<c:if test="${p.discount != 0}">
										<div><fmt:formatNumber value="${p.discount}" type="currency"/></div>
									</c:if>

								</div>
							</c:forEach>
						</div>
						<div class="order-col" style="border-top: 1px solid #cccccc; margin-top: 10px">
							<div>Tạm tính</div>
							<c:if test="${check}">
								<div><fmt:formatNumber value="0" type="currency"/></div>
							</c:if>
							<c:if test="${!check}">
								<div><span><fmt:formatNumber value="${total}" type="currency"/> </span></div>

							</c:if>

						</div>
						<div class="order-col">
							<div>Giảm giá</div>
							<div>${price}đ</div>
						</div>
						<div class="order-col">
							<div>Phí vận chuyển</div>
							<div><strong>Miễn phí</strong></div>
						</div>
						<div class="order-col" style="border-top: 1px solid #cccccc; margin-top: 10px">
							<div><strong>TỔNG CỘNG</strong></div>
							<c:if test="${check}">
								<div><strong class="order-total"><fmt:formatNumber value="0" type="currency"/></strong></div>
							</c:if>
							<c:if test="${!check}">
								<div><strong class="order-total"><fmt:formatNumber value="${total}" type="currency"/></strong></div>

							</c:if>

						</div>
					</div>
				</div>
				<!-- /Order Details -->
			</form>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->
</div>
<!-- /SECTION -->

<!-- FOOTER -->
<jsp:include page="footer.jsp"/>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="assets/js/jquery-3.6.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/slick.min.js"></script>
<script src="assets/js/nouislider.min.js"></script>
<script src="assets/js/jquery.zoom.min.js"></script>
<script src="assets/js/main.js"></script>
<script src="assets/js/validation.js"></script>

</body>
</html>
