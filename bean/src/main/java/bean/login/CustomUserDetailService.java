package bean.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import bean.menu.MenuDAO;
import bean.menu.MenuVO;

public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	LoginDAO loginDAO;

	@Autowired
	MenuDAO menuDAO;



	@Override
	public CustomUserDetail loadUserByUsername(String memberid) throws UsernameNotFoundException {
		CustomUserDetail userDetail = null;
		try {
			userDetail = loginDAO.checkMemberId(memberid);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}


		return userDetail;
	}

	public List<MenuVO> menuList(MenuVO vo) throws UsernameNotFoundException {
		List<MenuVO> menu = null;
		try {
			menu = menuDAO.roleMenu(vo);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return menu;
	}


}
