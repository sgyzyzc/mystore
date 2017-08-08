<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="ch.qos.logback.core.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@page import="com.cib.cap4j.cfn.codeInfo.vo.IPCodeInfoVO"%>
<%@page import="com.cib.cap4j.cfn.general.CFNConstants"%>
<%@page import="com.cib.cap4j.core.context.ContextUtil"%>
<%@page import="com.cib.cap4j.cfn.directory.service.IDirectoryService"%>
<%@page import="com.cib.cap4j.cfn.directory.service.impl.DirectoryServiceImpl"%>

<%
	// 登录页面上的标题
	/*
	IDirectoryService directoryService = ContextUtil.getBean(IDirectoryService.class);
	IPCodeInfoVO codeInfoVO = directoryService.findInfoByTypeCodeAndInfoCode(
	CFNConstants.PLATFORM_CONFIG, CFNConstants.PLATFORM_TITLE_LOGON_PAGE);
	//判断码表配置是否https登录
	codeInfoVO = directoryService.findInfoByTypeCodeAndInfoCode(CFNConstants.PLATFORM_CONFIG, CFNConstants.PLATFORM_CONFIG_LOGIN_CHANNEL);
	boolean https_login = codeInfoVO != null && "https".equals(codeInfoVO.getMbtmz());
	IPCodeInfoVO codeInfoVO2 = directoryService.findInfoByTypeCodeAndInfoCode(CFNConstants.PLATFORM_CONFIG, CFNConstants.PLATFORM_CONFIG_HTTP_PORT);
	String http_port = codeInfoVO2 == null ? "" : codeInfoVO2.getMbtmz();
	codeInfoVO2 = directoryService.findInfoByTypeCodeAndInfoCode(CFNConstants.PLATFORM_CONFIG, CFNConstants.PLATFORM_CONFIG_HTTPS_PORT);
	String https_port = codeInfoVO2 == null ? "" : codeInfoVO2.getMbtmz();
	// security=true表示已跳转至https路径
	String reqUri = request.getRequestURI();
	String serverIp = request.getServerName();
	String accUrl = "";
	int serverPort = request.getServerPort();
	String protocol = request.getProtocol();
	if (https_login) {
		//地址栏是HTTPS，折使用输入的HTTPS端口号
		if(protocol.startsWith("HTTPS")){
			https_port = String.valueOf(serverPort);
		}
		accUrl = "https://" + serverIp + ":" + https_port + request.getContextPath()  + "/login/login.do";
	} else {
		//地址栏时HTTP，折使用输入的HTTP端口号
		if(!protocol.startsWith("HTTPS")){
			http_port = String.valueOf(serverPort);
		}
		accUrl = "http://" + serverIp + ":"+ http_port + request.getContextPath()  + "/login/login.do";
	}
	request.getSession().setAttribute(CFNConstants.PROTOCOL_CHECK, "true");
	response.sendRedirect(accUrl);
	*/
	request.getSession().setAttribute(CFNConstants.PROTOCOL_CHECK, "true");
	response.sendRedirect(request.getContextPath() + "/login/login.do");
%>

