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
		</div>
	</div>
<div class="alliance-container">
    <ul class="alliance-list">
        <li>
            <h2 class="title e_tit1"></h2>

            <div class="content">
                <p>
                    小白自媒体联盟成立于2014年，致力于打造国内最好的生活百科类自媒体平台，内容涵盖了母婴、育儿、健身、健康、太极拳、传统武术、理财、职业技能、汽车等多领域，旨在为大众提供全面而实用的生活小窍门，涨知识又不乏味的文章集锦。</p>

                <p>
                    小白平台拥有高质量的内容、媒体和产品线，具有专业知识的专家达人群体在小白平台上开通自己的个人媒体频道，发布优质的制作内容，小白则通过宣传专业知识吸引用户流量，帮助自媒体化零为整承接大型广告获得收入，同时帮助自媒体运营渠道流量及媒体粉丝，复用运营资源以提高自媒体的粉丝粘性。</p>

                <p>小白，原意为新手、菜鸟，而此小白非彼小白，小白自媒体联盟全力帮助生活菜鸟进阶为生活达人，我们期待您的加入，耕耘出专属于自己的收入！</p>
            </div>
        </li>

        <li>
            <h2 class="title e_tit2"></h2>

            <div class="content clearfix">
                <div class="left">
                    <p class="e_2">加入联盟：</p>

                    <p class="e_2">请发送您的个人联系方式、自媒体账号logo、二维码、以及一段简短的介绍至<span>xiaobai@pezy.cn</span>我们的工作人员会与您取得联系!</p>

                    <p class="e_2">了解联盟：</p>

                    <p class="e_2">关注小白自媒体联盟微信公众平台，公众平台会每天推送有价值的信息！扫右侧二维码。</p>
                </div>
                <div class="right vip">
                    <img src="images/media-images/xiaobai_bk.jpg" alt="">

                    <p>小白自媒体联盟</p>

                    <p>微信号：xiaobai_bk</p>
                </div>
            </div>
        </li>

        <li>
            <h2 class="title e_tit3"></h2>
            <c:forEach items="${mediaList}" var="medias">
                    <div class="content member clearfix">
                        <a target="_blank"
                           href="alliance/toAllianceDetailePage.do?mediaId=${medias.mediaId}"
                           class="pic">
                            <img src="${medias.mediaPortrait}" width="105px" height="105px" alt="">
                        </a>

                        <div class="cont-list">
                            <a target="_blank" href="alliance/toAllianceDetailePage.do?mediaId=${medias.mediaId}">
                                <strong>${medias.mediaName}</strong>
                            </a>

                            <div class="abstract">
                                <p>${medias.mediaMaterials}</p>
                            </div>
                        </div>
                        <div class="right info">
                            <img src="${medias.twoDimensionCode}" alt="">
                            <c:if test="${medias.weixinPubilc != null and medias.weixinPubilc != ''}">
                            <p>微信号:<span>${medias.weixinPubilc}</span></p>
                            </c:if>
                        </div>
                    </div>
              </c:forEach>
        </li>


        <li>
            <h2 class="title e_tit4"></h2>

            <div class="cooperation clearfix">
                <div class="left">
                    <div class="pic">
                        <img src="/js/images/fg.png" alt="">
                    </div>
                    <p class="state">
                        福光百科·以华人用户为基础，着眼世界；长期专注于生活类、教育类音像节目的策划、拍摄制作及营销推广，以大量深受群众喜爱的强势产品为基础，树立了中国音像行业本土最具影响力的“百科全书”知名品牌。</p>
                </div>
                <div class="right">
                    <div class="pic">
                        <img src="/js/images/ucg.png" alt="">
                    </div>
                    <p class="state">
                        游戏机实用技术·创刊于1998年，是由国家新闻出版署批准出版的国内外公开发行的科普类期刊。依托GameSpot的专业资源，专注于游戏机游戏的大型全彩半月刊，以快速的资讯，优秀的攻略，精彩的专题，客观的立场，亲切的编辑，一流的印刷，成为游戏迷的首选杂志。由专业的游戏迷通过专业的杂志制作传播专业的游戏资讯！</p>
                </div>
            </div>
        </li>
    </ul>
</div>
<div class="alliance-footer">
		<div class="foot clearfix">
			<div class="left page-info">
				<h1>联系我们</h1>
				<p><em><span>商务合作：</span>田宝超</em><em><span>邮箱：</span>tianbaochao@pezy.cn</em></p>
				<p>京ICP备14030910号-1 </p>
			</div>
			<div class="right scan">
				<img src="/images/media-images/xiaobai_bk.jpg" alt="">
				<p>微信号：xiaobai_bk</p>
				<p>扫一扫关注微信号</p>	
			</div>
		</div>
	</div>


  </body>
</html>
