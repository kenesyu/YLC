<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZWXX.aspx.cs" Inherits="YLCWeb.ZWXX" %>

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
    <style>
        a.f_orange{ color:#FF9A00; text-decoration:none;}
        a.f_orange:link{ color:#FF9A00; text-decoration:none;}
        a.f_orange:visited{ color:#FF9A00; text-decoration:none;}
        a.f_orange:hover{ color:#cc0000; text-decoration:underline;}
        a.f_orange:actived{ color:#FF9A00; text-decoration:none;}
        a.f_green{color:#2c850d; text-decoration:none;}
        a.f_green:link{color:#2c850d; text-decoration:none;}
        a.f_green:visited{color:#2c850d; text-decoration:none;}
        a.f_green:hover{color:#999999; text-decoration:underline;}
        a.f_green:actived{color:#2c850d; text-decoration:none;}
        table#border{        }        table#border td{        border-bottom:#ebebeb 1px dashed;        height:30px;        vertical-align:middle;        }
    </style>
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
                            	<a href="#">景区风光</a>
                            </li>
                        	<li>
                            	<a href="zwxx.aspx?t=<%= URLConvert("景区要闻") %>">政务信息</a>
                            </li>
                        	<li>
                            	<a href="zcfg.aspx?id=1">政策法规</a>
                            </li>
                        	<li>
                            	<a href="#">在线互动</a>
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
                <div class="con_left_er">
                    <div class="px_l_share">
                        <h3>
                            <i>政务信息</i>
                        </h3>
                        <div class="px_con_er">
                            <ul>
                                <li><a href="ZWXX.aspx?t=<%= URLConvert("景区要闻") %>">景区要闻</a></li>
                                <li><a href="ZWXX.aspx?t=<%= URLConvert("招标公告") %>">招标公告 </a></li>
                                <li><a href="ZWXX.aspx?t=<%= URLConvert("工作简报") %>">工作简报 </a></li>
                                <li class="last"><a href="ZWXX.aspx?t=<%= URLConvert("政务动态") %>">政务动态</a></li>
                            </ul>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="con_right_er">
                    <h3>
                        <img src="img/icon_006.jpg">
                        <span>
                            <asp:Label ID="lblTitle" runat="server"></asp:Label></span>
                    </h3>
                    <div class="r_con_px">
                        <table width="100%" id="border" border="0" cellspacing="0">
                        <asp:Repeater ID="repList" runat="server" >
                            <ItemTemplate>
                            <tr>
                                <td width="80%"><a class="f_green" target="_blank" href='details.aspx?t=zwxx&id=<%# Eval("id") %>'><%# Eval("Title") %></a></td>
                                <td><%# Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy-MM-dd hh:mm:ss") %></td>
                            </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                        </table>
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
                    <span>技术支持：</span> <a href="#">大连易是网络科技有限公司</a> |
                </div>
            </div>
        </div>
    </div>
    <!-------------------------------------- 尾部开始 -------------------------------------->
</body>
</html>
