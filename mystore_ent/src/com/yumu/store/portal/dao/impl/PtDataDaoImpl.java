package com.yumu.store.portal.dao.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.cib.cap4j.core.base.dao.BaseDao;
import com.yumu.store.portal.dao.IPtDataDao;
import com.yumu.store.portal.vo.PtDataVO;

/**
 * DAO层实现类
 * @author Administrator
 * 
 */
@Repository("iPtDataDao")
public class PtDataDaoImpl extends BaseDao implements IPtDataDao {
	/**
	 * 日志记录器
	 */
	private Logger logger = LoggerFactory.getLogger(PtDataDaoImpl.class);

	@Override
	public List<PtDataVO> findAllInfos(PtDataVO vo, int offSet, int pageSize) {
		logger.info("iPtDataDao findAllInfos");
		List<PtDataVO> list = this.find_myBatis("com.yumu.store.portal.dao.IPtDataDao.findAllInfos", vo, offSet,
				pageSize);
		return list;
	}

	@Override
	public Integer findAllInfosCount(PtDataVO vo) {
		logger.info("iPtDataDao findAllInfosCount");
		List<Integer> list = this.find_myBatis("com.yumu.store.portal.dao.IPtDataDao.findAllInfosCount", vo);
		if (list != null && list.size() > 0) {
			return (Integer) list.get(0);
		}
		return null;
	}

	@Override
	public void save(PtDataVO vo) {
		logger.info("iPtDataDao save");
		this.save_myBatis("com.yumu.store.portal.dao.IPtDataDao.save", vo);
	}

	@Override
	public void update(PtDataVO vo) {
		logger.info("iPtDataDao update");
		this.update_myBatis("com.yumu.store.portal.dao.IPtDataDao.update", vo);
	}

	@Override
	public void delete(String[] arr) {
		logger.info("iPtDataDao delete");
		this.delete_myBatis("com.yumu.store.portal.dao.IPtDataDao.delete", arr);
	}

	@Override
	public PtDataVO getPtDataVOById(String id) {
		logger.info("iPtDataDao getPtDataVOById");
		return findByID_myBatis("com.yumu.store.portal.dao.IPtDataDao.getPtDataVOById", id);
	}

}
