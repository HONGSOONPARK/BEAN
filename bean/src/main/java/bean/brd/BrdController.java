package bean.brd;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import bean.login.CustomUserDetail;

@Controller
public class BrdController {

//	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	Logger log = Logger.getLogger(this.getClass());
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Resource(name="brdService")
	private BrdService brdService;

	@RequestMapping(value = "/brd/brdList.do")
	public ModelAndView brdList(HttpServletRequest request, BrdVO brdvo) throws Exception {
	    ModelAndView mv = new ModelAndView("/brd/brdList");


	    brdvo.setBrdid(request.getParameter("menu_id"));
	    Map<String, Object> resultMap = brdService.selectBrdList(brdvo);

        mv.addObject("paginationInfo", resultMap.get("paginationInfo"));
        mv.addObject("list", resultMap.get("result"));
        mv.addObject("total_count", resultMap.get("total_count"));


		return mv;
	}


	@RequestMapping(value = "/brd/brdWrite.do")
	public ModelAndView brdWrite() throws Exception {
	    ModelAndView mv = new ModelAndView("/brd/brdWrite");
		return mv;
	}

	@RequestMapping(value = "/brd/brdWriteInsert.do")
	public ModelAndView brdWriteInsert(MultipartHttpServletRequest request, BrdVO brdvo , BrdFileVO brdfilevo) throws Exception {
	    ModelAndView mv = new ModelAndView("redirect:/brd/brdList.do");
	    mv.addObject("menu_id", request.getParameter("menu_id"));
//	    MemberVO membervo = (MemberVO)request.getSession().getAttribute("membervo");
//	    String regid = membervo.getMemberid();
	    CustomUserDetail user = (CustomUserDetail) request.getAttribute("user");
	    String regid = user.getMember_id();

//	    commandMap.put("regid",regid);
//	    commandMap.put("modid",regid);
	    brdvo.setRegid(regid);
	    brdvo.setModid(regid);

	    brdfilevo.setRegid(regid);

	    brdService.insertBrd(brdvo, brdfilevo ,request);
		return mv;
	}


	@RequestMapping(value = "/brd/brdDetail.do")
	public ModelAndView brdDetail(HttpServletRequest request, BrdVO brdvo , BrdFileVO brdfilevo) throws Exception {
	    ModelAndView mv = new ModelAndView("/brd/brdDetail");

//	   MemberVO membervo = (MemberVO)request.getSession().getAttribute("membervo");
	   Map<String,Object> map = brdService.brdDetail(brdvo, brdfilevo);
	   CustomUserDetail user = (CustomUserDetail) request.getAttribute("user");
	   String regid = user.getMember_id();
	   mv.addObject("map", map.get("map"));
	   mv.addObject("loginId", regid);
//	   mv.addObject("loginId", membervo.getMemberid());

	   mv.addObject("list", map.get("list"));


		return mv;
	}





	@RequestMapping(value = "/brd/brdModify.do")
	public ModelAndView brdModify(HttpServletRequest request, BrdVO brdvo , BrdFileVO brdfilevo) throws Exception {

		ModelAndView mv = new ModelAndView("/brd/brdModify");
		Map<String,Object> map = brdService.brdDetail(brdvo,brdfilevo);
		mv.addObject("map", map.get("map"));
		mv.addObject("list", map.get("list"));
		mv.addObject("maxidx", map.get("maxidx"));
		mv.addObject("menu_id", request.getParameter("menu_id"));
		return mv;
	}

	@RequestMapping(value = "/brd/brdModifyUpdate.do")
	public ModelAndView brdModifyUpdate(MultipartHttpServletRequest request, BrdVO brdvo , BrdFileVO brdfilevo) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/brd/brdDetail.do");
		CustomUserDetail user = (CustomUserDetail) request.getAttribute("user");
	    String regid = user.getMember_id();
	 	brdvo.setRegid(regid);
		brdfilevo.setRegid(regid);
		brdvo.setModid(regid);
	    brdService.updateBrd(brdvo, brdfilevo, request);
	    mv.addObject("idx", brdvo.getIdx());
	    mv.addObject("menu_id", request.getParameter("menu_id"));


		return mv;
	}


	@RequestMapping(value = "/brd/brdModifyDelete.do")
	public ModelAndView brdModifyDelete(HttpServletRequest request,BrdVO brdvo) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/brd/brdList.do");
//		MemberVO membervo = (MemberVO)request.getSession().getAttribute("membervo");
//		commandMap.put("modid", membervo.getMemberid());
//		commandMap.put("modid","admin");
		mv.addObject("menu_id",request.getParameter("menu_id"));
		CustomUserDetail user = (CustomUserDetail) request.getAttribute("user");
	    String regid = user.getMember_id();
		brdvo.setModid(regid);

		brdService.delBrd(brdvo);

		return mv;
	}


//	@RequestMapping(value="/sample/testMapArgumentResolver.do")
//	public ModelAndView testMapArgumentResolver(Map<String,Object> commandMap) throws Exception{
//	    ModelAndView mv = new ModelAndView("");
//	    if(commandMap.isEmpty() == false){
//	        Iterator<Entry<String,Object>> iterator = commandMap.entrySet().iterator();
//	        Entry<String,Object> entry = null;
//	        while(iterator.hasNext()){
//	            entry = iterator.next();
//	            log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
//	        }
//	    }
//	    return mv;
//	}


}


