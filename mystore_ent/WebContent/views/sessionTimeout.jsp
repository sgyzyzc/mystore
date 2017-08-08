<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>

<!--
   * 超时页面
   *
   * Created on 2014-05-12
   * @author 陈之轩
   * @reviewer 
-->
<html>
<head>
    <title>会话超时页面</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<script type="text/javascript">
		function redoLogin() {
			var loginUrl = "<%= request.getContextPath() %>/views/index.jsp";
			//if (window.parent) {
				//window.parent.location.href = loginUrl;
			//} else {
				//window.location = loginUrl;
			//}
			top.window.location = loginUrl;
		}
	</script>
</head>

<body style="overflow: hidden; margin-top: 30px;">
<table width="100%" height="100%" border="0" align="center" cellpadding="2" cellspacing="2">
	<tr>
		<td height="100%" align="center">
			用户会话超时，请<a href="javascript:redoLogin()">重新登录</a>！
		</td>
	</tr>
</table>
</body>
