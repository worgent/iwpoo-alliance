<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>Basic CRUD Application - jQuery EasyUI CRUD Demo</title>
    <script src="jquery-easyui-1.4.2/jquery.min.js" type="text/javascript"></script>
    <script src="jquery-easyui-1.4.2/jquery.easyui.min.js" type="text/javascript"></script>
    
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.2/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.2/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.2/themes/color.css">	
    	
	  <script type="text/javascript">
	        var url;
	        function addHotArticle(){
	        	var mediaId = $("#dgMediaId").val();
	               $('#fmMediaId').textbox('setValue',mediaId);
	               $('#fmMediaId').textbox({editable:false});
		         $('#dlg').dialog('open').dialog('setTitle','添加热门文章');
		            url = 'alliance/saveHotArticle.do';
	        }
	        function editHotArticle(){
	            var row = $('#dg').datagrid('getSelected');
	            
	            if (row){
		            var id = row.id;
		            var mediaId = row.mediaId;
		            var hotArticleName = row.hotArticleName;
		            var exposureNum = row.exposureNum;
		            var readNum = row.readNum;
		            var hotArticleLink = row.hotArticleLink;
	                $('#dlg').dialog('open').dialog('setTitle','修改热门文章');
	                $("#fmId").val(id);
	                $('#fmMediaId').textbox('setValue',mediaId);
	                $('#fmMediaId').textbox({editable:false});
	                $('#fmHotArticleName').textbox('setValue',hotArticleName);
	                $('#fmExposureNum').textbox('setValue',exposureNum);
	                $('#fmReadNum').textbox('setValue',readNum);
	                $('#fmHotArticleLink').textbox('setValue',hotArticleLink);
	               // $('#fm').form('load',row);
	                url = 'alliance/updateHotArticle.do';
	            }else{
	            	jQuery.messager.alert('提示', '请选择要修改的记录', 'error');  
	            }
	        }
	        //var randomNu = (new Date().getTime()) ^ Math.random();
	     
	        function saveHotArticle(){
	            $('#fm').form('submit',{
	                url: url,
	                onSubmit: function(){
	                    return $(this).form('validate');
	                },
	                
	                success: function(result){
	                    if (result=="0"){
	                    	jQuery.messager.show({
								title: '提示',
								msg: '失败，请检查填写内容或与管理员联系'
							});
						} else {
							$('#dlg').dialog('close');		// close the dialog
							alert("成功");
							location.reload();
						}
	                },
	             
	            });
	        }
	        
	        function destroyHotArticle(){
	            
	            var row = $('#dg').datagrid('getSelected');  
	       		if(row){  
	            jQuery.messager.confirm('Confirm','Are you sure you want to remove this user?',function(option){  
	            	if(option){  
	                    
	                    //console.info(row.id);  
	                    jQuery.ajax({
	                        url : 'alliance/deleteHotArticle.do',
	                        data:{
									hotArticleId:row.id
								},
	                        dataType : 'json',
	                        success: function(result){
	                        	if(result == "0"){
	                        		$.messager.show({
	                                    title: '提示',
	                                    msg: "失败"
	                                });
	                                
	                        	}else{
	                        		alert("成功");
	                        		location.reload();
	                        	}
		             		} 
	                     });
		             }  
		        });  
		        }else{  
		            jQuery.messager.alert('提示', '请选择要删除的记录', 'error');  
		        }
	           
	        }
		    
		    function back(){
	    		window.location.href="alliance/toAllianceAdminPage.do";
	    		
	    	}
		    
		    
	  </script>
	  <style type="text/css">
	        #fm{
	            margin:0;
	            padding:10px 30px;
	        }
	        .ftitle{
	            font-size:14px;
	            font-weight:bold;
	            padding:5px 0;
	            margin-bottom:10px;
	            border-bottom:1px solid #ccc;
	        }
	        .fitem{
	            margin-bottom:5px;
	        }
	        .fitem label{
	            display:inline-block;
	            width:80px;
	        }
	        .fitem input{
	            width:160px;
	        }
	       
	  </style>  	
    	
    	
  
</head>
<body>
	<div class="demo-info" style="margin-bottom:10px">
		<div class="demo-tip icon-tip"></div>
	</div>
	
	<div class="easyui-layout" style="width:100%;height:800px;">
		<div data-options="region:'north'" style="overflow:hidden;padding:10px">
			<h2><center>热门文章管理</center></h2>
		</div>
		<!-- 中间热文信息操作部分 -->
		<div data-options="region:'center',title:'Main Title'" style="background:#fafafa;overflow:hidden">
			<table id="dg" title="" class="easyui-datagrid" style="width:100%;height:750px;"
			    toolbar="#toolbar" 
			    fitColumns="true" singleSelect="true">
		        <thead>
		            <tr>
		            	<th field="id" width="50">id</th>
		            	<th field="mediaId" width="50">媒体id</th>
		                <th field="hotArticleName" width="50">文章标题</th>
		                <th field="exposureNum" width="50">曝光量</th>
		                <th field="readNum" width="50">阅读量</th>
		                <th field="hotArticleLink" width="50">原文链接</th>
		            </tr>
		        </thead>
		       <!--  <input id="dgMediaId" type="text"> -->
		       		<c:forEach items="${allianceHotArticleList }" var="hotArticles">
		       		<input id="dgMediaId" type="hidden" value="${hotArticles.mediaId }">
                			<tr>	
                				<td align="center">${hotArticles.id }</td>
								<td align="center">${hotArticles.mediaId }</td>
								<td align="center">${hotArticles.hotArticleName }</td>
								<td align="center">${hotArticles.exposureNum }</td>
								<td align="center">${hotArticles.readNum }</td>
								<td align="center">${hotArticles.hotArticleLink }</td>
							</tr>
					</c:forEach>
		    </table>
		    <div id="toolbar">
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addHotArticle()">添加</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editHotArticle()">修改</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyHotArticle()">删除</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" plain="true" onclick="back()">返回</a>
		    </div>
		</div>
	</div>
	<div id="dlg" class="easyui-dialog" style="width:400px;height:280px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">热门文章信息</div>
        <form id="fm" method="post" novalidate>
        	 	<!-- 热门文章ID -->
        	<div class="fitem">
                <input id="fmId" name="id" readonly="true" type="hidden">
            </div>
            <div class="fitem">
                <label>媒体ID:</label>
           		<input id="fmMediaId" name="mediaId" class="easyui-textbox">
        	</div>
            <div class="fitem">
                <label>文章标题:</label>
                <input id="fmHotArticleName" name="hotArticleName" class="easyui-textbox" required="true">
            </div>
            <div class="fitem">
                <label>曝光量:</label>
                <input id="fmExposureNum" name="exposureNum" class="easyui-numberbox" required="true" missingMessage="请填写数字">
            </div>
            <div class="fitem">
                <label>阅读量:</label>
                <input id="fmReadNum" name="readNum" class="easyui-numberbox" required="true" missingMessage="请填写数字">
            </div>
            <div class="fitem">
                <label>原文链接:</label>
                <input id="fmHotArticleLink" name="hotArticleLink" class="easyui-textbox" required="true" validtype="url" invalidMessage="url格式不正确[http://www.example.com]">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveHotArticle()" style="width:90px">Save</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">Cancel</a>
    </div>
</body>
</html>