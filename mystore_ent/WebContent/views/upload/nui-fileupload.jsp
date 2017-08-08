<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ include file="/common/jstlres.jsp" %>
<%@ include file="/common/nuires.jsp" %>

<html>
<head>
    <title>文件上传</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/resources/nui/resource/swfupload/swfupload.js" type="text/javascript"></script>
</head>
<body>
<input class="nui-hidden" name="pageType" value="${pageType}" />

<div class="nui-fit">
	<form id="form1" method="post" enctype="multipart/form-data" action="<%= request.getContextPath() %>/upload/upload.do">
		<div style="padding-right: 20px; padding-top: 10px; padding-bottom: 15px;">
			<table style="table-layout: fixed;">
				<tr>
					<td align="right" width="20%">选择路径：</td>
					<td width="30%">
						<input id="uploadFile" class="nui-fileupload" name="uploadFile"
							limitType="*.*" flashUrl="<%= request.getContextPath() %>/resources/nui/resource/swfupload/swfupload.swf"
							uploadUrl="upload.jsp" onuploadsuccess="onUploadSuccess" 
							onuploaderror="onUploadError" onfileselect="onFileSelect" />
					</td>
				</tr>
			</table>
		</div>
	</form>
</div>
<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;" 
	borderStyle="border-left:0;border-bottom:0;border-right:0;">
	<a class="nui-button" style="width:60px;" id="closeBtn" onclick="onClose">关闭</a>
	<a class="nui-button" style="width:60px; margin-left:30px" id="closeBtn" onclick="onUpload">确定</a>
</div>
<script type="text/javascript">

	$J.parse();
	
	// 关闭
	function onClose(e) {
		window.CloseOwnerWindow();
	}
	
	// 上传
	function onUpload(e) {
		document.getElementById("form1").submit();
	}
	
	// 上传成功
	function onUploadSuccess(e) {
		$J.cap4jAlert("上传成功：" + e.serverData);
		this.setText("");
	}
	
	function onUploadError(e) {
		
	}
	
	function onFileSelect(e) {
		
	}
</script>
</body>
</html>