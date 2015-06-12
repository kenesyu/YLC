<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JQFG.aspx.cs" Inherits="YLCWeb.Admin.JQFG" %>

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

    <link rel="stylesheet" type="text/css" href="assets/bootstrap-datepicker/css/datepicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-colorpicker/css/colorpicker.css" />
    <link rel="stylesheet" type="text/css" href="assets/bootstrap-daterangepicker/daterangepicker.css" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/uploadify/uploadify.css">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
    <![endif]-->
  </head>
<body>
    <form id="form1" runat="server" class="from">
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
              <div class="">
                      <div class="row">
                          <div class="col-lg-12">
                              <section class="panel">
                                  <header class="panel-heading">
                                      <asp:Label ID="lblTitle" runat="server" Text="政务信息"></asp:Label>
                                  </header>
                                  <div class="panel-body">
                                      <div class="form">
                                         <div class="form-group">
                                              <label class="col-sm-2 control-label col-sm-2">景点</label>
                                              <div class="col-sm-10">
                                                  <asp:TextBox runat="server" ID="txtTitle" class="form-control" style="color:Black"></asp:TextBox>
                                              </div>
                                              </div>
                                         <div class="form-group">
                                                  <label class="col-sm-2 control-label col-sm-2">内容</label>
                                                  <div class="col-sm-10">
                                                      <textarea class="form-control ckeditor" id="editor1" name="editor1" runat="server" rows="15"></textarea>
                                                  </div>
                                              </div>
                                      </div>
                                      <div class="form-group">
                                              <label class="col-sm-2 control-label col-sm-2">上传图片</label>
                                              <div class="col-sm-10">
                                                  	<div id="queue"></div>
		                                            <input id="file_upload" name="file_upload" type="file" multiple="true">
                                              </div>
                                     </div>
                                         <div class="form-group">
                                              <label class="col-sm-2 control-label col-sm-2"></label>
                                              <div class="col-sm-10" style=" text-align:center">
                                              <asp:TextBox ID="txtID" runat="server" Text="0" style="display:none"></asp:TextBox>
                                              <asp:TextBox ID="txtImg" runat="server" Text="0" style="display:none"></asp:TextBox> 
                                              <asp:Button runat="server" id="btnSubmit" runat="server" class="btn btn-danger" 
                                                      Text="提交" onclick="btnSubmit_Click" />
<%--                                              <button type="submit" runat="server" id="btnSubmit" class="btn btn-danger">提交</button>--%>
                                              </div>
                                              </div>
                                  </div>
                              </section>
                          </div>
                      </div>

                  </div>
              <!-- page end-->
          </section>
      </section>
      <!--main content end-->
  </section>

    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.scrollTo.min.js"></script>
    <script src="js/jquery.nicescroll.js" type="text/javascript"></script>

    <script src="js/jquery-ui-1.9.2.custom.min.js"></script>
    <script class="include" type="text/javascript" src="js/jquery.dcjqaccordion.2.7.js"></script>

  <!--custom switch-->
  <script src="js/bootstrap-switch.js"></script>
  <!--custom tagsinput-->
  <script src="js/jquery.tagsinput.js"></script>
  <!--custom checkbox & radio-->
  <script type="text/javascript" src="js/ga.js"></script>

  <script type="text/javascript" src="assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
  <script type="text/javascript" src="assets/bootstrap-daterangepicker/date.js"></script>
  <script type="text/javascript" src="assets/bootstrap-daterangepicker/daterangepicker.js"></script>
  <script type="text/javascript" src="assets/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
  <script type="text/javascript" src="assets/ckeditor/ckeditor.js"></script>
  <script type="text/javascript" src="assets/uploadify/jquery.uploadify.min.js"></script>

  <script type="text/javascript" src="assets/bootstrap-inputmask/bootstrap-inputmask.min.js"></script>
  <script src="js/respond.min.js" ></script>


  <!--common script for all pages-->
  <script src="js/common-scripts.js"></script>

  <!--script for this page-->
  <script src="js/form-component.js"></script>
    <script type="text/javascript">
        $(function () {
            var id = $("#txtID").val()
            $('#file_upload').uploadify({
                'swf': 'assets/uploadify/uploadify.swf',
                'uploader': 'Uploader.axd',
                'script': 'Uploader.axd',
                'fileTypeExts': '*.gif; *.jpeg; *.jpg; *.png',  
                'onUploadStart': function (file) {
                    $("#file_upload").uploadify("settings", "formData", { 'jqfgid': id });
                    //在onUploadStart事件中，也就是上传之前，把参数写好传递到后台。  
                },
                'onUploadSuccess': function (file, data, response) {
                    $("#txtImg").val($("#txtImg").val() + "," + data);
                }
            });
        });
	</script>
    </form>
  </body>
</html>