<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ include file="/common/jstlres.jsp"%>
<html>
  <head>
    <title>
      PtData列表
    </title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <%@ include file="/common/nuires.jsp"%>
  </head>
  <body>
    <div class="nui-splitter" style="width:100%;height:100%;" borderStyle="border: 0;">
      <div size="230px;" showCollapseButton="true" style="border: 0;">
        <div class="nui-panel" title="查询条件" style="width: 100%;height: 100%;">
          <div id="form1" class="nui-form" align="left">
            <table id="table1" class="table">
              <tr>
                <td class="form_label">
                  dataId:
                </td>
                <td colspan="1">
                  <input class="nui-textbox" name="dataId" required="false" visible="true">
                </input>
              </td>
            </tr>
            <tr>
              <td class="form_label">
                propName:
              </td>
              <td colspan="1">
                <input class="nui-textbox" name="propName" required="false" visible="true">
              </input>
            </td>
          </tr>
          <tr>
            <td class="form_label">
              propDesc:
            </td>
            <td colspan="1">
              <input class="nui-textbox" name="propDesc" required="false" visible="true">
            </input>
          </td>
        </tr>
        <tr>
          <td class="form_label">
            valueType:
          </td>
          <td colspan="1">
            <input class="nui-textbox" name="valueType" required="false" visible="true">
          </input>
        </td>
      </tr>
      <tr>
        <td class="form_label">
          objectId:
        </td>
        <td colspan="1">
          <input class="nui-textbox" name="objectId" required="false" visible="true">
        </input>
      </td>
    </tr>
    <tr>
      <td class="form_label" colspan="2" align="center">
        <a class="nui-button" iconCls="icon-search" onclick="search()">
          查询
        </a>
        &nbsp;&nbsp;
        <a class="nui-button" iconCls="icon-reload" onclick="reset()">
          重置
        </a>
      </td>
    </tr>
  </table>
</div>
</div>
</div>
<div showCollapseButton="false" style="border: 0;">
  <div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
    <table style="width: 100%;">
      <tr>
        <td style="width: 100%;">
          <a class="nui-button" iconCls="icon-add" onclick="add()">
            增加
          </a>
          <a id="update" class="nui-button" iconCls="icon-edit" onclick="edit()">
            编辑
          </a>
          <a class="nui-button" iconCls="icon-remove" onclick="remove()">
            删除
          </a>
        </td>
      </tr>
    </table>
  </div>
  <div class="nui-fit">
    <div id="datagrid1" dataField="data" class="nui-datagrid" style="width:100%;height:100%;" url="<%= request.getContextPath() %>/ptData/query.do" pageSize="10" 			     multiSelect="true" 			     sortField="propName" sortOrder="asc"  allowSortColumn="false" onselectionchanged="selectionChanged">
      <div property="columns">
        <div type="checkcolumn">
        </div>
        <div type="indexcolumn">
          序号
        </div>
        <div field="dataId" headerAlign="center" allowSort="true" visible="false">
          dataId
        </div>
        <div field="propName" headerAlign="center" allowSort="true" >
          propName
        </div>
        <div field="propDesc" headerAlign="center" allowSort="true" >
          propDesc
        </div>
        <div field="value" headerAlign="center" allowSort="true" >
          value
        </div>
        <div field="valueType" headerAlign="center" allowSort="true" >
          valueType
        </div>
        <div field="objectId" headerAlign="center" allowSort="true" >
          objectId
        </div>
      </div>
    </div>
  </div>
</div>
</div>
<script type="text/javascript">
  $J.parse();
  var grid;
  var form;
  var updateBtn;
  $(function(){
    grid = $J.get("datagrid1");
    form = $J.getForm("form1");
    updateBtn = $J.get("update");
    grid.load();

  });

  //新增PtData
  function add() {

    var bizData = {
      pageType : "add"
      };//传入模态窗口页面的json数据
      $J.showmodaldialog("PtData信息详情", appContext + "/ptData/detail.do", 600, 400, bizData, function(action) {
        grid.reload();
      });
    }

    //编辑PtData
    function edit() {
      var row = grid.getSelected();
      if (row) {
        var bizData = {
          pageType : "edit",
          dataId : row.dataId
          };
          $J.showmodaldialog("PtData信息详情", appContext + "/ptData/detail.do", 600, 400, bizData, function(action) {
            grid.reload();
          });
        } else {
          $J.cap4jAlert("请选中一条记录", "提示");
        }
      }

      //删除PtData
      function remove() {
        var rows = grid.getSelecteds();
        if (rows.length > 0) {
          $J.cap4jConfirm("确定删除选中记录？", "删除提示", function(action) {
            if (action == 'ok') {
              var ids = "";
              for(var index = 0;index < rows.length;index++){
                if(ids == ""){
                  ids = rows[index].dataId;
                } else {
                  ids += "," + rows[index].dataId;
                }
              }
              var ajaxConf = new Cap4jAjaxConf();
              ajaxConf.setSuccessFunc(refresh);
              $J.postByAjax({"ids":ids}, appContext + "/ptData/delete.do", ajaxConf);
            }
          });
        } else {
          $J.cap4jAlert("请选中一条记录", "提示");
        }
      }

      //重新刷新页面
      function refresh() {
        grid.reload();
        updateBtn.enable();
      }

      //查询
      function search() {
        grid.load(form.getData());//grid查询
      }

      //重置查询条件
      function reset() {
        form.reset();
      }

      //enter键触发查询
      function onKeyEnter(e) {
        search();
      }

      //当选择列时
      function selectionChanged() {
        var rows = grid.getSelecteds();
        if (rows.length > 1) {
          updateBtn.disable();
        } else {
          updateBtn.enable();
        }
      }
    </script>
  </body>
</html>
