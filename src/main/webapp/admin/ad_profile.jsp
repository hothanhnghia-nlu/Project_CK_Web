<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile</title>
    <!-- Bootstrap -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../assets/fonts/css/all.css" rel="stylesheet">

    <link href="../vendors/datatables.net-bs/css/dataTables.bootstrap.css" rel="stylesheet">
    <link href="../vendors/datatables.net-buttons-bs/css/buttons.bootstrap.css" rel="stylesheet">
    <link href="../vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.css" rel="stylesheet">
    <link href="../vendors/datatables.net-responsive-bs/css/responsive.bootstrap.css" rel="stylesheet">
    <link href="../vendors/datatables.net-scroller-bs/css/scroller.bootstrap.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../assets/css/custom.css" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/laptop-icon.png" />
</head>
<body>
<body class="nav-md">
<div class="container body">
    <div class="main_container">
        <!-- menu bar -->
        <jsp:include page="menu-admin.jsp"/>
        <!-- /menu bar -->

        <!-- page content -->
        <div class="right_col" role="main">
            <div class="">
                <div class="page-title">
                    <div class="title_left" style="width: 50%;">
                        <h3>Thông tin Admin</h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search"></div>
                    </div>
                </div>

                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_title">
                                <h2>Thông tin cá nhân</h2>
                                <div class="clearfix"></div>
                            </div>
                            <c:if test="${sessionScope.auth != null}">
                                <div class="row">
                                    <div class="col-lg-12 col-xl-6">
                                        <div class="table-responsive">
                                            <table class="table m-0">
                                                <tbody>
                                                <tr>
                                                    <th scope="row">Họ tên</th>
                                                    <td>${sessionScope.auth.fullName}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Ngày sinh</th>
                                                    <td>${sessionScope.auth.birthday}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Địa chỉ</th>
                                                    <td>${sessionScope.auth.address}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                    <div class="col-lg-12 col-xl-6">
                                        <div class="table-responsive">
                                            <table class="table">
                                                <tbody>
                                                <tr>
                                                    <th scope="row">Email</th>
                                                    <td>${sessionScope.auth.email}</td>
                                                </tr>
                                                <tr>
                                                    <th scope="row">Điện thoại</th>
                                                    <td>${sessionScope.auth.phoneNumber}</td>
                                                </tr>


                                                <tr>
                                                    <th scope="row"></th>
                                                    <td></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                </div>

            </div>
        </div>
        <!-- /page content -->
    </div>
</div>

<!-- jQuery -->
<script src="../assets/js/jquery-3.6.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.3/jquery.validate.min.js"></script>
<!-- Bootstrap -->
<script src="../assets/js/bootstrap.bundle.min.js"></script>
<script src="../assets/js/validation.js"></script>
<!-- FastClick -->
<script src="vendors/fastclick/lib/fastclick.js"></script>
<!-- NProgress -->
<script src="vendors/nprogress/nprogress.js"></script>
<!-- iCheck -->
<script src="vendors/iCheck/icheck.min.js"></script>
<!-- Datatables -->
<script src="../vendors/datatables.net/js/jquery.dataTables.js"></script>
<script src="../vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
<script src="../vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
<script src="../vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
<script src="../vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
<script src="../vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
<script src="../vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
<script src="../vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
<script src="../vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>

<!-- Custom Theme Scripts -->
<script src="../assets/js/custom.min.js"></script>

</body>
</body>
</html>
