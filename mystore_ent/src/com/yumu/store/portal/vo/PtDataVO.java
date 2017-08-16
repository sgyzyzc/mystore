package com.yumu.store.portal.vo;

import com.cib.cap4j.core.vo.BaseVO;

/**
 * 数据库表映射对象
 * @author Administrator
 * 修改历史
 */
public class PtDataVO extends BaseVO {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 数据ID
	 */
	private String dataId;
	/**
	 * 属性名称
	 */
	private String propName;
	/**
	 * 属性描述
	 */
	private String propDesc;
	/**
	 * 值（如果是大对象，保存大对象ID）
	 */
	private String value;
	/**
	 * 值类型
	 */
	private String valueType;
	/**
	 * 业务对象ID
	 */
	private String objectId;

	public String getDataId() {
		return dataId;
	}

	public void setDataId(String dataId) {
		this.dataId = dataId;
	}

	public String getPropName() {
		return propName;
	}

	public void setPropName(String propName) {
		this.propName = propName;
	}

	public String getPropDesc() {
		return propDesc;
	}

	public void setPropDesc(String propDesc) {
		this.propDesc = propDesc;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getValueType() {
		return valueType;
	}

	public void setValueType(String valueType) {
		this.valueType = valueType;
	}

	public String getObjectId() {
		return objectId;
	}

	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}

}
