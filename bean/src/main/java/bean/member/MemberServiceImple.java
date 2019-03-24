package bean.member;


import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

@Service("memberService")
public class MemberServiceImple implements MemberService{

    Logger log = Logger.getLogger(this.getClass());

    @Resource(name="memberDAO")
    private MemberDAO memberDAO;


    @Override
	public int memberInsert(MemberVO membervo) throws Exception {
        return memberDAO.memberInsert(membervo);

    }





}
