<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ include file="/common/jstlres.jsp" %>
<%@ include file="/common/nuires.jsp" %>

<!--
   * 文件下载
   *
   * Created on 2014-06-20
   * @author 陈之轩
   * @reviewer 
-->
<html>
<head>
    <title>文件下载</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/resources/nui/resource/swfupload/swfupload.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			// 显示下载链接
			downloadLink();
		});
	</script>
</head>
<body>
<input class="nui-hidden" name="pageType" value="${pageType}" />

<div class="nui-fit">
	<form id="form1" method="post" enctype="multipart/form-data">
		<div id="div1" style="padding-right: 20px; padding-top: 10px; padding-bottom: 15px;">
			<table style="table-layout: fixed;">
				<tr id="download_tr" style="display:none;">
					<td align="right" valign="top" width="38%" nowrap>已上传文件：</td>
					<td nowrap>
						<div id="downloadDiv">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<input class="nui-hidden" name="docId" value="${docId}" />
	</form>
</div>

<div class="nui-toolbar" style="text-align:center;padding-top:10px;padding-bottom:10px;margin-bottom:-5px;"
     	borderStyle="border-left:0;border-bottom:0;border-right:0;">
    <a class="nui-button" iconCls="icon-close" style="width:60px;" id="closeBtn" onclick="onClose"><fmt:message key='button.close'/></a>
</div> 
<script type="text/javascript">

	$J.parse();
	
	// 父页面调用方法
	function setFormData(data) {
	}
	
	// 父页面调用方法
	function getFormData() {
		var docId = $J.getbyName("docId").getValue();
		var data = {docId : docId};
		
		return data;
	}
	
	// 关闭
	function onClose(e) {
		window.CloseOwnerWindow();
	}
	
	// 下载
	function download(id) {
		window.location = "<%= request.getContextPath() %>/upload/download.do?id=" + id;
	}
	
	// 显示已上传的文件的下载链接
	function downloadLink() {
		var docId = $J.getbyName("docId").getValue();
		if(docId == '') {
			return;
		}
		// 异步请求数据
    	var ajaxConf = new Cap4jAjaxConf();
    	ajaxConf.setIsShowSuccMsg(false);
    	ajaxConf.setIsShowProcessBar(false);
    	ajaxConf.setSuccessFunc(
    		function(data) {
    			if (data.length){
					var downloadLink = '';
					for(var i=0; i<data.length; i++) {
						var record = data[i];
						downloadLink += "<a href=\"javascript:download('" + record['id'] + "')\"  title=\"" + record['realName'] + "\">" + record['diaplayName'] + "</a>";
						downloadLink += "&nbsp;&nbsp;<br>";
					}
					$("#download_tr").show();
					$("#downloadDiv").html(downloadLink);
				} else {
					$("#download_tr").hide();
				}
    		}
    	);
    	var param = {"docId" : docId};
    	$J.postByAjax(param, "upload/downloadLink.do", ajaxConf);
	}
</script>
</body>
</html>