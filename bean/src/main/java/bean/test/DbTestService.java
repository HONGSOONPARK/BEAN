package bean.test;

import java.util.List;
import java.util.Map;

public interface DbTestService {
	
	 List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception;


}
