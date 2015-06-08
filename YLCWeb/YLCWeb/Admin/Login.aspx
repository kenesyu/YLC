﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="YLCWeb.Admin.Login" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>登陆</title>

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

  <body class="login-body">

    <div class="container">

      <form class="form-signin" onsubmit="return checkLogin()" runat="server">
        <h2 class="form-signin-heading">系统管理</h2>
        <div class="login-wrap">
            <input type="text" class="form-control" runat="server" id="username" placeholder="用户名" autofocus>
            <input type="password" class="form-control" runat="server" id="password" placeholder="密码">
            <asp:Button class="btn btn-lg btn-login btn-block" ID="btnLogin" runat="server" 
                Text = "登陆" onclick="btnLogin_Click"/>
        </div>
      </form>
    </div>
    <!-- js placed at the end of the document so the pages load faster -->
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script>
        function checkLogin() {
            if ($("#username").val() == "" || $("#password").val() == "") {
                alert("用户名或密码不能为空")
                return false;
            }
            return true;
        }
    </script>
  </body>
</html>
    