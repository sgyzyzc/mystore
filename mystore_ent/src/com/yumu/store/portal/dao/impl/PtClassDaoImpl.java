package com.yumu.store.portal.dao.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.cib.cap4j.core.base.dao.BaseDao;
import com.yumu.store.portal.dao.IPtClassDao;
import com.yumu.store.portal.vo.PtClassVO;

/**
 * DAO层实现类
 * @author Administrator
 * 
 */
@Repository("iPtClassDao")
public class PtClassDaoImpl extends BaseDao implements IPtClassDao {
	/**
	 * 日志记录器
	 */
	private Logger logger = LoggerFactory.getLogger(PtClassDaoImpl.class);

	@Override
	public List<PtClassVO> findAllInfos(PtClassVO vo, int offSet, int pageSize) {
		logger.info("iPtClassDao findAllInfos");
		List<PtClassVO> list = this.find_myBatis("com.yumu.store.portal.dao.IPtClassDao.findAllInfos", vo, offSet,
				pageSize);
		return list;
	}

	@Override
	public Integer findAllInfosCount(PtClassVO vo) {
		logger.info("iPtClassDao findAllInfosCount");
		List<Integer> list = this.find_myBatis("com.yumu.store.portal.dao.IPtClassDao.findAllInfosCount", vo);
		if (list != null && list.size() > 0) {
			return (Integer) list.get(0);
		}
		return null;
	}

	@Override
	public void save(PtClassVO vo) {
		logger.info("iPtClassDao save");
		this.save_myBatis("com.yumu.store.portal.dao.IPtClassDao.save", vo);
	}

	@Override
	public void update(PtClassVO vo) {
		logger.info("iPtClassDao update");
		this.update_myBatis("com.yumu.store.portal.dao.IPtClassDao.update", vo);
	}

	@Override
	public void delete(String[] arr) {
		logger.info("iPtClassDao delete");
		this.delete_myBatis("com.yumu.store.portal.dao.IPtClassDao.delete", arr);
	}

	@Override
	public PtClassVO getPtClassVOById(String id) {
		logger.info("iPtClassDao getPtClassVOById");
		return findByID_myBatis("com.yumu.store.portal.dao.IPtClassDao.getPtClassVOById", id);
	}

}
