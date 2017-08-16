package com.yumu.store.portal.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yumu.store.portal.vo.PtObjectVO;


/**
 * DAO层接口类
 * @author Administrator
 * 
 */
@Repository
public interface IPtObjectDao {
	/**
	 * 获取所有的PtObjectVO对象列表及分页信息
	 * @param vo 业务查询条件
	 * @param offSet 数据记录偏移量
	 * @param pageSize 每页显示记录数
	 * @return 满足条件的业务数据对象列表
	 */
	public List<PtObjectVO> findAllInfos(PtObjectVO vo, int offSet, int pageSize);

	/**
	 * 保存PtObjectVO对象
	 * @param vo 需要保存的业务数据
	 */
	public void save(PtObjectVO vo);

	/**
	 * 删除PtObjectVO对象
	 * @param arr 选择的业务数据主键列表
	 */
	public void delete(String[] arr);

	/**
	 * 更新PtObjectVO对象
	 * @param vo 需要更新的业务数据
	 */
	public void update(PtObjectVO vo);

	/**
	 * 根据主键获取业务详情
	 * @param id 业务主键
	 * @return 业务详情对象
	 */
	public PtObjectVO getPtObjectVOById(String id);

	/**
	 * 计算满足条件的总记录数据
	 * @param vo 查询条件
	 * @return 满足条件的记录总数
	 */
	public Integer findAllInfosCount(PtObjectVO vo);
}
