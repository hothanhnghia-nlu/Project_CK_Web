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
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/laptop-icon.png"/>

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
<!--    <script src="assets/js/jquery-3.6.1.min.js"></script>-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <![endif]-->
    <%--    <script>--%>

    <%--    $(document).ready(function () {--%>

    <%--            $('#example').dataTable({}); // dòng này để nhúng bảng biểu thành dạng bảng được phân trang--%>

    <%--        });--%>
    <%--    </script>--%>
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
                <form action="update-cart" method="post">
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
                                <tbody class="cart-item">
                                <c:forEach items="${list}" var="p">
                                    <tr>
                                        <td><img src="${p.image.get(0)}" alt=""></td>
                                        <td><p><a href="detail?pid=${p.productID}"><strong>${p.name}</strong></a></p>
                                        </td>


                                        <td style="width: 175px; text-align: center"><fmt:formatNumber
                                                value="${p.out_price}" type="currency"/></td>

                                        <td style="width: 100px;outline: none"><input class="amount" min="1"
                                                                                      type="number"
                                                                                      name="${p.productID}"
                                                                                      value="${p.quantity}"
                                                                                      style="width: 85px;height: 40px;text-align: center">
                                        </td>

                                        <td class="price" data-value="${p.out_price}" style="width: 175px">
                                            <fmt:formatNumber value="${p.out_price * p.quantity}"
                                                              type="currency"/></td>

                                        <td class="action" data-title="Remove"><a href="remove?pid=${p.productID}"><i
                                                class="fa fa-trash"></i></a></td>
                                    </tr>
                                </c:forEach>
                                <tr style="text-align: center">
                                    <td colspan="4" style="font-size: 20px; font-weight: 700"> Tổng tiền:</td>
                                    <c:if test="${check}">
                                        <td colspan="2"><span class="total" style="font-size: 20px; font-weight: 800; font-style: italic;color: #ff0000"><fmt:formatNumber value="0" type="currency"/></span></td>
                                    </c:if>
                                    <c:if test="${!check}">
                                        <td colspan="2"><span class="total" style="font-size: 20px; font-weight: 800; font-style: italic;color: #ff0000"><fmt:formatNumber value="${total}" type="currency"/></span></td>
                                    </c:if>
                                </tr>
                                </tbody>
                            </table>


                            <!--/ End Shopping Summery -->
                        </div>
                    </div>
                    <div class="center-block justify-content-center" style="display: inline-flex;margin-left: 337px">
                        <div>
                            <a href="home" class="btn primary-btn" style="border-radius: 5px">Tiếp tục mua sắm</a>
                            <input type="submit" class=" btn primary-btn" style="border-radius: 5px;outline: none" value="Cập nhật">
                            <a href="checkout.jsp" class="btn primary-btn" style="border-radius: 5px">Thanh toán</a>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
</c:if>
<!-- /SECTION -->


<!-- FOOTER -->
<jsp:include page="footer.jsp"/>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/slick.min.js"></script>
<script src="assets/js/nouislider.min.js"></script>
<script src="assets/js/jquery.zoom.min.js"></script>
<script src="assets/js/main.js"></script>

<!-- Nice Select JS -->z`
<script src="assets/js/nicesellect.js"></script>
</body>
</html>