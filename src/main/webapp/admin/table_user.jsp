<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.User" %>
<%@ page import="vn.edu.hcmuaf.fit.service.UserService" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Quản lý khách hàng | Quản trị Admin</title>

    <!-- Bootstrap -->
    <link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                    <div class="title_left">
                        <h3>Thông tin khách hàng</h3>
                    </div>

                    <div class="title_right">
                        <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search"></div>
                    </div>
                </div>

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-md-12 col-sm-12 ">
                        <div class="x_panel">
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <table id="datatable-buttons" class="table table-striped table-bordered" style="width:100%">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Họ và tên</th>
                                                    <th>Email</th>
                                                    <th>Số điện thoại</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Ngày sinh</th>
                                                    <th>Tính năng</th>
                                                </tr>
                                                </thead>
                                                <tbody class="list-item">
                                                <%
                                                    List<User> userList = UserService.getInstances().listALlUser();
                                                    request.setAttribute("userList",userList);
                                                %>
                                                <c:forEach items="${userList}" var="u">

                                                <tr>
                                                    <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"  method="post">
                                                    <td>${u.id}</td>
                                                    <td>${u.fullName}</td>
                                                    <td>${u.email}</td>
                                                    <td>${u.phoneNumber}</td>
                                                    <td>${u.address}</td>
                                                    <td>${u.birthday}</td>
                                                    <td>
                                                        <div class="btn-group ml-auto">
                                                            <a class="btn btn-danger btn-sm trash mr-2" type="button" data-id="${u.id}" title="Xóa" href="customers?id=${u.id}"><i
                                                                    class="fas fa-trash-alt"></i></a>
                                                        </div>
                                                    </td>
                                                    </form>
                                                </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /page content -->
    </div>
</div>
<div class="modal" id="deleteModal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thông báo</h5>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            </div>
        </div>
    </div>
</div>
<script>

    $(document).ready(function() {
        // $('.trash').click(function(e) {
        //     e.preventDefault();
        //
        //     var url = $(this).attr('href');
        //     var row = $(this).closest('tr');
        //
        //     $.ajax({
        //         url: url,
        //         type: 'GET',
        //         dataType: 'json',
        //         success: function(response) {
        //             row.remove();
        //             $('.modal-body').html(' Đã xóa khách hàng thành công!');
        //             $('#deleteModal').modal('show'); // Hiển thị modal thông báo
        //         },
        //         error: function(xhr, status, error) {
        //             console.log("Đã xảy ra lỗi khi xóa.");
        //         }
        //     });
        // });

        $(document).on('click', '.trash  ', function (e) {
            e.preventDefault();

            var userId = $(this).data('id');
            var $listItem = $(this).closest('tr');

            $.ajax({
                type: 'GET',
                url: 'customers',
                data: {id: userId},
                success: function (response) {
                    $listItem.remove();
                    $('.modal-body').html('Đã xóa khách hàng thành công!');
                    $('#deleteModal').modal('show'); // Hiển thị modal thông báo
                    $('.list-item').html($(response).find('.list-item').html());
                },
                error: function (xhr, status, error) {
                    console.error(error);
                }
            });
        });
    });

</script>
<!-- jQuery -->
<script src="../assets/js/jquery-3.6.1.min.js"></script>
<!-- Bootstrap -->
<script src="../assets/js/bootstrap.bundle.min.js"></script>
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
<script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
<script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

<!-- Custom Theme Scripts -->
<script src="../assets/js/custom.min.js"></script>

</body>
</html>