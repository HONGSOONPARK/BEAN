package bean.brd;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bean.dao.AbstractDAO;




@Repository("brdDAO")
public class BrdDAO extends AbstractDAO {

//	@SuppressWarnings("unchecked")
//	public Map<String, Object>  selectBrdList(Map<String, Object> map) throws Exception{
//		  return selectPagingList("brd.selectBrdList",map);
//	}

	@SuppressWarnings("unchecked")
	public Map<String, Object>  selectBrdList(BrdVO brdvo) throws Exception{
		  return selectPagingVoList("brd.selectBrdList",brdvo);
	}

	public void insertBrd(BrdVO brdvo) throws Exception{
		insert("brd.insertBrd",brdvo);
	}

//	@SuppressWarnings("unchecked")
//	public Map<String, Object> selectBrdDetail(Map<String, Object> map) throws Exception{
//		  return (Map<String, Object>) selectOne("brd.selectBrdDetail",map);
//	 }

//	@SuppressWarnings("unchecked")
//
//	public List<Map<String, Object>> selectFileList(Map<String, Object> map) throws Exception{
//	    return selectList("brd.selectFileList", map);
//	}


	public BrdVO selectBrdDetail(BrdVO vo) throws Exception{
		  return  (BrdVO)selectOne("brd.selectBrdDetail",vo);
	 }

	@SuppressWarnings("unchecked")
	public List<BrdFileVO> selectFileList(BrdFileVO vo) throws Exception{
	    return selectList("brd.selectFileList", vo);
	}


	public void updateHitCnt(BrdVO vo) throws Exception{
	    update("brd.updateHitCnt", vo);
	}

	public void updateBrd(BrdVO vo) throws Exception{
		update("brd.updateBrd",vo);
	}

	public void delBrd(BrdVO vo) throws Exception{
		delete("brd.delBrd",vo);
	}


	public void insertFile(BrdFileVO brdfilevo) throws Exception{
	    insert("brd.insertFile", brdfilevo);

	}


	public void deleteFileList(BrdFileVO brdfilevo) throws Exception{
	    update("brd.deleteFileList", brdfilevo);

	}

	public void updateFile(BrdFileVO brdfilevo) throws Exception{
	    update("brd.updateFile", brdfilevo);

	}

	public BrdFileVO selectFileMaxIdx(BrdFileVO brdfilevo) throws Exception{
	    return (BrdFileVO) selectOne("brd.selectFileMaxIdx", brdfilevo);

	}


}
