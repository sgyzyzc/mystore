package com.yumu.store.portal.service;

import java.util.Map;

import com.cib.cap4j.core.base.vo.Pagination;
import com.yumu.store.portal.vo.PtObjectVO;

/**
 * 服务层接口类
 * @author Administrator
 * 
 */
public interface IPtObjectService {
	/**
	 * 根据页面查询条件，分页查询业务数据
	 * @param vo 查询条件
	 * @param page 分页参数
	 * @return 分页业务数据及满足条件总记录数
	 */
	public Map<String, Object> findAllInfos(PtObjectVO vo, Pagination page);

	/**
	 * 保存PtObjectVO对象
	 * @param vo 新增业务详情
	 */
	public void save(PtObjectVO vo);

	/**
	 * 删除PtObjectVO对象
	 * @param arr 删除数据列表
	 */
	public void delete(String[] arr);

	/**
	 * 更新PtObjectVO对象
	 * @param vo 修改后的业务数据
	 */
	public void update(PtObjectVO vo);

	/**
	 * 根据主键获取业务详情
	 * @param id 业务主键
	 * @return 业务详情对象
	 */
	public PtObjectVO getPtObjectVOById(String id);
}
