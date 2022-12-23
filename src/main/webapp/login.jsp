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

    <title>Đăng nhập</title>

    <!-- Google font -->
    <link rel="stylesheet" href="fonts/css/all.css">

    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

    <!-- Slick -->
    <link type="text/css" rel="stylesheet" href="css/slick.css"/>
    <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
    <!-- Themify Icons -->
    <link href="http://yoursite.com/themify-icons.css" rel="stylesheet">
    <!-- nouislider -->
    <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

    <!-- Font Awesome Icon -->
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <!-- Custom stlylesheet -->
    <link type="text/css" rel="stylesheet" href="css/style.css"/>
    		<link rel="stylesheet" href="css/styleloginsigup.css">


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
<div id="forms">
    <div class="form login">
        <span class="title">Đăng nhập</span>

        <form action="login" method="post">
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
                <input type="text" value="<%= request.getParameter("username")!=null ? request.getParameter("username") : ""%>" name="username" id="tendangnhap" placeholder="Tên đăng nhập">
                <i class="fa fa-envelope"></i>
            </div>
            <div class="input-field">
                <input type="password" name="password" id="matkhaulogin" class="password" placeholder="Mật khẩu">
                <i class="fa fa-lock"></i>
                <div id="show-pass">
                    <i class="fa fa-eye-slash showHidePw"></i>
                </div>
            </div>
            <div class="checkbox-text">
                <div class="checkbox-content">
                    <input type="checkbox" id="logCheck">
                    <label for="logCheck" class="text">Lưu mật khẩu</label>
                </div>

                <a href="forgot-password.jsp" class="text">Quên mật khẩu</a>
            </div>

            <div class="input-field button" id="dangnhap">
                <input type="submit" value="Đăng nhập">
            </div>
        </form>

        <div class="login-signup">
                    <span class="text">Chưa có tài khoản?
                        <a href="signup.jsp" class="text signup-link">Đăng ký ngay</a>
                    </span>
        </div>
    </div>
</div>
<!-- /SECTION -->

<!-- FOOTER -->
<jsp:include page="footer.jsp"/>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/nouislider.min.js"></script>
<script src="js/jquery.zoom.min.js"></script>
<script src="js/main.js"></script>
<!-- Nice Select JS -->
<script src="js/nicesellect.js"></script>
<script src="js/showpass.js"></script>
</body>
</html>
