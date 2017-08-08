/**
 * 返回该用户对应的功能权限列表，以及对控件的RESID对应的url功能权限判断是否拥有权限
 * 并根据码表的设置，确定用户无对应的功能权限时前端控件的置灰还是不可见
 * 
 * 2014-07-30 在以上基础上添加了数据权限的控制
 *
 * Created on 2014-5-22
 * @author wdr_huangwenwei 
 * @reviewer
 */

/**
 * 是否包含给定的子串
 * @param substr
 * @returns {Boolean}
 */
String.prototype.contains = function(substr) {
	return this.indexOf(substr) >= 0;
};

// 常量定义 //
var GLOBAL_CONTEXT = '_globalContext';//
var AUTH_RES_LIST = '_authResList';//资源权限列表Key
var USER_ID = '_userId';//用户ID上下文Key

var AUTH_DATA_PERMISSION = '_authDataPermission';//数据权限列表key

// 数据权限程序开关 //
nui.enableDataAuth = true; //是否启用数据权限控制，为false则表示关闭数据权限控制
// 功能权限程序开关 //
nui.enableResAuth = true; // 是否启用资源权限控制，为false则表示关闭功能权限控制

//系统码表配置的当前用户无权限时，前端控件不显示还是置灰
var NO_AUTH = '0';//默认置灰
var DISABLED = '0';//0表示置灰
var REMOVED = '1';//1表示不显示

//数据权限标识字段列是否容许修改
var DATA_ENABLED = '1';//1或其它表示可以修改

/**
 * 判断是否为顶层窗口
 * @param win window对象
 */
function isTop(win) {
	return win.parent === win; // 顶层窗口的parent等于自身窗口
}

/**
 * 根据传入的window对象，依次遍历parent直到top，查找属性值
 * @param win window对象
 * @param propName 属性名称
 * @return 属性值
 */
nui.findPropertyValue = function(win, propName) {
	if(!win) {
		return null;
	}
	
	if(win[propName]) {
		return win[propName];
	}
	
	if(isTop(win)) { 
		return null;
	} 
	
	return this.findPropertyValue(win.parent, propName);
};

/**
 * 获取全局数据上下文
 */
nui.getGlobalContext = function() {
	return this.findPropertyValue(window, GLOBAL_CONTEXT);
};

/**
 * 根据当前登录用户的userId加载（同步方式）已授权的资源列表。<br/>
 * 该方法只需要在Top中调用一次，以后子页面直接通过nui.getAuthResList()方法获取
 * 
 */
nui.loadAuthResList = function() {
	var globalContext = this.getGlobalContext();
	if(!globalContext) {
		return;
	}
	//使用同步方式来获取后台的功能权限数据
	nui.ajax({
		type: 'post',
		url: appContext + '/auth/loadAuth.do',
		async:false,
		success: function(text,status,response) {
			obj = nui.decode(text);
			if(obj.success) {
				//将功能列表放入main.jsp所在的window对象内存中
				globalContext[AUTH_RES_LIST] = obj.data;
				//码表定义的无权限是置灰还是删除
				NO_AUTH = obj.noAuth;
			} else {
				nui.alert('获取权限失败');
			}
		}
	});
};

/**
 * 根据当前登录用户的userId获取已授权的资源列表，获取前需要确保在Top中已经调用过loadAuthResList()方法
 */
nui.getAuthResList = function() {
	var globalContext = this.getGlobalContext();
	return globalContext ? globalContext[AUTH_RES_LIST] : null;
};

/**
 * 2014-7-30 add 
 * 首次登录main页面时加载当前用户的数据权限 
 * 此方法只应该在Top(main.jsp)的iframe中调用一次，后续框架中的页面直接通过nui.getDataPermissionList()方法获取
 */
nui.loadDataPermissionList = function(){
	var globalContext = this.getGlobalContext();
	if(!globalContext) {
		return;
	}
	//使用同步方式来获取后台的数据权限数据
	nui.ajax({
		type: 'post',
		url: appContext + '/auth/loadDataPermission.do',
		async:false,
		success: function(text,status,response) {
			obj = nui.decode(text);
			if(obj.success) {
				//将数据列表放入main.jsp所在的window对象内存中
				globalContext[AUTH_DATA_PERMISSION] = obj.data;
			} else {
				nui.alert('获取权限失败');
			}
		}
	});
};

/**
 * 2014-7-30 add
 * 根据当前用户所处的 页面ID、gridID. 获取对应的页面grid内字段的显示状态
 */
nui.getAuthDataPermissionList = function(){
	var globalContext = this.getGlobalContext();
	return globalContext ? globalContext[AUTH_DATA_PERMISSION] : null; 
};

/**
 * 返回字符串是否以该子字串开头
 */
String.prototype.startsWith = function(substrs) {
	return this.indexOf(substrs) == 0;
};

/**
 * 返回字符串是否以该子字串结尾
 */
String.prototype.endsWith = function(substrs) {
	if(substrs){
		//如果子串长度长于当前字串直接返回false
		if(substrs.length>this.length){
			return false;
		}else{
			var end = this.lastIndexOf(substrs);
			end = end + substrs.length;
			if(end==this.length){
				return true;
			}else{
				return false;
			}
		}
	}
	return false;
};

/**
 * 将字符串分隔为数组，从0开始到包含endTokenStr位置结束，如果没有找到endTokenStr的字串
 * 那么直接整个字串分隔为数组
 */
function tokenizeToArray(str,splitStr){
	var arr = new Array();
	if(str){
		//如果字符串以"/"为开头
		if(str.startsWith(splitStr)){
			if(str.length==1){//如果字符串仅为 /
				return arr;
			}else{
				str = str.substring(1,str.length);
				arr = str.split(splitStr);
			}
		}else{
			arr = str.split(splitStr);
		}
	}
	return arr;
}

/**
 * 校验字串是否符合正则表达式
 */
function matchStrings(pattern,path){
	//定义匹配的通配符，？表示任意一个字符，*表示任意数量字符，**表示任意数量的目录
	var singleChar = '?';
	var anyChar = '*';
	var anyPathChar = '**';
	
	//分隔出每个字符，并编译出正则表达式
	if(pattern){
		if(pattern==anyPathChar || pattern==anyChar) return true;
		
		//如果匹配了**，则替换**为(.*)
		pattern = pattern.replace('**','(.*)');
		//按(.*)分隔为数组，如果数组中每个元素匹配了*，则替换*为(.*)
		var arr = pattern.split('(.*)');
		var temp = '';
		for(var i=0;i<arr.length;i++){
			if(arr[i] && arr[i].trim().length>0){
				//如果数组长度>1表示包含了**字符串，所以要加上(.*)
				if(arr.length>1){
					temp = temp + (arr[i].replace('*','(.*)') + '(.*)');
				}else{
					temp = arr[i].replace('*','(.*)');
				}
			}
		}
		//如果匹配了？则替换？，得到最后的正则表达式字符串
		temp = temp.replace('?','(.+)');
		
		var reg = new RegExp(temp);
		//如果 exec() 找到了匹配的文本，则返回一个结果数组。否则，返回 null。
		//此数组的第0个元素是与正则表达式相匹配的文本,第1个元素是与RegExpObject的第1个子表达式相匹配的文本（如果有的话），
		//第2个元素是与 RegExpObject 的第2个子表达式相匹配的文本(如果有的话),以此类推
		var results = reg.exec(path);
		if(results){//如果能够匹配到字符串
			//如果文本与paths相等表示成功，避免出现pattern为a，而path为a.do时匹配成功
			if(results[0]==path) return true;
	  	}
	}
	return false;
}

/**
 * 字串是否符合分配的路径逻辑
 * pattern 表示当前角色的分配的权限
 * path    表示要匹配的路径
 */
function doMatch(pattern,path){
	var pathSeparator = '/';
	
	if (path.startsWith(pathSeparator) != pattern.startsWith(pathSeparator)) {
		return false;
	}
	
	var pattDirs = tokenizeToArray(pattern, pathSeparator);
	var pathDirs = tokenizeToArray(path, pathSeparator);
	
	var pattIdxStart = 0;
	var pattIdxEnd = pattDirs.length - 1;
	var pathIdxStart = 0;
	var pathIdxEnd = pathDirs.length - 1;
	// Match all elements up to the first **
	while (pattIdxStart <= pattIdxEnd && pathIdxStart <= pathIdxEnd) {
		var pattDir = pattDirs[pattIdxStart];
		if ("**"==pattDir) {
			break;
		}
		if (!matchStrings(pattDir, pathDirs[pathIdxStart])) {
			return false;
		}
		pattIdxStart++;
		pathIdxStart++;
	}
	if (pathIdxStart > pathIdxEnd) {
		// Path is exhausted, only match if rest of pattern is * or **'s
		if (pattIdxStart > pattIdxEnd) {
			return (pattern.endsWith(pathSeparator) ? path.endsWith(pathSeparator) :
					!path.endsWith(pathSeparator));
		}
		if (pattIdxStart == pattIdxEnd && pattDirs[pattIdxStart]=="*" && path.endsWith(pathSeparator)) {
			return true;
		}
		for (var i = pattIdxStart; i <= pattIdxEnd; i++) {
			if (pattDirs[i]!="**") {
				return false;
			}
		}
		return true;
	}
	else if (pattIdxStart > pattIdxEnd) {
		// String not exhausted, but pattern is. Failure.
		return false;
	}
	// up to last '**'
	while (pattIdxStart <= pattIdxEnd && pathIdxStart <= pathIdxEnd) {
		var pattDir = pattDirs[pattIdxEnd];
		if (pattDir=="**") {
			break;
		}
		if (!matchStrings(pattDir, pathDirs[pathIdxEnd])) {
			return false;
		}
		pattIdxEnd--;
		pathIdxEnd--;
	}
	if (pathIdxStart > pathIdxEnd) {
		// String is exhausted
		for (var i = pattIdxStart; i <= pattIdxEnd; i++) {
			if (pattDirs[i]!="**") {
				return false;
			}
		}
		return true;
	}

	while (pattIdxStart != pattIdxEnd && pathIdxStart <= pathIdxEnd) {
		var patIdxTmp = -1;
		for (var i = pattIdxStart + 1; i <= pattIdxEnd; i++) {
			if (pattDirs[i]=="**") {
				patIdxTmp = i;
				break;
			}
		}
		if (patIdxTmp == pattIdxStart + 1) {
			// '**/**' situation, so skip one
			pattIdxStart++;
			continue;
		}
		// Find the pattern between padIdxStart & padIdxTmp in str between
		// strIdxStart & strIdxEnd
		var patLength = (patIdxTmp - pattIdxStart - 1);
		var strLength = (pathIdxEnd - pathIdxStart + 1);
		var foundIdx = -1;

		//strLoop:
		var forI = 0;
		for (var i = 0; i <= strLength - patLength; i++) {
			forI = i;
			for (var j = 0; j < patLength; j++) {
				var subPat = pattDirs[pattIdxStart + j + 1];
				var subStr = pathDirs[pathIdxStart + i + j];
				if (!matchStrings(subPat, subStr)) {
					//continue strLoop;
					i=-1;
					break;
				}
			}
			if(i>-1) break;
		}
		foundIdx = pathIdxStart + forI;

		if (foundIdx == -1) {
			return false;
		}

		pattIdxStart = patIdxTmp;
		pathIdxStart = foundIdx + patLength;
	}

	for (var i = pattIdxStart; i <= pattIdxEnd; i++) {
		if (pattDirs[i]!="**") {
			return false;
		}
	}

	return true;
	
}

/**
 * 执行资源权限控制
 * @param authResList 授权资源列表
 */
nui.applyResAuth = function(authResList) {
	if(!authResList) return;
	//查询页面包含了resId属性的控件，并遍历进行处理
	$('*[resId]').each(function() {
		var $this = $(this);
		//获取控件的resId属性对应值, 值为URL路径，例如 /ipCodeType/save.do
		var resIdAttr = $this.attr('resId');
		
		//如果属性值为空或为空白直接返回
		if(!resIdAttr){
			return;
		}else{
			if(resIdAttr.trim().length==0) return;
		}
		
		//默认表示人员对该resId对应的URL没有权限
		var flag = false;
		var singleChar = '?';//匹配单一字符
		var anyChar = '*';//匹配任意字符
		
		//根据控件的resId属性对应的值获取对应的权限，循环权限表匹配
		for(var i=0;i<authResList.length;i++){
			var pattern = authResList[i];
			if(pattern){
				//精确匹配
				if(pattern==resIdAttr){
					flag = true;
					break;
				}else{//模糊匹配
					if(pattern.indexOf(singleChar)>-1 || pattern.indexOf(anyChar)>-1){
						//类似AntPathMatcher类的ant路径方式的匹配
						flag = doMatch(pattern, resIdAttr);//查看resid的值是否与权限匹配
						if(flag==true) break;
					}
				}
			}
		}
		
		//如果模糊匹配失败，表示当前用户没有该功能权限
		if(!flag){
			if(DISABLED==NO_AUTH){
				$this.attr('enabled', false);
			}else if(REMOVED==NO_AUTH){
				//根据码表对无权限时前端控件的控制方式，删除或置灰控件
				$this.remove();
				//$this.hide(); //用hide()方法对表格(DataGrid)列的隐藏无效
			}else{
				$this.remove();
			}
		}
	});
};

/**
 * 2014-7-30 实施数据权限
 */
nui.applyDataAuth = function(authDataList) {
	var GRID_CLASS = '.nui-datagrid';//NUI的grid控件class
	var GRID_ID = 'id';//GRID的id
	var META_NAME_PAGENO = "meta[name='pageNo']";//$("meta[name='pageNo']") JQUERY语法：查询meta标签，且name属性为pageNo的，返回为数组
	var pageNo = '';//当前页面编号
	
	if(!authDataList) return;
	//  每个需要控制数据权限的页面，必须添加如下pageNum的信息，
	//  其中content中记录的是页面ID, 开发者自行保证唯一性
	//	<head>
	//		<meta name="pageNo" content="123" ></meta>
	//  </head>
	//查询页面编号标签，当前会返回一个数组。为了性能这里默认使用第一个meta数据作为pageNo。
	var pageNoMetaArrs = $(META_NAME_PAGENO);
	//如果页面没有带有pageNo的meta标签，则直接返回不做权限处理
	if(!pageNoMetaArrs || pageNoMetaArrs.length==0) return;
	//假如有多个带有pageNo的meta，为了性能直接使用第一个，避免多次遍历
	var pageNoMeta = pageNoMetaArrs[0];
	pageNo = pageNoMeta.content;//获取页面编号
	//没有值直接返回不做权限处理
	if(checkIfEmpty(pageNo)) return;
	
	//查找当前页面的grid信息，一个页面有可能包含多个grid
	//支持多个grid的权限控制
	$(GRID_CLASS).each(function(){
		var grid = $(this);//当前grid对象
		var gridId = grid.attr(GRID_ID);//grid的唯一编号
		if(checkIfEmpty(gridId)) return;
		var authDataKey = gridId + '_' + pageNo;//数据权限的key。格式：gridId_pageNo
		
		//从数据权限列表中获取当前grid对应的字段的权限情况
		var fileds = authDataList[authDataKey];
		if(!fileds) return;
		
		//遍历grid的每个field字段，确定是否拥有数据权限
		grid.find('div[field]').each(function(){
			var currentFieldHtml = $(this);
			var currentFieldName = currentFieldHtml.attr('field');
			var flag = false;//当前字段是否匹配了数据权限
			
			//遍历数据权限数组
			for(var j=0;j<fileds.length;j++){
				//前端grid的字段名如果与数据权限传入的字段名称匹配的话，表示拥有权限显示
				//zdbm 表示字段编码，即前台filed属性对应的配置
				if(currentFieldName == fileds[j].zdbm){
					currentFieldHtml.attr('visible', true);
					
					//单元格下内嵌的子控件是否能够修改，默认不能修改
					var subEnabled = false;
					//sfkyxg 表示字段    是否可以修改
					if(DATA_ENABLED == fileds[j].sfkyxg){
						subEnabled = true;
					}else{
						subEnabled = false;
					}
					//由于要实现grid中行内编辑，是需要内嵌一个nui控件的，所以对字段的能够修改的控制，需要遍历当前div的子控件
					currentFieldHtml.children().each(function(){
						var subFiledHtml = $(this);
						subFiledHtml.attr('enabled', subEnabled);
					});
					
					//匹配到拥有数据权限
					flag = true;
					
					break;
				}
			}
			
			//如果没有匹配，则删除当前列
			if(!flag){
				currentFieldHtml.remove();
			}
		});
	});
};

/**
 * 检查字符串是否为null或空白
 */
function checkIfEmpty(str){
	if(!str){
		return true;
	}else{
		if(str.trim().length==0) return true;
	}
	return false;
}

// 扩展原nui.parse方法，增加模型校验和权限控制的功能
var old_nuiParse = nui.parse;
var isApplied = false; // 是否执行了模型校验和权限控制
nui.parse = function(el) {
	if(!isApplied) {
		// 执行资源权限控制
		if(nui.enableResAuth) {
			var authResList = this.getAuthResList();//获取功能权限列表
			this.applyResAuth(authResList);//实施功能权限
		}
		// 执行数据权限控制
		if(nui.enableDataAuth){
			var authDataList = this.getAuthDataPermissionList();//获取数据权限列表
			this.applyDataAuth(authDataList);//实施数据权限
		}
		
		isApplied = true;
	}
	
	old_nuiParse.call(this, el);
};
