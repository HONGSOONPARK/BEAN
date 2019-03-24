package bean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {

//	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	@RequestMapping(value = "/main.do")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView("main");
		return mv;
	}


}


