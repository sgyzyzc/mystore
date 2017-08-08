<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="com.cib.cap4j.cfn.util.CfnUtils"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ include file="/common/jstlres.jsp" %>
<%@ include file="/common/nuires.jsp" %>
<%@page import="com.cib.cap4j.core.context.ContextUtil"%>
<%@page import="com.cib.cap4j.core.security.Cap4jUserInfo"%>
<%
	Cap4jUserInfo userInfo = ContextUtil.getLoginUser();
	String userId = "";
	String userCode = "";
	String userName = "";
	String display_userCode = "";
	String display_userName = "";
	if(userInfo != null) {
		userId = userInfo.getUserId();
		userCode = userInfo.getUserCode();
		userName = userInfo.getUsername();
		display_userCode = CfnUtils.substringAbsolute(userCode, 10, "...");
		display_userName = CfnUtils.substringAbsolute(userName, 10, "...");
	}
%>

<!--
   * 系统主页面
   *
   * Created on 2014-05-12
   * @author 陈之轩
   * @reviewer 
-->
<html>
<head>
	<title>${titleOfWindow}</title>
	<link href="<%= request.getContextPath() %>/resources/css/main/main.css" rel="stylesheet" type="text/css" />
<style type="text/css">
	/** 菜单图片样式 */
    ${ allCss }
</style>
<style type="text/css">
	/** 菜单不可用样式 */
	#notEnabledItemCls div
    {
    	color : gray;
    }
	.mini-button-allow {
	    _margin-top: 7px;
	}
	.mini-button-text.mini-button-icon.icon-skin{
		padding: 4px 3px 4px 25px;
		_padding: 6px 3px 4px 25px;
	}
	.mini-button-plain{
		height: 21px;
	}
	
</style>
<script type="text/javascript">
	$(function(){
		//整个项目中只调用一次，根据用户id获取所有的功能权限列表以及对应的操作
		initMain();

		// 首页菜单
		var menuJson = ${menuJson};
		$J.get("menu1").setData(menuJson);
		
		// 首次登录是否一定需要修改密码
		var isPwdNeedModified = ${isPwdNeedModified};
		if (isPwdNeedModified) {
			changePassword_onClick(1);
		}

		// IE6下去除图片透明层底色
		if ($.browser.msie && parseInt($.browser.version) <= 6.0) {
			for (var j=0; j<document.images.length; j++) {
				var img = document.images[j];
				var imgName = img.src.toUpperCase();
				if (imgName.substring(imgName.length-3, imgName.length) == "PNG") {
					var imgID = (img.id) ? "id='" + img.id + "' " : "" ;
					var imgClass = (img.className) ? "class='" + img.className + "' " : "" ;
					var imgTitle = (img.title) ? "title='" + img.title + "' " : "title='" + img.alt + "' " ;
					var imgStyle = "display:inline-block;" + img.style.cssText ;
					if (img.align == "left") imgStyle = "float:left;" + imgStyle ;
					if (img.align == "right") imgStyle = "float:right;" + imgStyle ;
					if (img.parentElement.href) imgStyle = "cursor:hand;" + imgStyle ;
					var strNewHTML = "<span " + imgID + imgClass + imgTitle
						+ " style=\"" + "width:" + (img.width * 0.8) + "px; height:" + (img.height * 0.8) + "px;" + imgStyle + ";"
						+ "filter:progid:DXImageTransform.Microsoft.AlphaImageLoader"
						+ "(src=\'" + img.src + "\', sizingMethod='scale');\"></span>" ;
					img.outerHTML = strNewHTML;
					j = j-1;
				}
			}
		}
	});

    function initMain(){
       var arr = new Array();
       arr[USER_ID] = "<%=userId%>";//验证阶段，默认使用初始化用户id
       window[GLOBAL_CONTEXT] = arr;//初始化全局权限容器
       //整个项目中只调用一次，根据用户id获取所有的功能权限列表以及对应的操作
       if(nui.enableResAuth){
       	  $J.loadAuthResList();//获取权限资源列表
       }
       //整个项目中只调用一次，根据当前用户id获取所有的数据权限
       if(nui.enableDataAuth){
       	  $J.loadDataPermissionList();//获取数据权限资源列表
       }
    }
</script>
</head>
<body id="panel">
	<div class="header" region="north" showSplit="false" showHeader="false">
		<table border=0 cellpadding=0 cellspacing=0 width=100% height=100%>
			<tr>
				<td width="30%">
					<table style="height:40px;" border=0 cellpadding=0 cellspacing=0>
						<tr>
							<td>
								<img id="logo" src="../resources/images/main_head_logo.png" style="width:248.8px;height:29.6px;" />
							</td>
						</tr>
					</table>
				</td>
				<td align="center" width="40%">
					<%-- <table style="height:40px; vertical-align: middle;" border=0 cellpadding=0 cellspacing=0>
						<tr>
							<td><span style="height:40px;font-weight:normal;font-size:20px;font-family:黑体;">${titleOfMainPage}</span></td>
						</tr>
					</table> --%>
				</td>
				<td align="right">
					<table style="height:40px;" border=0 cellpadding=0 cellspacing=0>
						<tr style="height:22px;" align="right">
							<td>
								<table border=0 cellpadding=0 cellspacing=0>
									<tr>
										<td style="padding-right:8px">
											<a class="nui-menubutton" iconCls="icon-skin" plain="true" menu="#skinMenu" style="color:#006699;margin-top:0px;_margin-top:-2px;">&nbsp;<fmt:message key='main.skin'/></a>
											<ul id="skinMenu" class="nui-menu" style="display:none;">
												<li onclick="onSkinChanged(this,'default')"><fmt:message key='main.default'/></li>
										        <li onclick="onSkinChanged(this,'blue')"><fmt:message key='main.blue'/></li>
									            <li onclick="onSkinChanged(this,'blue2003')"><fmt:message key='main.blue2003'/></li>
									            <li onclick="onSkinChanged(this,'blue2010')"><fmt:message key='main.blue2010'/></li>
										        <li onclick="onSkinChanged(this,'gray')"><fmt:message key='main.gray'/></li>
									            <li onclick="onSkinChanged(this,'olive2003')"><fmt:message key='main.olive2003'/></li>
									            
									            <!-- 仿bootstrap风格 -->
									            <li onclick="onSkinChanged(this,'bootstrap')">bootstrap</li>
											</ul>
										</td>
										<td>
										<ul class="m_op" style="padding-left:0px">
										<li><a class="m_op_lk_1" href="#" 
										onclick="feedback_onClick()"><fmt:message key='main.feedback'/></a></li>
										<li><a class="m_op_lk_4" 
										href="<%=request.getContextPath()+"/j_spring_security_logout"%>"><fmt:message key='main.logout'/></a></li>
										</ul>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr style="line-height:18px;" align="right">
							<td>
								<table border=0 cellpadding=0 cellspacing=0>
									<tr>
										<td>
											<span style="font-family:宋体;">
											<fmt:message key='main.welcome'/>，<a href="#" style="text-decoration:none;color:blue;"
											onclick="detailInfo_onClick()" title="<%=userName %>"><%=display_userName %>(<%=display_userCode %>)</a>
											</span>
										</td>
										<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
									</tr>
								</table>
							</td>
							<td>&nbsp;</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<ul id="menu1" class="nui-menubar" onitemclick="menuClick" ></ul>
	<div class="nui-fit" style="padding-top:5px;">
        <!--Tabs-->
        <div id="mainTabs" class="nui-tabs" activeIndex="0" style="width:100%;height:100%;">
            <div title="<fmt:message key='main.title'/>" url="../login/welcome.do">
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
	top.okBtnPosition = "${okBtnPosition}";
    $J.parse();

	// 菜单点击事件
    function menuClick(e) {
        var item = e.item;
        var isLeaf = e.isLeaf;

        if (isLeaf) {
            showTab(item);
        }            
    }
    function showTab(node) {
        var tabs = $J.get("mainTabs");
        var tabsNum = tabs['tabs'].length;
        var maxTabsNum = 9;
        var id = "tab$" + node.id;
        var tab = tabs.getTab(id);
        if(tabsNum && tabsNum >= maxTabsNum && !tab) {
        	$J.cap4jConfirm("打开菜单超过9个，可能造成系统速度变慢，确定仍然打开？", message.common.prompt,
        		function(action) {
        			if(action == 'ok') {
        				createTab();
        			}
        		}
        	);
        } else {
        	createTab();
        }
        
		function createTab() {
			var id = "tab$" + node.id;
	        var tab = tabs.getTab(id);
	        if (!tab) {
	            tab = {};
	            tab.name = id;
	            tab.title = node.text;
	            //tab.showCloseButton = true;
				tab.showMenuButton = true;

	            //这里拼接了url，实际项目，应该从后台直接获得完整的url地址
	            var url = node.url;
	            if(url == null || url == '') {
	            	$J.cap4jAlert("未配置菜单URL");
	            	return;
	            } else if(url.indexOf("/") != 0) {
	            	url = "/" + url;
	            }
	            tab.url = "<%= request.getContextPath() %>" + url;
				
	            tabs.addTab(tab);
	        }
	        tabs.activeTab(tab);
		}
    }
    
    function changePassword_onClick(flag) {
    	var url = "<%= request.getContextPath() %>/login/changePassword.do";
        var bizParams = { action: "changePassword", flag: flag};
        var showCloseButton;
        if(flag == 1) {
        	showCloseButton = false;
        } else {
        	showCloseButton = true;
        }
        $J.showmodaldialog("修改密码", url, 360, 300, bizParams, null, showCloseButton);        
    }
    
    function feedback_onClick() {
		var url = "<%= request.getContextPath() %>/feedbackQuestion/add.do";
		var height = $(window).height() < 600 ? $(window).height() : 600;
	    $J.showmodaldialog("问题反馈新增", url, 600, height, null, null);
    }
    
    function detailInfo_onClick() {
    	var node = {};
    	node.id = "viewDetail";
    	node.text = "用户详细信息";
    	node.url = "/login/viewDetail.do";
    	showTab(node);
    
	    //var url = "<%= request.getContextPath() %>/staff/viewDetail.do";
        //$J.showmodaldialog("用户详细信息", url, 930, 630, null, null);
    }
    
    function onSkinChanged(e, thisValue){
    	var value = thisValue;
    	if(value) {
	    	$J.Cookie.set("nuiSkin",value);
    	}
    	window.location.reload();
    }

    
</script>
</html>
