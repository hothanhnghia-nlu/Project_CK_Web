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

    <title>Quản lý đơn hàng | Quản trị Admin</title>

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
              <h3>Danh sách đơn hàng</h3>
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
                            <th>Tên khách hàng</th>
                            <th>SĐT</th>
                            <th>Địa chỉ</th>
                            <th>Ghi chú</th>
                            <th>Ngày đặt hàng</th>
                            <th>Thanh toán</th>
                            <th>Tình trạng</th>
                            <th>Tính năng</th>
                          </tr>
                          </thead>
                          <tbody>
                          <c:forEach items="${orderList}" var="x" varStatus="STT">
                            <tr>
                              <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left"  method="post">
                                  <input type="hidden" name="id" value="${x.orderId}" />
                              <td>${x.orderId}</td>
                              <td>${x.fullName}</td>
                              <td>${x.phoneNumber}</td>
                              <td>${x.address}</td>
                              <td>${x.note}</td>
                              <td>${x.orderDate}</td>
                              <td>${x.payment}</td>
                              <td style="color: #FFF">
                                  <select tabindex="0" name="status">
                                      <c:if test="${x.status == 0}">
                                          <option value="${x.status}" class="badge bg-warning">Đang xử lý</option>
                                      </c:if>
                                      <c:if test="${x.status == 1}">
                                        <option value="${x.status}" class="badge bg-primary" style="color: white">Đang vận chuyển</option>
                                      </c:if>
                                      <c:if test="${x.status == 2}">
                                        <option value="${x.status}" class="badge bg-success" style="color: white">Đã giao</option>
                                      </c:if>
                                      <c:if test="${x.status == 3}">
                                        <option value="${x.status}" class="badge bg-danger" style="color: white">Đã hủy</option>
                                      </c:if>
                                      <option value="0">Đang xử lý</option>
                                      <option value="1">Đang vận chuyển</option>
                                      <option value="2">Đã giao</option>
                                      <option value="3" >Đã hủy</option>
                                  </select>
                              </td>

                              <td>
                                <div class="btn-group ml-auto">
                                  <a class="btn btn-danger btn-sm trash mr-2" type="button" href="order-list?id=${x.orderId}" title="Xóa"><i
                                          class="fas fa-trash-alt"></i></a>
                                  <a class="btn btn-primary btn-sm edit" type="button" href="order-detail?id=${x.orderId}" title="Xem"><i
                                          class="fas fa-eye"></i></a>
                                  <button class="btn btn-primary btn-sm edit" type="submit" title="Cập nhật" style="margin-left: 8px"><i
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
    <script src="../vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="../vendors/pdfmake/build/vfs_fonts.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../assets/js/custom.min.js"></script>

  </body>
</html>