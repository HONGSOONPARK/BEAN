package bean.test;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bean.dao.AbstractDAO;




@Repository("dbTestDAO")
public class DbTestDAO extends AbstractDAO {

	  @SuppressWarnings("unchecked")
	    public List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception{
	        return selectList("dbtest.selectList", map);

	    }



}
