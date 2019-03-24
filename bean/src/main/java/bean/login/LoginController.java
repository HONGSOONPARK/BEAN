package bean.login;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.admin.AdminService;
import bean.common.common.Globals;
import bean.member.MemberVO;




@Controller
public class LoginController {

//	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	Logger log = Logger.getLogger(this.getClass());
	/**
	 * Simply selects the home view to render by returning its name.
	 *
	 */

	private static KakaoRestApiHelper apiHelper = new KakaoRestApiHelper();
	private final String KAKAO_REST_API = Globals.KAKAO_REST_API;
	private final String KAKAO_JS_API = Globals.KAKAO_JS_API;
	private final String KAKAO_NATIVE_API = Globals.KAKAO_NATIVE_API;
	private final String KAKAO_ADMIN_API = Globals.KAKAO_ADMIN_API;
	private final String KAKAO_REDIRECT_URL = Globals.KAKAO_REDIRECT_URL;

	@Resource(name="loginService")
	private LoginService loginService;

	@Resource(name="adminService")
	private AdminService adminService;

	@RequestMapping(value = "/login.do")
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response){

		ModelAndView mv =  new ModelAndView("/login/login");

		mv.addObject("kakaoRestApi", KAKAO_REST_API);
		mv.addObject("kakaoJsApi", KAKAO_JS_API);
		mv.addObject("kakaoNativeApi", KAKAO_NATIVE_API);
		mv.addObject("kakaoAdminApi", KAKAO_ADMIN_API);
		mv.addObject("kakaoRdUrl", KAKAO_REDIRECT_URL);


		return mv;
	}

	// 카카오 로그인 하기 위한 임시 윈도우 창
	@RequestMapping(value = "/kakao/kakaoAuthTemp.do")
	public ModelAndView kakaoAuthTemp(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/login/kakaoAuthTemp");
		return mv;
	}

    // 카카오톡 로그인 팝업
	@RequestMapping(value = "/kakao/kakaoAuth.do")
	public ModelAndView kakaoAuth(@RequestParam String code, HttpServletRequest request) throws Exception {
//		ModelAndView mv = new ModelAndView("/login/kakaoPop");

		Map<String, String> map = new HashMap<String, String>();

		map.put("grant_type","authorization_code" );
		map.put("client_id",KAKAO_REST_API );
		map.put("redirect_uri",request.getRequestURL().toString());
		map.put("code",code);

		JSONParser jp = new JSONParser();


		// 토큰 받아오기
		JSONObject tokenObject = (JSONObject)jp.parse(apiHelper.token(map));


		// 받은 토큰 사용하기 위에 변수에 저장
		apiHelper.setAccessToken(tokenObject.get("access_token").toString());

		// 발급받은 admin key
		apiHelper.setAdminKey(KAKAO_ADMIN_API);

		// 세션에 저장(토큰, 카카오톡 사용자 정보)
		HttpSession session = request.getSession();

		session.setAttribute("access_token",tokenObject.get("access_token").toString());

		// 카카오 서버에서 받은 카카오톡 사용자 정보 object로 저장
		JSONObject meRt = (JSONObject)jp.parse(apiHelper.me());

		// properties 값은 json 형태로 오기때문에 따로 뺌
		JSONObject meProperties = (JSONObject) meRt.get("properties");
		CustomUserDetail cud = new CustomUserDetail();
		cud.setId(meRt.get("id").toString());
		cud.setProperties(meProperties);
		cud.setProfile_image(meProperties.get("profile_image").toString());
		cud.setThumbnail_image(meProperties.get("thumbnail_image").toString());
		cud.setNickname(meProperties.get("nickname").toString());

//		MemberVO member = loginService.checkKakaoMember(cud);

		session.setAttribute("kakao_info",cud);

		ModelAndView mv = null;
		if(request.getParameter("state").equals("join")){
			mv = new ModelAndView("forward:/kakao/kakaoJoin.do");
			mv.addObject("kakaoUserId",meRt.get("id").toString());
			mv.addObject("kakaoUserName",meProperties.get("nickname").toString());
		}else if(request.getParameter("state").equals("login")){
			mv = new ModelAndView("forward:/kakao/kakaoLogin.do");

		}
		return mv;
	}


	// kakao 가입하기
	@RequestMapping(value = "/kakao/kakaoJoin.do")
	public ModelAndView kakaoJoin(Map<Object, String> map,  HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/login/kakaoJoin");

		int idCnt = loginService.checkMemberIdCnt(request.getAttribute("kakaoUserId").toString());

		mv.addObject("idCnt", idCnt);
		mv.addObject("kakaoUserId",request.getAttribute("kakaoUserId"));
		mv.addObject("kakaoUserName",request.getAttribute("kakaoUserName"));
//		mv.addObject("cud",request.getAttribute("cud"));

		return mv;
	}

	// kakao 가입 팝업팝업
	@RequestMapping(value = "/kakao/kakaoPopJoin.do")
	@SuppressWarnings("unchecked")
	@ResponseBody
	public JSONObject kakaoPopJoin(HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		CustomUserDetail kakao_info = (CustomUserDetail) session.getAttribute("kakao_info");
		MemberVO membervo = loginService.checkKakaoMember(kakao_info);
		JSONObject jsonRt = new JSONObject();
		jsonRt.put("membervo", membervo);

		return jsonRt;
	}

    // 카카오로 로그인
	@RequestMapping(value = "/kakao/kakaoLogin.do")
	public ModelAndView kakaoLogin(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/login/kakaoLogin");

		HttpSession session = request.getSession();
		CustomUserDetail kakao_info = (CustomUserDetail) session.getAttribute("kakao_info");

		// 카카오 아이디 DB에서 조회, 홈페이지 회원 가입되어있는지 확인 후 분기
		int result = loginService.checkMemberIdCnt(kakao_info.getId());

		MemberVO membervo = null;
		// 회원이 존재함 -> 로그인 프로세스
		if(result > 0){
			membervo = loginService.checkKakaoMember(kakao_info);
			membervo.setMember_id(kakao_info.getId());
			mv.addObject("membervo",membervo);
			mv.addObject("member_yn","Y");
		// 회원이 아니다 -> 가입하라는 안내창
		}else{
			mv.addObject("member_yn","N");
		}

		return mv;
	}

    // 회원가입 팝업창
	@RequestMapping(value = "/join/memberPopJoin.do")
	public ModelAndView memberPopJoin(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/login/homeJoin");
		return mv;
	}

    // 회원가입 팝업창
	@RequestMapping(value = "/join/memberInsert.do")
	@ResponseBody
	public int memberInsert(HttpServletRequest request, @RequestBody MemberVO membervo) throws Exception {

		membervo.setMember_role("ROLE_USER");
		membervo.setMember_nick(membervo.getMember_name());
		membervo.setMember_type("홈페이지");
		membervo.setStatus("insert");

		int result = adminService.adminMemberInfoUpdate(membervo);
		return result;

	}

	// 카카오톡 앱 연결 해제하기 and 탈퇴처리
	@RequestMapping(value = "/kakao/kakaoDrop.do")
	@ResponseBody
	public int kakaoDrop(@RequestBody Map<String, Object> data, HttpServletRequest request) throws Exception{

		CustomUserDetail cud = (CustomUserDetail) request.getAttribute("user");
		HttpSession session = request.getSession();

		MemberVO membervo = new MemberVO();
		membervo.setMember_no(cud.getMember_no());
		if(data.get("type").equals("카카오")){
			String token = session.getAttribute("access_token").toString();
			apiHelper.setAccessToken(token);
			apiHelper.setAdminKey(KAKAO_ADMIN_API);
			apiHelper.unlink(); 		// unlink 성공
		}
			// 실제로 삭제하는 부분
			// 회원가입시 아이디 중복체크를 안해서 걍 삭제함
			// 원래는 DEL_YN = 'Y' 로 바꿈
			adminService.adminMemberRealDelete(membervo);


		// table에서 delete member_id 하기
		int result = 1;

		return result;
	}



    // 유저 정보 팝업
	@RequestMapping(value = "/main/userInfoPop.do")
	public ModelAndView userInfoPop(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("/login/userInfoPop");

		String token = null;
		if(request.getParameter("type").toString() == "카카오"){
			HttpSession session = request.getSession();
			 token = session.getAttribute("access_token").toString();
		}

		mv.addObject("kakaoJsApi", KAKAO_JS_API);
		mv.addObject("token", token);
		return mv;
	}

}


