package bean.admin;

import java.util.List;
import java.util.Map;

import bean.login.CustomUserDetail;
import bean.member.MemberVO;
import bean.menu.MenuVO;

public interface AdminService {

	public List<CustomUserDetail> adminMemberList(CustomUserDetail user) throws Exception;
	public MemberVO adminMemberInfoDetails(MemberVO user) throws Exception;
	public int adminMemberInfoUpdate(MemberVO membervo) throws Exception;
	public void adminMemberUse(MemberVO membervo) throws Exception;
	public void adminMemberDelete(MemberVO membervo) throws Exception;

	public void adminMemberRealDelete(MemberVO membervo) throws Exception;

//	public Map<String, Object> selectCodeList(AdminVO vo) throws Exception;

	public Map<String, Object> selectCodeList(AdminVO vo) throws Exception;



	public List<AdminVO> selectCodeDetail(AdminVO vo) throws Exception;
	public List<AdminVO> selectCodeInfo(AdminVO vo) throws Exception;



	public List<AdminVO> codeCheck(AdminVO vo) throws Exception;

	public int codeListInsert(AdminVO vo) throws Exception;

	public int codeDetailUpdate(AdminVO vo) throws Exception;
	public void codeListUpdate(AdminVO vo) throws Exception;
	public void codeListDelete(AdminVO vo) throws Exception;

	public void codeDeleteAll(int code) throws Exception;


	public List<MenuVO> menuManagerList(MenuVO menuvo) throws Exception;
	public List<MenuVO> menuManagerDetail(MenuVO menuvo) throws Exception;

	public MenuVO menuDepthCheck(MenuVO menuvo) throws Exception;

	public int menuDelCheck(MenuVO menuvo) throws Exception;

	public MenuVO menuCheck(MenuVO vo) throws Exception;

	public int menuUpdate(MenuVO vo) throws Exception;

	public void menuDelete(MenuVO vo) throws Exception;

	public List<AdminVO> authManagerList() throws Exception;

	public List<AdminVO> authDetail(AdminVO vo) throws Exception;

//	public List<MenuVO> authDetailPop(MenuVO vo) throws Exception;

	public Map<String, Object> authDetailPop(MenuVO vo) throws Exception;


	public int authDetailUpdate(MenuVO vo) throws Exception;

	public void authDetailDelete(MenuVO vo) throws Exception;



}