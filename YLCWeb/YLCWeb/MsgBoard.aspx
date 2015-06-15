<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgBoard.aspx.cs" Inherits="YLCWeb.MsgBoard" %>

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
        a.f_orange
        {
            color: #FF9A00;
            text-decoration: none;
        }
        a.f_orange:link
        {
            color: #FF9A00;
            text-decoration: none;
        }
        a.f_orange:visited
        {
            color: #FF9A00;
            text-decoration: none;
        }
        a.f_orange:hover
        {
            color: #cc0000;
            text-decoration: underline;
        }
        a.f_orange:actived
        {
            color: #FF9A00;
            text-decoration: none;
        }
        a.f_green
        {
            color: #2c850d;
            text-decoration: none;
        }
        a.f_green:link
        {
            color: #2c850d;
            text-decoration: none;
        }
        a.f_green:visited
        {
            color: #2c850d;
            text-decoration: none;
        }
        a.f_green:hover
        {
            color: #999999;
            text-decoration: underline;
        }
        a.f_green:actived
        {
            color: #2c850d;
            text-decoration: none;
        }
        table#border
        {
        }
        table#border td
        {
            border-bottom: #ebebeb 1px dashed;
            height: 30px;
            vertical-align: middle;
        }
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
                <div class="con_left_er">
                    <div class="px_l_share">
                        <h3>
                            <i>联系方式</i>
                        </h3>
                        <div class="px_con_er">
                            <ul>
                                <li>风景园林处-办公室：83684091</li>
                                <li>大型活动办-办公室：83698626</li>
                                <li>劳动公园-办公室： 83645363</li>
                                <li>绿山游乐场-办公室： 83695406</li>
                                <li>东海公园-办公室： 82731548</li>
                                <li>燕窝岭管理处： 82401304</li>
                                <li>付家庄公园-办公室：82400574</li>
                                <li>星海公园-办公室：84692514</li>
                                <li>地址：大连市中山区解放路5号</li>
                                <li>邮编：116001</li>
                            </ul>
                            <div class="clear">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="con_right_er">
                    <h3>
                        <img src="img/icon_006.jpg">
                        <span>留言板</span>
                    </h3>
                    <div class="r_con_px">
                        <p>
                            发表您的留言：</p>
                        <form runat="server" id="form1" onsubmit="return checksubmit()">
                        <table width="100%" id="border" border="0" cellspacing="0">
                            <tr>
                                <td>
                                    姓名：<input type="text" maxlength="50" id="txtName" runat="server">
                                </td>
                                <td>
                                    电子邮件：<input type="text" maxlength="150" id="txtemail" runat="server">
                                </td>
                                <td>
                                    联系电话：<input type="text" maxlength="15" id="txttel" runat="server">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" style="vertical-align: text-top">
                                    留言：<textarea runat="server" rows="8" id="txtMessage" style="width: 656px"></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <asp:Button Text="提交" runat="server" ID="btnSubmit" OnClick="btnSubmit_Click" />
                                </td>
                            </tr>
                        </table>
                        <script>
                            function checksubmit() {
                                var flag = true;
                                if ($("#txtName").val() == "") {
                                    alert("请输入姓名")
                                    return false;
                                }
                                if ($("#txtemail").val() == "") {
                                    alert("请输入Email")
                                    return false;
                                }
                                if ($("#txttel").val() == "") {
                                    alert("请输入联系方式")
                                    return false;
                                }
                                if ($("#txtMessage").val() == "") {
                                    alert("请输入留言")
                                    return false;
                                }
                                return flag;
                            }
                        </script>
                        </form>
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
