package bean.common.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {

//		System.out.println("exception.getMessage():"+exception.getMessage());
//		String error = exception.getMessage();
//		response.sendRedirect(request.getContextPath() + "/handler/loginFailure.do?error="+error);


		String returnMsg;

		// UsernameNotFoundException 발생시 message_common_kr 적용안됨.. 원인을 못찾아서 이렇게 해놨음....................................쩝
		if(exception.getMessage() == ("UserDetailsService returned null, which is an interface contract violation")){
			returnMsg = "사용자를 찾을 수 없습니다.";
		}else{
			returnMsg = exception.getMessage();
		}

		request.setAttribute("exceptionMsg", returnMsg);
		request.getRequestDispatcher("/login.do").forward(request, response);


	}



}


