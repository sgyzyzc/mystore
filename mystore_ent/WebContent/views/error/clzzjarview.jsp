<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>类文件查询页面</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@ include file="/common/nuires.jsp"%>
<script language="javascript">
$(function(){
	$("#okBtn").click(function(){
		var ajaxConf = new Cap4jAjaxConf();
		ajaxConf.setIsShowSuccMsg(false);
		ajaxConf.setSuccessFunc(function(data){
			var temp = new String(data.qryResult);
			$("#resultText").html(data.qryResult);
		});
		$J.submitForm("form1", "exceptionCtrler/clzzJarView.do", ajaxConf);
	});
});
</script>
</head>
<body>
	<form id="form1" style="margin: 0 auto;width: 800px">
		类全限定名（不包括.class）：
		<input name="clzzName" class="nui-textbox" required="true" style="width: 700px"/>
		<a class="mini-button" href="javascript:void(0)" id="okBtn"><span class="mini-button-text">确定</span></a>
	</form>
	<div style="margin: 0 auto;width: 800px;font-size: 15px;" id="resultText">
	</div>
</body>
</html>