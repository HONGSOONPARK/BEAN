package bean.menu;

import java.util.List;

import org.springframework.stereotype.Repository;

import bean.dao.AbstractDAO;




@Repository("menuDAO")
public class MenuDAO extends AbstractDAO {

	@SuppressWarnings("unchecked")
	public List<MenuVO> roleMenu(MenuVO menu) throws Exception{
    	return selectList("menu.roleMenu", menu);
    }

	@SuppressWarnings("unchecked")
	public List<MenuVO> roleMenuAdmin(MenuVO menu) throws Exception{
    	return selectList("menu.roleMenuAdmin", menu);
    }

}
