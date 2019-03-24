package bean.login;

import org.springframework.stereotype.Repository;

import bean.dao.AbstractDAO;


@Repository("loginDAO")
public class LoginDAO extends AbstractDAO {

	public CustomUserDetail checkMemberId(String memberid) throws Exception{
    	return (CustomUserDetail) selectOne("login.check_MemberId", memberid);
    }

	public int checkMemberIdCnt(String memberid) throws Exception{
    	return (int) selectOne("login.check_MemberIdCnt", memberid);
    }


}
