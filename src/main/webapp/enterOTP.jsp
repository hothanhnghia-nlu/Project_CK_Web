<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String message = (String) request.getAttribute("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Quên mật khẩu</title>

    <!-- Google font -->
    <link rel="stylesheet" href="assets/fonts/css/all.css">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="assets/css/bootstrap.min.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/laptop-icon.png" />

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
    <style>
        li {
            display: inline-block;
            list-style-type: none;
        }

        li span {
            display: block;
        }
    </style>

</head>
<body>
<!-- HEADER -->
<jsp:include page="header.jsp"/>
<!-- /HEADER -->

<!-- SECTION -->
<div id="forms">
    <div class="form login">
        <div>
            <img src="assets/img/lock.png"/>
        </div>
        <div class="text-center">
            <span class="title">Nhập mã OTP</span>
            <%
                if (message != null) {
            %>
            <p><%= message %></p>
            <%
                }
            %>
        </div>

        <form action="validateOTP" method="post">
            <div class="input-field">
                <input type="text" id="otp" name="otp" placeholder="Nhập mã OTP" required>
                <i class="fa fa-mail-forward"></i>
            </div>

            <div style="text-align: center; margin-top: 10px">
                <a href="forgot-password.jsp" style="color: #2b80dd">Gửi lại mã?</a>
            </div>

            <div class="input-field button" id="dangnhap">
                <input type="submit" value="Đặt lại mật khẩu">
            </div>
        </form>

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
