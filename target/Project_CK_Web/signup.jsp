<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
    		<link rel="stylesheet" href="assets/css/styleloginsigup.css">


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
<div class="forms " id="formss">
    <!-- Registration Form -->
    <div class="form signup">
        <span class="title">Đăng ký</span>

        <form action="signup" method="post">
            <%
                if (error != null) {
            %>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>
            <%
                }
            %>
            <div class="input-field">
                <input id="username" value="<%= request.getParameter("user")!=null ? request.getParameter("user") : ""%>" type="text" name="user" placeholder="Tên đăng nhập" required>
                <i class="fa fa-user" id="iusername"></i>
            </div>
            <div class="input-field">
                <input id="email" type="text" name="email" placeholder="Email" required>
                <i class="fa fa-envelope icon" id="iemail"></i>
            </div>
            <div class="input-field">
                <input id="matkhau" type="password" name="pass" class="password" placeholder="Mật khẩu" required>
                <i class="fa fa-lock icon" id="imatkhau"></i>
                <div id="show-pass">
                    <i class="fa fa-eye-slash showHidePw"></i>
                </div>
            </div>
            <div class="input-field">
                <input id="rmatkhau" type="password" name="repass" class="password" placeholder="Nhập lại mật khẩu" required>
                <i class="fa fa-lock icon" id="irmatkhau"></i>
                <div id="show-pass1">
                    <i class="fa fa-eye-slash showHidePw"></i>
                </div>
            </div>

            <div class="input-field button">
                <input id="dangky" type="submit" value="Đăng ký">
            </div>
        </form>

        <div class="login-signup">
                    <span class="text">Đã có tài khoản?
                        <a href="login.jsp" class="text login-link">Đăng nhập ngay</a>
                    </span>
        </div>
        <div align="center">
            <p id="ketqua"> </p>
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
