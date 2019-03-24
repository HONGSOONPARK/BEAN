package bean.common.common;

import java.util.List;
import java.util.Map;


public interface CommonService {

	Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectCommonCode(Map<String, Object> map) throws Exception;

	List<Map<String, Object>> selectCommonRef1Code(Map<String, Object> map) throws Exception;

	int selectSeq(String code) throws Exception;

	void updateSeq(String code) throws Exception;

}
