package bean.admin;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import bean.dao.AbstractDAO;
import bean.login.CustomUserDetail;
import bean.member.MemberVO;
import bean.menu.MenuVO;




@Repository("adminDAO")
public class AdminDAO extends AbstractDAO {

//	사용자 관리 화면

	@SuppressWarnings("unchecked")
	public List<CustomUserDetail> adminMemberList(CustomUserDetail user) throws Exception{
    	return selectList("admin.adminMemberList", user);
    }

	public MemberVO adminMemberInfoDetails(MemberVO user) throws Exception{
    	return (MemberVO) selectOne("admin.adminMemberInfoDetails", user);
    }


	public void adminMemberInfoInsert(MemberVO user) throws Exception{
		insert("admin.memberInsert", user);
    }

	public void adminMemberDetailInfoInsert(MemberVO user) throws Exception{
		insert("admin.memberDetailInsert", user);
    }

	public void adminMemberInfoUpdate(MemberVO user) throws Exception{
		update("admin.memberUpdate", user);
    }

	public void adminMemberDetailInfoUpdate(MemberVO user) throws Exception{
		update("admin.memberDetailUpdate", user);
    }

	public void adminMemberUse(MemberVO user) throws Exception{
		update("admin.memberUse", user);
    }


	public void adminMemberDelete(MemberVO user) throws Exception{
		update("admin.memberDelete", user);
    }


	public void adminMemberRealDelete(MemberVO user) throws Exception{
		update("admin.memberRealDelete", user);
    }

	public void adminMemberDetailRealDelete(MemberVO user) throws Exception{
		update("admin.memberDetailRealDelete", user);
    }


	public void adminMemberDetailDelete(MemberVO user) throws Exception{
		update("admin.memberDetailDelete", user);
    }

//	사용자 관리 화면


	@SuppressWarnings("unchecked")
	public Map<String, Object> selectCodeList(AdminVO vo) throws Exception{
		return selectPagingAdminVoList("admin.selectCodeList",vo);
	}


	@SuppressWarnings("unchecked")
	public List<AdminVO> selectCodeDetail(AdminVO vo) throws Exception{
		return selectList("admin.selectCodeDetail",vo);
	}


	@SuppressWarnings("unchecked")
	public List<AdminVO> selectCodeInfo(AdminVO vo) throws Exception{
		return selectList("admin.selectCodeInfo",vo);
	}


	@SuppressWarnings("unchecked")
	public List<AdminVO> codeListCheck(AdminVO vo) throws Exception{
		return selectList("admin.selectCodeCheck",vo);
	}

	public int codeListInsert(AdminVO vo) throws Exception{
		return (int) insert("admin.codeListInsert",vo);
	}

	public void codeListUpdate(AdminVO vo) throws Exception{
		update("admin.codeListUpdate",vo);
	}

	public void codeDetailInsert(AdminVO vo) throws Exception{
		insert("admin.codeDetailInsert",vo);
	}

	public void codeDetailUpdate(AdminVO vo) throws Exception{
		update("admin.codeDetailUpdate",vo);
	}

	public void codeDetailDelete(int detail_no) throws Exception{
		update("admin.codeDetailDelete", detail_no);
	}

	public void codeListDelete(int code) throws Exception{
		update("admin.codeListDelete", code);
	}


	public void codeDetailDeleteAll(int code) throws Exception{
		update("admin.codeDetailDeleteAll", code);
	}



	@SuppressWarnings("unchecked")
	public List<MenuVO> menuManagerList(MenuVO menu) throws Exception{
    	return selectList("admin.menuManagerList", menu);
    }


	@SuppressWarnings("unchecked")
	public List<MenuVO> menuManagerDetail(MenuVO menu) throws Exception{
    	return selectList("admin.menuManagerDetail", menu);
    }


	public MenuVO menuDepthCheck(MenuVO menu) throws Exception{
    	return  (MenuVO) selectOne("admin.menuDepthCheck", menu);
    }


	public int menuDelCheck(MenuVO menu) throws Exception{
    	return  (int) selectOne("admin.menuDelCheck", menu);
    }


	public MenuVO menuCheck(MenuVO vo) throws Exception{
		return (MenuVO) selectOne("admin.menuCheck",vo);
	}


	public SeqTableVO seqInsert(SeqTableVO vo) throws Exception{
		return (SeqTableVO) selectOne("admin.seqTableInsert",vo);
	}

	public SeqTableVO seqCheck(SeqTableVO vo) throws Exception{
		return (SeqTableVO) selectOne("admin.seqTableCodeCheck",vo);
	}

	public SeqTableVO seqUpdate(SeqTableVO vo) throws Exception{
		return (SeqTableVO) selectOne("admin.seqTableUpdate",vo);
	}

	public SeqTableVO seqDelete(SeqTableVO vo) throws Exception{
		return (SeqTableVO) selectOne("admin.seqTableDelete",vo);
	}


	public int seqMax() throws Exception{
		return (int) selectOne("admin.seqTableMaxnum");
	}

//	public Integer selectCodeTotal(AdminVO vo) {
//		return (Integer) selectOne("admin.selectCodeTotal", vo);
//	}

	public void menuUpdate(MenuVO vo) throws Exception{
		insert("admin.menuUpdate",vo);
	}

	public void menuChildUpdate(MenuVO vo) throws Exception{
		update("admin.menuChildUpdate",vo);
	}

	public void menuAuthDetailUpdate(MenuVO vo) throws Exception{
		update("admin.menuAuthDetailUpdate",vo);
	}

	public void menuInsert(MenuVO vo) throws Exception{
		insert("admin.menuInsert",vo);
	}

	public void menuDelete(int no) throws Exception{
		update("admin.menuDelete", no);
	}


	@SuppressWarnings("unchecked")
	public List<AdminVO> authManagerList() throws Exception{
		return selectList("admin.authManagerList");
	}


	@SuppressWarnings("unchecked")
	public List<AdminVO> authDetail(AdminVO vo) throws Exception{
		return selectList("admin.authDetail", vo);
	}

//	@SuppressWarnings("unchecked")
//	public List<MenuVO> authDetailPop(MenuVO vo) throws Exception{
//		return selectList("admin.authDetailPop", vo);
//	}

	@SuppressWarnings("unchecked")
	public Map<String, Object> authDetailPop(MenuVO vo) throws Exception{
		return selectPagingMenuVoList("admin.authDetailPop", vo);
	}

	public void authDetailUpdate(MenuVO vo) throws Exception{
		insert("admin.authDetailUpdate",vo);
	}
	public void authDetailInsert(MenuVO vo) throws Exception{
		insert("admin.authDetailInsert",vo);
	}

	public void authDetailDelete(int no) throws Exception{
		update("admin.authDetailDelete", no);
	}


	public void menuAuthDetailDelete(String id) throws Exception{
		update("admin.menuAuthDetailDelete", id);
	}


	// 사용자 no 조회
	public MemberVO selMemberNo(MemberVO user) throws Exception{
    	return (MemberVO) selectOne("admin.selMemberNo", user);
    }




}
