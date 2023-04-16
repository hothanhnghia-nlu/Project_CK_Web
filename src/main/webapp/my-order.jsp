<%@ page import="vn.edu.hcmuaf.fit.bean.Order" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.OrderDetail" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Đơn hàng của tôi</title>

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
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="home">Trang chủ</a></li>
                    <li class="active">Đơn hàng của tôi</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<section id="contact-us" class="contact-us section">
    <div class="container">
        <div class="contact-head">
            <div class="row">
                <!-- row -->
                <div id="my-order">
                    <div class="col-lg-4 col-12">
                        <div class="single-head">
                            <div class="single-info" style="display: flex">
                                <i class="fa fa-user" style="float: left; background: none; color: black"></i>
                                <a href="my-profile" class="link-dark" style="float: right; margin: 10px 0 10px 0">Thông tin cá nhân</a>
                            </div>
                            <div class="single-info" style="display: flex">
                                <i class="fa fa-file-invoice-dollar active" style="float: left; background: none; color: black"></i>
                                <a href="update-order" class="link-dark active" style="float: right; margin: 10px 0 10px 0">Đơn hàng của tôi</a>
                            </div>
                            <div class="single-info" style="display: flex">
                                <i class="fa fa-file-invoice-dollar" style="float: left; background: none; color: black"></i>
                                <a href="change-password" style="float: right; margin: 10px 0 10px 0">Đổi mật khẩu</a>
                            </div>
                            <div class="single-info" style="display: flex">
                                <i class="fa fa-sign-out" style="float: left; background: none; color: black"></i>
                                <a href="logout" style="float: right; margin: 10px 0 10px 0">Đăng xuất</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-12">
                        <h3>Đơn hàng của tôi</h3>
                        <ul class="nav nav-tabs navbar-default">
                            <li class="active"><a data-toggle="tab" href="#all-order">Tất cả đơn</a></li>
                            <li><a data-toggle="tab" href="#waiting">Đang xử lý</a></li>
                            <li><a data-toggle="tab" href="#transforming">Đang vận chuyển</a></li>
                            <li><a data-toggle="tab" href="#deliveried">Đã giao</a></li>
                            <li><a data-toggle="tab" href="#canceled">Đã hủy</a></li>
                        </ul>

                        <div class="tab-content">
                            <%
                                List<Order> orderList = (List<Order>) request.getAttribute("orderList");
                                List<OrderDetail> odList = (List<OrderDetail>) request.getAttribute("orderDetailList");
                                for (Order o : orderList) {
                                    for (OrderDetail od : odList) {
                            %>
                            <div id="all-order" class="tab-pane fade in active">
                                <div class="order-list">
                                    <div class="orders">
                                        <div class="delivery-success">
                                            <label>
                                                <c:if test="<%=o.getStatus() == 0 %>">
                                                    <i class="fa fa-truck"></i>
                                                    Đang xử lý
                                                </c:if>
                                                <c:if test="<%=o.getStatus() == 1 %>">
                                                    <i class="fa fa-truck"></i>
                                                    Đang vận chuyển
                                                </c:if>
                                                <c:if test="<%=o.getStatus() == 2 %>">
                                                    <i class="fa fa-truck"></i>
                                                    Giao hàng thành công
                                                </c:if>
                                                <c:if test="<%=o.getStatus() == 3 %>">
                                                    <i class="fa fa-truck"></i>
                                                    Đã hủy
                                                </c:if>
                                            </label>
                                        </div>

                                        <div class="detail">
                                            <div class="product-info">
                                                <img src="assets/img/dell.png"/>
                                                <div class="product-name">
                                                    <p><%=od.getName()%></p>
                                                    <span>Số lượng: <%=od.getQuantity()%></span>
                                                </div>
                                                <div class="product-price">
                                                    <span><span><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(od.getPrice())%></span>
                                                </div>
                                            </div>

                                            <div class="total">
                                                <label>Tổng tiền: <span><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(od.getTotal())%></span></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}
                            }%>

                        </div>

                    </div>
                </div>
                <!-- /row -->
            </div>
        </div>
    </div>
    <!-- /container -->
</section>
<!-- /SECTION -->

<!-- FOOTER -->
<jsp:include page="footer.jsp"/>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="assets/js/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script src="assets/js/slick.min.js"></script>
<script src="assets/js/nouislider.min.js"></script>
<script src="assets/js/jquery.zoom.min.js"></script>
<script src="assets/js/main.js"></script>

</body>
</html>