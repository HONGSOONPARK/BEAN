package bean.login;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import bean.menu.MenuVO;

public class CustomAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    CustomUserDetailService customUserDetailService;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {

      String memberid = (String)authentication.getPrincipal(); //아이디 받기
      String memberpwd = (String)authentication.getCredentials(); //비밀번호 받기

      CustomUserDetail userDetail = customUserDetailService.loadUserByUsername(memberid);


      if (userDetail == null) {
		  throw new UsernameNotFoundException("[ "+memberid+" ] 사용자를 찾을 수 없습니다.");
	  }
//      if (!matchPassword(userDetail.getPassword(), memberpwd)) {
      if(!passwordEncoder.matches(memberpwd, userDetail.getPassword())){
          throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
       }

      MenuVO vo = new MenuVO();
      vo.setLogin_id(memberid);
      vo.setRole_char(userDetail.getMember_role().toString());
      vo.setAdmin_yn("N");

	  List<MenuVO> menuvo = customUserDetailService.menuList(vo);

      userDetail.setMenuvo(menuvo);

      List<GrantedAuthority> roles = new ArrayList<GrantedAuthority>();
      //권한 설정하기 해당 사항에 맞는 권한을 선택하여 이용한다.

//      if(userDetail.getMember_role().equals("A")){
//    	  roles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
//      }else if(userDetail.getMember_role().equals("N")){
//    	  roles.add(new SimpleGrantedAuthority("ROLE_USER"));
//      }else{
//    	  roles.add(new SimpleGrantedAuthority("ROLE_GUEST"));
//      }

   	  roles.add(new SimpleGrantedAuthority(userDetail.getMember_role()));

      UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(memberid, userDetail.getPassword(), roles);
      result.setDetails(userDetail);


      return result;
    }

//    private boolean matchPassword(String password, Object credentials) {
//        return password.equals(credentials);
//    }


    @Override
    public boolean supports(Class<?> authentication) {
          return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }
}

