package bean.member;

import org.springframework.stereotype.Repository;

import bean.dao.AbstractDAO;



@Repository("memberDAO")
public class MemberDAO extends AbstractDAO {

  public int memberInsert(MemberVO membervo) throws Exception{
        return (Integer)insert("member.memberInsert", membervo);
  }





}
