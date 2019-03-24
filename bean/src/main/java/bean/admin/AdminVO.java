package bean.admin;

import bean.common.common.PagingVO;

public class AdminVO extends PagingVO{

	private static final long serialVersionUID = 5818094040440135894L;


	// COMMON_CODE, COMMON_CODE_DETAIL
	private Integer no = 0;
	private Integer detail_no = 0;
	private Integer code = 0;
	private String code_name = "";
	private String var_code = "";
	private String var_name = "";
	private String use_yn = "";
	private String ref_1 = "";
	private String ref_2 = "";
	private String ref_3 = "";
	private String reg_id = "";
	private String reg_date = "";
	private String mod_id = "";
	private String mod_date = "";
	private Integer code_order = 0;

	private String status = "";
	private Integer rnum = 0;
	private Integer code_check = 0;

	private Integer[] del_detail_no;




	// ROLE_GROUP
//	private Integer no = 0;
	private String role_char;
	private String role_name;
	private Integer menu_no;
	private String menu_id;
	private String menu_name;
	private String read_grant;
	private String write_grant;
	private String delete_grant;
	private String etc;
//	private String reg_id = "";
//	private String reg_date = "";

	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getDetail_no() {
		return detail_no;
	}
	public void setDetail_no(Integer detail_no) {
		this.detail_no = detail_no;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getCode_name() {
		return code_name;
	}
	public void setCode_name(String code_name) {
		this.code_name = code_name;
	}
	public String getVar_code() {
		return var_code;
	}
	public void setVar_code(String var_code) {
		this.var_code = var_code;
	}
	public String getVar_name() {
		return var_name;
	}
	public void setVar_name(String var_name) {
		this.var_name = var_name;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public String getRef_1() {
		return ref_1;
	}
	public void setRef_1(String ref_1) {
		this.ref_1 = ref_1;
	}
	public String getRef_2() {
		return ref_2;
	}
	public void setRef_2(String ref_2) {
		this.ref_2 = ref_2;
	}
	public String getRef_3() {
		return ref_3;
	}
	public void setRef_3(String ref_3) {
		this.ref_3 = ref_3;
	}
	public String getReg_id() {
		return reg_id;
	}
	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getMod_id() {
		return mod_id;
	}
	public void setMod_id(String mod_id) {
		this.mod_id = mod_id;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	public Integer getCode_order() {
		return code_order;
	}
	public void setCode_order(Integer code_order) {
		this.code_order = code_order;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public Integer getRnum() {
		return rnum;
	}
	@Override
	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}
	public Integer getCode_check() {
		return code_check;
	}
	public void setCode_check(Integer code_check) {
		this.code_check = code_check;
	}
	public Integer[] getDel_detail_no() {
		return del_detail_no;
	}
	public void setDel_detail_no(Integer[] del_detail_no) {
		this.del_detail_no = del_detail_no;
	}
	public String getRole_char() {
		return role_char;
	}
	public void setRole_char(String role_char) {
		this.role_char = role_char;
	}
	public String getRole_name() {
		return role_name;
	}
	public void setRole_name(String role_name) {
		this.role_name = role_name;
	}
	public Integer getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(Integer menu_no) {
		this.menu_no = menu_no;
	}
	public String getMenu_id() {
		return menu_id;
	}
	public void setMenu_id(String menu_id) {
		this.menu_id = menu_id;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getRead_grant() {
		return read_grant;
	}
	public void setRead_grant(String read_grant) {
		this.read_grant = read_grant;
	}
	public String getWrite_grant() {
		return write_grant;
	}
	public void setWrite_grant(String write_grant) {
		this.write_grant = write_grant;
	}
	public String getDelete_grant() {
		return delete_grant;
	}
	public void setDelete_grant(String delete_grant) {
		this.delete_grant = delete_grant;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}







}



