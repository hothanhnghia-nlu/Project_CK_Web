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
    <meta name="google-signin-client_id" content="136400597387-ljfp47fjs5fjc9hdnuj2ee70kim3qfu1.apps.googleusercontent.com">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Tài khoản</title>

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
<div class="login-page">

    <!-- Main content -->
    <div id="main-content" class="main-content" style="padding-bottom: 30px">
        <div class="container">

            <div class="row">

                <!--Form Sign In-->
                <div class="col-md-7 col-lg-6 col-md-offset-3">
                    <div style="text-align: center; margin-top: 40px">
                        <h3 style="font-weight: 400; color: black">THAY ĐỔI MẬT KHẨU</h3>
                    </div>
                    <div class="signin-container">
                        <form action="update-password" name="frm-login" method="post">
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
                                <label for="fid-pass"><strong>Mật khẩu cũ </strong><span class="requite">*</span></label>
                                <input type="password" id="fid-pass" name="password" value="" placeholder="Nhập mật khẩu cũ" class="txt-input" required>
                            </p>
                            <p class="form-row">
                                <label for="fid-newpass"><strong>Mật khẩu mới </strong><span class="requite">*</span></label>
                                <input type="password" id="fid-newpass" name="new-pass" value="" placeholder="Nhập mật khẩu mới" class="txt-input" required>
                            </p>
                            <p class="form-row">
                                <label for="fid-repass"><strong>Xác nhận mật khẩu mới </strong><span class="requite">*</span></label>
                                <input type="password" id="fid-repass" name="repass" value="" placeholder="Nhập lại mật khẩu mới" class="txt-input" required>
                            </p>
                            <p class="form-row wrap-btn">
                                <input class="btn btn-submit btn-bold" type="submit" value="Đổi mật khẩu">
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
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v16.0&appId=768788668010334&autoLogAppEvents=1" nonce="5Q6IvbJ6"></script>
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>

<!-- Script login by FB, GG -->
<%--Facebook--%>
<script>

    function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
        console.log('statusChangeCallback');
        console.log(response);                   // The current login status of the person.
        if (response.status === 'connected') {   // Logged into your webpage and Facebook.
            testAPI();
        } else {                                 // Not logged into your webpage or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this webpage.';
        }
    }


    function checkLoginState() {               // Called when a person is finished with the Login Button.
        FB.getLoginStatus(function(response) {   // See the onlogin handler
            statusChangeCallback(response);
        });
    }


    window.fbAsyncInit = function() {
        FB.init({
            appId      : '768788668010334',
            cookie     : true,                     // Enable cookies to allow the server to access the session.
            xfbml      : true,                     // Parse social plugins on this webpage.
            version    : 'v16.0'           // Use this Graph API version for this call.
        });


        FB.getLoginStatus(function(response) {   // Called after the JS SDK has been initialized.
            statusChangeCallback(response);        // Returns the login status.
        });
    };

    function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function(response) {
            console.log('Successful login for: ' + response.name);
            document.getElementById('status').innerHTML =
                'Thanks for logging in, ' + response.name + '!';
        });
    }

</script>

<%--Google--%>
<script>
    function onSuccess(googleUser) {
        console.log('Logged in as: ' + googleUser.getBasicProfile().getName());
    }
    function onFailure(error) {
        console.log(error);
    }
    function renderButton() {
        gapi.signin2.render('my-signin2', {
            'scope': 'profile email',
            'width': 240,
            'height': 50,
            'longtitle': true,
            'theme': 'dark',
            'onsuccess': onSuccess,
            'onfailure': onFailure
        });
    }
</script>

</body>
</html>
