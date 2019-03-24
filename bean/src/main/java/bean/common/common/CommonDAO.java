package bean.common.common;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Repository;

import bean.dao.AbstractDAO;


@Repository("commonDAO")
public class CommonDAO extends AbstractDAO {

	Logger log = Logger.getLogger(this.getClass());
	@SuppressWarnings("unchecked")

	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception{
	    return (Map<String, Object>)selectOne("common.selectFileInfo", map);
	}


	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommonCode(Map<String, Object> map) throws Exception{
	    return selectList("common.selectCommonCode", map);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectCommonRef1Code(Map<String, Object> map) throws Exception{
	    return selectList("common.selectCommonRef1Code", map);
	}

	public int selectSeq(String code) throws Exception{
	    return (int) selectOne("common.selectSeq", code);
	}

	public void updateSeq(String code) throws Exception{
	    update("common.updateSeq", code);
	}



}
