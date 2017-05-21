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
					<li><a href="alliance/toAdvertisement.do?mediaId=${media.mediaId }"><i class="ad"></i>广告合作</a></li>
				</ul>
			</div>
		</div>
		<div class="header_2">
			<a href="/alliance/toIndex.do" class="logo"></a>
		</div>
	</div>
<!-- content -->
<div class="alliance-container">
    <div class="alliance-box">
        <div class="cont-lists">
            <div class="big-title read-tit">
                <h2>${media.mediaName }<span>Economic morning reading</span></h2>
            </div>
            <div class="content clearfix">
                <div class="introduce">
                    <p>${media.mediaMaterials }</p>
                </div>
                <div class="right">
                    <img src="${media.twoDimensionCode }" alt="">
                    <!-- <p>小白自媒体联盟</p> -->
                    <p>微信号：${media.weixinPubilc }</p>
                </div>
            </div>
        </div>
        <c:forEach items="${statisticsMediaList }" var="statisticsMedias">
        <div class="cont-lists">
            <div class="big-title">
                <h2 class="tit">阅读流量</h2>
            </div>
            <div class="content padding-0 clearfix">
                <div class="data-l">
                    <p>累计阅读量：<span>${statisticsMedias.readNum }</span></p>
                </div>
                <div class="data-r">
                    <p>较昨日增长：<span>${statisticsMedias.newReadNum}</span></p>
                </div>
            </div>
			<c:if test="${fn:length(allianceHotArticleList) > 0 }">
            <div class="content padding-0 clearfix" style="position: relative;">
				<div class="data-slide">
				    <div class="ibox">
				        <div class="showbox">
				            <ul>
				            <c:forEach items="${allianceHotArticleList }" var="allianceHotArticles">
				                <li>
				                	<h2 class="big-t"></h2>
				                	<div>
				                		<p class="t">文章标题</p>
				                		<p class="i">${allianceHotArticles.hotArticleName}</p>
				                		<p class="b">曝光量：${allianceHotArticles.exposureNum }</p>
				                		<p class="y">阅读量：${allianceHotArticles.readNum }</p>
				                	</div>
				                	<%--<a href="${allianceHotArticles.hotArticleLink }" class="c">查看原文</a>--%>
				                </li>
				            </c:forEach>
				            </ul>
				        </div>
				    </div>
					<div class="btnbox">
						<span class="pre">&laquo;向左</span>
						<span class="next">向右&raquo;</span>
					</div>
				</div>
			</div>
			</c:if>
        </div>
        </c:forEach>
        <div class="cont-lists">
            <div class="big-title">
                <h2 class="tit">流量大数据</h2>
            </div>
            <div class="content padding-0 clearfix">
                <div class="computer">
                   <!--<img src="$homeModule.getTarget("alliance/images/computer.png")" alt="">-->
                         						
                        
                    <div class="showdata">
							<c:forEach items="${alliancePictureList}" var="alliancePictures">
                            		<c:if test="${alliancePictures.weight=='1'}">
                            			<a href="alliance/toAllianceDetailePage.do?mediaId=${alliancePictures.mediaId }">
                             			<img src="${alliancePictures.pictureUrl}" alt="">
                             			</a>
                             		</c:if>
                             </c:forEach>
					</div>
					
					
                </div>
                <div class="pic-list">
                    <ul class="beyond clearfix">
                       <c:forEach items="${alliancePictureList}" var="alliancePictures">
                            <c:if test="${alliancePictures.weight>'1' }">
                                <li>
                                    <a href="${alliancePictures.pictureUrl}">
                                        <img src="${alliancePictures.pictureUrl}" alt="">
                                    </a>

                                    <p>${alliancePictures.description}</p>
                                </li>
                           </c:if>
                       </c:forEach>
                    </ul>
                </div>
            </div>
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

