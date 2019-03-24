package bean.common.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class CommonErrorController {


	Logger log = Logger.getLogger(this.getClass());


	@RequestMapping(value = "/handler/interceptFailure.do")
	public ModelAndView interceptFailure(HttpServletRequest request, HttpServletResponse response) {

		ModelAndView mv =  new ModelAndView("/error/interceptFailure");
		mv.addObject("exceptionMsg", request.getAttribute("exceptionMsg"));
//		request.getRequestDispatcher("/login.do").forward(request, response);

		return mv;
	}

	@RequestMapping(value = "/handler/accessDeny.do")
	public ModelAndView accessDeny(HttpServletRequest request, HttpServletResponse response, Exception exception) {

		ModelAndView mv =  new ModelAndView("/error/accessDeny");
		String returnUrl = request.getHeader("referer");

		String urlSub = null;

		if(returnUrl == null){
			returnUrl ="/main.do";
			urlSub = "/main.do";
		}else{
			urlSub = (returnUrl.substring(returnUrl.indexOf(request.getContextPath())+1)).substring(returnUrl.indexOf("/")-1);
		}

		mv.addObject("returnUrl", urlSub);
		mv.addObject("exceptionMsg", request.getAttribute("exceptionMsg"));
		return mv;
	}

	@RequestMapping(value = "/common/404error.do")
	public ModelAndView common404Error(HttpServletRequest request, HttpServletResponse response, Exception exception) {

		ModelAndView mv =  new ModelAndView("/error/error");
		String returnUrl = request.getHeader("referer");
		String urlSub = null;

		if(returnUrl == null){
			returnUrl ="/main.do";
			urlSub = "/main.do";
		}else{
			urlSub = (returnUrl.substring(returnUrl.indexOf(request.getContextPath())+1)).substring(returnUrl.indexOf("/")-1);
		}

		mv.addObject("returnUrl", urlSub);
		mv.addObject("exceptionMsg", exception);
		return mv;
	}


	@RequestMapping(value = "/common/500error.do")
	public ModelAndView common500Error(HttpServletRequest request, HttpServletResponse response, Exception exception) {

		ModelAndView mv =  new ModelAndView("/error/error");
		String returnUrl = request.getHeader("referer");
		String urlSub = null;

		if(returnUrl == null){
			returnUrl ="/main.do";
			urlSub = "/main.do";
		}else{
			urlSub = (returnUrl.substring(returnUrl.indexOf(request.getContextPath())+1)).substring(returnUrl.indexOf("/")-1);
		}

		mv.addObject("returnUrl", urlSub);
		mv.addObject("exceptionMsg", exception);
		return mv;
	}

	@RequestMapping(value = "/common/503error.do")
	public ModelAndView common503Error(HttpServletRequest request, HttpServletResponse response, Exception exception) {

		ModelAndView mv =  new ModelAndView("/error/error");
		String returnUrl = request.getHeader("referer");
		String urlSub = null;

		if(returnUrl == null){
			returnUrl ="/main.do";
			urlSub = "/main.do";
		}else{
			urlSub = (returnUrl.substring(returnUrl.indexOf(request.getContextPath())+1)).substring(returnUrl.indexOf("/")-1);
		}

		mv.addObject("returnUrl", urlSub);
		mv.addObject("exceptionMsg", exception);
		return mv;
	}


	@RequestMapping(value = "/common/Thowableerror.do")
	public ModelAndView commonThowableError(HttpServletRequest request, HttpServletResponse response, Exception exception) {

		ModelAndView mv =  new ModelAndView("/error/error");
		String returnUrl = request.getHeader("referer");
		String urlSub = null;

		if(returnUrl == null){
			returnUrl ="/main.do";
			urlSub = "/main.do";
		}else{
			urlSub = (returnUrl.substring(returnUrl.indexOf(request.getContextPath())+1)).substring(returnUrl.indexOf("/")-1);
		}

		mv.addObject("returnUrl", urlSub);
		mv.addObject("exceptionMsg", exception);
		return mv;
	}


	@RequestMapping(value = "/common/Exceptionerror.do")
	public ModelAndView commonExceptionError(HttpServletRequest request, HttpServletResponse response, Exception exception) {

		ModelAndView mv =  new ModelAndView("/error/error");
		String returnUrl = request.getHeader("referer");
		String urlSub = null;

		if(returnUrl == null){
			returnUrl ="/main.do";
			urlSub = "/main.do";
		}else{
			urlSub = (returnUrl.substring(returnUrl.indexOf(request.getContextPath())+1)).substring(returnUrl.indexOf("/")-1);
		}

		mv.addObject("returnUrl", urlSub);
		mv.addObject("exceptionMsg", exception);
		return mv;
	}
}


