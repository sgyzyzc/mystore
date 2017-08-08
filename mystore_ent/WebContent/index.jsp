<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<%
	String authChannel = request.getParameter("authChannel");
	boolean j_islocaldbcheck = false;
	if(authChannel != null && "local".equalsIgnoreCase(authChannel)){
		j_islocaldbcheck = true;
	}
%>
</head>
<body>
	<form action="<%= request.getContextPath() %>/login/login.do" method="post">
		<% if(authChannel != null){ %>
			<input type="hidden" name="j_islocaldbcheck" value="<%= j_islocaldbcheck %>"/>
		<% } %>
	</form>
</body>
<script type="text/javascript">
document.forms[0].submit();
</script>
</html>