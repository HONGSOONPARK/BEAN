package bean.brd;

import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;


public interface BrdService {


//	public Map<String, Object>  selectBrdList(Map<String, Object> map) throws Exception;

//	public Map<String, Object> brdDetail(Map<String, Object> map) throws Exception;

	public void insertBrd (BrdVO brdvo, BrdFileVO brdfilevo, MultipartHttpServletRequest request) throws Exception;

	public void updateBrd (BrdVO brdvo, BrdFileVO brdfilevo, MultipartHttpServletRequest request) throws Exception;

	public void delBrd (BrdVO brdvo) throws Exception;


	public Map<String, Object> selectBrdList(BrdVO brdvo) throws Exception;
//
	public Map<String, Object> brdDetail(BrdVO brdvo, BrdFileVO brdfilevo) throws Exception;
//
//	public void insertBrd (BrdVO brdvo, HttpServletRequest request) throws Exception;
//
//	public void updateBrd (BrdVO brdvo, HttpServletRequest request) throws Exception;
//
//	public void delBrd (BrdVO brdvo) throws Exception;


}
