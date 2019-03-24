package bean.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class PermissionEvaluator implements AccessDeniedHandler {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException exception) throws IOException, ServletException {



		response.setStatus(HttpServletResponse.SC_FORBIDDEN);
//		request.setAttribute("returnUrl",request.getHeader("referer"));
		request.setAttribute("exceptionMsg", exception.getMessage());
		request.getRequestDispatcher("/handler/accessDeny.do").forward(request, response);

	}


}

