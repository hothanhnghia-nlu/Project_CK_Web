<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Category" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Brand" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
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
                            <% List<Category> listCate = (List<Category>) request.getAttribute("listCate");
                                for (Category p : listCate) {%>
                            <div class="input-checkbox">
                                <input type="checkbox" id="category-<%=p.getCategoryID()%>" name="cateID"
                                       value="<%=p.getCategoryID()%>">
                                <label for="category-<%=p.getCategoryID()%>">
                                    <span></span>
                                    <%=p.getName()%>
                                    <%--												<small>(120)</small>--%>
                                </label>
                            </div>
                            <%}%>
                            <input type="submit" value="Submit" href="/Category/cateID=dasda">
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Hãng sản xuất</h3>
                        <div class="checkbox-filter">
                            <%
                                List<Brand> lists = (List<Brand>) request.getAttribute("listBrand");
                                for (Brand p : lists) {
                            %>
                            <div class="input-checkbox">
                                <input type="checkbox" id="brand-<%=p.getBrand()%>">
                                <label for="brand-<%=p.getBrand()%>">
                                    <span></span>
                                    <%=p.getBrand()%>
                                    <%--												<small>(578)</small>--%>
                                </label>
                            </div>
                            <%}%>
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
                        <h3 class="aside-title">Mới nhất</h3>
                        <%
                            List<Product> listNew = (List<Product>) request.getAttribute("listNew");
                            for (Product p : listNew) {
                        %>
                        <div class="product-widget">
                            <div class="product-img">
                                <img src="<%=p.getImage()%>" alt="">
                            </div>
                            <div class="product-body">
                                <p class="product-category"><%=p.getBrand()%>
                                </p>
                                <h3 class="product-name"><a href="#"><%=p.getName()%>
                                </a></h3>
                                <h4 class="product-price"><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getPrice())%></h4>
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
                    <div class="row">
                       <%List<Product> list = (List<Product>) request.getAttribute("list");
                            for (Product p : list) {
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
                                    <button class="add-to-cart-btn">Thêm vào giỏ hàng</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                        <div class="clearfix visible-sm visible-xs"></div>
                        <%}%>


                    </div>
                    <!-- /store products -->

                    <!-- store bottom filter -->
                    <!-- <div class="store-filter clearfix">
                        <span class="store-qty">Showing 20-100 products</span>
                        <ul class="store-pagination">
                            <li class="active">1</li>
                            <li><a href="#">2</a></li>
                            <li><a href="#">3</a></li>
                            <li><a href="#">4</a></li>
                            <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                        </ul>
                    </div> -->
                    <!-- /store bottom filter -->
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
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/slick.min.js"></script>
    <script src="assets/js/nouislider.min.js"></script>
    <script src="assets/js/jquery.zoom.min.js"></script>
    <script src="assets/js/main.js"></script>
    <script src="assets/js/backtop.js"></script>
</body>
</html>
