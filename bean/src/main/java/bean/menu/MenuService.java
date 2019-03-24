package bean.menu;

import java.util.List;

public interface MenuService {

	public List<MenuVO> roleMenu(MenuVO menu) throws Exception;

	public List<MenuVO> roleMenuAdmin(MenuVO menu) throws Exception;




}