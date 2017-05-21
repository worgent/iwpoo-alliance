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
    <style>
    /* .datagrid-header-row{
    		/* background-color:blue;color:#fff, */
    		font-size:36px
    	} */
    </style>
</head>
<body>
    <h2>媒体信息管理</h2>
    
    <table id="dg" title="My Users" class="easyui-datagrid" data-options="nowrap:false" style="width:100%;height:700px"
            url="get_users.php"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
            	<th field="id" width="15">媒体ID</th>
                <th data-options="field:'mediaPortrait',width:45,formatter:imgFormatter">头像</th>
                <th field="mediaName" width="35">名称</th>
                <th field="phone" width="35">电话</th>
                <th field="identityCard" width="35">身份证</th>
                <th field="mediaMaterials" width="50">简介</th>
                <th field="weixinPubilc" width="35">微信号</th>
                <th data-options="field:'twoDimensionCode',width:50,formatter:imgFormatter">二维码</th>
                <th field="status" width="10">状态</th>
                <th field="weight" width="10">权重</th>
            </tr>
        </thead>
        <c:forEach items="${mediaList }" var="medias">
        	<tr>
        		<td align="center">${medias.mediaId}</td>
                <td align="center">${medias.mediaPortrait}</td>
				<td align="center">${medias.mediaName}</td>
				<td align="center">${medias.phone}</td>
				<td align="center">${medias.identityCard}</td>
				<td align="center">${medias.mediaMaterials}</td>
				<td align="center">${medias.weixinPubilc}</td>
				<td align="center">${medias.twoDimensionCode}</td>
				<td align="center">${medias.status}</td>
				<td align="center">${medias.weight}</td>
			</tr>
		</c:forEach>
		
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addMedia()">添加媒体</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editMedia()">修改媒体</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyMedia()">删除媒体</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" plain="true" onclick="toHotArticlePage()">热门文章操作</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" plain="true" onclick="toAlliancePicturePage()">修改图片</a>
         <a href="javascript:void(0)" class="easyui-linkbutton" plain="true" onclick="editStatisticsMedia()">修改媒体统计</a>
    </div>
    <!-- <div id="staToolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addMedia()">添加媒体</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" plain="true" onclick="editStatisticsMedia()">修改媒体统计</a>
    </div> -->
    
    <div id="dlg" class="easyui-dialog" style="width:400px;height:500px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">User Information</div>
        <form id="fm" method="post" novalidate enctype="multipart/form-data">
        	<div class="fitem">
                <input id="fmId" name="id" readonly="true" type="hidden">
            </div>
            
            <div class="fitem">
                <label>头像:</label>
                <input id="mediaPortraitId" name="mediaPortrait" class="easyui-filebox" buttonText="选择图片">
            </div>
            <div class="fitem">
                <label>名称:</label>
                <input id="mediaNameId" name="mediaName" class="easyui-textbox" required="true" missingMessage="请填写名称">
            </div>
            <div class="fitem">
                <label>电话:</label>
                <input id="phoneId" name="phone" class="easyui-textbox">
            </div>
            <div class="fitem">
                <label>身份证:</label>
                <input id="identityCardId" name="identityCard" class="easyui-textbox">
            </div>
            <div class="fitem">
                <label>简介:</label>
                <input id="mediaMaterialsId" name="mediaMaterials" class="easyui-textbox" required="true" missingMessage="请填写简介">
            </div>
            <div class="fitem">
                <label>微信号:</label>
                <input id="weixinPublicId" name="weixinPublic" class="easyui-textbox">
            </div>
            <div class="fitem">
                <label>二维码:</label>
               <input id="twoDimensionCodeId" name="twoDimensionCode" class="easyui-filebox" buttonText="选择图片">
            </div>
            <div class="fitem">
                <label>状态:</label>
                <input id="statusId" name="status" class="easyui-numberbox" min="0" max="1" required="true" missingMessage="请填写数字(只能填写0或1;0显示，1不显示)">
            </div>
            <div class="fitem">
                <label>权重:</label>
                <input id="weightId" name="weight" class="easyui-numberbox" required="true" missingMessage="请填写数字(数字大的排在前面)">
            </div>
        </form>
    </div>
    <div id="slg" class="easyui-dialog" style="width:400px;height:400px;padding:10px 20px"
            closed="true" buttons="#slg-buttons">
        <div class="ftitle">User Information</div>
        <form id="sfm" method="post" novalidate enctype="multipart/form-data">
        	<div class="fitem">
                <input id="sfmId" name="staId" readonly="true" type="hidden">
            </div>
            <div class="fitem">
                <label>媒体ID:</label>
                <input id="sfmMediaId" name="staMediaId" class="easyui-numberbox">
            </div>
            <div class="fitem">
                <label>累计阅读量:</label>
                <input id="sfmReadNum" name="staReadNum" class="easyui-numberbox" required="true" missingMessage="请填写数字">
            </div>
            <div class="fitem">
                <label>昨日增长量:</label>
                <input id="sfmNewReadNum" name="staNewReadNum" class="easyui-numberbox" required="true" missingMessage="请填写数字">
            </div>
        </form>
    </div>
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveMedia()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">关闭</a>
    </div>
    <div id="slg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="updateStatisticsMedia()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#slg').dialog('close')" style="width:90px">关闭</a>
    </div>
    <script type="text/javascript">
    	
    		 //$("#dg").datagrid('hideColumn', 'id');
    	
    	function imgFormatter(value,row){
    		 var str = "";
	       	 if(value!="" || value!=null){
	       	 str = "<img style=\"height: 100px;width: 150px;\" src=\""+value+"\"/>";
	         return str;
	       	 }
    	}
    	
    	function toAlliancePicturePage(){
    		var row = $('#dg').datagrid('getSelected');
    		if(row){
    			var mediaId = row.id;
    			window.location.href="alliance/toAlliancePicturePage.do?mediaId="+mediaId;
    		}else{
    			alert("请选择要操作的媒体");
    			return false;
    		}
    		
    	}
    	function toHotArticlePage(){
    		var row = $('#dg').datagrid('getSelected');
    		if(row){
    			var mediaId = row.id;
    			window.location.href="alliance/toHotArticlePage.do?mediaId="+mediaId;
    		}else{
    			alert("请选择要操作的媒体");
    			return false;
    		}
    	}
    	
    	
        var url;
        function addMedia(){
            $('#dlg').dialog('open').dialog('setTitle','添加媒体');
            $('#fm').form('clear');
            url = 'alliance/saveMedia.do';
        }
        function editMedia(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','修改媒体信息');
                var id = row.id;
                var mediaPortrait = row.mediaPortrait;
                var phone = row.phone;
                var mediaName = row.mediaName;
                var identityCard = row.identityCard;
                var mediaMaterials = row.mediaMaterials;
                var weixinPubilc = row.weixinPubilc;
                var twoDimensionCode = row.twoDimensionCode;
                var status = row.status;
                var weight = row.weight;
                $("#fmId").val(id);
               // $('#mediaPortraitId').filebox('setValue',mediaPortrait);
                $('#mediaNameId').textbox('setValue',mediaName);
                $('#phoneId').textbox('setValue',phone);
                $('#identityCardId').textbox('setValue',identityCard);
                $('#mediaMaterialsId').textbox('setValue',mediaMaterials);
                $('#weixinPublicId').textbox('setValue',weixinPubilc);
               // $('#twoDimensionCodeId').filebox('setValue',twoDimensionCode);
                $('#statusId').textbox('setValue',status);
                $('#weightId').textbox('setValue',weight);
               //$('#fm').form('load',row);
                url = 'alliance/updateMedia.do';
                //alert(url);
         	}else{
         		 $.messager.show({
                     title: '提示',
                     msg: "请选择要修改的媒体"
                 });
         	}
        }
        
        function saveMedia(){
        	//alert("ddddd");
        	$('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                	if(result == "0"){
                		$.messager.show({
                            title: '提示',
                            msg: "失败"
                        });
                		
                	}else{
                		$('#dlg').dialog('close');
                        alert("成功");
                		location.reload();
                	}
                }
            });
        }
        
        function destroyMedia(){
        	var row = $('#dg').datagrid('getSelected');  
       		if(row){  
            jQuery.messager.confirm('Confirm','Are you sure you want to remove this user?',function(option){  
            	if(option){  
                    
                    //console.info(row.id);  
                    jQuery.ajax({
                        url : 'alliance/deleteMedia.do',
                        data:{
								mediaId:row.id
							},
                        dataType : 'json',
                        success : function(r){
                        	if(r=="0"){
                        		jQuery.messager.show({
									title: '提示',
									msg: '失败'
								});
                        	}else{
	                            alert("删除成功");
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
        
        function editStatisticsMedia(){
        	 var row = $('#dg').datagrid('getSelected');
             if (row){
                 $('#slg').dialog('open').dialog('setTitle','媒体统计信息');
                 var mediaId = row.id;
                 jQuery.ajax({
                     url : 'alliance/selectStatisticsMedia.do',
                     data:{
								mediaId:mediaId
							},
                     dataType : 'json',
                     success : function(data){
                     	//alert(data[0].readNum);
                     	$('#sfmMediaId').textbox('setValue',mediaId);
                     	$('#sfmReadNum').textbox('setValue',data[0].readNum);
                     	$('#sfmNewReadNum').textbox('setValue',data[0].newReadNum);
                     }
                  });
          	}else{
          		 $.messager.show({
                      title: '提示',
                      msg: "请选择相应的媒体"
                  });
          	}
        }
        
        function updateStatisticsMedia(){
        	$('#sfm').form('submit',{
                url: 'alliance/updateStatisticsMedia.do',
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                	if(result == "0"){
                		$.messager.show({
                            title: '提示',
                            msg: "失败"
                        });
                		
                	}else{
                		$('#dlg').dialog('close');
                        alert("成功");
                		location.reload();
                	}
                }
            });
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
</body>
</html>