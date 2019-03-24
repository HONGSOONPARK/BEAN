package bean.login;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import bean.admin.AdminDAO;
import bean.common.common.CommonDAO;
import bean.member.MemberVO;



@Service("loginService")
public class LoginServiceImple implements LoginService{

    @Resource(name="commonDAO")
    private CommonDAO commonDAO;

    @Resource(name="loginDAO")
    private LoginDAO loginDAO;

    @Resource(name="adminDAO")
    private AdminDAO adminDAO;


	@Autowired
	BCryptPasswordEncoder passwordEncoder;



  @Override
  public CustomUserDetail checkMemberId(String memberid) throws Exception {
		return loginDAO.checkMemberId(memberid);
  }

  @Override
  public int checkMemberIdCnt(String memberid) throws Exception {
		return loginDAO.checkMemberIdCnt(memberid);

  }

  @Override
  public MemberVO checkKakaoMember(CustomUserDetail cud) throws Exception {
	    // 카카오 로그인 확인하기
		MemberVO member = new MemberVO();

		// 카카오톡 서버에서 받은 사용자 정보 set
		member.setMember_id(cud.getId());
		member.setMember_nick(cud.getNickname());
		member.setMember_name(cud.getNickname());
		member.setDel_yn("N");
		member.setUse_yn("Y");


		MemberVO rt_Member = adminDAO.selMemberNo(member);




		if(loginDAO.checkMemberIdCnt(cud.getId()) > 0){
			// update
			member.setMember_id(rt_Member.getMember_id());
			member.setMember_name(rt_Member.getMember_name());
			member.setMember_no(rt_Member.getMember_no());
			member.setUse_yn(rt_Member.getUse_yn());
			member.setMember_pwd(rt_Member.getMember_pwd());
			member.setMember_role(rt_Member.getMember_role());
			member.setMember_type(rt_Member.getMember_type());
			member.setDel_yn("N");
			member.setUse_yn("Y");

			adminDAO.adminMemberInfoUpdate(member);
			adminDAO.adminMemberDetailInfoUpdate(member);

			member.setStatus("update");
		}else{
			// insert
//			member.setMember_id(cud.getId());
			member.setMember_pwd(passwordEncoder.encode(cud.getId()));
			member.setMember_role("ROLE_USER");
			member.setMember_type("카카오");

			commonDAO.updateSeq("MEMBER_NO");
			int member_no = commonDAO.selectSeq("MEMBER_NO");
			member.setMember_no(member_no);

			adminDAO.adminMemberInfoInsert(member);
			adminDAO.adminMemberDetailInfoInsert(member);

			member.setStatus("insert");
		}




	  	return member;

  }

}
