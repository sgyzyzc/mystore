<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/jstlres.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>错误页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/common/nuires.jsp" %>
</head>
<body>
<c:if test="${isBizErr == 'true'}">
	errMsg：${errMsg}<br>
	<br>
	&nbsp;<a class="nui-button" style="width:60px;" id="closeBtn" onclick="history.back()"><fmt:message key='button.back'/></a>
</c:if>
<c:if test="${isBizErr != 'true'}">
	系统错误，请联系管理员！<br>
	isBizErr：${isBizErr}<br>
	errCode：${errCode}<br>
	errMsg：${errMsg}<br>
	errStack：<br>
	${errStack}
</c:if>
</body>
</html>