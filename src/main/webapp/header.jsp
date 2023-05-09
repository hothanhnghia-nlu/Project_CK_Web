<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cart" value="${sessionScope.cart}"/>
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
                        <a href="home" class="logo">
                            <img src="assets/img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search" style="margin-right: 20px">
                        <form>
                            <input type="text" name="namespace" class="input" placeholder="Nhập tên sản phẩm cần tìm...">
                            <button type="submit" class="search-btn">Tìm kiếm</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- Account -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Account -->
                        <div style="list-style: none; display: flex">
                            <c:if test="${sessionScope.auth == null && sessionScope.oAuth == null}">
                                <a href="log-in">
                                    <i class="fa fa-user"></i>
                                    <span>Đăng nhập</span>
                                </a>
                            </c:if>

                            <!-- Normally login -->
                            <c:if test="${sessionScope.auth != null}">
                                <a href="my-profile" class="dropdown" style="margin-right: 20px">
                                    <i class="fa fa-user" style="margin-left: -30px"></i>
                                    <span style="margin-left: -30px">${sessionScope.auth.fullName}</span>
                                </a>
                            </c:if>

                            <!-- Google login -->
                            <c:if test="${sessionScope.oAuth != null}">
                                <a href="my-profile" class="dropdown" style="margin-right: 20px">
                                    <i class="fa fa-user" style="margin-left: -30px"></i>
                                    <span style="margin-left: -30px">${sessionScope.oAuth.name}</span>
                                </a>
                                <a href="logout">
                                    <i class="fa fa-sign-out"></i>
                                    <span>Đăng xuất</span>
                                </a>
                            </c:if>

                            <!-- Set admin -->
                            <c:if test="${sessionScope.auth.role >= 1}">
                                <a href="admin">
                                    <i class="fa fa-cog"></i>
                                    <span>Admin</span>
                                </a>
                            </c:if>

                            <c:if test="${sessionScope.auth.role < 1}">
                                <a href="logout">
                                    <i class="fa fa-sign-out"></i>
                                    <span>Đăng xuất</span>
                                </a>
                            </c:if>
                        </div>
                        <!-- /Account -->

                        <!-- Cart -->
                        <div>
                            <c:if test="${cart.quantity == null}">
                                <a href="blank-cart">
                                    <i  class="fa fa-shopping-cart"></i>
                                    <span>Giỏ hàng</span>
                                    <div class="qty">0</div>
                                </a>
                            </c:if>

                            <c:if test="${cart.quantity != null}">
                                <a href="shopping-cart">
                                    <i  class="fa fa-shopping-cart"></i>
                                    <span>Giỏ hàng</span>
                                    <c:if test="${cart.quantity != null}">
                                        <div class="qty">${cart.quantity}</div>
                                    </c:if>
                                    <c:if test="${cart.quantity == null}">
                                        <div class="qty">0</div>
                                    </c:if>
                                </a>
                            </c:if>
                        </div>
                        <!-- /Cart -->
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
                <li class="active"><a href="home">Trang chủ</a></li>
                <li><a href="list-product?idCat=GM010">Latop Gaming <i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown">
                        <li><a href="list-product?idCat=GM010&idVendor=002">MSI</a></li>
                        <li><a href="list-product?idCat=GM010&idVendor=001">Dell</a></li>
                        <li><a href="list-product?idCat=GM010&idVendor=003">Lenovo</a></li>
                        <li><a href="list-product?idCat=GM010&idVendor=004">HP</a></li>
                        <li><a href="list-product?idCat=GM010&idVendor=005">Asus</a></li>
                        <li><a href="list-product?idCat=GM010&idVendor=006">Acer</a></li>
                    </ul>
                </li>
                <li><a href="list-product?idCat=DH011">Laptop Đồ Họa <i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown">
                        <li><a href="list-product?idCat=DH011&idVendor=001">Dell</a></li>
                        <li><a href="list-product?idCat=DH011&idVendor=004">HP</a></li>
                    </ul>
                </li>
                <li><a href="list-product?idCat=VP012">Laptop Văn Phòng <i class="fa fa-angle-down"></i></a>
                    <ul class="dropdown">
                        <li><a href="list-product?idCat=VP012&idVendor=002">MSI</a></li>
                        <li><a href="list-product?idCat=VP012&idVendor=001">Dell</a></li>
                        <li><a href="list-product?idCat=VP012&idVendor=003">Lenovo</a></li>
                        <li><a href="list-product?idCat=VP012&idVendor=004">HP</a></li>
                        <li><a href="list-product?idCat=VP012&idVendor=005">Asus</a></li>
                        <li><a href="list-product?idCat=VP012&idVendor=006">Acer</a></li>
                        <li><a href="list-product?idCat=VP012&idVendor=008">Samsung</a></li>
                    </ul>
                </li>
                <li><a href="list-product?idCat=MB013">Macbook <i class="fa fa-angle-down"></i></a>
                </li>

                <li><a href="contact-us">Liên hệ</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->

