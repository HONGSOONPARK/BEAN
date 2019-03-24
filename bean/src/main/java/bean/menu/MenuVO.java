package bean.menu;

import java.io.Serializable;

import bean.common.common.PagingVO;

public class MenuVO extends PagingVO   implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 6764114919321583039L;


	private Integer no;
	private String role_char;
	private Integer depth_1;
	private Integer depth_2;
	private Integer depth_3;
	private Integer compare_depth_2;
	private String compare_menu_id;
	private String etc1;
	private String etc2;
	private String menu_id;
	private String menu_name;
	private String menu_url;
	private String use_yn;
	private String admin_yn;
	private Integer sort;
	private Integer leaf;
	private String pmenu_name;
	private Integer[] del_no;
	private String[] del_seq_menu_id;

	private Integer count;
	private String status;


	private String reg_id = "";
	private String reg_date = "";
	private String mod_id = "";
	private String mod_date = "";


	// menu grant 필요
	private String login_id;

	private Integer menu_no;
	private String read_grant;
	private String write_grant;
	private String delete_grant;
	private String etc;
	private Integer[] del_detail_no;



	public Integer[] getDel_detail_no() {
		return del_detail_no;
	}

	public void setDel_detail_no(Integer[] del_detail_no) {
		this.del_detail_no = del_detail_no;
	}

	public Integer getNo() {
		return no;
	}



	public Integer getMenu_no() {
		return menu_no;
	}

	public void setMenu_no(Integer menu_no) {
		this.menu_no = menu_no;
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

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getRole_char() {
		return role_char;
	}

	public void setRole_char(String role_char) {
		this.role_char = role_char;
	}

	public Integer getDepth_1() {
		return depth_1;
	}

	public void setDepth_1(Integer depth_1) {
		this.depth_1 = depth_1;
	}

	public Integer getDepth_2() {
		return depth_2;
	}

	public void setDepth_2(Integer depth_2) {
		this.depth_2 = depth_2;
	}

	public Integer getDepth_3() {
		return depth_3;
	}

	public void setDepth_3(Integer depth_3) {
		this.depth_3 = depth_3;
	}

	public Integer getCompare_depth_2() {
		return compare_depth_2;
	}

	public void setCompare_depth_2(Integer compare_depth_2) {
		this.compare_depth_2 = compare_depth_2;
	}

	public String getEtc1() {
		return etc1;
	}

	public void setEtc1(String etc1) {
		this.etc1 = etc1;
	}

	public String getEtc2() {
		return etc2;
	}

	public void setEtc2(String etc2) {
		this.etc2 = etc2;
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

	public String getMenu_url() {
		return menu_url;
	}

	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}

	public String getUse_yn() {
		return use_yn;
	}

	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}

	public String getAdmin_yn() {
		return admin_yn;
	}

	public void setAdmin_yn(String admin_yn) {
		this.admin_yn = admin_yn;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Integer getLeaf() {
		return leaf;
	}

	public void setLeaf(Integer leaf) {
		this.leaf = leaf;
	}

	public String getPmenu_name() {
		return pmenu_name;
	}

	public void setPmenu_name(String pmenu_name) {
		this.pmenu_name = pmenu_name;
	}

	public Integer[] getDel_no() {
		return del_no;
	}

	public void setDel_no(Integer[] del_no) {
		this.del_no = del_no;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
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

	public String getLogin_id() {
		return login_id;
	}

	public void setLogin_id(String login_id) {
		this.login_id = login_id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public String getCompare_menu_id() {
		return compare_menu_id;
	}

	public void setCompare_menu_id(String compare_menu_id) {
		this.compare_menu_id = compare_menu_id;
	}

	public String[] getDel_seq_menu_id() {
		return del_seq_menu_id;
	}

	public void setDel_seq_menu_id(String[] del_seq_menu_id) {
		this.del_seq_menu_id = del_seq_menu_id;
	}

















}
