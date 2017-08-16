package com.yumu.store.portal.vo;

import java.util.Date;
import com.cib.cap4j.core.mvc.argument.Cap4jDateSerializer;
import com.cib.cap4j.core.mvc.argument.Cap4jDateDeSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.cib.cap4j.core.vo.BaseVO;

/**
 * 数据库表映射对象
 * @author Administrator
 * 修改历史
 */
public class PtObjectVO extends BaseVO {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 对象ID
	 */
	private String objectId;
	/**
	 * 对象编码
	 */
	private String objectCode;
	/**
	 * 对象名称
	 */
	private String objectName;
	/**
	 * 对象描述
	 */
	private String objectDesc;
	/**
	 * 对象分类代码
	 */
	private String clazzId;
	private String clazzName;
	/**
	 * 状态
	 */
	private String status;
	/**
	 * 排序号
	 */
	private Integer sortno;
	/**
	 * 创建日期
	 */
	private Date creatTime;
	/**
	 * 修改日期
	 */
	private Date modifyTime;

	public String getObjectId() {
		return objectId;
	}

	public void setObjectId(String objectId) {
		this.objectId = objectId;
	}

	public String getObjectCode() {
		return objectCode;
	}

	public void setObjectCode(String objectCode) {
		this.objectCode = objectCode;
	}

	public String getObjectName() {
		return objectName;
	}

	public void setObjectName(String objectName) {
		this.objectName = objectName;
	}

	public String getObjectDesc() {
		return objectDesc;
	}

	public void setObjectDesc(String objectDesc) {
		this.objectDesc = objectDesc;
	}

	public String getClassId() {
		return clazzId;
	}

	public void setClassId(String classId) {
		this.clazzId = classId;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getSortno() {
		return sortno;
	}

	public void setSortno(Integer sortno) {
		this.sortno = sortno;
	}

	@JsonSerialize(using = Cap4jDateSerializer.class)
	public Date getCreatTime() {
		return creatTime;
	}

	@JsonDeserialize(using = Cap4jDateDeSerializer.class)
	public void setCreatTime(Date creatTime) {
		this.creatTime = creatTime;
	}

	@JsonSerialize(using = Cap4jDateSerializer.class)
	public Date getModifyTime() {
		return modifyTime;
	}

	@JsonDeserialize(using = Cap4jDateDeSerializer.class)
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getClazzName() {
		return clazzName;
	}

	public void setClazzName(String clazzName) {
		this.clazzName = clazzName;
	}

}
