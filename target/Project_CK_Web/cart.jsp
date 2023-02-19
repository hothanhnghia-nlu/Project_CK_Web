<%@ page import="vn.edu.hcmuaf.fit.bean.Cart" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="java.util.Collection" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Giỏ Hàng</title>

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
    <script>
        $(document).ready(function () {

            $('#example').dataTable({}); // dòng này để nhúng bảng biểu thành dạng bảng được phân trang

        });
    </script>
</head>
<body>
<!-- HEADER -->
<jsp:include page="header.jsp"/>
<!-- /HEADER -->

<% Cart c = Cart.getCart(session);
    Collection<Product> list = c.getListProduct();
    request.setAttribute("list", list);
    double total = c.getTotalMoney();
    boolean checkList = list.isEmpty();
    request.setAttribute("check", checkList);
    request.setAttribute("total", total);

%>
<!-- BREADCRUMB -->
<div id="breadcrumb" class="section">
    <!-- container -->
    <div class="container">
        <!-- row -->
        <div class="row">
            <div class="col-md-12">
                <ul class="breadcrumb-tree">
                    <li><a href="home">Trang Chủ</a></li>
                    <li class="active">Giỏ Hàng</li>
                </ul>
            </div>
        </div>
        <!-- /row -->
    </div>
    <!-- /container -->
</div>
<!-- /BREADCRUMB -->

<!-- SECTION -->
<c:if test="${check}">
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12">
                    <div class="load_image text-center">
                        <img src="assets/img/bag.png" alt="">
                    </div>
                    <div class="back_home text-center">
                        <h4>Không có sản phẩm nào trong giỏ hàng</h4>
                        <a href="home" class="primary-btn" style="font-weight: normal">TIẾP TỤC MUA SẮM</a>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
</c:if>

<c:if test="${!check}">
    <div class="section">
        <div class="shopping-cart section">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- Shopping Summery -->
                        <table class="table shopping-summery">
                            <thead>
                            <tr class="main-hading">
                                <th>SẢN PHẨM</th>
                                <th>TÊN SẢN PHẨM</th>
                                <th class="text-center">GIÁ</th>
                                <th class="text-center">SỐ LƯỢNG</th>
                                <th class="text-center">TỔNG</th>
                                <th class="text-center">XÓA</th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${list}" var="p">
                                <tr>
                                    <td><img src="${p.image}" alt=""></td>
                                    <td class="product-des" data-title="Description">
                                        <p class="product-des">

                                            <a href="detail?pid=${p.productID}"><strong>${p.name}</strong></a>
                                        </p>
                                    </td>
                                    <c:if test="${p.discount == 0}">
                                    <td class="price" data-title="Price"><span><fmt:formatNumber value="${p.price}" type="currency"/> </span></td>
                                    </c:if>
                                    <c:if test="${p.discount != 0}">
                                        <td class="price" data-title="Price"><span><fmt:formatNumber value="${p.discount}" type="currency"/> </span></td>
                                    </c:if>
                                    <td class="qty" data-title="Qty">
                                        <!-- Input Order -->
                                        <div class="input-group" style="margin-right:-76px">
                                            <div class="button minus" >
                                                <button class="btn btn-primary btn-number qty-down"
                                                        data-type="minus"
                                                         style="outline: none" onclick="handleMinus()">
                                                    <i class="fa fa-minus"></i>
                                                </button>
                                            </div>
                                            <input type="text" id="amount" name="quant[1]" class="input-number" data-min="1"
                                                   data-max="100" value="${p.quantity}" style="outline: none">
                                            <div class="button plus">
                                                <button class="btn btn-primary btn-number qty-up"
                                                        data-type="plus"
                                                          style="outline: none" onclick="handlePlus()">
                                                    <i class="fa fa-plus"></i>
                                                </button>
                                            </div>
                                        </div>
                                        <!--/ End Input Order -->
                                    </td>
                                    <c:if test="${p.discount == 0}">
                                        <td class="total-amount" data-title="Total"><span><fmt:formatNumber
                                                value="${p.price*p.quantity}" type="currency"/></span></td>
                                    </c:if>
                                    <c:if test="${p.discount != 0}">
                                        <td class="total-amount" data-title="Total"><span><fmt:formatNumber
                                                value="${p.discount*p.quantity}" type="currency"/></span></td>
                                    </c:if>

                                    <td class="action" data-title="Remove"><a href="remove?pid=${p.productID}"><i
                                            class="fa fa-trash"></i></a></td>
                                </tr>

                            </c:forEach>
                            </tbody>
                        </table>
                        <!--/ End Shopping Summery -->
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <!-- Total Amount -->
                        <div class="total-amount">
                            <div class="row">
                                <div class="col-lg-8 col-md-5 col-12">
                                    <div class="left">
                                        <div class="coupon">
                                            <form action="#" target="_blank">
                                                <input name="Coupon" placeholder="Nhâp mã giảm giá">
                                                <button class="btn">Áp dụng</button>
                                            </form>
                                        </div>

                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-7 col-12">
                                    <div class="right">
                                        <ul>
                                            <c:if test="${check}">
                                                <li><strong>Tổng tạm tính</strong><span><fmt:formatNumber value="0"
                                                                                                          type="currency"/></span>
                                                </li>
                                            </c:if>
                                            <c:if test="${!check}">
                                                <li><strong>Tổng tạm tính</strong><span><fmt:formatNumber
                                                        value="${total}"
                                                        type="currency"/></span>
                                                </li>
                                            </c:if>
                                            <li><strong>Phí vận chuyển</strong><span>0đ</span></li>
                                            <c:if test="${check}">
                                                <li class="last"><strong>Thành tiền</strong><span
                                                        class="total"><strong>0</strong></span></li>
                                            </c:if>
                                            <c:if test="${!check}">
                                                <li class="last"><strong>Thành tiền</strong><span
                                                        class="total"><strong><fmt:formatNumber value="${total}"
                                                                                                type="currency"/></strong></span>
                                                </li>
                                            </c:if>
                                        </ul>
                                        <div class="button5">
                                            <a href="checkout.jsp" class="btn">Thanh toán</a>
                                            <a href="home" class="btn">Tiếp tục mua sắm</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--/ End Total Amount -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>
<!-- /SECTION -->


<!-- FOOTER -->
<jsp:include page="footer.jsp"/>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="../../js/jquery.min.js"></script>
<script src="../../js/bootstrap.min.js"></script>
<script src="../../js/slick.min.js"></script>
<script src="../../js/nouislider.min.js"></script>
<script src="../../js/jquery.zoom.min.js"></script>
<script src="../../js/main.js"></script>
<!-- Nice Select JS -->
<script src="../../js/nicesellect.js"></script>
<script src="assets/js/minPlus.js"></script>
</body>
</html>
