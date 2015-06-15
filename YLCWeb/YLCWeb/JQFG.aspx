<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JQFG.aspx.cs" Inherits="YLCWeb.JQFG" %>
<!DOCTYPE html>
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

        <link href="/js/plugSlider/flexslider.css" rel="stylesheet" />
        <script type="text/javascript" src="/js/plugSlider/jquery.flexslider-min.js"></script>
        <script type="text/javascript" src="/js/plugSlider/modernizr.js"></script>

		<!--plugin-->
		<script>
		    $(function () {
		        $(window).load(function () {
		            $('.flexslider').flexslider({
		                animation: "slide"
		            });
		        });
		    });
		</script>
        <style id="stylemodule">
            #module349 {border:none;}
            #module349 {padding:0px;}
            #module349 .formMiddle349{border:none;}
            #module349 .formMiddle349{padding:0px;}
            #module349 .formMiddle349 .formMiddleCenter349{border:none;}
            #module349 .formMiddle349 .formMiddleCenter349{padding:0px;}
            #module349 .formTop349{display:none;}
            #module349 .formBottom349{display:none;}
            #module349 .formMiddle349 .formMiddleLeft349{display:none;}
            #module349 .formMiddle349 .formMiddleRight349{display:none;}
            #module349 .formBanner349{display:none;}
            #module349 .formMiddleContent349{padding:0px;}
            #module349 .formMiddleContent349{margin-left:10px;}
            #module349 .formMiddleContent349{margin-right:10px;}
            #module349 .formMiddleContent349{margin-top:0px;}
            #module349 .formMiddleContent349{margin-bottom:20px;}
            #module349 {background:none;}
            #module349 .formMiddle349 {background:none;}
            #module349 .formMiddle349 .formMiddleCenter349{background:none;}
            #module349 .formMiddleContent349{background:none;}
            </style>
	</head>
	<body>
		<!-------------------------------------- 头部开始 -------------------------------------->
		<div class="header">
			<div class="wrap share_style">
            	<div class="head_index">
                    <div class="ht30"></div>
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
                	<div class="ht10"></div>
                	<div class="con_left_er">
                        <div class="px_l_share">
                            <h3>
                                <i>景区列表</i>
                                </h3>
                            <div class="px_con_er">
                                <ul>
                                    <asp:Repeater ID="repMenu" runat="server">
                                    <ItemTemplate>
                                    <li>
                                        <a href="JQFG.aspx?id=<%# Eval("id") %>">
                                            <%# Eval("Title") %>
                                        </a>
                                    </li>
                                    </ItemTemplate>
                                    </asp:Repeater>              
                                </ul>
                                <div class="clear"></div>
                            </div>
                        </div>
                    </div>
                    <div class="con_right_er">
                    	<h3>
                        	<img src="img/icon_006.jpg">
                            <span><asp:Label ID="lblTitle" runat="server"></asp:Label></span>
                        </h3>
                        <div class="r_con_px">
                        	<div class="ht30"></div>
                        	<asp:Label ID="lblDetails" runat="server"></asp:Label>
                            <div class="ht400">
                               <div class="detail-content-img flexslider">
                                    <ul class="slides">
                                        <asp:Repeater runat="server" ID="repImgList">
                                        <ItemTemplate>
                                        <li>
                                            <img width="697px" height="299px" src="/Upload/<%# Eval("NewName") %>" class="ps" />
                                        </li>
                                        </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                            <div class="clear"></div>
                            <div class="ht30"></div>
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
                
			</div>
		</div>
		<!-------------------------------------- 内容结束 -------------------------------------->
		<!-------------------------------------- 尾部开始 -------------------------------------->
		<div class="footer">
			<div class="wrap share_style">
				<div class="foot_con">
                    <div class="ht10"></div>
                    <p>
                    	©2015 大连国家级风景名胜区 版权所有
                    </p>
                    <div class="ht10"></div>
                	<div class="foot_px1">
                    	<span>技术支持：</span>
                    	<a href="#">大连易是网络科技有限公司</a> |
                    </div>
                </div>
			</div>
		</div>
		<!-------------------------------------- 尾部开始 -------------------------------------->
	</body>
</html>