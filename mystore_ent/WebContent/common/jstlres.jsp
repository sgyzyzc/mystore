<%@page import="com.cib.cap4j.core.context.ContextUtil"%>
<%@page import="com.cib.cap4j.core.conf.Cap4jConf"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%
Cap4jConf cap4jConf = ContextUtil.getBean(Cap4jConf.class);
request.setAttribute("_CONTEXTPATH", request.getContextPath());
request.setAttribute("_DATEPATTERN", cap4jConf.getDatePattern());
request.setAttribute("_TIMESTAMPPATTERN", cap4jConf.getTimestampPattern());
%>