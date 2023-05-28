<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="java.util.List" %>
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

      <title>Quản lý sản phẩm | Quản trị Admin</title>

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
                        <h3>Quản lý sản phẩm</h3>
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
                                <div class="row element-button">
                                    <div class="pl-3">
                                        <a class="btn btn-print btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"
                                           style="border: 2px solid #bdc3c7"><i
                                                class="fas fa-print"></i> In dữ liệu</a>
                                    </div>
                                    <div class="pl-3">
                                        <a class="btn btn-delete btn-sm delete-all" type="button" title="Xóa"
                                            style="border: 2px solid #bdc3c7" href="new_product"><i
                                                class="fas fa-plus"></i> Tạo mới sản phẩm</a>
                                    </div>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="x_content">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="card-box table-responsive">
                                            <table id="datatable" class="table table-striped table-bordered" style="width:100%">
                                                <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Ảnh</th>
                                                    <th>Số Lượng</th>
                                                    <th>Tình trạng</th>
                                                    <th>Đơn giá</th>
                                                    <th>Danh mục</th>
                                                    <th>Tính năng</th>
                                                </tr>
                                                </thead>
                                                <tbody class="list-item">
                                                <%List<Product> list = (List<Product>) request.getAttribute("proList");
                                                    for (Product p : list) {
                                                %>
                                                <tr>
                                                    <td><%=p.getProductID()%></td>
                                                    <td><%=p.getName()%></td>
                                                    <td><img width="100px" src=".<%=p.getImage().get(0)%>" alt=""></td>
                                                    <td class="text-center"><%=p.getQuantity()%></td>
                                                    <% boolean check = p.getQuantity()==0?false:true;
                                                        if(check==true){%>
                                                    <td style="font-size: 17px"><span class="badge bg-green">Còn hàng</span></td>
                                                    <%} else {%>
                                                    <td style="font-size: 17px; color:#FFF;"><span class="badge bg-danger ">Hết hàng</span></td>
                                                    <%}%>
                                                    <td><%=NumberFormat.getCurrencyInstance(new Locale("vi", "VN")).format(p.getOut_price())%></td>
                                                    <td><%=p.getVendor()%></td>
                                                    <td>
                                                        <div class="btn-group ml-auto">
                                                            <a class="btn btn-primary btn-sm edit mr-2" type="button" title="Xem" data-product-id="<%=p.getProductID()%>" href="product?id=<%=p.getProductID()%>"><i
                                                                    class="fas fa-edit"></i></a>
                                                            <a class="btn btn-danger btn-sm trash delete-product" type="button" title="Xóa" data-product-id="<%=p.getProductID()%>" href="product-soft-delete?id=<%=p.getProductID()%>">
                                                                <i class="fas fa-trash-alt"></i></a>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <%}%>
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
      $(document).ready(function () {
          $(document).on('click', '.delete-product', function (e) {
              e.preventDefault();

              var productId = $(this).data('product-id');
              var $productItem = $(this).closest('tr');

              $.ajax({
                  type: 'GET',
                  url: 'product-soft-delete',
                  data: {id: productId},
                  success: function (response) {
                      $productItem.remove();
                      $('.modal-body').html('Sản phẩm đã được chuyển đến thùng rác!');
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

    <!-- Custom Theme Scripts -->
    <script src="../assets/js/custom.min.js"></script>

  </body>
</html>