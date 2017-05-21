<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
      <META http-equiv=Content-Type content="text/html; charset=utf-8">
      <title>小白自媒体联盟</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
      <link rel="shortcut icon" href="/images/favicon.ico">

      <link rel="stylesheet" href="js/css/common.css?6_3">
	<link rel="stylesheet" href="js/css/index.css?6_3">
	<!--	
	<link rel="stylesheet" href="$homeModule.getTarget("alliance/css/ui/lanrenzhijia.css")">
	<link rel="stylesheet" href="$homeModule.getTarget("alliance/css/ui/forms.css")">
	-->
	<script src="js/js/jquery-1.8.3.min.js"></script>
	<script src="js/js/hotarticleinfo.js"></script>
	<!--
	<script src="$homeModule.getTarget("alliance/js/ui/jquery.imgbox.pack.js")"></script>
	-->
  </head>
   <body>
  <div class="alliance-header">
		<div class="header_1">
			<div class="head_nav">
				<ul>
					<li><a href="alliance/toAdvertisement.do"><i class="ad"></i>广告合作</a></li>
				</ul>
			</div>
		</div>
		<div class="header_2">
			<a href="/alliance/toIndex.do" class="logo"></a>
			<div class="back_nav">
			<a href="alliance/toIndex.do"><i class="back"></i>小白自媒体联盟</a>
			<!-- <a href="alliance/toIndex.do"><i class="home"></i>小白首页</a> -->
			<!-- <a href=""><i class="add"></i>广告加盟</a> -->
	</div>
		</div>
	</div>
<!-- content -->
<div class="alliance-container">
    <div class="alliance-box">
        <div class="cont-lists">
            <h2 class="bg-title t1"></h2>

            <div class="content-explain">
                <p>小白平台拥有高质量的内容、媒体和产品线，具有专业知识的专家达人群体在小白平台上开通自己的个人媒体频道，发布优质的制作内容，小白则通过宣传专业知识吸引用户流量，帮助自媒体化零为整承接大型广告获得收入，同时帮助自媒体运营渠道流量及媒体粉丝，复用运营资源以提高自媒体的粉丝粘性。</p>

                <p>小白目前已有二十多个此类大号。</p>

                <p>精准覆盖各类人群 500,000 人。</p>
            </div>
        </div>

         <div class="cont-lists">
            <h2 class="bg-title t2"></h2>

            <div class="content-case">
                <div class="case-show">
                    <div class="case-list clearfix">
                        <h3 class="case-tit">微信投放形式</h3>

                        <div class="cont">
                            <div class="info">
                                <p>广告展现形式范例一:</p>

                                <p>微信文章最后文字推荐</p>

                                <p>价格：￥1,000/账号 起</p>
                            </div>
                            <a href="javascript:void(0)" class="pic">
                                <img src="images/poster-images/wx1.jpg" alt="">
                            </a>
                        </div>
                        <div class="cont">
                            <div class="info">
                                <p>广告展现形式范例二:</p>

                                <p>微信文章底部图文+阅读原文链接</p>

                                <p>价格：￥3,000/账号 起</p>
                            </div>
                            <a href="javascript:void(0)" class="pic">
                                <img src="images/poster-images/wx2.jpg" alt="">
                            </a>
                        </div>
                        <div class="cont">
                            <div class="info">
                                <p>广告展现形式范例三:</p>

                                <p>当日微信整篇文章（第二篇）+正文推荐</p>

                                <p>价格：￥5,000/账号 起</p>
                            </div>
                            <a href="javascript:void(0)" class="pic">
                                <img src="images/poster-images/wx3.jpg" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="case-list clearfix">
                        <h3 class="case-tit">搜狐新闻投放形式</h3>

                        <div class="cont">
                            <div class="info">
                                <p>广告展现形式范例一:</p>

                                <p>搜狐文章最后文字推荐</p>

                                <p>价格：￥1,000/账号 起</p>
                            </div>
                            <a href="javascript:void(0)" class="pic">
                                <img src="images/poster-images/sh1.jpg" alt="">
                            </a>
                        </div>
                        <div class="cont">
                            <div class="info">
                                <p>广告展现形式范例二:</p>

                                <p>搜狐文章底部图文+阅读原文链接</p>

                                <p>价格：￥3,000/账号 起</p>
                            </div>
                            <a href="javascript:void(0)" class="pic">
                                <img src="images/poster-images/sh2.jpg" alt="">
                            </a>
                        </div>
                        <div class="cont">
                            <div class="info">
                                <p>广告展现形式范例三:</p>

                                <p>当日搜狐整篇文章（第二篇）+正文推荐</p>

                                <p>价格：￥5,000/账号 起</p>
                            </div>
                            <a href="javascript:void(0)" class="pic">
                                <img src="images/poster-images/sh3.jpg" alt="">
                            </a>
                        </div>
                    </div>
                    <div class="case-list clearfix">
                        <h3 class="case-tit">今日头条投放形式</h3>

                        <div class="cont">
                            <div class="info">
                                <p>广告展现形式范例一:</p>

                                <p>头条文章最后文字推荐</p>

                                <p>价格：￥1,000/账号 起</p>
                            </div>
                            <a href="javascript:void(0)" class="pic">
                                <img src="images/poster-images/tt1.jpg" alt="">
                            </a>
                        </div>
                        <div class="cont">
                            <div class="info">
                                <p>广告展现形式范例二:</p>

                                <p>头条文章底部图文+阅读原文链接</p>

                                <p>价格：￥3,000/账号 起</p>
                            </div>
                            <a href="javascript:void(0)" class="pic">
                                <img src="images/poster-images/tt2.jpg" alt="">
                            </a>
                        </div>
                        <div class="cont">
                            <div class="info">
                                <p>广告展现形式范例三:</p>

                                <p>当日头条整篇文章（第二篇）+正文推荐</p>

                                <p>价格：￥5,000/账号 起</p>
                            </div>
                            <a href="javascript:void(0)" class="pic">
                                <img src="images/poster-images/tt3.jpg" alt="">
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="cont-lists">
            <h2 class="bg-title t3"></h2>

            <div class="content-case">
                <div class="case-show clearfix">
                    <div class="clearfix">
                        <div class="vid">
                            <div class="bg-vid">
                                <a href="">
                                    <img src="images/poster-images/chaboguanggao.jpg" alt="">
                                </a>
                            </div>
                            <div class="v-info">
                                <a href="javascript:void(0)" class="add-btn">插播广告</a>

                                <p>开头结尾-赞助，合作价格：￥1，000/账号起.</p>
                            </div>
                        </div>
                        <div class="vid">
                            <div class="bg-vid">
                                <a href="javascript:void(0)">
                                    <img src="images/poster-images/bansuiguanggao.jpg" alt="">
                                </a>
                            </div>
                            <div class="v-info">
                                <a href="javascript:void(0)" class="add-btn">伴随广告</a>

                                <p>伴随广告价格：￥2，000/账号 起.</p>
                            </div>
                        </div>
                    </div>
                    <div class="dz">
                        <h2>视频定制，推广请直接联系商务合作</h2>
                    </div>
                </div>
            </div>
        </div>
        <div class="cont-lists">
            <h2 class="bg-title t4"></h2>

            <div class="content-marke">
                <div class="marke-show">
                    <div class="clearfix">
                        <div class="marke-list">
                            <h3>CPA</h3>

                            <p>网站注册量计费</p>
                        </div>
                        <div class="marke-list">
                            <h3>CPC</h3>

                            <p>网站流量计费</p>
                        </div>
                        <div class="marke-list">
                            <h3>CPM</h3>

                            <p>网站显示计费</p>
                        </div>
                    </div>
                    <div class="coop">
                        <h4>合作单位</h4>
                        <img src="js/images/coop-img.png" alt="">
                    </div>
                </div>
            </div>
            <style>

            </style>
        </div>
    </div>

</div><!-- /content -->
<div class="alliance-footer">
		<div class="foot clearfix">
			<div class="left page-info">
				<h1>联系我们</h1>
				<p><em><span>商务合作：</span>田宝超</em><em><span>邮箱：</span>tianbaochao@pezy.cn</em></p>
				<p>京ICP备14030910号-1 </p>
			</div>
			<div class="right scan">
				<img src="images/media-images/xiaobai_bk.jpg" alt="">
				<p>微信号：xiaobai_bk</p>
				<p>扫一扫关注微信号</p>	
			</div>
		</div>
	</div>


  </body>
</html>