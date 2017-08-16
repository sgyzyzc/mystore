<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ include file="/common/jstlres.jsp"%>
<html>
  <head>
    <title>
      编辑PtObject
    </title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <%@ include file="/common/nuires.jsp"%>
  </head>
  <body>
    <!-- 标识页面是查看(query)、修改(edit)、新增(add) -->
    <div class="nui-fit">
      <input name="pageType" class="nui-hidden" />
      <form id="dataform1" method="post">
        <div style="padding-bottom: 5px; padding-top: 5px;">
          <input class="nui-hidden"  name="clazzId" />  
          <table style="table-layout: fixed;" align="center">
            <tr>
              <td class="form_label">
                类编码:
              </td>
              <td colspan="1">
                <input class="nui-textbox" name="clazzCode"  visible="true">
              </input>
            </td>
            <td class="form_label">
              类名称:
            </td>
            <td colspan="1">
              <input class="nui-textbox" name="clazzName" visible="true">
            </input>
          </td>
        </tr>
        <tr>
          <td class="form_label">
            类描述:
          </td>
          <td colspan="1">
            <input class="nui-textbox" name="clazzDesc" visible="true">
          </input>
        </td>
        <td class="form_label">
          上级ID:
        </td>
        <td colspan="1">
          <input class="nui-textbox" name="parentId" visible="true">
        </input>
      </td>
    </tr>
    <tr>
      <td class="form_label">
        层级:
      </td>
      <td colspan="1">
        <input class="nui-textbox" name="treelevel" visible="true">
      </input>
    </td>
    <td class="form_label">
      是否末级:
    </td>
    <td colspan="1">
      <input class="nui-textbox" name="lastflag" visible="true">
    </input>
  </td>
</tr>
<tr>
  <td class="form_label">
    查询路径:
  </td>
  <td colspan="1">
    <input class="nui-textbox" name="spath" visible="true">
  </input>
</td>
<td class="form_label">
  状态:
</td>
<td colspan="1">
  <input class="nui-textbox" name="status" visible="true">
</input>
</td>
</tr>
<tr>
  <td class="form_label">
    排序号:
  </td>
  <td colspan="1">
    <input class="nui-textbox" name="sortno" visible="true">
  </input>
</td>
<td class="form_label">
  备注:
</td>
<td colspan="1">
  <input class="nui-textbox" name="remark" visible="true">
</input>
</td>
</tr>
<tr>
  <td class="form_label">
    创建日期:
  </td>
  <td colspan="1">
    <input class="nui-datepicker" name="createTime" visible="true">
  </input>
</td>
<td class="form_label">
  修改日期:
</td>
<td colspan="1">
  <input class="nui-datepicker" name="modifyTime" visible="true">
</input>
</td>
</tr>
</table>
</div>
</form>
</div>
<div class="nui-toolbar" id="toolbardiv" style="text-align:center;padding-top:10px;padding-bottom:10px;margin-bottom:-5px;" borderStyle="border-left:0;border-bottom:0;border-right:0;">
  <a class="nui-button" onclick="onCancel" style="margin-right:20px;" iconCls="icon-close">
    取消
  </a>
  <a class="nui-button" onclick="onOk" iconCls="icon-ok">
    确定
  </a>
</div>
<script type="text/javascript">
  changeButtonPosition($("#toolbardiv"));
  //$J.parse();
  $(function(){
  });
  //json方式保存数据
  function saveJson() {
    //保存
    var urlStr = "/store/portal/ptClass/save.do";
    var pageType = $J.getbyName("pageType").getValue();//获取当前页面是编辑还是新增状态
    //表示为编辑状态
    if (pageType == "edit") {
      urlStr = "/store/portal/ptClass/update.do";
    }
    var ajaxConf = new Cap4jAjaxConf();
    ajaxConf.setSuccessFunc(CloseWindow);
    $J.submitForm("dataform1", urlStr, ajaxConf);
  }

  //获取父页面传递来的json数据
  function setData(data) {
    //跨页面传递的数据对象，克隆后才可以安全使用
    var infos = $J.clone(data);

    //保存list页面传递过来的页面类型：add表示新增、edit表示编辑
    $J.getbyName("pageType").setValue(infos.pageType);
    //如果是点击编辑类型页面
    if (infos.pageType == "edit") {
      //编辑页面根据主键加载业务信息
      var ajaxConf = new Cap4jAjaxConf();
      ajaxConf.setIsShowSuccMsg(false);
      ajaxConf.setSuccessFunc(function(data){
    	  
        var form = $J.getForm("dataform1");//将普通form转为nui的form
        form.setData(data);
        form.setChanged(false);
      });

      $J.postByAjax({"id":infos.clazzId}, "/store/portal/ptClass/getPtClassVOById.do", ajaxConf);
    }
  }

  //关闭窗口
  function CloseWindow(action) {
    if (action == "close" && form.isChanged()) {
      if (confirm("数据被修改了，是否先保存？")) {
        return false;
      }
    }
    $J.closemodaldialog("OK");
  }

  //确定保存或更新
  function onOk(e) {
    saveJson();
  }

  //取消
  function onCancel(e) {
    $J.closemodaldialog("cancel");
  }
</script>
</body>
</html>
