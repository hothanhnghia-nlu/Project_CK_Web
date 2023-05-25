<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-md-3 left_col">
    <div class="left_col scroll-view">
        <div class="navbar nav_title" style="border: 0;">
            <a href="" class="site_title"><i class="fa fa-laptop"></i> <span>LaptopVN</span></a>
        </div>

        <div class="clearfix"></div>

        <!-- menu profile quick info -->
        <div class="profile clearfix">
            <div class="profile_pic">
                <img src="../assets/img/avatar.png" alt="..." class="img-circle profile_img">
            </div>
            <div class="profile_info">
                <span>Xin chào,</span>
                <h2>${sessionScope.auth.fullName}</h2>
            </div>
        </div>
        <!-- /menu profile quick info -->

        <br/>

        <!-- sidebar menu -->
        <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
            <div class="menu_section">
                <ul class="nav side-menu">
                    <c:if test="${sessionScope.auth.role > 1}">
                        <li><a href="statistic"><i class="fa fa-bar-chart"></i> Thống kê</a></li>
                    </c:if>
                    <c:if test="${sessionScope.auth.role == 3}">
                        <li><a href="accounts"><i class="fa fa-user"></i> Quản lý tài khoản</a></li>
                    </c:if>
                    <c:if test="${sessionScope.auth.role > 1}">
                        <li><a href="customers"><i class="fa fa-users"></i> Quản lý khách hàng</a></li>
                    </c:if>
                    <c:if test="${sessionScope.auth.role > 0}">
                        <li><a> <i class="fa fa-list"></i> Quản lý sản phẩm <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="product-list"><i class="fa fa-table"></i> Quản lý sản phẩm</a></li>
                                <li><a href="product-bin"><i class="fa fa-trash"></i> Thùng rác</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.auth.role > 1}">
                        <li><a><i class="fa fa-comment"></i> Quản lý bình luận <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="comment"><i class="fa fa-list"></i> Đánh giá sản phẩm</a></li>
                                <li><a href="contacts"><i class="fa fa-compress"></i> Liên hệ</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.auth.role > 0}">
                        <li><a><i class="fa fa-cart-shopping"></i> Quản lý đơn hàng <span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                                <li><a href="order-list"><i class="fa fa-list-alt"></i> Danh sách đơn hàng</a></li>
                                <li><a href="check-order"><i class="fa fa-check-circle"></i> Duyệt đơn hàng</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${sessionScope.auth.role == 3}">
                        <li><a href="logs"><i class="fa fa-history"></i> Quản lý nhật ký</a></li>
                    </c:if>
                    <li> <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out"></i> Đăng xuất</a></li>
                </ul>
            </div>
        </div>
        <!-- /sidebar menu -->
    </div>
</div>

<!-- top navigation -->
<div class="top_nav">
    <div class="nav_menu">
        <div class="nav toggle">
            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
        </div>
        <nav class="nav navbar-nav">
            <ul class=" navbar-right">
                <li class="nav-item dropdown open" style="padding-left: 15px;">
                    <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown"
                       data-toggle="dropdown" aria-expanded="false">
                        <img src="../assets/img/avatar.png" alt="">${sessionScope.auth.fullName}
                    </a>
                    <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                        <c:if test="${sessionScope.auth.role == 1 || sessionScope.auth.role == 2}">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/home"><i class="fa fa-home"></i> Trang mua hàng</a>
                            <a class="dropdown-item" href="profile"><i class="fa fa-user"></i> Trang cá nhân</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out"></i> Đăng xuất</a>
                        </c:if>
                        <c:if test="${sessionScope.auth.role == 3}">
                            <a class="dropdown-item" href="profile"><i class="fa fa-user"></i> Trang cá nhân</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out"></i> Đăng xuất</a>
                        </c:if>
                    </div>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- /top navigation -->