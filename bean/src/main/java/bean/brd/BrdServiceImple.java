package bean.brd;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import bean.common.common.CommonDAO;
import bean.common.util.FileUtils;



@Service("brdService")
public class BrdServiceImple implements BrdService{

    Logger log = Logger.getLogger(this.getClass());

    @Resource(name="brdDAO")
    private BrdDAO brdDAO;

    @Resource(name="commonDAO")
    private CommonDAO commonDAO;


    @Resource(name="fileUtils")

    private FileUtils fileUtils;


	@Override
	public Map<String, Object> selectBrdList(BrdVO brdvo) throws Exception {
		return brdDAO.selectBrdList(brdvo);
	}


	@Override
	public void insertBrd(BrdVO brdvo, BrdFileVO brdfilevo, MultipartHttpServletRequest request) throws Exception {

//		int idx = brdDAO.selectIdxKey().getIdx();
//		brdvo.setIdx(idx);

		// brd idx 채번 // 게시판은 메뉴 id를 seq_code로 갖는다;



//		commonDAO.updateSeq(request.getParameter("menu_id"));
//		int idx = commonDAO.selectSeq(request.getParameter("menu_id"));

		commonDAO.updateSeq("BRD_DATA_IDX");
		commonDAO.updateSeq(request.getParameter("menu_id"));

		int idx = commonDAO.selectSeq("BRD_DATA_IDX");
		int brdidx = commonDAO.selectSeq(request.getParameter("menu_id"));

		brdvo.setIdx(idx);
		brdvo.setBrdidx(brdidx);

		brdDAO.insertBrd(brdvo);		brdfilevo.setBrdidx(brdvo.getIdx());

		 List<BrdFileVO> list = fileUtils.parseInsertFileInfo(brdfilevo, request);

		 int size;
		 if(list == null){
			 size = 0;
		 }else{
			 size = list.size();
		 }

	        for(int i=0; i<size; i++){

	        	commonDAO.updateSeq("BRD_FILE_IDX");
	    		int fileidx = commonDAO.selectSeq("BRD_FILE_IDX");
	    		list.get(i).setFileidx(fileidx);
	        	brdDAO.insertFile(list.get(i));
	        }
	}




	@Override
	public Map<String, Object> brdDetail(BrdVO brdvo, BrdFileVO brdfilevo) throws Exception {

		 brdDAO.updateHitCnt(brdvo);
		 Map<String, Object> resultMap = new HashMap<String,Object>();
	  	 BrdVO tempMap = brdDAO.selectBrdDetail(brdvo);
	  	 brdfilevo.setBrdidx(brdvo.getIdx());
	  	 BrdFileVO maxFileIdx = brdDAO.selectFileMaxIdx(brdfilevo);
	  	 List<BrdFileVO> list = brdDAO.selectFileList(brdfilevo);

	  	 resultMap.put("map",tempMap);
	     resultMap.put("list",list);
	     resultMap.put("maxidx",maxFileIdx.getMaxidx());


		return resultMap;
	}

	@Override
	public void updateBrd(BrdVO brdvo, BrdFileVO brdfilevo, MultipartHttpServletRequest request) throws Exception {

		brdfilevo.setBrdidx(brdvo.getIdx());
		brdfilevo.setBrdid(brdvo.getBrdid());

		brdDAO.updateBrd(brdvo);
		brdDAO.deleteFileList(brdfilevo);

	    List<BrdFileVO> list = fileUtils.parseUpdateFileInfo(brdfilevo, request);
	    BrdFileVO tempMap;

	    int size;

	    if(list == null || list.equals("")){
	    	size = 0;
	    }else{
	    	size = list.size();
	    }

	    for(int i=0;i<size; i++){
	    	tempMap = list.get(i);
	        if(tempMap.getIs_new() == "Y" || tempMap.getIs_new().equals("Y")){
	        	commonDAO.updateSeq("BRD_FILE_IDX");
	    		int idx = commonDAO.selectSeq("BRD_FILE_IDX");
	        	tempMap.setFileidx(idx);
	        	brdDAO.insertFile(tempMap);
	        }
	        else{
	        	brdDAO.updateFile(tempMap);
	        }
	    }
	}

	@Override
	public void delBrd(BrdVO brdvo) throws Exception {
		brdDAO.delBrd(brdvo);
	}


}
