<%@ page import="java.util.List" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Order" %>
<%@ page import="vn.edu.hcmuaf.fit.service.OrderService" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.User" %>
<%@ page import="vn.edu.hcmuaf.fit.service.UserService" %>
<%@ page import="vn.edu.hcmuaf.fit.service.ProductService" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.VendorStatistic" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    List<User> listUser = UserService.getInstances().listALlUser();
    int numUser = listUser.size();
    request.setAttribute("numUser", numUser);
    List<Order> listOrder = OrderService.getInstance().getAllOrder();
    int numOrder = listOrder.size();
    request.setAttribute("numOrder", numOrder);
    int listAllQuan = ProductService.getInstance().getAllQuantity();
    request.setAttribute("listAllQuan", listAllQuan);
    int listInventoryQuan = ProductService.getInstance().getInventoryQuantity();
    request.setAttribute("listInventoryQuan", listInventoryQuan);
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

      <title>Thống kê | Quản trị Admin</title>

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
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/laptop-icon.png" />

      <!-- CSS Backtop -->
      <style>
          #backtop {
              height: 50px;
              width: 50px;
              background: #2b80dd;
              color: yellow;
              border-radius: 50%;
              justify-content: center;
              align-items: center;
              display: none;
              position: fixed;
              bottom: 40px;
              right: 20px;
              cursor: pointer;
              animation: ease 1.5s;
          }
          #backtop.backtop-open {
              display: flex;
          }
          #backtop:hover {
              background-color: rgb(199, 199, 199);
          }
      </style>
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

                <div class="clearfix"></div>

                <div class="row">
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card" style="height: 135px">
                            <div class="card-body">
                                <div class="d-inline-block">
                                    <a href="accounts">
                                        <h5 class="text-muted">Tổng user</h5>
                                    </a>
                                    <h2 class="mb-0" style="font-size: 2.5rem; padding-top: 8px"><%=numUser%></h2>
                                </div>
                                <div class="float-right icon-circle-medium  icon-box-lg  bg-primary-light mt-1">
                                    <i class="fa fa-user fa-fw fa-sm text-primary"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card border-3" style="height: 136px">
                            <div class="card-body">
                                <a href="product-list">
                                    <h5 class="text-muted">Tổng số lượng sản phẩm</h5>
                                </a>
                                <div class="metric-value d-inline-block">
                                    <h1 class="mb-1"><%=listAllQuan%></h1>
                                </div>
                                <div class="float-right icon-circle-medium  icon-box-lg  bg-secondary-light mt-1">
                                    <i class="fa fa-book fa-fw fa-sm text-secondary"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-3 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card border-3" style="height: 136px">
                            <div class="card-body">
                                <a href="#">
                                    <h5 class="text-muted">Tổng số lượng sản phẩm tồn kho</h5>
                                </a>
                                <div class="metric-value d-inline-block">
                                    <h1 class="mb-1"><%=listInventoryQuan%></h1>
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
                                <a href="order-list">
                                    <h5 class="text-muted">Tổng số đơn đặt hàng</h5>
                                </a>
                                <div class="metric-value d-inline-block">
                                    <h1 class="mb-1"><%=numOrder%></h1>
                                </div>
                                <div class="float-right icon-circle-medium  icon-box-lg  bg-brand-light mt-1">
                                    <i class="fa fa-money-bill-alt fa-fw fa-sm text-brand"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row" style="margin-top: 20px">
                    <div class="col-xl-12">
                        <div class="card">
                            <a href="order-list">
                                <h5 class="card-header">Đơn hàng gần đây</h5>
                            </a>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead class="bg-light">
                                        <tr class="border-0">
                                            <th class="border-0">#</th>
                                            <th class="border-0">Tên khách hàng</th>
                                            <th class="border-0">SĐT</th>
                                            <th class="border-0">Địa chỉ</th>
                                            <th class="border-0">Ghi chú</th>
                                            <th class="border-0">Ngày đặt hàng</th>
                                            <th class="border-0">Thanh toán</th>
                                            <th class="border-0">Tình trạng</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            List<Order> orderList = OrderService.getInstance().getTop5Order();
                                            request.setAttribute("orderList",orderList);
                                        %>
                                        <c:forEach items="${orderList}" var="o">
                                        <tr>
                                            <td>${o.orderId}</td>
                                            <td>${o.fullName}</td>
                                            <td>${o.phoneNumber}</td>
                                            <td>${o.address}</td>
                                            <td>${o.note}</td>
                                            <td>${o.orderDate}</td>
                                            <td>${o.payment}</td>
                                            <td style="font-size: 17px; color: #FFF">
                                                <c:if test="${o.status == 0}">
                                                    <span class="badge badge-warning">Đang xử lý</span>
                                                </c:if>
                                                <c:if test="${o.status == 1}">
                                                    <span class="badge badge-primary">Đang vận chuyển</span>
                                                </c:if>
                                                <c:if test="${o.status == 2}">
                                                    <span class="badge badge-success">Đã giao</span>
                                                </c:if>
                                                <c:if test="${o.status == 3}">
                                                    <span class="badge badge-danger">Đã hủy</span>
                                                </c:if>
                                                <c:if test="${o.status == 4}">
                                                    <span class="badge badge-dark">Giao hàng thất bại</span>
                                                </c:if>
                                            </td>

                                        </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end recent orders  -->
                </div>
                <div class="col" style="margin-top: 20px">
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12">
                        <div class="card">
                            <h5 class="card-header">Thống kê doanh thu chi tiết theo hãng (Triệu VND)</h5>
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
                    <div class="col-xl-6 col-lg-6 col-md-6 col-sm-12 col-12" style="text-align: center">
                        <div class="card" style="width: 500px; margin-bottom: 20px">
                            <h5 class="card-header">Thống kê số lượng sản phẩm đã bán theo hãng </h5>
                            <div class="card-body">
                                <div id="c3chart_donut"></div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- end dount chart  -->
                    <!-- ============================================================== -->
                </div>
                <!--BACKTOP-->
                <div id="backtop">
                    <i class="fa fa-arrow-up"></i>
                </div>
                <!--/BACKTOP-->
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

  <!-- Chart.js -->
  <script src="../assets/js/Chart.min.js"></script>
  <!-- Custom Theme Scripts -->
  <script src="../assets/js/custom.min.js"></script>
  <script src="assets/js/backtop.js"></script>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/d3/5.15.0/d3.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/c3/0.7.20/c3.min.js"></script>

  <script>
      //Thống kê số lượng sản phẩm đã bán theo hãng
      var chart = c3.generate({
          bindto: '#c3chart_donut',
          data: {
              columns: [
                  <% List<VendorStatistic> vendorStatisticListList = (List<VendorStatistic>) request.getAttribute("vendorList");
                  for (VendorStatistic a: vendorStatisticListList) { %>
                    ['<%=a.getName()%>', <%=a.getQuantity()%>],
                  <% }%>
              ],
              type: 'donut'
          },
          donut: {
              title: ''
          }
      });

//Thống kê doanh thu chi tiết theo hãng
      new Chartist.Bar('.ct-chart-horizontal', {
          labels: [<%for (VendorStatistic a: vendorStatisticListList) { %>
              '<%=a.getName()%>',
              <% }%>],
          series: [
              [<%for (VendorStatistic a: vendorStatisticListList) {
                String b = (Integer.parseInt(a.getQuantity()))+"";%>
                  <%=""%>,
                  <% }%>],
              [<%for (VendorStatistic a: vendorStatisticListList) {
                  String c = (Double.parseDouble(a.getPrice())/1000000)+"";%>
                  <%=c%>,
                  <% }%>]
          ]
      }, {
          seriesBarDistance: 10,
          reverseData: true,
          horizontalBars: true,
          axisY: {
              offset: 70
          }
      });

  </script>
  </body>
</html>