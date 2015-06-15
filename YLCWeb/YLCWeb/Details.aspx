<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="YLCWeb.Details" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <!--[if lt IE 9]>
		<script type="text/javascript" src="js/html5.js"></script>
		<![endif]-->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <!--
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">-->
    <title>大连国家级风景名胜区</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/basic.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/pages.css">
    <script type="text/javascript" src="js/base.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <!--plugin-->
    <script>
        $(function () {

        });
    </script>
</head>
<body>
    <!-------------------------------------- 头部开始 -------------------------------------->
    <div class="header">
        <div class="wrap share_style">
            <div class="head_index">
                <div class="ht30">
                </div>
                <div class="banner_head">
                    <div class="ban_l">
                        大连海滨—旅顺口风景名胜区
                    </div>
                </div>
                    <div class="head_menu">
                    	<ul>
                        	<li>
                            	<a href="index.aspx" class="cur">首页</a>
                            </li>
                        	<li>
                            	<a href="zngl.aspx?id=1">管理职能</a>
                            </li>
                        	<li>
                            	<a href="JQFG.aspx">景区风光</a>
                            </li>
                        	<li>
                            	<a href="zwxx.aspx?t=<%= URLConvert("景区要闻") %>">政务信息</a>
                            </li>
                        	<li>
                            	<a href="zcfg.aspx?id=1">政策法规</a>
                            </li>
                        	<li>
                            	<a href="MsgBoard.aspx">在线互动</a>
                            </li>
                        </ul>
                    </div>
            </div>
        </div>
    </div>
    <!-------------------------------------- 头部结束 -------------------------------------->
    <!-------------------------------------- 内容开始 -------------------------------------->
    <div class="mainer">
        <div class="wrap share_style">
            <div class="index_content1">
                <div class="ht10">
                </div>
                <div class="con_right_er1">
                    <div class="r_con_px" style="text-align: left">
                        <div class="ht30" style="text-align: center">
                            <b>
                                <asp:Label ID="lblTitle" Style="font-size: 14px;" runat="server"></asp:Label></b></div>
                        <div class="ht30" style="text-align: right">
                            <asp:Label ID="lblTime" runat="server"></asp:Label></div>
                        <asp:Label ID="lbldetails" runat="server"></asp:Label>
                        <div class="clear">
                        </div>
                        <div class="ht30">
                        </div>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
    </div>
    <!-------------------------------------- 内容结束 -------------------------------------->
    <!-------------------------------------- 尾部开始 -------------------------------------->
    <div class="footer">
        <div class="wrap share_style">
            <div class="foot_con">
                <div class="ht10">
                </div>
                <p>
                    ©2015 大连国家级风景名胜区 版权所有
                </p>
                <div class="ht10">
                </div>
                <div class="foot_px1">
                    <span>技术支持：</span> <a href="#">大连易是网络科技有限公司</a>
                </div>
            </div>
        </div>
    </div>
    <!-------------------------------------- 尾部开始 -------------------------------------->
</body>
</html>
