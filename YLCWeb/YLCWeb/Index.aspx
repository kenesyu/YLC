<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="YLCWeb.Index" %>

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
	<body class="index_bg">
		<!-------------------------------------- 头部开始 -------------------------------------->
		<div class="header">
			<div class="wrap share_style">
            	<div class="head_index">
                    <div class="ht30"></div>
                    <div class="banner_head">
                        <div class="ban_l">
                            大连海滨—旅顺口风景名胜区
                        </div>
                        <div class="date_head" id="time">
                            
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
                
                	<div class="con_left_b">
                        <div class="ht10"></div>
                        <div class="left_line_px1">
                            <div class="px_l_share">
                                <h3>
                                    <i>招标公告</i>
                                    <b><a href="#">更多&gt;&gt;</a></b>
                                </h3>
                                <div class="px_con">
                                	<ul>
                                        <asp:Repeater ID="repZhaobiaogonggao" runat="server">
                                            <ItemTemplate>
                                               <li>
                                        	        <a target="_blank" href="details.aspx?t=ZWXX&id=<%# Eval("id") %>">
                                           		        <i><%# Eval("Title") %></i>
                                                        <b><%# Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy-MM-dd") %></b>
                                                    </a>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="left_line_px2">
                        	<div class="ht10"></div>
                            <div class="px_l_share">
                                <h3>
                                    <i>管理登录</i>
                                </h3>
                                <div class="px_con1">
                                	<div class="ht25"></div>
                                	<form runat="server">
                                    	<input type="text" class="box text" id="username" runat="server" placeholder="用户名">
                                    	<input type="password" class="box password" id="password" runat="server" placeholder="密码">
                                        <asp:Button ID="btnLogin" runat="server" class="sub" Text="登录" 
                                            onclick="btnLogin_Click" />
   
                                    </form>
                                </div>
                            </div>
                    	</div>
                        <div class="ht10"></div>
                        <div class="left_line_px3">
                            <div class="px_l_share">
                                <h3>
                                    <i>友情链接</i>
                                </h3>
                                <div class="px_con3">
                                	<div class="ht10"></div>
                                	<ul>
                                    	<li>
                                        	<a href="#">住建部</a>
                                        </li>
                                        <li>
                                        	<a href="#">辽宁省住建厅</a>
                                        </li>
                                        <li>
                                        	<a href="#">大连市城建局</a>
                                        </li>
                                        <li>
                                        	<a href="#">旅顺口区人民政府</a>
                                        </li>
                                        <li>
                                        	<a href="#">老虎滩海洋公园</a>
                                        </li>
                                        <li>
                                        	<a href="#">森林动物园</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                    	</div>
                    </div>
                    <div class="con_right_b">
                    	<div class="ht10"></div>
                        <div class="right_line_px1">
                            <div class="line1_l box1">
                                <h3>
                                    <span>图片新闻</span>
                                </h3>
                                <div class="box_swf box_swf_scr">
                                	<img src="img/img_b.jpg" width="100%">
                                	<img src="img/img_b.jpg" width="100%">
                                	<img src="img/img_b.jpg" width="100%">
                                	<img src="img/img_b.jpg" width="100%">
                                	<img src="img/img_b.jpg" width="100%">
                                </div>
                                <script>
                                    $(function () {
                                        ; (function () {
                                            xulin_banner($('.box_swf_scr'));
                                        })();
                                    });
								</script>
                            </div>
                            <div class="line1_r box1">
                                <h3>
                                    <span>景区要闻</span>
                                    <a href="#">more&gt;&gt;</a>
                                </h3>
                                <ul>
                                    <asp:Repeater ID="repjingquyaowen" runat="server">
                                    <ItemTemplate>
                                     <li>
                                        <a target="_blank" href="details.aspx?t=ZWXX&id=<%# Eval("id") %>">
                                        	<i><%# Eval("Title") %></i>
                                            <b><%# Convert.ToDateTime(Eval("CreateTime")).ToString("yyyy-MM-dd") %></b>
                                        </a>
                                    </li>
                                    </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                            <div class="clear"></div>
                        </div>
                        <div class="ht10"></div>
                        <div class="right_line_px2">
                        	<h3>
                            	<span>名胜区各景区图片展示</span>
                            </h3>
                            <div class="ht20"></div>
                            <div class="product_img product_img_scr">
                            	<img src="img/img_s1.jpg">
                            	<img src="img/img_s2.jpg">
                            	<img src="img/img_s3.jpg">
                            	<img src="img/img_s1.jpg">
                            </div>
							<script>
							    $(function () {
							        ; (function () {
							            xulin_product($('.product_img_scr'));
							        })();
							    });
                            </script>
                        </div>
                        <div class="ht10"></div>
                        <div class="right_line_px3">
                        	<h3>
                            	<span>名胜区地理位置图</span>
                            </h3>
                            <div class="map">
                            	<img src="img/map.jpg">
                            </div>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="ht10"></div>
                </div>
                
			</div>
		</div>
		<!-------------------------------------- 内容结束 -------------------------------------->
		<!-------------------------------------- 尾部开始 -------------------------------------->
		<div class="footer">
			<div class="wrap">
				<div class="foot_con">
                	<div class="ht20"></div>
                    <div class="ht10"></div>
                    <p>
                    	©2015 大连国家级风景名胜区 版权所有
                    </p>
                    <div class="ht10"></div>
                	<div class="foot_px1">
                    	<span>技术支持：</span>
                    	<a href="#">大连易是网络科技有限公司</a>
                    </div>
                </div>
			</div>
		</div>
		<!-------------------------------------- 尾部开始 -------------------------------------->
	</body>
</html>
<style>

</style>
<script>
    function getDateDemo() {
        var myDate = new Date();
        var year = myDate.getFullYear();
        var month = myDate.getMonth() + 1;
        var date = myDate.getDate();
        var hours = myDate.getHours();
        var minutes = myDate.getMinutes();
        var seconds = myDate.getSeconds();

        //月份的显示为两位数字如09月  
        if (month < 10) {
            month = "0" + month;
        }
        if (date < 10) {
            date = "0" + date;
        }
        var dateTime = year + "年" + month + "月" + date + "日" + hours + "时" + minutes + "分" + seconds + "秒";
        var divNode = document.getElementById("time");
        divNode.innerHTML = dateTime;
    }
    window.setInterval("getDateDemo()", 1000); //每隔1秒，调用一次getDateDemo()  
</script>  