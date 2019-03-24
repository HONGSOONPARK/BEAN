package bean.test;
	

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("dbTestService")
public class DbTestServiceImple implements DbTestService{
	
    Logger log = Logger.getLogger(this.getClass());

    @Resource(name="dbTestDAO")
    private DbTestDAO dbTestDAO;

    @Override
    public List<Map<String, Object>> selectList(Map<String, Object> map) throws Exception {
        return dbTestDAO.selectList(map);

    }
	
	
}
