package com.yumu.store.portal.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cib.cap4j.core.mvc.ctrler.BaseCtrler;
import com.yumu.store.portal.service.IPtClassService;

/**
 * 控制器类.
 * @author Administrator
 * 
 */
@Controller
@RequestMapping("/store/portal/ptPortal")
public class PtPortalCtrler extends BaseCtrler {
	/**
	 * 注入的业务处理类.
	 */
	@Autowired
	private IPtClassService iPtClassService;

	/**
	 * 日志记录类.
	 */
	private Logger log = LoggerFactory.getLogger(PtPortalCtrler.class);


}
