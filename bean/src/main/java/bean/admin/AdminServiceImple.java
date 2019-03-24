package bean.admin;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import bean.common.common.CommonDAO;
import bean.login.CustomUserDetail;
import bean.member.MemberVO;
import bean.menu.MenuVO;



@Service("adminService")
public class AdminServiceImple implements AdminService{

    Logger log = Logger.getLogger(this.getClass());


	@Autowired
	BCryptPasswordEncoder passwordEncoder;

    @Resource(name="adminDAO")
    private AdminDAO adminDAO;

    @Resource(name="commonDAO")
    private CommonDAO commonDAO;


	@Override
	public List<CustomUserDetail> adminMemberList(CustomUserDetail user) throws Exception {
		return adminDAO.adminMemberList(user);
	}

	@Override
	public MemberVO adminMemberInfoDetails(MemberVO user) throws Exception {
		return adminDAO.adminMemberInfoDetails(user);
	}



	@Override
	public int adminMemberInfoUpdate(MemberVO user) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;

//		System.out.println("입력한 비번 : "+user.getMember_pwd() +" // 원래비번" +user.getMember_pwd_cur());
		if(!user.getMember_pwd().equals(user.getMember_pwd_cur())){
			user.setMember_pwd(passwordEncoder.encode(user.getMember_pwd()));
		}
		if(user.getStatus().equals("insert")){

			commonDAO.updateSeq("MEMBER_NO");
			int member_no = commonDAO.selectSeq("MEMBER_NO");
			user.setMember_no(member_no);
			adminDAO.adminMemberInfoInsert(user);
			adminDAO.adminMemberDetailInfoInsert(user);
			result = 1;
		}

		if(user.getStatus().equals("update")){
			adminDAO.adminMemberInfoUpdate(user);
			adminDAO.adminMemberDetailInfoUpdate(user);
			result = 2;
		}

		return result;
	}


	@Override
	public void adminMemberDelete(MemberVO user) throws Exception {
			adminDAO.adminMemberDetailDelete(user);
			adminDAO.adminMemberDelete(user);
	}


	@Override
	public void adminMemberRealDelete(MemberVO user) throws Exception {
			adminDAO.adminMemberDetailRealDelete(user);
			adminDAO.adminMemberRealDelete(user);
	}


	@Override
	public void adminMemberUse(MemberVO user) throws Exception {
			adminDAO.adminMemberUse(user);
	}



	@Override
	public Map<String, Object> selectCodeList(AdminVO vo) throws Exception {
		return adminDAO.selectCodeList(vo);
	}


	@Override
	public List<AdminVO> selectCodeDetail(AdminVO vo) throws Exception {
		return adminDAO.selectCodeDetail(vo);
	}

	@Override
	public List<AdminVO> selectCodeInfo(AdminVO vo) throws Exception {
		return adminDAO.selectCodeInfo(vo);
	}


	@Override
	public List<AdminVO> codeCheck(AdminVO vo) throws Exception {
		return adminDAO.codeListCheck(vo);
	}

	@Override
	public int codeListInsert(AdminVO vo) throws Exception {
		commonDAO.updateSeq("CODE_IDX");
		int idx = commonDAO.selectSeq("CODE_IDX");
		vo.setNo(idx);
		return adminDAO.codeListInsert(vo);
	}

	@Override
	public void codeListUpdate(AdminVO vo) throws Exception {
		adminDAO.codeListUpdate(vo);
	}


	@Override
	public int codeDetailUpdate(AdminVO vo) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;

		if(vo.getStatus().equals("insert")){

			commonDAO.updateSeq("CODE_DETAIL_IDX");
			int idx = commonDAO.selectSeq("CODE_DETAIL_IDX");
			vo.setDetail_no(idx);

			adminDAO.codeDetailInsert(vo);
			result = 1;
		}

		if(vo.getStatus().equals("update")){
			adminDAO.codeDetailUpdate(vo);
			result = 1;
		}

		return result;
	}

	@Override
	public void codeListDelete(AdminVO vo) throws Exception {
		if(vo.getDel_detail_no().length > 0){
			Integer[] no = vo.getDel_detail_no();
			for(int i = 0; i < no.length; i++){
				adminDAO.codeDetailDelete(no[i]);
			}
		}
	}

	@Override
	public void codeDeleteAll(int code) throws Exception {
		adminDAO.codeDetailDeleteAll(code);
		adminDAO.codeListDelete(code);
	}


	@Override
	public List<MenuVO> menuManagerList(MenuVO menuvo) throws Exception {
		return adminDAO.menuManagerList(menuvo);
	}


	@Override
	public List<MenuVO> menuManagerDetail(MenuVO menuvo) throws Exception {
		return adminDAO.menuManagerDetail(menuvo);
	}

	@Override
	public MenuVO menuDepthCheck(MenuVO menuvo) throws Exception{
		return adminDAO.menuDepthCheck(menuvo);
	}

	@Override
	public int menuDelCheck(MenuVO menuvo) throws Exception{
		return adminDAO.menuDelCheck(menuvo);
	}


	@Override
	public MenuVO menuCheck(MenuVO vo) throws Exception {
		return adminDAO.menuCheck(vo);
	}


	@Override
	public int menuUpdate(MenuVO vo) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;



		if(vo.getStatus().equals("insert")){

			commonDAO.updateSeq("MENU_IDX");
			int idx = commonDAO.selectSeq("MENU_IDX");
			vo.setNo(idx);
			adminDAO.menuInsert(vo);


			int seqMax = adminDAO.seqMax();
			SeqTableVO stv = new SeqTableVO();
			stv.setNo(seqMax);
			stv.setSeq_code(vo.getMenu_id());
			stv.setSeq_name(vo.getMenu_name());
			adminDAO.seqInsert(stv);

			result = 1;
		}

		if(vo.getStatus().equals("update")){

			SeqTableVO stv = new SeqTableVO();

			stv.setSeq_code(vo.getMenu_id());
			stv.setP_seq_code(vo.getCompare_menu_id());
			stv.setSeq_name(vo.getMenu_name());

			adminDAO.seqUpdate(stv);
			adminDAO.menuUpdate(vo);
			adminDAO.menuChildUpdate(vo);
			adminDAO.menuAuthDetailUpdate(vo);
			result = 1;
		}

		return result;
	}

	@Override
	public void menuDelete(MenuVO vo) throws Exception {
		SeqTableVO stv = new SeqTableVO();
		if(vo.getDel_no().length > 0){
			Integer[] no = vo.getDel_no();
			String[] id = vo.getDel_seq_menu_id();

			for(int i = 0; i < no.length; i++){
				adminDAO.menuDelete(no[i]);
				stv.setSeq_code(id[i]);
				adminDAO.menuAuthDetailDelete(id[i]);
				adminDAO.seqDelete(stv);
			}
		}
	}


	@Override
	public List<AdminVO> authManagerList() throws Exception {
		return adminDAO.authManagerList();
	}


	@Override
	public List<AdminVO> authDetail(AdminVO vo) throws Exception {
		return adminDAO.authDetail(vo);
	}


//	@Override
//	public List<MenuVO> authDetailPop(MenuVO vo) throws Exception {
//		return adminDAO.authDetailPop(vo);
//	}


	@Override
	public Map<String, Object> authDetailPop(MenuVO vo) throws Exception {
		return adminDAO.authDetailPop(vo);
	}


	@Override
	public int authDetailUpdate(MenuVO vo) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;

		if(vo.getStatus().equals("insert")){

			commonDAO.updateSeq("ROLE_GROUP_IDX");
			int idx = commonDAO.selectSeq("ROLE_GROUP_IDX");
			vo.setNo(idx);
			adminDAO.authDetailInsert(vo);

			result = 1;
		}

		if(vo.getStatus().equals("update")){
			adminDAO.authDetailUpdate(vo);
			result = 1;
		}

		return result;
	}

	@Override
	public void authDetailDelete(MenuVO vo) throws Exception {
		if(vo.getDel_detail_no().length > 0){
			Integer[] no = vo.getDel_detail_no();
			for(int i = 0; i < no.length; i++){
				adminDAO.authDetailDelete(no[i]);
			}
		}
	}




}
