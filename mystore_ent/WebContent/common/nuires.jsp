<%@page import="com.cib.cap4j.core.conf.Cap4jConf"%>
<%@page import="com.cib.cap4j.core.context.ContextUtil"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Locale locale = org.springframework.web.servlet.support.RequestContextUtils.getLocaleResolver(request).resolveLocale(request);
	String language=locale.toString();
	Cap4jConf cap4jConf1 = ContextUtil.getBean(Cap4jConf.class);
	if(cap4jConf1.getLanguage().indexOf(language) < 0){
		language="zh_CN";
	}
%>
<script src="<%= request.getContextPath() %>/resources/nui/nui.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/resources/nui/locale/<%= language %>.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/resources/nui/cap4j/message_<%= language %>.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/resources/nui/cap4j/appmessage_<%= language %>.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/resources/cap4j/nui-dict.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/resources/cap4j/cap4jui.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/resources/cap4j/sha1.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/resources/cap4j/cfncommon.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/resources/cap4j/nui-extension.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/resources/cap4j/nui-assistant-ext.js" type="text/javascript"></script>
<script src="<%= request.getContextPath() %>/resources/cap4j/nui-extauth.js" type="text/javascript"></script>
<link href="<%= request.getContextPath() %>/resources/cap4j/css/nui-extension.css" rel="stylesheet" type="text/css" />
<link href="<%= request.getContextPath() %>/resources/cap4j/css/cap4juicss.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
	var appContext = "<%= request.getContextPath() %>";
	<c:forEach var="oneCodeType" items="${_pageCodeTypeList}">
		<c:if test="${oneCodeType._showVar != null}">
			var ${oneCodeType._codeTypeCode}Data = ${oneCodeType._codeTypeInfo};
		</c:if>
	</c:forEach>
	$(function(){
	<c:forEach var="oneCodeType" items="${_pageCodeTypeList}">
		if($J.get("${oneCodeType._elementId}")){
			$J.get("${oneCodeType._elementId}").setData(${oneCodeType._codeTypeCode}Data);
		}
	</c:forEach>
	});
</script>