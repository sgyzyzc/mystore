<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/jstlres.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><fmt:message key="platform.syserror.ErrorTitle"/></title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<%@ include file="/common/nuires.jsp"%>
<script language="javascript">
	var isShowDetail = false;
	function setData(data) {
		$("#messagecontent").text(data.errMsg);
		$("#detailStackRow").text(data.errStack);
	}
	$(function(){
		$("#okBtn").click(function(){
			$J.closemodaldialog("OK");
		});
		$("#viewDetail").click(function(){
			if(!isShowDetail){
				isShowDetail = true;
				$("#detailText").text("<fmt:message key='platform.syserror.CloseDetailBtn'/>");
				$("#detailStackRow").css("display","block");
			}else{
				isShowDetail = false;
				$("#detailText").text("<fmt:message key='platform.syserror.ViewDetailBtn'/>");
				$("#detailStackRow").css("display","none");
			}
			
		});
		
	});
</script>
</head>
<body>
	<div class="mini-panel-body" style="overflow: hidden;">
		<div class="mini-messagebox-content">
			<table class="mini-messagebox-table" id="mini-34$table"
				style="width: 100%;" cellspacing="0" cellpadding="0">
				<tbody>
					<tr>
						<td><div class="mini-messagebox-error"></div></td>
						<td id="messagecontent" class="mini-messagebox-content-text" style="width: 100%;"></td>
					</tr>
				</tbody>
			</table>
			<div class="mini-messagebox-buttons">
				<a class="mini-button" href="javascript:void(0)" id="okBtn"><span class="mini-button-text"><fmt:message key="platform.syserror.OKBtn"/></span></a>
				<a class="mini-button" href="javascript:void(0)" id="viewDetail"><span class="mini-button-text" id="detailText"><fmt:message key="platform.syserror.ViewDetailBtn"/></span></a>
			</div>
			<div id="detailStackRow" style="display: none;overflow: auto;border: 1px solid #E3E6E8;height: 155px;" ></div>
		</div>
	</div>
</body>
</html>