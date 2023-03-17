<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Hồ sơ của tôi</title>

    <!-- Google font -->
    <link rel="stylesheet" href="assets/fonts/css/all.css">
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/laptop-icon.png" />

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="assets/css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="assets/css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="assets/css/slick-theme.css"/>
    <!-- Themify Icons -->
    <link href="http://yoursite.com/themify-icons.css" rel="stylesheet">
    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="assets/css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="assets/css/style.css"/>
    		<link rel="stylesheet" href="assets/css/style-login-signup.css">


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
                    <li class="active">Thông tin cá nhân</li>
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
                <div class="col-lg-4 col-12">
                    <div class="single-head">
                        <div class="single-info icon-link">
                            <i class="fa fa-user active"></i><a href="my-profile.jsp" class="link-dark active">Thông tin cá nhân</a>
                        </div>
                        <div class="single-info icon-link">
                            <i class="fa fa-file-invoice-dollar"></i><a href="my-order.jsp" class="link-dark">Đơn hàng của tôi</a>
                        </div>
                        <div class="single-info icon-link">
                            <i class="fa fa-sign-out"></i><a href="logout" class="link-dark">Đăng xuất</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-12">
                    <div class="form-main">
                        <div class="title">
                            <h3>THÔNG TIN CÁ NHÂN</h3>
                        </div>
                        <form class="form" method="post">
                            <div class="row">
                                <c:if test="${sessionScope.auth != null}">
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Họ và tên<span>*</span></label>
                                            <input name="name" type="text" placeholder="" value="${sessionScope.auth.fullName}" style="background: #f1f0f1; border-color: #e6e2f5" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Điện thoại<span>*</span></label>
                                            <input name="text" type="text" value="${sessionScope.auth.phoneNumber}" style="background: #f1f0f1; border-color: #e6e2f5" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Email<span>*</span></label>
                                            <input name="email" type="email" value="${sessionScope.auth.email}" style="background: #f1f0f1; border-color: #e6e2f5" disabled required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Ngày sinh<span>*</span></label>
                                            <input name="date" type="text" value="" style="background: #f1f0f1; border-color: #e6e2f5" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label>Địa chỉ<span>*</span></label>
                                            <input name="text" type="text" value="" style="background: #f1f0f1; border-color: #e6e2f5" required>
                                        </div>
                                    </div>
                                </c:if>

                                <c:if test="${sessionScope.oAuth != null}">
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Họ và tên<span>*</span></label>
                                            <input name="name" type="text" value="${sessionScope.oAuth.name}" style="background: #f1f0f1; border-color: #e6e2f5" disabled>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Điện thoại<span>*</span></label>
                                            <input name="phone" type="text" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Email<span>*</span></label>
                                            <input name="email" type="email" style="background: #f1f0f1; border-color: #e6e2f5" value="${sessionScope.oAuth.email}" disabled>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-12">
                                        <div class="form-group">
                                            <label>Ngày sinh<span>*</span></label>
                                            <input name="birthday" type="text" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label>Địa chỉ<span>*</span></label>
                                            <input name="address" type="text" required>
                                        </div>
                                    </div>
                                </c:if>

                                <div class="col-12">
                                    <div class="form-group button" style="text-align: center;">
                                        <button type="submit" class="btn">Lưu thay đổi</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
</section>
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
<!-- Nice Select JS -->
<script src="assets/js/nicesellect.js"></script>
<script src="assets/js/showpass.js"></script>

</body>
</html>
