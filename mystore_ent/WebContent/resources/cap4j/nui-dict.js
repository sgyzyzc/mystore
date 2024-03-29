(function(){
  mini.DictCheckboxGroup=function(){
    mini.DictCheckboxGroup.superclass.constructor.call(this);
  }
  mini.DictRadioGroup=function(){
    mini.DictRadioGroup.superclass.constructor.call(this);
  }
  mini.DictComboBox=function(){
    mini.DictComboBox.superclass.constructor.call(this);
  }
  
  var dictStore={
    map:{},
    loadingMap:{},
    removeEmpty:function(data){
      if(data){
        for(var i=0,len=data.length;i<len;i++){
          if(data[i]&&data[i].__NullItem){
            data.splice(i,1);
          }
        }
      }
    },
    getDictName:function(dictData,dictID){
      if(dictData){
	      var name=[];
	      for(var i=0,len=dictData.length;i<len;i++){
	        var dict=dictData[i];
	        if(nui.fn.contains(dictID,dict.dictID)){
	          name.push(dict.dictName);
	        }
	      }
	      return name.join(',');
      }else{
      	  return null;
      }
    },
    ajaxLoad:function(control){
      var data={dictTypeId:control.dictTypeId,filterStr:control.filterStr};
      var ajaxConf = new Cap4jAjaxConf();
      ajaxConf.setIsAsync(false);
      ajaxConf.setIsShowSuccMsg(false);
      ajaxConf.setSuccessFunc(function(ret){
        var dictData=ret.dictList;
        dictStore.map[dictTypeId]=dictData;
        control._setDictData(dictData);
      });
      $J.postByAjax(data, "/directory/loadDict.do", ajaxConf);
    },
    getDictText:function(dictTypeId,dictKey){
      var data=dictStore.map[dictTypeId];
      if(data){//no map
        return dictStore.getDictName(data,dictKey);
      }
      var filterStr = this.filterStr;
      
      var dictName='';
      var ajaxConf = new Cap4jAjaxConf();
      ajaxConf.setIsAsync(false);
      ajaxConf.setIsShowSuccMsg(false);
      ajaxConf.setSuccessFunc(function(ret){
        var dictData=ret.dictList;
        dictStore.map[dictTypeId]=dictData;
        dictName=dictStore.getDictName(dictData,dictKey);
      });
      $J.postByAjax({dictTypeId:dictTypeId,filterStr:filterStr}, 
      			"/directory/loadDict.do", ajaxConf);
      return dictName;
    },
    loadData:function(){
      var dictTypeId=this.dictTypeId;
      if(!dictTypeId){
        return;
      }
      var filterStr = this.filterStr;
      
      var data=dictStore.map[dictTypeId];
      if(!data){
        var ajaxConf = new Cap4jAjaxConf();
        ajaxConf.setIsAsync(false);
        ajaxConf.setIsShowSuccMsg(false);
        ajaxConf.setSuccessFunc(function(ret){
          var dictData=ret.dictList;//dictList is the key of the json list data
          dictStore.map[dictTypeId]=dictData;
        });
        $J.postByAjax({dictTypeId:dictTypeId,filterStr:filterStr}, "/directory/loadDict.do", ajaxConf);
        data=dictStore.map[dictTypeId];
      }
      dictStore.removeEmpty(data);
      this._setDictData(data);
    }
  }
  
  
  mini.getDictText=dictStore.getDictText;
  
  var pp={
    dictTypeId:'',
    textField:'dictName',
    valueField:'dictID',
    filterStr:'',
    _initData:function(){
      dictStore.loadData.call(this);
    },
    _setDictData:function(data){
      this.loadData(data);
      if(this.value){
        this.setValue(this.value);
      }
    }
  };
  pp.uiCls='mini-dictcheckboxgroup';
  jQuery.extend(pp,{
    uiCls:'mini-dictcheckboxgroup',
    set: function(config) {
      mini.DictCheckboxGroup.superclass.set.call(this,config);
      this._initData();
    },
    getAttrs: function (el) {
          var attrs = mini.DictCheckboxGroup.superclass.getAttrs.call(this, el);
          var jq = jQuery(el);
          
          mini._ParseString(el, attrs,
              ["dictTypeId","filterStr"
               ]
          );
          return attrs;
      }
  });
  mini.extend(mini.DictCheckboxGroup, mini.CheckBoxList, pp);
  
  
  jQuery.extend(pp,{
    uiCls:'mini-dictradiogroup',
    set: function(config) {
      mini.DictRadioGroup.superclass.set.call(this,config);
      this._initData();
    },
    getAttrs: function (el) {
          var attrs = mini.DictRadioGroup.superclass.getAttrs.call(this, el);
          var jq = jQuery(el);
          
          mini._ParseString(el, attrs,[
        "dictTypeId","filterStr"
      ]);
          return attrs;
      }
  });
  mini.extend(mini.DictRadioGroup, mini.RadioButtonList, pp);
  
  //dictcombobox
  jQuery.extend(pp,{
    uiCls:'mini-dictcombobox',
    set: function(config) {
      mini.DictComboBox.superclass.set.call(this,config);
      this._initData();
    },
    getAttrs: function (el) {
          var attrs = mini.DictComboBox.superclass.getAttrs.call(this, el);
          var jq = jQuery(el);
          
          mini._ParseString(el, attrs,
              ["dictTypeId","filterStr"
               ]
          );
          return attrs;
      },
    _setDictData:function(data){
      if(data){
        this.setValueField(this.valueField);
        this.setTextField(this.textField);
        
        this.setData(data.clone());
        
        if(this.value){
          var v=this.value;
          this.value='';
          this.setValue(v);
        }
      }
    }
  });
  mini.extend(mini.DictComboBox, mini.ComboBox, pp);
  
  
  
  mini.regClass(mini.DictCheckboxGroup, 'dictcheckboxgroup');
  mini.regClass(mini.DictRadioGroup, 'dictradiogroup');
  mini.regClass(mini.DictComboBox, 'dictcombobox');
})(mini);