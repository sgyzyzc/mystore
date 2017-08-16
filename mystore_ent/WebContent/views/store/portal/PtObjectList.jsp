<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="false"%>
<%@ include file="/common/jstlres.jsp"%>
<html>
  <head>
    <title>
      PtObject列表
    </title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <%@ include file="/common/nuires.jsp"%>
  </head>
  <body>
    <div class="nui-splitter" style="width:100%;height:100%;" borderStyle="border: 0;">
      <div size="500px;" showCollapseButton="true" style="border: 0;"> 
        <div class="nui-panel" title="业务对象" style="width: 100%;height: 150px;">
          <div id="form1" class="nui-form" align="left"> 
            <table id="table1" class="table">
              <tr>
                <td class="form_label">
                 	 对象Id:
                </td>
                <td colspan="1">
                  <input class="nui-textbox" name="objectId" required="false" visible="true">
                </input>
              </td>
              	<td class="form_label">
		            	类名称:
		          </td>
		          <td colspan="1">
		            <input class="nui-textbox" name="clazzName" required="false" visible="true">
		          </input>
		        </td>
            </tr>

        <tr>
          <td class="form_label">
            	类名称:
          </td>
          <td colspan="1">
            <input class="nui-textbox" name="clazzName" required="false" visible="true">
          </input>
        </td>
	       <td class="form_label">
	          	状态:
	        </td>
	        <td colspan="1">
	          <input class="nui-textbox" name="status" required="false" visible="true">
	        </input>
	      </td>
      </tr>

<!--     <tr>
      <td class="form_label">
       	 创建时间:
      </td>
      <td colspan="1">
        <input class="nui-datepicker" name="creatTime" visible="true">
      </input>
    </td>
    	<td class="form_label">
     	 修改时间:
    </td>
    <td colspan="1">
      <input class="nui-datepicker" name="modifyTime" visible="true">
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
    <div id="datagrid1" dataField="data" class="nui-datagrid" style="width:100%;height:100%;" url="<%= request.getContextPath() %>/store/portal/ptObject/query.do" pageSize="10"     multiSelect="false"     sortField="objectId" sortOrder="asc"  allowSortColumn="false" onselectionchanged="selectionChanged">
      <div property="columns">
        <div type="checkcolumn">
        </div>
<!--         <div type="indexcolumn">
          序号
        </div>   -->
<!--         <div field="objectCode" headerAlign="center" allowSort="true" >
         	 对象编码
        </div>
        <div field="objectName" headerAlign="center" allowSort="true" >
          	对象名称
        </div>
        <div field="objectDesc" headerAlign="center" allowSort="true" >
          	对象描述
        </div> -->
        <div field="clazzName" headerAlign="center" allowSort="true" >
          	类名称
        </div>
        <div field="objectId" headerAlign="center" allowSort="true" visible="true" width="150px">
         	 对象ID
        </div>
        <div field="sortno" headerAlign="center" allowSort="true" >
          	排序号
        </div> 
        <div field="status" headerAlign="center" allowSort="true" >
          	状态
        </div>
        <div field="creatTime" headerAlign="center" allowSort="true" >
          	创建时间
        </div>
        <div field="modifyTime" headerAlign="center" allowSort="true" >
          	修改时间
        </div>
      </div>
    </div>
  </div>

</div>


<div   showCollapseButton="false" style="border: 0;">
<div  class="nui-panel" title="对象属性" style="width: 100%;height: 100%;">
	<div id="form2" class="nui-form" align="left"> 
		<input class="nui-textbox" id="objectId_form2" name="objectId" visible="false">
	</div>

  <div class="nui-toolbar" style="border-bottom: 0; padding: 0px;">
    <table style="width: 100%;">
      <tr>
        <td style="width: 100%;">
          <a class="nui-button" iconCls="icon-add" onclick="add2()">
            增加
          </a>
          <a id="update2" class="nui-button" iconCls="icon-edit" onclick="edit2()">
            编辑
          </a>
          <a class="nui-button" iconCls="icon-remove" onclick="remove2()">
            删除
          </a>
        </td>
      </tr>
    </table>
  </div> 
  <div class="nui-fit">
    <div id="datagrid2" dataField="data" class="nui-datagrid" style="width:100%;height:100%;" url="<%= request.getContextPath() %>/store/portal/ptData/query.do" pageSize="10" 			     multiSelect="true" 			     sortField="propName" sortOrder="asc"  allowSortColumn="false" onselectionchanged="selectionChanged2">
      <div property="columns">
        <div type="checkcolumn">
        </div>
<!--         <div type="indexcolumn">
          序号
        </div> --> 
        <div field="dataId" headerAlign="center" allowSort="true" visible="false">
          dataId
        </div>
        <div field="propName" headerAlign="center" allowSort="true" >
          	属性名称
        </div>
        <div field="propDesc" headerAlign="center" allowSort="true" >
          	属性描述
        </div>
        <div field="value" headerAlign="center" allowSort="true" >
          	值
        </div>
        <div field="valueType" headerAlign="center" allowSort="true" >
         	 值类型
        </div>
        <div field="objectId" headerAlign="center" allowSort="true" visible="false" >
          objectId
        </div>
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

  //新增PtObject
  function add() {

    var bizData = {
      pageType : "add"
      };//传入模态窗口页面的json数据
      $J.showmodaldialog("PtObject信息详情", appContext + "/store/portal/ptObject/detail.do", 600, 400, bizData, function(action) {
        grid.reload();
      });
    }

    //编辑PtObject
    function edit() {
      var row = grid.getSelected();
      if (row) {
        var bizData = {
          pageType : "edit",
          objectId : row.objectId
          };
          $J.showmodaldialog("PtObject信息详情", appContext + "/store/portal/ptObject/detail.do", 600, 400, bizData, function(action) {
            grid.reload();
          });
        } else {
          $J.cap4jAlert("请选中一条记录", "提示");
        }
      }

      //删除PtObject
      function remove() {
        var rows = grid.getSelecteds();
        if (rows.length > 0) {
          $J.cap4jConfirm("确定删除选中记录？", "删除提示", function(action) {
            if (action == 'ok') {
              var ids = "";
              for(var index = 0;index < rows.length;index++){
                if(ids == ""){
                  ids = rows[index].objectId;
                } else {
                  ids += "," + rows[index].objectId;
                }
              }
              var ajaxConf = new Cap4jAjaxConf();
              ajaxConf.setSuccessFunc(refresh);
              $J.postByAjax({"ids":ids}, appContext + "/store/portal/ptObject/delete.do", ajaxConf);
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
    	  debugger;
        var rows = grid.getSelecteds();
/*         if (rows.length > 1) {
          updateBtn.disable();
        } else {
          updateBtn.enable();
        } */
        if(rows.length == 1){
        	var row = rows[0];
        	$J.getForm("form2").setData(row);
        	search2();
        }
      }
    </script>
    <script type="text/javascript">
    $J.parse();
    var grid2;
    var form2;
    var updateBtn2;
    $(function(){
      grid2 = $J.get("datagrid2");
      form2 = $J.getForm("form2");
      updateBtn2 = $J.get("update2");
      //grid2.load();

    });

    //新增PtData
    function add2() {

      var bizData = {
        pageType : "add"
        };//传入模态窗口页面的json数据
        $J.showmodaldialog("PtData信息详情", appContext + "/store/portal/ptData/detail.do", 600, 400, bizData, function(action) {
          grid2.reload();
        });
      }

      //编辑PtData
      function edit2() {
        var row = grid2.getSelected();
        if (row) {
          var bizData = {
            pageType : "edit",
            dataId : row.dataId
            };
            $J.showmodaldialog("PtData信息详情", appContext + "/store/portal/ptData/detail.do", 600, 400, bizData, function(action) {
              grid2.reload();
            });
          } else {
            $J.cap4jAlert("请选中一条记录", "提示");
          }
        }

        //删除PtData
        function remove2() {
          var rows = grid2.getSelecteds();
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
                $J.postByAjax({"ids":ids}, appContext + "/store/portal/ptData/delete.do", ajaxConf);
              }
            });
          } else {
            $J.cap4jAlert("请选中一条记录", "提示");
          }
        }

        //重新刷新页面
        function refresh2() {
        	search2();
          //grid2.reload();
          updateBtn2.enable();
        }

        //查询
        function search2() {
          grid2.load(form2.getData());//grid查询
        }

        //重置查询条件
        function reset() {
          form2.reset();
        }

        //当选择列时
        function selectionChanged2() {
          var rows = grid2.getSelecteds();
          if (rows.length > 1) {
            updateBtn2.disable();
          } else {
            updateBtn2.enable();
          }
        }
    </script>
  </body>
</html>
