<%@ page import="vn.edu.hcmuaf.fit.bean.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="java.util.Collection" %>
<%@ page import="java.text.DecimalFormat" %>
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
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/laptop-icon.png" />

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
		DecimalFormat formatter = new DecimalFormat("###,###,###");
	%>
	<!-- container -->
	<div class="container">
		<!-- row -->
		<div class="row">
			<div class="col-md-12">
				<ul class="breadcrumb-tree">
					<li><a href="shopping-cart">Giỏ hàng</a></li>
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
					<c:if test="${sessionScope.auth == null && sessionScope.oAuth == null}">

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

					<c:if test="${sessionScope.oAuth != null}">
						<div class="form-group">
							<label>Họ và tên<span><strong class="compulsory"> *</strong></span></label>
							<input class="input" type="text" name="name" value="${sessionScope.oAuth.name}">
						</div>
						<div class="form-group">
							<label>Email<span><strong class="compulsory"> *</strong></span></label>
							<input class="input" type="email" name="email" value="${sessionScope.oAuth.email}">
						</div>
						<div class="form-group">
							<label>Số điện thoại<span><strong class="compulsory"> *</strong></span></label>
							<input class="input" type="tel" name="phone" value="" placeholder="Số điện thoại">
						</div>
					</c:if>

					<div class="form-group">
						<label>Địa chỉ giao hàng<span><strong class="compulsory"> *</strong></span></label>
						<input class="input" type="text" name="address" placeholder="Số nhà, phường/xã, quận/huyện, tỉnh/thành phố">
					</div>
					<!-- Order notes -->
					<div class="form-group">
						<label>Ghi chú</label>
						<textarea class="input" name="note" placeholder="Ghi chú (không bắt buộc)"></textarea>
					</div>
					<!-- /Order notes -->
					<div class="payments">
						<label><strong>PHƯƠNG THỨC THANH TOÁN</strong></label><br>
						<div class="row">
							<div class="col-xs-12 select">
								<form class="bs-example" action="">
									<div class="panel-group" id="accordion">
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class="panel-title">
													<label for='r11' style='width: 350px;'>
														<input type='radio' id='r11' name='payment' value='Tiền mặt'> Thanh toán khi giao hàng (COD)
														<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"></a>
													</label>
												</h4>
											</div>
											<div id="collapseOne" class="panel-collapse collapse">
												<div class="panel-body">
													<p style="text-align: center; color: #333333">COD - giao hàng & thu tiền tận nơi thông qua đơn vị vận chuyển.</p>
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading">
												<h4 class=panel-title>
													<label for='r12' style='width: 350px;'>
														<input type='radio' id='r12' name='payment' value='Chuyển khoản'> Chuyển khoản qua ngân hàng
														<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"></a>
													</label>
												</h4>
											</div>
											<div id="collapseTwo" class="panel-collapse collapse">
												<div class="panel-body">
													<p style="text-align: center; color: #333333">Tài Khoản Ngân Hàng:<br/>

													</p>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>

					<input type="submit" class="primary-btn order-submit" value="XÁC NHẬN ĐẶT HÀNG" style="margin-left: 180px; margin-top: 10px">
				</div>
				<!-- /Billing Details -->

				<!-- Order Details -->
				<div class="col-md-4 order-details" style="background: #fafafa; margin-left: 10px">
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
									<div>${p.quantity} x ${p.name}</div>
									<div><fmt:formatNumber value="${p.out_price * p.quantity}" type="currency"/></div>
								</div>
							</c:forEach>
						</div>
						<div class="order-col" style="border-top: 1px solid #cccccc; margin-top: 10px">
							<div>Tạm tính</div>
							<c:if test="${check}">
								<div><%= formatter.format(0)+" đ" %></div>
							</c:if>
							<c:if test="${!check}">
								<div><span><%= formatter.format(total)+" đ" %></span></div>
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
								<div><strong class="order-total"><%= formatter.format(0)+" VNĐ" %></strong></div>
							</c:if>
							<c:if test="${!check}">
								<div><strong class="order-total"><%= formatter.format(total)+" VNĐ" %></strong></div>
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
