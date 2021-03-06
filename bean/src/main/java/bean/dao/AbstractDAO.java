package bean.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import bean.admin.AdminVO;
import bean.brd.BrdVO;
import bean.menu.MenuVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

public class AbstractDAO {
    protected Log log = LogFactory.getLog(AbstractDAO.class);

    @Autowired
    private SqlSessionTemplate sqlSession;

    protected void printQueryId(String queryId) {
        if(log.isDebugEnabled()){
            log.debug("\t QueryId  \t:  " + queryId);
        }
    }

    public Object insert(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.insert(queryId, params);
    }

    public Object update(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.update(queryId, params);
    }

    public Object delete(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.delete(queryId, params);
    }

    public Object selectOne(String queryId){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId);
    }

    public Object selectOne(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectOne(queryId, params);
    }


    @SuppressWarnings("rawtypes")
    public List selectList(String queryId){
        printQueryId(queryId);
        return sqlSession.selectList(queryId);
    }

    @SuppressWarnings("rawtypes")
    public List selectList(String queryId, Object params){
        printQueryId(queryId);
        return sqlSession.selectList(queryId,params);
    }


    @SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectPagingList(String queryId, Object params){
		printQueryId(queryId);

		Map<String,Object> map = (Map<String,Object>) params;
		PaginationInfo paginationInfo = null;

		if(map.containsKey("currentPageNo") == false || StringUtils.isEmpty(map.get("currentPageNo")) == true)
			map.put("currentPageNo","1");

		paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(Integer.parseInt(map.get("currentPageNo").toString()));
		if(map.containsKey("PAGE_ROW") == false || StringUtils.isEmpty(map.get("PAGE_ROW")) == true){
			paginationInfo.setRecordCountPerPage(15);
		}
		else{
			paginationInfo.setRecordCountPerPage(Integer.parseInt(map.get("PAGE_ROW").toString()));
		}
		paginationInfo.setPageSize(10);

		int start = paginationInfo.getFirstRecordIndex();
		int end = start + paginationInfo.getRecordCountPerPage();
		map.put("START",start);
		map.put("END",end);

		params = map;

		Map<String,Object> returnMap = new HashMap<String,Object>();
		List<Map<String,Object>> list = sqlSession.selectList(queryId,params);
		if(list.size() == 0){
			map = new HashMap<String,Object>();
			map.put("TOTAL_COUNT",0);
			list.add(map);

			if(paginationInfo != null){
				paginationInfo.setTotalRecordCount(0);
				returnMap.put("paginationInfo", paginationInfo);
			}
		}
		else{
			if(paginationInfo != null){
				paginationInfo.setTotalRecordCount(Integer.parseInt(list.get(0).get("TOTAL_COUNT").toString()));
//				paginationInfo.setTotalRecordCount(500);
				returnMap.put("paginationInfo", paginationInfo);
			}
		}
		returnMap.put("result", list);
		return returnMap;
	}




    @SuppressWarnings({ "rawtypes" })
 	public Map selectPagingVoList(String queryId, Object params){
 		printQueryId(queryId);
 		BrdVO brdvo = (BrdVO)params;
 		PaginationInfo paginationInfo = null;

 		if(StringUtils.isEmpty(brdvo.getCurrentPageNo()) == true || brdvo.getCurrentPageNo() == 0){
 			brdvo.setCurrentPageNo(1);
 		}

 		paginationInfo = new PaginationInfo();
 		paginationInfo.setCurrentPageNo(brdvo.getCurrentPageNo());
 		if(StringUtils.isEmpty(brdvo.getPagerow()) == true || brdvo.getPagerow() == 0){
 			paginationInfo.setRecordCountPerPage(15);
 		}
 		else{
 			paginationInfo.setRecordCountPerPage(brdvo.getPagerow());
 		}

 		paginationInfo.setPageSize(5);

 		int start = paginationInfo.getFirstRecordIndex();

// 		int end = start + paginationInfo.getRecordCountPerPage(); // 오라클 사용
 		int end = paginationInfo.getRecordCountPerPage(); // MYSQL 사용

 		brdvo.setStart(start);
 		brdvo.setEnd(end);

 		params = brdvo;

 		Map<String,Object> returnMap = new HashMap<String,Object>();

 		List<BrdVO> list = sqlSession.selectList(queryId,params);
 		int total_count = sqlSession.selectOne("selectBrdListTotalCount",params);
 		if(list.isEmpty() == true){

 			BrdVO empTotCnt = new BrdVO();
 			empTotCnt.setTotalcount(0);
 			list.add(empTotCnt);
 			if(paginationInfo != null){
 				paginationInfo.setTotalRecordCount(0);
 				returnMap.put("paginationInfo", paginationInfo);
 			}
 		}
 		else{
 			if(paginationInfo != null){
 				paginationInfo.setTotalRecordCount(total_count);
 				returnMap.put("paginationInfo", paginationInfo);
 			}
 		}
 		returnMap.put("result", list);
 		returnMap.put("total_count", total_count);

 		return returnMap;
 	}




    @SuppressWarnings({ "rawtypes" })
 	public Map selectPagingAdminVoList(String queryId, Object params){
 		printQueryId(queryId);

 		AdminVO vo = (AdminVO)params;

 		PaginationInfo paginationInfo = null;

 		if(StringUtils.isEmpty(vo.getCurrentPageNo()) == true || vo.getCurrentPageNo() == 0){
 			vo.setCurrentPageNo(1);
 		}

 		paginationInfo = new PaginationInfo();
 		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo());
 		if(StringUtils.isEmpty(vo.getPagerow()) == true || vo.getPagerow() == 0){
 			paginationInfo.setRecordCountPerPage(15);
 		}
 		else{
 			paginationInfo.setRecordCountPerPage(vo.getPagerow());
 		}

 		paginationInfo.setPageSize(5);

 		int start = paginationInfo.getFirstRecordIndex();
// 		int end = start + paginationInfo.getRecordCountPerPage(); // ORACLE 사용
 		int end = paginationInfo.getRecordCountPerPage(); // MYSQL 사용

// 		vo.setStart(start + 1); // ORACLE 사용
 		vo.setStart(start);
 		vo.setEnd(end);

 		params = vo;

 		Map<String,Object> returnMap = new HashMap<String,Object>();

 		List<AdminVO> list = sqlSession.selectList(queryId,params);
 		int total_count = sqlSession.selectOne("selectCodeListTotalCount",params); // MYSQL 사용

 		if(list.isEmpty() == true){

 			AdminVO empTotCnt = new AdminVO();

 			empTotCnt.setTotalcount(0);
 			list.add(empTotCnt);
 			if(paginationInfo != null){
 				paginationInfo.setTotalRecordCount(0);
 				returnMap.put("paginationInfo", paginationInfo);
 			}
 		}
 		else{
 			if(paginationInfo != null){
// 				paginationInfo.setTotalRecordCount(list.get(0).getTotalcount()); // ORACLE 사용
 				paginationInfo.setTotalRecordCount(total_count); // ORACLE 사용
 				returnMap.put("paginationInfo", paginationInfo);
 			}
 		}
 		returnMap.put("result", list);
 		returnMap.put("total_count", total_count);

 		return returnMap;
 	}




    @SuppressWarnings({ "rawtypes" })
 	public Map selectPagingMenuVoList(String queryId, Object params){
 		printQueryId(queryId);

 		MenuVO vo = (MenuVO)params;

 		PaginationInfo paginationInfo = null;

 		if(StringUtils.isEmpty(vo.getCurrentPageNo()) == true || vo.getCurrentPageNo() == 0){
 			vo.setCurrentPageNo(1);
 		}

 		paginationInfo = new PaginationInfo();
 		paginationInfo.setCurrentPageNo(vo.getCurrentPageNo());
 		if(StringUtils.isEmpty(vo.getPagerow()) == true || vo.getPagerow() == 0){
 			paginationInfo.setRecordCountPerPage(15);
 		}
 		else{
 			paginationInfo.setRecordCountPerPage(vo.getPagerow());
 		}

 		paginationInfo.setPageSize(5);


 		int start = paginationInfo.getFirstRecordIndex();
// 		int end = start + paginationInfo.getRecordCountPerPage(); // ORACLE 사용
 		int end = paginationInfo.getRecordCountPerPage(); // MYSQL 사용

// 		vo.setStart(start + 1); // ORACLE 사용
 		vo.setStart(start);
 		vo.setEnd(end);

 		params = vo;

 		Map<String,Object> returnMap = new HashMap<String,Object>();

 		List<MenuVO> list = sqlSession.selectList(queryId,params);
 		int total_count = sqlSession.selectOne("selectAuthListTotalCount",params); // MYSQL 사용

 		if(list.isEmpty() == true){

 			MenuVO empTotCnt = new MenuVO();

 			empTotCnt.setTotalcount(0);
 			list.add(empTotCnt);
 			if(paginationInfo != null){
 				paginationInfo.setTotalRecordCount(0);
 				returnMap.put("paginationInfo", paginationInfo);
 			}
 		}
 		else{
 			if(paginationInfo != null){
// 				paginationInfo.setTotalRecordCount(list.get(0).getTotalcount()); // ORACLE 사용
 				paginationInfo.setTotalRecordCount(total_count);
 				returnMap.put("paginationInfo", paginationInfo);
 			}
 		}
 		returnMap.put("result", list);
 		returnMap.put("total_count", total_count);
 		return returnMap;
 	}



















    @SuppressWarnings("unchecked")

    public Object selectPagingListAjax(String queryId, Object params){
        printQueryId(queryId);
        Map<String,Object> map = (Map<String,Object>)params;

        String strPageIndex = (String)map.get("PAGE_INDEX");
        String strPageRow = (String)map.get("PAGE_ROW");
        int nPageIndex = 0;
        int nPageRow = 20;

        if(StringUtils.isEmpty(strPageIndex) == false){
            nPageIndex = Integer.parseInt(strPageIndex)-1;
        }

        if(StringUtils.isEmpty(strPageRow) == false){
            nPageRow = Integer.parseInt(strPageRow);
        }

        map.put("START", (nPageIndex * nPageRow) + 1);
        map.put("END", (nPageIndex * nPageRow) + nPageRow);

        return sqlSession.selectList(queryId, map);

    }










}