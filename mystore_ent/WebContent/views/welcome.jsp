<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ include file="/common/jstlres.jsp" %>
<%@ include file="/common/nuires.jsp" %>
<!--
   * 欢迎页面
   *
   * Created on 2014-05-12
   * @author 陈之轩
   * @reviewer 
-->
<html>
<head>
    <title>欢迎页面</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <script type="text/javascript">
	$(function(){
		var windowHeight = $(window).height();
		var windowWidth = $(window).width();
		var imgHeight = $("#welcome").height();
		var imgWidth = $("#welcome").width();
		if(windowHeight < imgHeight && windowWidth < imgWidth) {
			$("#welcome").height(windowHeight);
			$("#welcome").width(windowWidth);
		}
	});
	</script>
</head>

<body style="overflow: hidden; margin-top: 30px;">
<table width="100%" height="100%" border="0" align="center" cellpadding="2" cellspacing="2">
	<tr>
		<td height="100%" align="center"><img id="welcome" src="../resources/images/welcome.png" align="middle"></td>
	</tr>
</table>
</body>
</html>
