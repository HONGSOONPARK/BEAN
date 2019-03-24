package bean.menu;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MenuController {

//	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	Logger log = Logger.getLogger(this.getClass());
	/**
	 * Simply selects the home view to render by returning its name.
	 */


	@Resource(name="menuService")
	private MenuService menuService;

	@RequestMapping(value = "")
	public ModelAndView menu(HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView();

		return mv;
	}


}


