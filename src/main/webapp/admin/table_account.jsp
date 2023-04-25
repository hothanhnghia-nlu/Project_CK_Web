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

    <title>Quản lý tài khoản | Quản trị Admin</title>

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
                        <h3>Quản lý tài khoản</h3>
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
                                            <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                                                <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Họ và tên</th>
                                                    <th>Tên tài khoản</th>
                                                    <th>Email</th>
                                                    <th>Vai trò</th>
                                                    <th>Tính năng</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <%
                                                    List<User> userList = UserService.getInstances().listALlUser();
                                                    request.setAttribute("userList",userList);
                                                %>
                                                <c:forEach items="${userList}" var="u">

                                                    <tr>
                                                        <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"  method="post">
                                                            <input type="hidden" name="id" value="${u.id}" />
                                                            <td>${u.id}</td>
                                                            <td>${u.fullName}</td>
                                                            <td>${u.username}</td>
                                                            <td>${u.email}</td>
                                                            <td>
                                                                <select style="width: 80px;" tabindex="0" name="role">
                                                                    <c:if test="${u.role == 0}">
                                                                        <option value="${u.role}">User</option>
                                                                    </c:if>
                                                                    <c:if test ="${u.role == 1}">
                                                                        <option value="${u.role}">Admin</option>
                                                                    </c:if>
                                                                    <option value="0" >User</option>
                                                                    <option value="1" >Admin</option>
                                                                </select>

                                                            </td>
                                                            <td>
                                                                <div class="btn-group ml-auto">
                                                                    <a class="btn btn-danger btn-sm trash mr-2" type="button" title="Xóa" href="accounts?id=${u.id}"><i
                                                                            class="fas fa-trash-alt"></i></a>
                                                                    <button class="btn btn-primary btn-sm edit" type="submit" title="Cập nhật" ><i
                                                                            class="fas fa-rotate"></i></button>
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
        </div>
        <!-- /page content -->
    </div>
</div>

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

<!-- Custom Theme Scripts -->
<script src="../assets/js/custom.min.js"></script>

</body>
</html>