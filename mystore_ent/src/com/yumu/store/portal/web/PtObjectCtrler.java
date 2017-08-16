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
import com.yumu.store.portal.service.IPtObjectService;
import com.yumu.store.portal.vo.PtObjectVO;

/**
 * 控制器类.
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/store/portal/ptObject")
public class PtObjectCtrler extends BaseCtrler {
	/**
	 * 注入的业务处理类.
	 */
	@Autowired
	private IPtObjectService iPtObjectService;

	/**
	 * 日志记录类.
	 */
	private Logger log = LoggerFactory.getLogger(PtObjectCtrler.class);

	/**
	 * 新增业务数据保存方法.
	 * @param vo 业务数据
	 */
	@FunctionDesc("新增PtObject")
	@ResponseBody
	public void save(PtObjectVO vo) {
		log.info("save");
		iPtObjectService.save(vo);
	}

	/**
	 * 删除选中的数据.
	 * @param ids 选中的数据列表，逗号分隔
	 */
	@FunctionDesc("删除PtObject")
	@ResponseBody
	public void delete(String ids) {
		String[] arr = ids.split(",");
		iPtObjectService.delete(arr);
	}

	/**
	 * 修改业务数据.
	 * @param vo 修改后的业务数据
	 */
	@FunctionDesc("修改PtObject")
	@ResponseBody
	public void update(PtObjectVO vo) {
		log.info("update");
		iPtObjectService.update(vo);
	}

	/**
	 * 根据页面输入查询条件，分页查询数据.
	 * @param vo 业务查询参数
	 * @param page 分页对象数据
	 * @return 业务数据及满足查询条件的总记录数
	 */
	@FunctionDesc("查询PtObject")
	@ResponseBody
	public Map<String, Object> query(PtObjectVO vo, Pagination page) {
		log.info("list");
		Map<String, Object> map = iPtObjectService.findAllInfos(vo, page);
		return map;
	}

	/**
	 * 功能模块入口方法，返回功能模块主界面
	 * @return 功能模块页面
	 */
	@FunctionDesc("[PtObject]主页面")
	public String list() {
		return "/store/portal/PtObjectList";
	}

	/**
	 * 展现业务信息详情页面
	 * @return 业务信息详情编辑页面
	 */
	@FunctionDesc("PtObject详情页面")
	public String detail() {
		return "/store/portal/PtObjectForm";
	}

	/**
	 * 根据主键，获取主键对应详细数据
	 * @param id 业务主键
	 * @return 业务主键对应业务详细数据
	 */
	@FunctionDesc("获取PtObject")
	@ResponseBody
	public PtObjectVO getPtObjectVOById(String id) {
		return iPtObjectService.getPtObjectVOById(id);
	}
}
