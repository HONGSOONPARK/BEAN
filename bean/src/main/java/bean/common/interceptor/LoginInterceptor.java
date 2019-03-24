package bean.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginInterceptor extends HandlerInterceptorAdapter {
    protected Log log = LogFactory.getLog(LoginInterceptor.class);

//    private Set<String> permittedURL;

//	public void setPermittedURL(Set<String> permittedURL) {
//		this.permittedURL = permittedURL;
//	}

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (log.isDebugEnabled()) {
//            log.debug("▶▶▶         START        ============================================================================");
//            log.debug(" Request URI \t:  " + request.getRequestURI());
        }

//    	String requestURI = request.getRequestURI(); //요청 URI
//		boolean isPermittedURL = false;

//		HttpSession session = request.getSession();

//		MemberVO memberVO = (MemberVO) session.getAttribute("membervo");


//		if(memberVO != null){
			return true;
//		}else{
//			ModelAndView modelAndView = new ModelAndView("redirect:/logout.do");
//		throw new ModelAndViewDefiningException(modelAndView);


//			}

		}


    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (log.isDebugEnabled()) {
//            log.debug("============================================================================           END          ◀◀◀\n");
        }
    }
}