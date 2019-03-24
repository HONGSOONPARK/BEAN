package bean.menu;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



@Service("menuService")
public class MenuServiceImple implements MenuService{


    @Resource(name="menuDAO")
    private MenuDAO menuDAO;

	@Override
	public List<MenuVO> roleMenu(MenuVO menu) throws Exception {
		return menuDAO.roleMenu(menu);
	}


	@Override
	public List<MenuVO> roleMenuAdmin(MenuVO menu) throws Exception {
		return menuDAO.roleMenuAdmin(menu);
	}




}
