package bean.test;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



/**
 * Handles requests for the application home page.
 */
@Controller
public class DbTestController {

	Logger log = Logger.getLogger(this.getClass());

	@Resource(name="dbTestService")
	private DbTestService dbTestService;
	@RequestMapping(value = "db_view.do")
	public String DbTest(Locale locale, Model model, HttpServletRequest request) {
		log.debug(model);
		return "/db_test/db_view";
	}


	@RequestMapping(value="/db.do")
    public ModelAndView SelectList(Map<String,Object> commandMap) throws Exception{
		log.info("★ ☆ ★ ☆ ★ ☆ ※ DB Button Click : 연결 확인. ★ ☆ ★ ☆ ★ ☆ ");
		ModelAndView mv = new ModelAndView("/main");
        List<Map<String,Object>> list = dbTestService.selectList(commandMap);
	    mv.addObject("list", list);
	    return mv;
    }


	@RequestMapping(value="/viewTest.do")
    public String ViewTest(Map<String,Object> commandMap) throws Exception{


	    return "/test";
    }


}
