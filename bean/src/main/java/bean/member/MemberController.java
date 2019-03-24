package bean.member;

import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {

//	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	Logger log = Logger.getLogger(this.getClass());
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Resource(name="memberService")
	private MemberService memberService;

	@RequestMapping(value = "/member/memberInsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(Locale locale, Model model, HttpServletRequest request, MemberVO membervo) throws Exception {
		log.debug(model);
		String result = null;

		membervo.setMember_role("B");
		membervo.setMember_nick("짱구");

		result = Integer.toString(memberService.memberInsert(membervo));
		return result;
	}



}
