package bean.login;

import bean.member.MemberVO;

public interface LoginService {

	 public CustomUserDetail checkMemberId(String memberid) throws Exception;

	 public int checkMemberIdCnt(String memberid) throws Exception;

	 public MemberVO checkKakaoMember(CustomUserDetail cud) throws Exception;



}
