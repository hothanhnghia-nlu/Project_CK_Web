<%@ page import="vn.edu.hcmuaf.fit.bean.Product" %>
<%@ page import="vn.edu.hcmuaf.fit.bean.Category" %>
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

    <title>Thêm sản phẩm | Quản trị Admin</title>

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
            <div class="title_left" style="width: 50%;">
              <h3>Thêm sản phẩm</h3>
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
                            <h2>Thêm sản phẩm</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
<%--                            <form id="frm" data-parsley-validate class="form-horizontal form-label-left" enctype="multipart/form-data"  method="post">--%>
<%--                               <div class="item form-group">--%>
<%--                                    <label class="col-form-label col-md-3 col-sm-3 label-align" for="first-name">Tên sản phẩm--%>
<%--                                    </label>--%>
<%--                                    <div class="col-md-6 col-sm-6 ">--%>
<%--                                        <input type="text" id="first-name" class="form-control" name="namep" value="">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="form-group row">--%>
<%--                                    <label class="control-label col-md-3 col-sm-3 label-align">Danh Mục</label>--%>
<%--                                    <div class="col-md-9 col-sm-9 ">--%>
<%--                                        <%List<Category> cate = (List<Category>) request.getAttribute("cate");%>--%>
<%--                                        <select class="col-form-label col-md-3 col-sm-3 form-control" tabindex="0" name="id_cate">--%>
<%--                                            <option></option>--%>
<%--                                            <% for(Category c : cate){%>--%>
<%--                                            <option value="<%=c.getCategoryID()%>" ><%=c.getName()%></option>--%>
<%--                                            <%}%>--%>
<%--                                        </select>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="item form-group">--%>
<%--                                    <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Số Lượng</label>--%>
<%--                                    <div class="col-md-6 col-sm-6 ">--%>
<%--                                        <input for="middle-name" class="form-control" type="number" name="quantity" value="">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="item form-group">--%>
<%--                                    <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Giá</label>--%>
<%--                                    <div class="col-md-6 col-sm-6 ">--%>
<%--                                        <input for="middle-name" class="form-control" type="number" name="price" value="">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="item form-group">--%>
<%--                                    <label for="middle-name" class="col-form-label col-md-3 col-sm-3 label-align">Giảm giá</label>--%>
<%--                                    <div class="col-md-6 col-sm-6 ">--%>
<%--                                        <input id="middle-name" class="form-control" type="number" name="discount" value="">--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="item form-group">--%>
<%--                                    <label class="control-label col-md-3 col-sm-3 label-align">Thông số</label>--%>
<%--                                    <div class="col-md-9 col-sm-9 ">--%>
<%--                                        <textarea class="resizable_textarea form-control" style="height: 300px;" name="discription" placeholder="..."></textarea>                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="item form-group">--%>
<%--                                    <label class="control-label col-md-3 col-sm-3 label-align">Chọn ảnh</label>--%>
<%--                                    <div class="col-md-9 col-sm-9 ">--%>
<%--                                        <input type="file"id="avatar" name="img" accept="image/png, image/jpeg">--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                                <div class="ln_solid"></div>--%>
<%--                                <div class="item form-group">--%>
<%--                                    <div class="col-md-6 col-sm-6 offset-md-3">--%>
<%--                                        <button class="btn btn-primary" type="reset">Huỷ</button>--%>
<%--                                        <input type="submit" class="btn btn-success" value="Submit">--%>
<%--                                    </div>--%>
<%--                                </div>--%>

<%--                            </form>--%>

                            <form method="post"  enctype="multipart/form-data">
                                Select file to upload: <input type="file" name="file" size="60" /><br /><br />
                                <input type="submit" value="Upload" />
                            </form>
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
</html>