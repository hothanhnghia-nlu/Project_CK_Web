<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Brand" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Vendor" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Danh sách sản phẩm</title>

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

    <!-- SECTION -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- ASIDE -->
                <div id="aside" class="col-md-3">
                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Danh mục</h3>
                        <div class="checkbox-filter">
                            <div class="input-checkbox">
                                <a href="list-product?idCat=GM010">
                                    <input type="checkbox" id="category-1">
                                    <label for="category-1">
                                        <span></span>
                                        Laptop Gaming
                                    </label>
                                </a>
                            </div>

                            <div class="input-checkbox">
                                <a href="list-product?idCat=DH011">
                                    <input type="checkbox" id="category-2">
                                    <label for="category-2">
                                        <span></span>
                                        Laptop Đồ Họa
                                    </label>
                                </a>
                            </div>

                            <div class="input-checkbox">
                                <a href="list-product?idCat=VP012">
                                    <input type="checkbox" id="category-3">
                                    <label for="category-3">
                                        <span></span>
                                        Laptop Văn Phòng
                                    </label>
                                </a>
                            </div>

                            <div class="input-checkbox">
                                <a href="list-product?idCat=MB013">
                                    <input type="checkbox" id="category-4">
                                    <label for="category-4">
                                        <span></span>
                                        Macbook
                                    </label>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Hãng sản xuất</h3>
                        <div class="checkbox-filter">
                            <div class="input-checkbox">
                                <a href="list-product?idVendor=001">
                                    <input type="checkbox" id="brand-1">
                                    <label for="brand-1">
                                        <span></span>
                                        Dell
                                    </label>
                                </a>
                            </div>

                            <div class="input-checkbox">
                                <a href="list-product?idVendor=005">
                                    <input type="checkbox" id="brand-2">
                                    <label for="brand-2">
                                        <span></span>
                                        Asus
                                    </label>
                                </a>
                            </div>

                            <div class="input-checkbox">
                                <a href="list-product?idVendor=006">
                                    <input type="checkbox" id="brand-3">
                                    <label for="brand-3">
                                        <span></span>
                                        Acer
                                    </label>
                                </a>
                            </div>

                            <div class="input-checkbox">
                                <a href="list-product?idVendor=003">
                                    <input type="checkbox" id="brand-4">
                                    <label for="brand-4">
                                        <span></span>
                                        Lenovo
                                    </label>
                                </a>
                            </div>

                            <div class="input-checkbox">
                                <a href="list-product?idVendor=004">
                                    <input type="checkbox" id="brand-5">
                                    <label for="brand-5">
                                        <span></span>
                                        HP
                                    </label>
                                </a>
                            </div>

                            <div class="input-checkbox">
                                <a href="list-product?idVendor=007">
                                    <input type="checkbox" id="brand-6">
                                    <label for="brand-6">
                                        <span></span>
                                        Apple
                                    </label>
                                </a>
                            </div>

                            <div class="input-checkbox">
                                <a href="list-product?idVendor=002">
                                    <input type="checkbox" id="brand-7">
                                    <label for="brand-7">
                                        <span></span>
                                        MSI
                                    </label>
                                </a>
                            </div>

                            <div class="input-checkbox">
                                <a href="list-product?idVendor=008">
                                    <input type="checkbox" id="brand-8">
                                    <label for="brand-8">
                                        <span></span>
                                        Samsung
                                    </label>
                                </a>
                            </div>
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Mức giá</h3>
                        <div class="price-filter">
                            <div id="price-slider"></div>
                            <div class="input-number price-min">
                                <input id="price-min" type="number">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                            <span>-</span>
                            <div class="input-number price-max">
                                <input id="price-max" type="number">
                                <span class="qty-up">+</span>
                                <span class="qty-down">-</span>
                            </div>
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Bán chạy nhất</h3>
                        <%
                            List<Product> listSeller = (List<Product>) request.getAttribute("listSeller");
                            for (Product p : listSeller) {
                        %>
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<%=p.getImage().get(0)%>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category">
                                    <%=p.getVendor()%>
                                </p>
                                <h3 class="product-name"><a href="#"><%=p.getName()%>
                                </a></h3>
                                <h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getOut_price())%></h4>
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <!-- /aside Widget -->
                </div>
                <!-- /ASIDE -->

                <!-- STORE -->
                <div id="store" class="col-md-9">
                    <!-- store top filter -->
                    <div class="store-filter clearfix">
                        <div class="store-sort">
                            <label>
                                Xếp theo:
                                <select class="input-select">
                                    <option value="0">Giá thấp đến cao</option>
                                    <option value="1">Giá cao xuống thấp</option>
                                </select>
                            </label>
                        </div>
                        <ul class="store-grid">
                            <li class="active"><i class="fa fa-th"></i></li>
                            <li><a href="#"><i class="fa fa-th-list"></i></a></li>
                        </ul>
                    </div>
                    <!-- /store top filter -->

                    <!-- store products -->
                    <div id="pagination" class="row">
                       <%List<Product> list = (List<Product>) request.getAttribute("list");
                            for (Product p : list) {
                        %>

                        <!-- product -->
                        <div class="col-md-4 col-xs-6 contentPage">
                            <div class="product">
                                <div class="product-img">
                                    <img src="<%=p.getImage().get(0)%>" alt="">
                                    <div class="product-label">
                                        <!-- <span class="sale">-30%</span> -->
<%--                                        <% boolean check = p.getDiscount()!=0 ? true :false;--%>
<%--                                        if(check==true){%>--%>
<%--                                            <span class="sale">-<%=(int)((1.0-(double)p.getDiscount()/(double)p.getPrice())*100)%>%</span>--%>
<%--                                        <%}%>--%>
                                        <span class="new">NEW</span>

                                    </div>
                                </div>
                                <div class="product-body">
                                    <p class="product-category">
                                        <%=p.getVendor()%>
                                    </p>
                                    <h3 class="product-name"><a href="detail?pid=<%=p.getProductID()%>"><%=p.getName()%>
                                    </a></h3>

<%--                                    <% if(check==true){%>--%>
<%--                                        <h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getDiscount())%></h4>--%>
<%--                                        <del class="product-old-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getPrice())%></del>--%>
<%--                                    <%} else {%>--%>
                                        <h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getOut_price())%></h4>
<%--                                        <br>--%>
<%--                                    <%}%>--%>

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
                    <!-- /store products -->
                </div>
                <!-- /STORE -->
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
    <script src="assets/js/jquery-3.6.1.min.js" ></script>
    <script src="http://1892.yn.lt/blogger/JQuery/Pagging/js/jquery.twbsPagination.js" type="text/javascript"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/nouislider.min.js"></script>
    <script src="assets/js/jquery.zoom.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/backtop.js"></script>
    <script src="assets/js/pagination.js"></script>
</body>
</html>
