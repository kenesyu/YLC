<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZWXX_List.aspx.cs" Inherits="YLCWeb.Admin.ZWXX_List" %>

<%@ Register src="menubar.ascx" tagname="menubar" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>后台管理</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>

  <section id="container" class="">
      <!--header start-->
      <header class="header white-bg">
          <div class="sidebar-toggle-box">
              <div data-original-title="Toggle Navigation" data-placement="right" class="icon-reorder tooltips"></div>
          </div>
          <!--logo start-->
          <a href="main.aspx" class="logo" >后台管理</a>
          <!--logo end-->
      </header>
      <!--header end-->
      <!--sidebar start-->
      <uc1:menubar ID="menubar1" runat="server" />
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start-->
              <div class="row">
                  <div class="col-lg-12">
                      <section class="panel">
                          <header class="panel-heading">
                              信息列表
                          </header>
                          <div style="text-align:right">
                          <button type="submit" onclick="location.href='ZWXX.aspx'" class="btn btn-success">添加信息</button>
                          &nbsp;&nbsp;</div>
                          
                          <table class="table table-striped table-advance table-hover">
                              <thead>
                              
                              <tr>
                                  <th><i class="icon-bullhorn"></i> 类别</th>
                                  <th class="hidden-phone"><i class="icon-question-sign"></i> 标题</th>
                                  <th><i class="icon-bookmark"></i> 发布日期</th>
                                  <th></th>
                              </tr>
                              
                              </thead>
                              <asp:Repeater ID="replist" runat="server">
                              <ItemTemplate>
                              <tr>
                                  <td><a href="#"><%# Eval("Type") %></a></td>
                                  <td class="hidden-phone"><%# Eval("Title") %></td>
                                  <td><%# Eval("CreateTime") %></td>
                                  <td>
                                      <button class="btn btn-primary btn-xs" onclick="location.href='zwxx.aspx?id=<%# Eval("id") %>'"><i class="icon-pencil">&nbsp;修改</i></button>
                                      <button class="btn btn-danger btn-xs" runat="server" id="btnDelete"><i class="icon-trash ">&nbsp;删除</i></button>
                                  </td>
                              </tr>
                             </ItemTemplate>

                           </asp:Repeater>
                          </table>
                          
                      </section>
                  </div>
              </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
      <!--footer start-->
      <!--footer end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>
    <script src="js/respond.min.js" ></script>

    <!--common script for all pages-->
    <script src="js/common-scripts.js"></script>

  </body>
</html>