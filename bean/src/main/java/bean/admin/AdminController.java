package bean.admin;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import bean.login.CustomUserDetail;
import bean.login.LoginService;
import bean.member.MemberVO;
import bean.menu.MenuService;
import bean.menu.MenuVO;

@Controller
public class AdminController {

//	private static final Logger logger = LoggerFactory.getLogger(MainController.class);

	Logger log = Logger.getLogger(this.getClass());
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@Resource(name="menuService")
	private MenuService menuService;

	@Resource(name="loginService")
	private LoginService loginService;

	@Resource(name="adminService")
	private AdminService adminService;



	// 관리자 페이지 메인 접근
	@RequestMapping(value = "/admin/adminMain.do")
	public ModelAndView adminMain(HttpServletRequest request) throws Exception {
	    ModelAndView mv = new ModelAndView("/admin/adminMain");

	    CustomUserDetail user = (CustomUserDetail) request.getAttribute("user");
		MenuVO vo = new MenuVO();
		vo.setRole_char(user.getMember_role().toString());
		vo.setAdmin_yn("Y");
	    List<MenuVO> menuvo = menuService.roleMenuAdmin(vo);

	    mv.addObject("admin_menuvo",menuvo);

		return mv;
	}


	// 사용자 정보 리스트 화면
	@RequestMapping(value = "/admin/member/memberInfo.do")
	public ModelAndView memberInfo(HttpServletRequest request) throws Exception {
	    ModelAndView mv = new ModelAndView("/admin/member/memberInfo");

	    CustomUserDetail user = new CustomUserDetail();

	    List<CustomUserDetail> userlist = adminService.adminMemberList(user);

	    mv.addObject("userlist",userlist);

		return mv;
	}

	// 사용자 정보 상세 화면
	@RequestMapping(value = "/admin/member/memberInfoDetails.do", method = RequestMethod.POST )
	@ResponseBody
	public Map<String, Object> memberInfoDetails(HttpServletRequest request, @RequestBody MemberVO membervo) throws Exception {
//	    ModelAndView mv = new ModelAndView("/admin/member/memberInfo");
		Map<String, Object> map = new HashMap<String, Object>();
	    MemberVO user = adminService.adminMemberInfoDetails(membervo);
	    map.put("membervo", user);

	    return map;
	}

//	 사용자 정보 추가 및 변경
//	@RequestMapping(value = "/admin/member/memberInfoUpdate.do", method = RequestMethod.POST)
//	@ResponseBody
//	public int memberInfoUpdate(@RequestBody MemberVO membervo) throws Exception {
//
//		int result = adminService.adminMemberInfoUpdate(membervo);
//		return result;
//	}

	// 사용자 정보 업데이트
	@RequestMapping(value = "/admin/member/memberInfoUpdate.do", method = RequestMethod.POST)
	public ModelAndView memberInfoUpdate(MemberVO membervo) throws Exception {
		int result = adminService.adminMemberInfoUpdate(membervo);
		ModelAndView mv = new ModelAndView("redirect:/admin/member/memberInfo.do");

		mv.addObject("result", result);
		return mv;
	}


    // 사용자 아이디 중복 체크
	@RequestMapping(value = "/admin/member/memberIdCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int memberIdCtn(@RequestBody String member_id) throws Exception {

		int result = loginService.checkMemberIdCnt(member_id);
		return result;
	}

	// 사용자 정보 삭제
	@RequestMapping(value = "/admin/member/memberDelete.do", method = RequestMethod.POST)
	public ModelAndView memberDelete(MemberVO membervo) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/member/memberInfo.do");

		adminService.adminMemberDelete(membervo);

		return mv;
	}

    // 코드 관리 화면 메인
	@RequestMapping(value = "/admin/codeManager.do")
	public ModelAndView codeManager(AdminVO adminvo) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/management/codeManager");

	    Map<String, Object> resultMap = adminService.selectCodeList(adminvo);

        mv.addObject("paginationInfo", resultMap.get("paginationInfo"));
        mv.addObject("list", resultMap.get("result"));
        mv.addObject("total_count", resultMap.get("total_count"));

		return mv;
	}


//	@RequestMapping(value = "/admin/codeDetail.do")
//	@ResponseBody
//	public List<AdminVO> codeDetail(@RequestBody AdminVO adminvo) throws Exception {
//		List<AdminVO> list = adminService.selectCodeDetail(adminvo);
//		return list;
//	}

    // 코드 정보 상세보기
	@RequestMapping(value = "/admin/codeDetail.do")
	@ResponseBody
	public Map<String, Object> codeDetail(@RequestBody AdminVO adminvo) throws Exception {

		List<AdminVO> list = adminService.selectCodeDetail(adminvo);
		List<AdminVO> info = adminService.selectCodeInfo(adminvo);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("list", list);
		map.put("info",info);


		return map;
	}



	// 코드 등록시 중복값 체크
	@RequestMapping(value = "/admin/codeCheck.do")
	@ResponseBody
	public List<AdminVO> codeInfoCheck(@RequestBody List<AdminVO> adminvo) throws Exception {
		List<AdminVO> result = null;
		AdminVO checkResult = new AdminVO();
		for(int i=0; i < adminvo.size(); i++){

			 result = adminService.codeCheck(adminvo.get(i));   // 코드 테이블에서 조회 후 count 반환
			 if(result.get(0).getCode_check() > 0 ){		// count > 0 이면 break
				 checkResult.setCode_check(result.get(0).getCode_check());   // 반환할 값 set
				 checkResult.setCode_name(adminvo.get(i).getCode_name());
				 checkResult.setCode(adminvo.get(i).getCode());
				 result.set(0, checkResult);
				break;
			}
		}
		return result;
	}

    // 코드 리스트 추가
	@RequestMapping(value = "/admin/codeListInsert.do")
	@ResponseBody
	public int codeListInsert(HttpServletRequest request, @RequestBody List<AdminVO> adminvo) throws Exception {

		int result = 0;

	    CustomUserDetail user = (CustomUserDetail) request.getAttribute("user");

		for(int i =0; i < adminvo.size(); i++){
			adminvo.get(i).setReg_id(user.getMember_id());
			adminvo.get(i).setMod_id(user.getMember_id());
			result = adminService.codeListInsert(adminvo.get(i));
		}
		return result;
	}


    // 코드 상세 정보 업데이트 및 삭제
	@RequestMapping(value = "/admin/codeDetailUpdate.do")
	@ResponseBody
	public int codeDetailUpdate(HttpServletRequest request, @RequestBody List<AdminVO> adminvo) throws Exception {

		int result = 0;

	    CustomUserDetail user = (CustomUserDetail) request.getAttribute("user");

		for(int i =0; i < adminvo.size(); i++){

			adminvo.get(i).setReg_id(user.getMember_id());
			adminvo.get(i).setMod_id(user.getMember_id());

			if(i==0){
				adminService.codeListUpdate(adminvo.get(i));
				adminService.codeListDelete(adminvo.get(i));
				result = 1;
			}


			result = adminService.codeDetailUpdate(adminvo.get(i));

		}

		return result;
	}


    // 코드 상세 정보 업데이트 및 삭제
	@RequestMapping(value = "/admin/codeDeleteAll.do")
	public ModelAndView codeDeleteAll(HttpServletRequest request, int code) throws Exception {

		ModelAndView mv = new ModelAndView("redirect:/admin/codeManager.do");
		adminService.codeDeleteAll(code);

		return mv;
	}


//	@RequestMapping(value = "/admin/codeInfo.do", method = RequestMethod.POST)
//	@ResponseBody
//	public Map<String, Object> searchPost(@RequestBody AdminVO vo) throws Exception {
//		Map<String, Object> map = adminService.selectCodeList(vo);
//		return map;
//	}



    // 관리자 -> 메뉴관리 리스트
	@RequestMapping(value = "/admin/menuList.do")
	public ModelAndView menuList(HttpServletRequest request) throws Exception {

		ModelAndView mv = new ModelAndView("/admin/menu/menuManager");

		MenuVO vo = new MenuVO();
		String redirect_menu = request.getParameter("rd");
		String redirect_menu_name = request.getParameter("rdnm");
		List<MenuVO> menuvo = adminService.menuManagerList(vo);

		mv.addObject("rdmenu",redirect_menu);
		mv.addObject("rdmenunm",redirect_menu_name);
		mv.addObject("menuvo", menuvo);


		return mv;
	}



    // 관리자 -> 메뉴관리 -> 리스트 클릭시 상세
	@RequestMapping(value = "/admin/menuDetail.do")
	@ResponseBody
	public Map<String, Object> menuDetail(HttpServletRequest request, @RequestBody MenuVO vo) throws Exception {

		Map<String, Object> map = new HashMap<>();

		List<MenuVO> menuvo = adminService.menuManagerDetail(vo);
		map.put("list", menuvo);

		return map;
	}


	// 메뉴 코드 있는지 확인
	@RequestMapping(value = "/admin/menuDepthCheck.do")
	@ResponseBody
	public MenuVO menuDepthCheck(@RequestBody MenuVO menuvo) throws Exception {
//		int result = 0;

		MenuVO result = adminService.menuDepthCheck(menuvo);

		return result;
	}


	// 메뉴 삭제전 하위 메뉴 있는지 확인
	@RequestMapping(value = "/admin/menuDelCheck.do")
	@ResponseBody
	public int menuDelCheck(@RequestBody MenuVO menuvo) throws Exception {
		int result  = adminService.menuDelCheck(menuvo);
		return result;
	}


	// 메뉴 등록시 중복값 체크
	@RequestMapping(value = "/admin/menuCheck.do")
	@ResponseBody
//	public List<MenuVO> menuCheck(@RequestBody List<MenuVO> menuvo) throws Exception {
	public MenuVO menuCheck(@RequestBody List<MenuVO> menuvo) throws Exception {

		MenuVO result = null;
		MenuVO checkResult = new MenuVO();
//		for(int i=0; i < menuvo.size(); i++){
//
//			if(menuvo.get(i).getDepth_2() != menuvo.get(i).getCompare_depth_2())
//			 result = adminService.menuCheck(menuvo.get(i));   // 코드 테이블에서 조회 후 count 반환
//			 if(result.get(0).getCount() > 0 ){		// count > 0 이면 break
//				 checkResult.setCount(result.get(0).getCount());   // 반환할 값 set
//				 checkResult.setDepth_2(menuvo.get(i).getDepth_2());
//				 result.set(0, checkResult);
//				break;
//			}
//		}


		for(int i=0; i < menuvo.size(); i++){

			// 업데이트 and 기존 데이터 변경시 중복체크
			// 데이트 추가 중복체크
			if((menuvo.get(i).getStatus().equals("update") && !menuvo.get(i).getDepth_2().equals(menuvo.get(i).getCompare_depth_2())) || (menuvo.get(i).getStatus().equals("insert"))){
				result = adminService.menuCheck(menuvo.get(i));   // 코드 테이블에서 조회 후 count 반환
				if(result.getCount() > 0){
					checkResult.setCount(result.getCount());   // 반환할 값 set
					checkResult.setDepth_2(menuvo.get(i).getDepth_2());
					break;
				}
			}
		}


		return checkResult;
	}


    // 메뉴 상세 정보 업데이트 및 삭제
	@RequestMapping(value = "/admin/menuUpdate.do")
	@ResponseBody
	public int menuUpdate(HttpServletRequest request, @RequestBody List<MenuVO> menuvo) throws Exception {

		int result = 0;

	    CustomUserDetail user = (CustomUserDetail) request.getAttribute("user");

		for(int i =0; i < menuvo.size(); i++){
			menuvo.get(i).setReg_id(user.getMember_id());
			menuvo.get(i).setMod_id(user.getMember_id());
			result = adminService.menuUpdate(menuvo.get(i));
		}

		return result;
	}


    // 메뉴 상세 정보 업데이트 및 삭제
	@RequestMapping(value = "/admin/menuDelete.do")
	@ResponseBody
	public int menuDelete(HttpServletRequest request, @RequestBody List<MenuVO> menuvo) throws Exception {

		int result = 0;

		adminService.menuDelete(menuvo.get(0));

		return result;
	}



    // 권한 관리 화면 메인, 리스트
	@RequestMapping(value = "/admin/authMenuManager.do")
	public ModelAndView authManager(AdminVO adminvo) throws Exception {
		ModelAndView mv = new ModelAndView("/admin/auth/authManager");

	    List<AdminVO> list = adminService.authManagerList();

	    mv.addObject("list", list);

		return mv;
	}


    // 권한 관리 화면 권한별 상세 화면
	@RequestMapping(value = "/admin/authMenuDetail.do")
	@ResponseBody
	public Map<String, Object> authDetail(@RequestBody AdminVO adminvo) throws Exception {


		Map<String, Object> map = new HashMap<String, Object>();

	    List<AdminVO> list = adminService.authDetail(adminvo);

	    map.put("list", list);

		return map;
	}


    // 권한 관리 화면 권한별 상세 화면 팝업(메뉴추가)
	@RequestMapping(value = "/admin/authDetailPop.do")
	public ModelAndView authDetailPop(MenuVO menuvo, HttpServletRequest request) throws Exception {


		ModelAndView mv = new ModelAndView("/admin/auth/authManagerPop");
		menuvo.setRole_char(request.getParameter("role_char"));

	    Map<String, Object> resultMap = adminService.authDetailPop(menuvo);

        mv.addObject("paginationInfo", resultMap.get("paginationInfo"));
        mv.addObject("list", resultMap.get("result"));
        mv.addObject("no_arry", request.getParameter("no_arry"));
        mv.addObject("total_count", resultMap.get("total_count"));


		return mv;
	}



    // 코드 상세 정보 업데이트 및 삭제
	@RequestMapping(value = "/admin/authDetailUpdate.do")
	@ResponseBody
	public int authDetailUpdate(HttpServletRequest request, @RequestBody List<MenuVO> menuvo) throws Exception {

		int result = 0;

	    CustomUserDetail user = (CustomUserDetail) request.getAttribute("user");

		for(int i =0; i < menuvo.size(); i++){

			menuvo.get(i).setReg_id(user.getMember_id());

			if(i==0){
				adminService.authDetailDelete(menuvo.get(i));
				result = 1;
			}


			result = adminService.authDetailUpdate(menuvo.get(i));

		}

		return result;
	}


}



