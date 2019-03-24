package bean.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import bean.common.common.Globals;
import bean.login.CustomUserDetail;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
    protected Log log = LogFactory.getLog(LoggerInterceptor.class);
    private final String KAKAO_JS_API = Globals.KAKAO_JS_API;

    @Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

    	if (log.isDebugEnabled()) {
            log.debug("▶▶▶         START        ============================================================================");
            log.debug(" Request URI \t:  " + request.getRequestURI());

    		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
    		if(auth != null){
	    		if(auth.getCredentials() != null || auth.getCredentials() != ""){
	        		Object pri = auth.getPrincipal();
		    		if(pri != null){
		    			if( auth.getName() != "anonymousUser"){
		    			CustomUserDetail membervo = (CustomUserDetail)auth.getDetails();

		    			request.setAttribute("user",membervo);
		    			request.setAttribute("menuvo",membervo.getMenuvo());
		    			request.setAttribute("cur_menu_id", request.getParameter("menu_id"));
		    			request.setAttribute("kakaoJsApi",KAKAO_JS_API);

//		    			request.setAttribute("user_nick", membervo.getMember_nick());
//		    			request.setAttribute("user_name", membervo.getMember_name());
//		    			request.setAttribute("user_type", membervo.getMember_type());
//		    			request.setAttribute("user_auth", auth.getAuthorities());
//		    			request.setAttribute("user_auth", membervo.getMember_role());
//		    			request.setAttribute("user_id", auth.getName());

		    			}
		    		}
	    		}
    		}
        }

        return super.preHandle(request, response, handler);
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("============================================================================           END          ◀◀◀\n");
        }
    }
}