package com.yumu.store.portal.dao.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.cib.cap4j.core.base.dao.BaseDao;
import com.yumu.store.portal.dao.IPtObjectDao;
import com.yumu.store.portal.vo.PtObjectVO;

/**
 * DAO层实现类
 * @author Administrator
 * 
 */
@Repository("iPtObjectDao")
public class PtObjectDaoImpl extends BaseDao implements IPtObjectDao {
	/**
	 * 日志记录器
	 */
	private Logger logger = LoggerFactory.getLogger(PtObjectDaoImpl.class);

	@Override
	public List<PtObjectVO> findAllInfos(PtObjectVO vo, int offSet, int pageSize) {
		logger.info("iPtObjectDao findAllInfos");
		List<PtObjectVO> list = this.find_myBatis("com.yumu.store.portal.dao.IPtObjectDao.findAllInfos", vo, offSet,
				pageSize);
		return list;
	}

	@Override
	public Integer findAllInfosCount(PtObjectVO vo) {
		logger.info("iPtObjectDao findAllInfosCount");
		List<Integer> list = this.find_myBatis("com.yumu.store.portal.dao.IPtObjectDao.findAllInfosCount", vo);
		if (list != null && list.size() > 0) {
			return (Integer) list.get(0);
		}
		return null;
	}

	@Override
	public void save(PtObjectVO vo) {
		logger.info("iPtObjectDao save");
		this.save_myBatis("com.yumu.store.portal.dao.IPtObjectDao.save", vo);
	}

	@Override
	public void update(PtObjectVO vo) {
		logger.info("iPtObjectDao update");
		this.update_myBatis("com.yumu.store.portal.dao.IPtObjectDao.update", vo);
	}

	@Override
	public void delete(String[] arr) {
		logger.info("iPtObjectDao delete");
		this.delete_myBatis("com.yumu.store.portal.dao.IPtObjectDao.delete", arr);
	}

	@Override
	public PtObjectVO getPtObjectVOById(String id) {
		logger.info("iPtObjectDao getPtObjectVOById");
		return findByID_myBatis("com.yumu.store.portal.dao.IPtObjectDao.getPtObjectVOById", id);
	}

}
