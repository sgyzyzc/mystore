package com.yumu.store.portal.web;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cib.cap4j.core.mvc.ctrler.BaseCtrler;
import com.cib.cap4j.core.base.vo.Pagination;
import com.cib.cap4j.core.mvc.handlermapping.FunctionDesc;
import com.yumu.store.portal.service.IPtDataService;
import com.yumu.store.portal.vo.PtDataVO;

/**
 * 控制器类.
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/store/portal/ptData")
public class PtDataCtrler extends BaseCtrler {
	/**
	 * 注入的业务处理类.
	 */
	@Autowired
	private IPtDataService iPtDataService;

	/**
	 * 日志记录类.
	 */
	private Logger log = LoggerFactory.getLogger(PtDataCtrler.class);

	/**
	 * 新增业务数据保存方法.
	 * @param vo 业务数据
	 */
	@FunctionDesc("新增PtData")
	@ResponseBody
	public void save(PtDataVO vo) {
		log.info("save");
		iPtDataService.save(vo);
	}

	/**
	 * 删除选中的数据.
	 * @param ids 选中的数据列表，逗号分隔
	 */
	@FunctionDesc("删除PtData")
	@ResponseBody
	public void delete(String ids) {
		String[] arr = ids.split(",");
		iPtDataService.delete(arr);
	}

	/**
	 * 修改业务数据.
	 * @param vo 修改后的业务数据
	 */
	@FunctionDesc("修改PtData")
	@ResponseBody
	public void update(PtDataVO vo) {
		log.info("update");
		iPtDataService.update(vo);
	}

	/**
	 * 根据页面输入查询条件，分页查询数据.
	 * @param vo 业务查询参数
	 * @param page 分页对象数据
	 * @return 业务数据及满足查询条件的总记录数
	 */
	@FunctionDesc("查询PtData")
	@ResponseBody
	public Map<String, Object> query(PtDataVO vo, Pagination page) {
		log.info("list");
		Map<String, Object> map = iPtDataService.findAllInfos(vo, page);
		return map;
	}

	/**
	 * 功能模块入口方法，返回功能模块主界面
	 * @return 功能模块页面
	 */
	@FunctionDesc("[PtData]主页面")
	public String list() {
		return "/store/portal/PtDataList";
	}

	/**
	 * 展现业务信息详情页面
	 * @return 业务信息详情编辑页面
	 */
	@FunctionDesc("PtData详情页面")
	public String detail() {
		return "/store/portal/PtDataForm";
	}

	/**
	 * 根据主键，获取主键对应详细数据
	 * @param id 业务主键
	 * @return 业务主键对应业务详细数据
	 */
	@FunctionDesc("获取PtData")
	@ResponseBody
	public PtDataVO getPtDataVOById(String id) {
		return iPtDataService.getPtDataVOById(id);
	}
}
