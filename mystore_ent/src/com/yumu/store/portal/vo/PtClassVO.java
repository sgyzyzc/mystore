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
public class PtClassVO extends BaseVO {
	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 类ID
	 */
	private String clazzId;
	/**
	 * 类编码
	 */
	private String clazzCode;
	/**
	 * 类名称
	 */
	private String clazzName;
	/**
	 * 类描述
	 */
	private String clazzDesc;
	/**
	 * 上级ID
	 */
	private String parentId;
	/**
	 * 层级
	 */
	private Integer treelevel;
	/**
	 * 是否末级
	 */
	private Integer lastflag;
	/**
	 * 查询路径
	 */
	private String spath;
	/**
	 * 状态
	 */
	private String status;
	/**
	 * 排序号
	 */
	private Integer sortno;
	/**
	 * 备注
	 */
	private String remark;
	/**
	 * 创建日期
	 */
	private Date createTime;
	/**
	 * 修改日期
	 */
	private Date modifyTime;


	public String getClazzId() {
		return clazzId;
	}

	public void setClazzId(String clazzId) {
		this.clazzId = clazzId;
	}

	public String getClazzCode() {
		return clazzCode;
	}

	public void setClazzCode(String clazzCode) {
		this.clazzCode = clazzCode;
	}

	public String getClazzName() {
		return clazzName;
	}

	public void setClazzName(String clazzName) {
		this.clazzName = clazzName;
	}

	public String getClassDesc() {
		return clazzDesc;
	}

	public void setClassDesc(String classDesc) {
		this.clazzDesc = classDesc;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public Integer getTreelevel() {
		return treelevel;
	}

	public void setTreelevel(Integer treelevel) {
		this.treelevel = treelevel;
	}

	public Integer getLastflag() {
		return lastflag;
	}

	public void setLastflag(Integer lastflag) {
		this.lastflag = lastflag;
	}

	public String getSpath() {
		return spath;
	}

	public void setSpath(String spath) {
		this.spath = spath;
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	@JsonSerialize(using = Cap4jDateSerializer.class)
	public Date getCreateTime() {
		return createTime;
	}

	@JsonDeserialize(using = Cap4jDateDeSerializer.class)
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@JsonSerialize(using = Cap4jDateSerializer.class)
	public Date getModifyTime() {
		return modifyTime;
	}

	@JsonDeserialize(using = Cap4jDateDeSerializer.class)
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}



}
