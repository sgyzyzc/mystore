<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><spring:message code="title" /></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="<%= request.getContextPath() %>/resources/nui/$J.js"
	type="text/javascript"></script>
<style type="text/css">
html,body {
	margin: 0;
	padding: 0;
	border: 0;
	width: 100%;
	height: 100%;
	overflow: hidden;
}
</style>
<script type="java/script"></script>
</head>
<body style="width: 100%; height: 100%;">
	<!--Layout-->
	<div id="layout1" class="nui-layout" style="width: 100%; height: 100%;">
		<div class="header" region="north" height="70" showSplit="false"
			showHeader="false">
			<ul id="menu1" class="nui-menubar" style="width: 100%;"
				url="menudata.txt" onitemclick="onItemClick" textField="text"
				dataField="treeNodes" idField="id" parentField="pid">
			</ul>
		</div>
		<div title="south" region="south" showSplit="false" showHeader="false"
			height="30"></div>
		<div title="center" region="center" bodyStyle="overflow:hidden;">
			<!--Splitter-->
			<div class="nui-splitter" style="width: 100%; height: 100%;"
				borderStyle="border:0;">
				<div size="180" maxSize="250" minSize="100"
					showCollapseButton="true"></div>
				<div showCollapseButton="false">
					<!-- Main Working Area -->

					<div style="border-bottom: 0; padding: 0px;">
					<fieldset>
					<legend>高级查询</legend>
						<table style="width: 100%;">
							<tr>
								<td style="width: 100%;"><a class="nui-button"
									iconCls="icon-add" onclick="add()">增加</a> <a class="nui-button"
									iconCls="icon-add" onclick="edit()">编辑</a> <a
									class="nui-button" iconCls="icon-remove" onclick="remove()">删除</a>
									<a class="nui-button" iconCls="icon-add" onclick="testzz()">模拟遮罩</a>
								</td>
								<td style="white-space: nowrap;"><input id="key"
									class="nui-textbox" emptyText="请输入名称" style="width: 150px;" />
									<a class="nui-button" onclick="search()">查询</a></td>
							</tr>
						</table>
						</fieldset>
					</div>

					<div class="nui-fit">
						<div id="datagrid_schedularMonitor" dataField="data"
							class="nui-datagrid" style="width: 100%; height: 100%;"
							url="<%= request.getContextPath() %>/ipCodeType/list.do"
							multiSelect="false">
							<div property="columns">
								<div type="checkcolumn"></div>
								<div type="indexcolumn"></div>
								<div field="codeTypeKy" width="120" headerAlign="center"
									allowSort="true" visible="false">码表ID</div>
								<div field="codeTypeCode" width="120" headerAlign="center"
									allowSort="true">码表编码</div>
								<div field="codeTypeName" width="120" headerAlign="center"
									allowSort="true">码表名称</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</body>
<script type="text/javascript">
    	$J.parse();

    	function search(){
        	$J.cap4jAlert("UnderConstruction");
        	}
    	</script>
</html>