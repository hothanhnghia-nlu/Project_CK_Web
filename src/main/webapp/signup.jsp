<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Đăng ký</title>

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

<!-- SECTION -->
<div class="page-contain login-page">

    <!-- Main content -->
    <div id="main-content" class="main-content" style="padding-bottom: 30px">
        <div class="container">

            <div class="row">

                <!--Form Sign In-->
                <div class="col-md-7 col-lg-6 col-md-offset-3">
                    <div style="text-align: center; margin-top: 40px">
                        <h3 style="font-weight: 400; color: black">ĐĂNG KÝ TÀI KHOẢN</h3>
                        <p>Bạn đã có tài khoản? <a href="login.jsp" style="color: #2b80dd">Đăng nhập ngay</a></p>
                    </div>
                    <div class="signin-container">
                        <form action="signup" name="frm-login" method="post">
                            <%
                            if (error != null) {
                            %>
                            <div class="alert alert-danger" role="alert">
                                <%= error %>
                            </div>
                            <%
                            }
                            %>
                            <p class="form-row">
                                <label for="fid-name"><strong>Họ và tên </strong><span class="requite">*</span></label>
                                <input type="text" id="fid-name" name="name" value="" placeholder="Họ và tên" class="txt-input" required>
                            </p>
                            <p class="form-row">
                                <label for="fid-username"><strong>Tên đăng nhập </strong><span class="requite">*</span></label>
                                <input type="text" id="fid-username" name="username" value="<%= request.getParameter("username")!=null ? request.getParameter("username") : ""%>" placeholder="Tên đăng nhập" class="txt-input" required>
                            </p>
                            <p class="form-row">
                                <label for="fid-email"><strong>Email </strong><span class="requite">*</span></label>
                                <input type="email" id="fid-email" name="email" value="" placeholder="Email" class="txt-input" required>
                            </p>
                            <p class="form-row">
                                <label for="fid-tel"><strong>Số điện thoại </strong><span class="requite">*</span></label>
                                <input type="text" id="fid-tel" name="phone" value="" placeholder="Số điện thoại" class="txt-input" required>
                            </p>
                            <p class="form-row">
                                <label for="fid-pass"><strong>Mật khẩu </strong><span class="requite">*</span></label>
                                <input type="password" id="fid-pass" name="password" value="" placeholder="Mật khẩu" class="txt-input" required>
                            </p>
                            <p class="form-row">
                                <label for="fid-repass"><strong>Xác nhận mật khẩu </strong><span class="requite">*</span></label>
                                <input type="password" id="fid-repass" name="repass" value="" placeholder="Nhập lại mật khẩu" class="txt-input" required>
                            </p>
                            <p class="form-row wrap-btn">
                                <input class="btn btn-submit btn-bold" type="submit" value="Đăng ký">
                            </p>
                        </form>
                    </div>
                </div>

            </div>

        </div>

    </div>

</div>
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
