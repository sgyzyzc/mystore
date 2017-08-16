package com.yumu.store.portal.service;

import java.util.Map;

import com.cib.cap4j.core.base.vo.Pagination;
import com.yumu.store.portal.vo.PtClassVO;

/**
 * 服务层接口类
 * @author Administrator
 * 
 */
public interface IPtClassService {
	/**
	 * 根据页面查询条件，分页查询业务数据
	 * @param vo 查询条件
	 * @param page 分页参数
	 * @return 分页业务数据及满足条件总记录数
	 */
	public Map<String, Object> findAllInfos(PtClassVO vo, Pagination page);

	/**
	 * 保存PtClassVO对象
	 * @param vo 新增业务详情
	 */
	public void save(PtClassVO vo);

	/**
	 * 删除PtClassVO对象
	 * @param arr 删除数据列表
	 */
	public void delete(String[] arr);

	/**
	 * 更新PtClassVO对象
	 * @param vo 修改后的业务数据
	 */
	public void update(PtClassVO vo);

	/**
	 * 根据主键获取业务详情
	 * @param id 业务主键
	 * @return 业务详情对象
	 */
	public PtClassVO getPtClassVOById(String id);
}
