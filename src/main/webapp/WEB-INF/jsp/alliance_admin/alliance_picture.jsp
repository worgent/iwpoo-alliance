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
    <h2>证明图片操作</h2>
    
    <table id="dg" title="My Users" class="easyui-datagrid" data-options="nowrap:false" style="width:1000px;height:700px"
            url="get_users.php"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
            	<th field="alliancePicId" width="10">ID</th>
            	<th field="mediaId" width="15">媒体ID</th>
                <th data-options="field:'pictureUrl',width:40,formatter:imgFormatter">图片</th>
                <th field="description" width="35">描述</th>
                <th field="weight" width="35">权重位置</th>
                <th field="status" width="35">状态</th>
            </tr>
        </thead>
        <c:forEach items="${alliancePictureList }" var="alliancePictures">
        <input id="dgMediaId" type="hidden" value="${alliancePictures.mediaId }">
        	<tr>
        		<td align="center">${alliancePictures.id}</td>
        		<td align="center">${alliancePictures.mediaId}</td>
                <td align="center">${alliancePictures.pictureUrl}</td>
				<td align="center">${alliancePictures.description}</td>
				<td align="center">${alliancePictures.weight}</td>
				<td align="center">${alliancePictures.status}</td>
			</tr>
		</c:forEach>
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addAlliancePicture()">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-edit" plain="true" onclick="editAlliancePicture()">修改</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="destroyAlliancePicture()">删除</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-back" plain="true" onclick="back()">返回</a>
    </div>
    
    <div id="dlg" class="easyui-dialog" style="width:400px;height:400px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons">
        <div class="ftitle">User Information</div>
        <form id="fm" method="post" novalidate enctype="multipart/form-data">
        	<div class="fitem">
                <input id="fmAlliancePicId" name="alliancePicId" readonly="true" type="hidden">
            </div>
             
            <div class="fitem">
                <label>媒体ID:</label>
           		<input id="fmMediaId" name="mediaId" class="easyui-textbox">
        	</div>
            <div class="fitem">
                <label>图片:</label>
                <input id="mediaPortraitUrl" name="pictureUrl" class="easyui-filebox" buttonText="选择图片">
            </div>
            <div class="fitem">
                <label>描述:</label>
                <input id="descriptionId" name="description" class="easyui-textbox" required="true" missingMessage="请填写简介">
            </div>
            <div class="fitem">
                <label>权重位置:</label>
                <input id="weightId" name="weight" class="easyui-numberbox" required="true" missingMessage="请填写数字(数字大的排在前面)">
            </div>
            <div class="fitem">
                <label>状态:</label>
                <input id="statusId" name="status" class="easyui-numberbox" min="0" max="1" required="true" missingMessage="请填写数字(只能填写0或1;0显示，1不显示)">
            </div>
        </form>
    </div>
    
    <div id="dlg-buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveAlliancePicture()" style="width:90px">保存</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">关闭</a>
    </div>
    <script type="text/javascript">
    	
    		 //$("#dg").datagrid('hideColumn', 'id');
    	
		    function back(){
	    		window.location.href="alliance/toAllianceAdminPage.do";
	    		
	    	}
    	
    	function imgFormatter(value,row){
    		 var str = "";
	       	 if(value!="" || value!=null){
	       	 str = "<img style=\"height: 100px;width: 150px;\" src=\""+value+"\"/>";
	         return str;
	       	 }
    	}
    
        var url;
        function addAlliancePicture(){
        	var mediaId = $("#dgMediaId").val();
            $('#fmMediaId').textbox('setValue',mediaId);
            $('#fmMediaId').textbox({editable:false});
            $('#dlg').dialog('open').dialog('setTitle','添加图片');
            url = 'alliance/saveAlliancePicture.do';
        }
        function editAlliancePicture(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','修改媒体信息');
				var alliancePicId = row.alliancePicId;
                var mediaId = row.mediaId;
                var pictureUrl = row.pictureUrl;
                var description = row.description;
                var weight = row.weight;
                var status = row.status;
                
                $("#fmAlliancePicId").val(alliancePicId);
                $('#fmMediaId').textbox('setValue',mediaId);
                $('#fmMediaId').textbox({editable:false});
                $('#descriptionId').textbox('setValue',description);
                $('#weightId').textbox('setValue',weight);
                $('#statusId').textbox('setValue',status);
                url = 'alliance/updateAlliancePicture.do';
                //alert(url);
         	}else{
         		jQuery.messager.alert('提示', '请选择要修改的记录', 'error');  
         	}
        }
        
        function saveAlliancePicture(){
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
        
        function destroyAlliancePicture(){
        	var row = $('#dg').datagrid('getSelected');  
       		if(row){  
            jQuery.messager.confirm('Confirm','Are you sure you want to remove this user?',function(option){  
            	if(option){  
                    
                    //console.info(row.id);  
                    jQuery.ajax({
                        url : 'alliance/deleteAlliancePicture.do',
                        data:{
								alliancePictureId:row.alliancePicId
							},
                        dataType : 'json',
                        success : function(r){
                        	if(r=="0"){
                        		jQuery.messager.show({
									title: '提示',
									msg: '失败'
								});
                        	}else{
	                             //$('#dg').datagrid('unselectAll');
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
        
        
        /*  function editUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $('#dlg').dialog('open').dialog('setTitle','Edit User');
                $('#fm').form('load',row);
                url = 'update_user.php?id='+row.id;
            }
        }
        function saveUser(){
            $('#fm').form('submit',{
                url: url,
                onSubmit: function(){
                    return $(this).form('validate');
                },
                success: function(result){
                    var result = eval('('+result+')');
                    if (result.errorMsg){
                        $.messager.show({
                            title: 'Error',
                            msg: result.errorMsg
                        });
                    } else {
                        $('#dlg').dialog('close');        // close the dialog
                        $('#dg').datagrid('reload');    // reload the user data
                    }
                }
            });
        }
        function destroyUser(){
            var row = $('#dg').datagrid('getSelected');
            if (row){
                $.messager.confirm('Confirm','Are you sure you want to destroy this user?',function(r){
                    if (r){
                        $.post('destroy_user.php',{id:row.id},function(result){
                            if (result.success){
                                $('#dg').datagrid('reload');    // reload the user data
                            } else {
                                $.messager.show({    // show error message
                                    title: 'Error',
                                    msg: result.errorMsg
                                });
                            }
                        },'json');
                    }
                });
            }
        } */
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