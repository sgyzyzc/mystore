<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ include file="/common/jstlres.jsp"%>
<html>
  <head>
    <title>
      PtClass列表
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
<!--                 <td class="form_label">
                  类ID:
                </td>
                <td colspan="1">
                  <input 
                      allowInput="true"
                      class="nui-textbox"
                      dateErrorText="请输入日期格式 {0}"
                      emailErrorText="请输入邮件格式"
                      errorMode="icon"
                      floatErrorText="请输入数字"
                      intErrorText="请输入整数"
                      maxErrorText="数字不能大于 {0}"
                      maxLengthErrorText="不能超过 {0} 个字符"
                      minErrorText="数字不能小于 {0}"
                      minLengthErrorText="不能少于 {0} 个字符"
                      name="clazzId"
                      rangeErrorText="数字必须在 {0} 到 {1} 之间"
                      rangeLengthErrorText="字符数必须在 {0} 到 {1} 之间"
                      required="false"
                      selectOnFocus="false"
                      urlErrorText="请输入URL格式"
                      validateOnChanged="true"
                      validateOnLeave="true"
                      visible="true">

                </input>
              </td>
            </tr> -->
<!--             <tr>
              <td class="form_label">
                类编码:
              </td>
              <td colspan="1">
                <input class="nui-textbox" name="clazzCode">
              </input>
            </td>
          </tr> -->
          <tr>
            <td class="form_label">
              类名称:
            </td>
            <td colspan="1">
              <input class="nui-textbox" name="clazzName">
            </input>
          </td>
        </tr>
        <tr>
          <td class="form_label">
            上级ID:
          </td>
          <td colspan="1">
            <input class="nui-textbox" name="parentId">
          </input>
        </td>
      </tr>
<!--       <tr>
        <td class="form_label">
          层级:
        </td>
        <td colspan="1">
          <input class="nui-textbox" name="treelevel">
        </input>
      </td>
    </tr> -->
<!--     <tr>
      <td class="form_label">
        类描述:
      </td>
      <td colspan="1">
        <input class="nui-textbox" name="clazzDesc">
      </input>
    </td>
  </tr> -->
  <tr>
    <td class="form_label">
      查询路径:
    </td>
    <td colspan="1">
      <input class="nui-textbox" name="spath">
    </input>
  </td>
</tr>
<tr>
  <td class="form_label">
    状态:
  </td>
  <td colspan="1">
    <input class="nui-textbox" name="status">
  </input>
</td>
</tr>
<!-- <tr>
  <td class="form_label">
    是否末级:
  </td>
  <td colspan="1">
    <input class="nui-textbox" name="lastflag">
  </input>
</td>
</tr> -->
<!-- <tr>
  <td class="form_label">
    创建日期:
  </td>
  <td colspan="1">
    <input class="nui-datepicker" name="createTime">
  </input>
</td>
</tr>
<tr>
  <td class="form_label">
    修改日期:
  </td>
  <td colspan="1">
    <input class="nui-datepicker" name="modifyTime">
  </input>
</td> 
</tr> -->
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
    <div id="datagrid1" dataField="data" class="nui-datagrid" style="width:100%;height:100%;" url="<%= request.getContextPath() %>/store/portal/ptClass/query.do" pageSize="20" 			     multiSelect="true" 			     sortField="sortno" sortOrder="asc"  allowSortColumn="false" onselectionchanged="selectionChanged">
      <div property="columns">
        <div type="checkcolumn">
        </div>
        <div type="indexcolumn">
          序号
        </div>
        <div field="clazzId" headerAlign="center" allowSort="true" visible="false">
          类ID
        </div>
        <div field="clazzCode" headerAlign="center" allowSort="true"  visible="false">
          类编码
        </div>
        <div field="clazzName" headerAlign="center" allowSort="true" >
          类名称
        </div>
        <div field="clazzDesc" headerAlign="center" allowSort="true" >
          类描述
        </div>
        <div field="parentId" headerAlign="center" allowSort="true" >
          上级ID
        </div>
        <div field="treelevel" headerAlign="center" allowSort="true" >
          层级
        </div>
        <div field="lastflag" headerAlign="center" allowSort="true" >
          是否末级
        </div>
        <div field="spath" headerAlign="center" allowSort="true" >
          查询路径
        </div>
        <div field="status" headerAlign="center" allowSort="true" >
          状态
        </div>
        <div field="sortno" headerAlign="center" allowSort="true"  visible="false">
          排序号
        </div>
        <div field="remark" headerAlign="center" allowSort="true" >
          备注
        </div>
        <div field="createTime" headerAlign="center" allowSort="true" >
          创建日期
        </div>
        <div field="modifyTime" headerAlign="center" allowSort="true" >
          修改日期
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

  //新增PtClass
  function add() {

    var bizData = {
      pageType : "add"
      };//传入模态窗口页面的json数据
      $J.showmodaldialog("PtClass信息详情", appContext + "/store/portal/ptClass/detail.do", 600, 400, bizData, function(action) {
        grid.reload();
      });
    }

    //编辑PtClass
    function edit() {
      var row = grid.getSelected();
      if (row) {
        var bizData = {
          pageType : "edit",
          clazzId : row.clazzId
          };
          $J.showmodaldialog("PtClass信息详情", appContext + "/store/portal/ptClass/detail.do", 600, 400, bizData, function(action) {
            grid.reload();
          });
        } else {
          $J.cap4jAlert("请选中一条记录", "提示");
        }
      }

      //删除PtClass
      function remove() {
        var rows = grid.getSelecteds();
        if (rows.length > 0) {
          $J.cap4jConfirm("确定删除选中记录？", "删除提示", function(action) {
            if (action == 'ok') {
              var ids = "";
              for(var index = 0;index < rows.length;index++){
                if(ids == ""){
                  ids = rows[index].clazzId;
                } else {
                  ids += "," + rows[index].clazzId;
                }
              }
              var ajaxConf = new Cap4jAjaxConf();
              ajaxConf.setSuccessFunc(refresh);
              $J.postByAjax({"ids":ids}, appContext + "/store/portal/ptClass/delete.do", ajaxConf);
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
