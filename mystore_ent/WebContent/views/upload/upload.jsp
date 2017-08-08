<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ include file="/common/jstlres.jsp" %>
<%@ include file="/common/nuires.jsp" %>

<!--
   * 文件上传
   *
   * Created on 2014-05-12
   * @author 陈之轩
   * @reviewer 
-->
<html>
<head>
    <title>文件上传</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script src="<%= request.getContextPath() %>/resources/nui/resource/swfupload/swfupload.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(function() {
			var docId = $J.getbyName("docId").getValue();
			var bizId = $J.getbyName("bizId").getValue();
			
			// 若是成功上传，则隐藏上传控件，提示成功
			var result = '${result}';
			var msg;
			if(result && result == 'success') {
				msg = '上传成功！';
			}
			if(result && result == 'failed') {
				msg = '上传失败，请联系系统管理员！';
			}
			/**
			if(result && result != '') {
				$J.get("confirmBtn").hide();
				$("#div1").remove();
				$("#div2").show();
				$("#msg").html(msg);
			}
			*/
			// 显示下载链接
			showDownloadLink();
		});
	</script>
</head>
<body>
<input class="nui-hidden" name="pageType" value="${pageType}" />

<div class="nui-fit">
	<form id="form1" method="post" enctype="multipart/form-data" action="<%= request.getContextPath() %>/upload/upload.do">
		<div id="div1" style="padding-right: 20px; padding-top: 10px; padding-bottom: 15px;">
			<table style="table-layout: fixed;">
				<tr id="download_tr" style="display:none;">
					<td align="right" valign="top" width="38%" nowrap>已上传文件：</td>
					<td nowrap>
						<div id="downloadDiv">
						</div>
					</td>
				</tr>
				<tr>
					<td align="right" width="38%"><fmt:message key='upload.chooseFile'/>：</td>
					<td>
						<input class="nui-htmlfile" name="uploadFile" style="width:200px"/>
					</td>
				</tr>
			</table>
		</div>
		<div id="div2" style="padding-right: 20px; padding-top: 10px; padding-bottom: 15px; display:none;">
			<table style="table-layout: fixed;">
				<tr>
					<td align="center"><div id="msg"></div></td>
				</tr>
			</table>
		</div>
		<input class="nui-hidden" name="docId" value="${docId}" />
		<input class="nui-hidden" name="bizId" value="${bizId}" />
	</form>
</div>
<div class="nui-toolbar" style="text-align:center;padding-top:8px;padding-bottom:8px;margin-bottom:-5px;" 
	borderStyle="border-left:0;border-bottom:0;border-right:0;">
	<a class="nui-button" iconCls="icon-close" style="width:60px;" id="closeBtn" onclick="onClose"><fmt:message key='button.close'/></a>
	<a class="nui-button" iconCls="icon-ok" style="width:60px; margin-left:30px" id="confirmBtn" onclick="onUpload"><fmt:message key='button.ok'/></a>
</div>
<script type="text/javascript">
	changeButtonPosition($('.nui-toolbar:last'));

	$J.parse();
	
	// 父页面调用方法
	function setData(data) {
	}
	
	//revised by zhangyuqing 控制确定按钮的状态
	$J.get("confirmBtn").disable();
	
	$("input[name='uploadFile']").change(function(){
		var uploadFile = $("input[name='uploadFile']").val();
		if(uploadFile.length) {
			$J.get("confirmBtn").enable();
		} else {
			$J.get("confirmBtn").disable();
		}
	});
	
	// 父页面调用方法
	function getData() {
		var docId = $J.getbyName("docId").getValue();
		var data = {docId : docId};
		
		return data;
	}
	
	// 关闭
	function onClose(e) {
		//revised by zhangyuqing 引用公共的js方法
		$J.closemodaldialog("ok");
	}
	
	// 上传
	function onUpload(e) {
		// 无效化确定按钮
		$J.get("confirmBtn").disable();
		
		var uploadFiles = $("input[name='uploadFile']");
		var temp = '';
		if(uploadFiles.length) {
			for(var i=0; i<uploadFiles.length; i++) {
				var uploadFile = uploadFiles[i];
				var path = $(uploadFile).val();
				temp += path;
			}
		}
		if(temp == '') {
			$J.cap4jAlert(message.common.uploadPrompt, message.common.prompt, function() {
				// 有效化确定按钮
				$J.get("confirmBtn").enable();
				return;
			});
		} else {
			document.getElementById("form1").submit();
		}
	}
	
	// 下载
	function download(id) {
		window.location = "<%= request.getContextPath() %>/upload/download.do?id=" + id;
	}
	
	// 显示已上传的文件的下载链接
	function showDownloadLink() {
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
					var showDownloadLink = '';
					for(var i=0; i<data.length; i++) {
						var record = data[i];
						showDownloadLink += "<a href=\"javascript:download('" + record['id'] + "')\"  title=\"" + record['realName'] + "\">" + record['diaplayName'] + "</a>";
						showDownloadLink += "&nbsp;&nbsp;<img style='cursor:pointer; vertical-align:bottom;' src='../resources/images/delete.gif'" +
						" onclick=\"delFile('" + record['id'] + "')\"></img><br>";
					}
					$("#download_tr").show();
					$("#downloadDiv").html(showDownloadLink);
				} else {
					$("#download_tr").hide();
				}
    		}
    	);
    	var param = {"docId" : docId};
    	$J.postByAjax(param, "upload/downloadLink.do", ajaxConf);
	}
	
	// 删除文件确认
	function delFile(id) {
		$J.cap4jConfirm("确定删除文件？若删除，文件将无法找回", "操作提示", function(action) {
			if(action == 'ok') {
				cofirmDelFile(id);
			}
		});
	}
	
	// 删除文件
	function cofirmDelFile(id) {
		// 异步请求数据
		var ajaxConf = new Cap4jAjaxConf();
    	ajaxConf.setIsShowSuccMsg(false);
    	ajaxConf.setIsShowProcessBar(false);
    	ajaxConf.setSuccessFunc(
    		function(data) {
    			if (data['result'] == 'success') {
					$J.cap4jAlert("删除文件成功！");
					showDownloadLink();
				} else {
					$J.cap4jAlert("删除文件失败或文件不存在！");
				}
    		}
    	);
    	ajaxConf.setErrorFunc(
    		function() {
    			$J.cap4jAlert("删除文件出现异常，请联系管理员！");
    		}
    	);
    	var param = {"id" : id};
    	$J.postByAjax(param, "upload/delFile.do", ajaxConf);
	}
</script>
</body>
</html>