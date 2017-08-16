package com.yumu.store.portal.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cib.cap4j.core.base.service.BaseService;
import com.cib.cap4j.core.base.vo.Pagination;
import com.cib.cap4j.core.context.ContextUtil;
import com.cib.cap4j.core.base.service.IKeyGenerateService;
import com.yumu.store.portal.dao.IPtClassDao;
import com.yumu.store.portal.service.IPtClassService;
import com.yumu.store.portal.vo.PtClassVO;

/**
 * 服务层接口实现类
 * @author Administrator
 * 
 */
@Service("iPtClassService")
public class PtClassServiceImpl extends BaseService implements IPtClassService {
	/**
	 * 日志记录器
	 */
	private Logger logger = LoggerFactory.getLogger(PtClassServiceImpl.class);

	/**
	 * 依赖DAO层接口类
	 */
	@Autowired
	@Qualifier("iPtClassDao")
	private IPtClassDao iPtClassDao;

	@Override
	public void delete(String[] arr) {
		logger.info("iPtClassService delete");
		iPtClassDao.delete(arr);

	}

	@Override
	public Map<String, Object> findAllInfos(PtClassVO vo, Pagination page) {
		logger.info("iPtClassService findAllInfos");

		List<PtClassVO> result = iPtClassDao.findAllInfos(vo, page.getPageIndex() * page.getPageSize(), page
				.getPageSize());
		Integer total = iPtClassDao.findAllInfosCount(vo);
		//返回给action层的数据结果集以及总的数据量，这里默认的使用data、total的key，
		//action层可以根据页面定义的不同来重新封装
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", result);
		map.put("total", total);
		return map;
	}

	@Override
	public void save(PtClassVO vo) {
		logger.info("iPtClassService save");
		if (vo != null) {
			IKeyGenerateService generateService = (IKeyGenerateService) ContextUtil
					.getBean("cfnDateKeyGeneratorServiceImpl");
			vo.setClazzId(generateService.getKeyValue(java.lang.String.class));
		}
		iPtClassDao.save(vo);
	}

	@Override
	public void update(PtClassVO vo) {
		logger.info("iPtClassService update");
		iPtClassDao.update(vo);
	}

	@Override
	public PtClassVO getPtClassVOById(String id) {
		logger.info("iPtClassService getPtClassVOById");
		return iPtClassDao.getPtClassVOById(id);
	}

}
