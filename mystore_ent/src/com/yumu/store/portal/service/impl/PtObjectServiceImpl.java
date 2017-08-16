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
import com.yumu.store.portal.dao.IPtObjectDao;
import com.yumu.store.portal.service.IPtObjectService;
import com.yumu.store.portal.vo.PtObjectVO;

/**
 * 服务层接口实现类
 * @author Administrator
 * 
 */
@Service("iPtObjectService")
public class PtObjectServiceImpl extends BaseService implements IPtObjectService {
	/**
	 * 日志记录器
	 */
	private Logger logger = LoggerFactory.getLogger(PtObjectServiceImpl.class);

	/**
	 * 依赖DAO层接口类
	 */
	@Autowired
	@Qualifier("iPtObjectDao")
	private IPtObjectDao iPtObjectDao;

	@Override
	public void delete(String[] arr) {
		logger.info("iPtObjectService delete");
		iPtObjectDao.delete(arr);

	}

	@Override
	public Map<String, Object> findAllInfos(PtObjectVO vo, Pagination page) {
		logger.info("iPtObjectService findAllInfos");

		List<PtObjectVO> result = iPtObjectDao.findAllInfos(vo, page.getPageIndex() * page.getPageSize(), page
				.getPageSize());
		Integer total = iPtObjectDao.findAllInfosCount(vo);
		//返回给action层的数据结果集以及总的数据量，这里默认的使用data、total的key，
		//action层可以根据页面定义的不同来重新封装
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", result);
		map.put("total", total);
		return map;
	}

	@Override
	public void save(PtObjectVO vo) {
		logger.info("iPtObjectService save");
		if (vo != null) {
			IKeyGenerateService generateService = (IKeyGenerateService) ContextUtil
					.getBean("cfnDateKeyGeneratorServiceImpl");
			vo.setObjectId(generateService.getKeyValue(java.lang.String.class));
		}
		iPtObjectDao.save(vo);
	}

	@Override
	public void update(PtObjectVO vo) {
		logger.info("iPtObjectService update");
		iPtObjectDao.update(vo);
	}

	@Override
	public PtObjectVO getPtObjectVOById(String id) {
		logger.info("iPtObjectService getPtObjectVOById");
		return iPtObjectDao.getPtObjectVOById(id);
	}

}
