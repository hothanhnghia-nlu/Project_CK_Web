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
    <link href="../vendors/charts/chartist-bundle/chartist.css" rel="stylesheet">
    <link href="../vendors/charts/c3charts/c3.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../assets/css/custom.css" rel="stylesheet">
<%--    <link href="../assets/css/adminStyle.css" rel="stylesheet">--%>
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/laptop-icon.png" />
</head>
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
                        <h3>Thống kê</h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search"></div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-inline-block">
                                    <h5 class="text-muted">Tổng user</h5>
                                    <h2 class="mb-0"> 5</h2>
                                </div>
                                <div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
                                    <i class="fa fa-user fa-fw fa-sm text-primary"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-inline-block">
                                    <h5 class="text-muted">Tổng số lượng<br>truy cập</h5>
                                    <h2 class="mb-0"> 1826</h2>
                                </div>
                                <div class="float-right icon-circle-medium  icon-box-lg  bg-info-light mt-1">
                                    <i class="fa fa-eye fa-fw fa-sm text-info"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card border-3">
                            <div class="card-body">
                                <h5 class="text-muted">Tổng số lượng sản phẩm</h5>
                                <div class="metric-value d-inline-block">
                                    <h1 class="mb-1">150</h1>
                                </div>
                                <div class="float-right icon-circle-medium  icon-box-lg  bg-secondary-light mt-1">
                                    <i class="fa fa-book fa-fw fa-sm text-secondary"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card border-3">
                            <div class="card-body">
                                <h5 class="text-muted">Tổng số đơn đặt hàng</h5>
                                <div class="metric-value d-inline-block">
                                    <h1 class="mb-1">13.200</h1>
                                </div>
                                <div class="float-right icon-circle-medium  icon-box-lg  bg-brand-light mt-1">
                                    <i class="fa fa-money-bill-alt fa-fw fa-sm text-brand"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-9 col-lg-12 col-md-6 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">Đơn hàng gần đây</h5>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="bg-light">
                                        <tr class="border-0">
                                            <th class="border-0">STT</th>
                                            <th class="border-0">Hình ảnh</th>
                                            <th class="border-0">Tên sản phẩm</th>
                                            <th class="border-0">Mã sản phẩm</th>
                                            <th class="border-0">Số lượng</th>
                                            <th class="border-0">Giá</th>
                                            <th class="border-0">Thời gian mua hàng</th>
                                            <th class="border-0">Khách hàng</th>
                                            <th class="border-0">Trạng thái</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>
                                                <div class="m-r-10"><img
                                                        src="assets/images/Laptop Acer Nitro 5 Gaming AN515 45 R6EV.jpg"
                                                        alt="user" class="rounded" width="45">
                                                </div>
                                            </td>
                                            <td>LAPTOP ACER NITRO 5 GAMING AN515 45 R6EV</td>
                                            <td>AN515R6EV</td>
                                            <td>1</td>
                                            <td>22.490.000đ</td>
                                            <td>08-11-2022 08:35:12</td>
                                            <td>Trần Minh Long</td>
                                            <td><span class="badge-dot badge-brand mr-1"></span>Đang giao</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end recent orders  -->
                </div>
                <div class="col">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">Thống kê doanh thu chi tiết theo hãng</h5>
                            <div class="card-body">
                                <div class="ct-chart-horizontal ct-golden-section"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- ============================================================== -->
                    <!-- dount chart  -->
                    <!-- ============================================================== -->
                    <div>
                        <div class="card">
                            <h5 class="card-header">Thống kê doanh thu </h5>
                            <div class="card-body">
                                <div id="c3chart_donut"></div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end dount chart  -->
                    <!-- ============================================================== -->
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
<!-- Chart.js -->
<script src="../assets/js/Chart.min.js"></script>
<!-- Custom Theme Scripts -->
<script src="../assets/js/custom.min.js"></script>
<!-- chart chartist js -->
<script src="../vendors/charts/chartist-bundle/chartist.min.js"></script>
<!-- sparkline js -->
<script src="../vendors/charts/sparkline/jquery.sparkline.js"></script>
<!-- morris js -->
<script src="../vendors/charts/morris-bundle/raphael.min.js"></script>
<script src="../vendors/charts/morris-bundle/morris.js"></script>
<!-- chart c3 js -->
<script src="../vendors/charts/c3charts/c3.min.js"></script>
<script src="../vendors/charts/c3charts/d3-5.4.0.min.js"></script>
<script src="../vendors/charts/c3charts/C3chartjs.js"></script>
<script src="../vendors/charts/chartist-bundle/Chartistjs.js"></script>
<%--            <script src="libs/js/dashboard-ecommerce.js"></script>--%>

</body>
</html>
