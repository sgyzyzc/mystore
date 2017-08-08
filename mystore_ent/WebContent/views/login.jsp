<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@ include file="/common/jstlres.jsp"%>
<%@ include file="/common/nuires.jsp"%>
<%@page import="com.cib.cap4j.cfn.general.CFNConstants"%>

<!--
   * 用户登录
   *
   * Created on 2014-05-12
   * @author 陈之轩
   * @reviewer 
-->
<html>
<head>
<title><fmt:message key='login.title' /></title>
	<script type="text/javascript">
		$(function() {
			// 如果本页面不是顶层窗口，则跳转为顶层窗口
			var parentHref = window.parent.location.href;
			if (parentHref != '' && parentHref.indexOf('<%= request.getContextPath() %>/login/login.do') < 0) {
				top.window.location.href = window.location.href;
			} else {
				// 设置焦点到用户名
				$J.getbyName("username").focus();
				// 获取公告信息列表
				getInfoList();
				
				// 监听回车事件
				addEnterEvent();
			}
		});
		
		// 监听回车事件
		function addEnterEvent() {
			$("#loginForm").keydown(function(event) {
				if (event.keyCode == 13) {
					Button_submit_onClick(event);
				}
			});
		}
	</script>
	<style type="text/css">
	 	a.info:link {color: gray; text-decoration:none;}     /* 未访问的链接 */
 		a.info:visited {color: gray; text-decoration:none;}  /* 已访问的链接 */
 		a.info:hover {color: blue; text-decoration:none;}    /* 当有鼠标悬停在链接上 */
 		a.info:active {color: blue; text-decoration:none;}   /* 被选择的链接 */
	</style>
</head>
<body>
<div style="height: 100%; overflow: hidden;">
<img style="position:absolute;z-Index:-1;" src="../resources/images/loginpage/bg.png" width="100%" height="100%"/>
<table cellpadding="0" cellspacing="0" border="0" align="center" style="top: 25%">
	<tr>
		<td id="bg" style="background:url(../resources/images/loginpage/bg1.png) 0 0 no-repeat; width:658px; height:297px;">
			<table cellpadding="0" cellspacing="0" border="0">
			<!-- 登录页上方TR -->
			<tr style="height: 67px;">
				<td colspan="2">
					<%-- <table cellpadding="0" cellspacing="0" border="0" style="width:100%; height:100%; top:5px;">
						<tr>
							<td style="width:224px;">
							</td>
							<td style="width:410px;">
								<span style="font-size:20px; font-family:黑体; color:#004187; letter-spacing:2px;">${titleOfLogonPage}</span>
							</td>
							<td style="width:24px;">
							</td>
						</tr>
					</table> --%>
				</td>
			</tr>
			<tr style="height: 162px;">
				<!-- 公告栏 -->
				<td align="right">
					<div style="width: 300px; height: 173px; position: relative; top: 60px; left: 15px;">
					<table cellpadding="0" cellspacing="0" border="0" style="width:100%; height:100%;">
						<tr style="vertical-align:top;">
							<td>
								<div id="infoDiv" style="width: 300px;">
								</div>
							</td>
						</tr>
					</table>
					</div>
				</td>
				<!-- 登录栏 -->
				<td>
					<div style="width: 300px; position: relative; top: 50px; left: 8px;">
					<form method="post" name="loginForm" id="loginForm" method="post">
					<table cellpadding="1" cellspacing="0" id="frmTable" border="0">
					<tr id="userTypeTr">
						<td align="right" noWrap><label for="loginType"><fmt:message key='login.logintype'/>：</label></td>
						<td width="100%">
							&nbsp;&nbsp;
							<input id="usertype" name="j_usertype" class="nui-dictcombobox" emptyText="..." style="width:130px"
								dictTypeId="<%=CFNConstants.LOGIN_TYPE%>"  filterStr="" />
						</td>
					</tr>
					<tr>
						<td align="right" noWrap><label for="username"><fmt:message key='login.loginname'/>：</label></td>
						<td width="100%">
							&nbsp;&nbsp;
							<input class='nui-textbox' name='username' maxLength="32" style="width: 130px;" />
							<input class='nui-hidden' name='j_username' />
							<c:if test="${j_islocaldbcheck != null}">
								<input class='nui-hidden' name='j_islocaldbcheck' value='${j_islocaldbcheck}'/>
							</c:if>
						</td>
					</tr>
					<tr>
						<td align="right" noWrap><label for="username"><fmt:message key='login.password'/>：</label></td>
						<td width="100%">
							&nbsp;&nbsp;
							<input class='nui-password' name='password' maxLength="16" style="width: 130px;" />
							<input class='nui-hidden' name='j_password' />
						</td>
					</tr>
					<c:if test="${isEnableCaptcha}">
					<tr>
						<td align="right" noWrap><label for="Label_CheckCode"><fmt:message key='login.captcha'/>：</label></td>
						<td>&nbsp;&nbsp;
							<input class="nui-textbox" name="j_captcha" maxLength="4" style="width: 66px;" />
							<script>document.write("<img border=0 src='<%=request.getContextPath()%>/views/randomImage.jsp?Rand="+Math.random()*10000+"' align='absmiddle'>");</script>
						</td>
					</tr>
					</c:if>
					<tr style="height:30px">
						<td colspan="2">
							<div align="left" id="errorDiv" style="color:red; top:5px; bottom:5px;">
								<spring:message code="${error}"></spring:message>
							</div>
						</td>
					</tr>
					<tr style="height:20px">
						<td colspan="2">
						<img id="loginImg" src="../resources/images/loginpage/sure.png"
							onclick="Button_submit_onClick(this);" style="cursor: hand"
							onmousedown="loginMouserdown()" onmousemove="loginMouseover()"
							onmouseout="loginMoserout()"></img>&nbsp;&nbsp;&nbsp;&nbsp;
						<img id="resetImg" src="../resources/images/loginpage/reset.png"
							onclick="Button_reset_onClick(this);" style="cursor: hand"
							onmousedown="resetMouserdown()" onmousemove="resetMouseover()"
							onmouseout="resetMoserout()"></img></td>
					</tr>
				</table>

				</form>
				</div>
				</td>
			</tr>
			<!-- 登录页下方TR -->
			<tr style="height: 68px;">
				<td colspan="2">
					<table cellpadding="0" cellspacing="0" border="0" style="width:100%; height:100%; top:100px;">
						<tr>
							<td align="center">
								<span style="font-size:12px; font-family:宋体; color:#004187; letter-spacing:1px;">Copyright@2016 YUMU All Rights Reserved&nbsp;&nbsp;&nbsp;&nbsp;</span>
								<%-- 
								<c:forEach var="releaseNote" items="${releaseNotesConfList}">
								<span style="margin-right:5px"><a href="${releaseNote.path}" target="infoVersion"><c:out value="${releaseNote.name}"/></a></span>
								</c:forEach> --%>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</table>
		</td>
	</tr>
</table>
</div>
</body>
<script type="text/javascript">
	$J.parse();
	$(function(){
		var usertype = $J.get("usertype");
		if(usertype.data.length == "0"){
			usertype.setValue("<%=CFNConstants.LOGIN_TYPE_STAFFCODE%>");
			$("#userTypeTr").hide();
		}
		if(usertype.data.length == "1"){		
			usertype.setValue(usertype.data[0].dictID);
			$("#userTypeTr").hide();
		}
		if(usertype.data.length > "1"){
			usertype.setValue("<%=CFNConstants.LOGIN_TYPE_STAFFCODE%>");
		}
	});
	
	var form = new $J.Form("#loginForm");

	// 登录
	function Button_submit_onClick(self) {
		var username = $J.getbyName("username").getValue();
		if(username == '') {
			username = $("#loginForm [name = username]").val();
			if(username == '') {
				nui.cap4jAlert(message.login.inputUsername);
				return;
			}
		}
		var password = $J.getbyName("password").getValue();
		
		if(password == '') {
			password = $("#loginForm [name = password]").val();
			if(password == '') {
				nui.cap4jAlert(message.login.inputPassword);
				return;
			}
		}
		if($J.getbyName("j_captcha") != undefined) {
			var captcha = $J.getbyName("j_captcha").getValue();
			if(captcha == '') {
				nui.cap4jAlert(message.login.inputCaptcha);
				return;
			}
		}
		
		// 判断是否达到最大用户在线数
		// 异步请求数据
    	var ajaxConf = new Cap4jAjaxConf();
    	ajaxConf.setIsShowSuccMsg(false);
    	ajaxConf.setIsShowProcessBar(false);
    	ajaxConf.setSuccessFunc(
    		function(data) {
    			var result = data['result'];
    			if(result == 'true') {
    				nui.cap4jAlert(message.login.reachMaxSession);
    			} else {
    				var encodeUserName = encodeURI(username);
    				// 将特殊字符转义
    				encodeUserName = encodeUserName.replace(/\+/g, '%2B').replace(/\"/g, '%22').replace(/\'/g, '%27').replace(/\//g, '%2F'); 
    				$J.getbyName("j_username").setValue(encodeUserName);
    				<c:if test="${isLocalVerify==true}">
    					password = hex_sha1(password);
    				</c:if>
    				$J.getbyName("j_password").setValue(password);
    				var formObj = $("#loginForm")[0];
    				formObj.action = appContext + "/j_spring_security_check";
    				formObj.submit();
    			}
    		}
		);
		$J.postByAjax(null, "login/isReachMaxSessions.do", ajaxConf);
    }
    
    // 重置
    function Button_reset_onClick(self) {
		form.reset();
    }
    
    // 获取公告信息列表
    function getInfoList() {
    	// 异步请求数据
    	var ajaxConf = new Cap4jAjaxConf();
    	ajaxConf.setIsShowSuccMsg(false);
    	ajaxConf.setIsShowProcessBar(false);
    	ajaxConf.setSuccessFunc(
			function(data) {
				if (data.length){
					var innerHTML = '';
					var array = data;
					var count = array.length > 4 ? 4 : array.length;
					for(var i = 0; i < count; i++) {
						var title = array[i]['title'];
						var oTitle = array[i]['oTitle'];
						var id = array[i]['id'];
						innerHTML += "<tr style=\"line-height:20px\"><td align=\"left\">"
							+ "<img style=\"vertical-align:middle\" src=\"../resources/images/loginpage/dot.png\">"
							+ "&nbsp;&nbsp;&nbsp;&nbsp;<a class=\"info\" href=\"javascript:viewInfoDetial('" 
							+ id + "');\" title=\"" + oTitle + "\" style=\"font-family:宋体;\">" + title + "</a></td></tr>";
					}
					if(array.length == 4) {
						innerHTML += "<tr style=\"line-height:30px\"><td align=\"center\"><span style=\"display:inline-block; width:50px;\"></span><a class=\"info\" href=\"javascript:viewMore()\">更多...</a></td></tr>";
					}
					var tableHTML = "<table cellpadding=\"0\" cellspacing=\"0\" id=\"infoTable\" border=\"0\" style=\"width:100%; height:100%\">"
						+ innerHTML + "</table>";
					document.getElementById('infoDiv').innerHTML = tableHTML;
				}
			}
		);
    	$J.postByAjax(null, "info/index/getLoginInfoList.do", ajaxConf);
    }
    
    // 公告信息详细页面
	function viewInfoDetial(id) {
		var url = "<%= request.getContextPath() %>/info/index/viewInfo.do?id=" + id;
		openWin(url);
	}
	
	// 查看“更多”公告
	function viewMore() {
		var url = "<%= request.getContextPath() %>/info/index/viewMore.do";
		openWin(url);
	}
	
	// 打开窗口方法
	function openWin(url) {
		var left = Math.round((window.screen.width) / 6);
		var top = Math.round((window.screen.height) / 6);
		var height = window.screen.height / 3 * 2;
		var width = window.screen.width / 3 * 2;
		childWin=window.open(url, "_blank", "height="+height+",width="+width+",top="+top+",left="+left+",scrollbars=no,toolbar=no,menubar=no,resizable=yes,location=no,status=no,alwaysRaised=no");
// 		window.onfocus = function focus() {// 重写父窗口window对象中的onfocus，使其在获得焦点时执行以下代码
// 			if (typeof(window.childWin) != "undefined") {// 如果子窗口存在，将焦点转到子窗口
// 				window.childWin.focus();
// 			}
// 		}
	}
    
    // 按钮样式
    function loginMouserdown(){
  		document.getElementById("loginImg").src="../resources/images/loginpage/sure2.png";
  	}
  	function loginMouseover(){
  		document.getElementById("loginImg").src="../resources/images/loginpage/sure1.png";
  	}
  	function loginMoserout(){
  		document.getElementById("loginImg").src="../resources/images/loginpage/sure.png";
  	}
  	
  	function resetMouserdown(){
  		document.getElementById("resetImg").src="../resources/images/loginpage/reset2.png";
  	}
  	function resetMouseover(){
  		document.getElementById("resetImg").src="../resources/images/loginpage/reset1.png";
  	}
  	function resetMoserout(){
  		document.getElementById("resetImg").src="../resources/images/loginpage/reset.png";
  	}
</script>
</html>