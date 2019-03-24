package bean.member;

import java.io.Serializable;

public class MemberVO implements Serializable {

	private static final long serialVersionUID = -5634620436147793548L;

	private Integer member_no = 0;
	private String member_id="";
	private String member_pwd="";
	private String member_pwd_cur="";

	private String member_role="";
	private String member_role_name="";
	private String member_nick="";
	private String member_name="";

	private String member_tel="";
	private String member_phone="";
	private String member_email="";
	private String member_addr="";
	private String member_addr_2="";
	private String member_eng_name="";

	private String member_type="";

	private String cre_date;
	private String mod_date;
	private String use_yn = "";

	private String del_yn = "";

	private String status = "";



	public String getMember_role_name() {
		return member_role_name;
	}
	public void setMember_role_name(String member_role_name) {
		this.member_role_name = member_role_name;
	}


	public String getMember_type() {
		return member_type;
	}
	public void setMember_type(String member_type) {
		this.member_type = member_type;
	}
	public String getDel_yn() {
		return del_yn;
	}
	public void setDel_yn(String del_yn) {
		this.del_yn = del_yn;
	}
	public String getMember_pwd_cur() {
		return member_pwd_cur;
	}
	public void setMember_pwd_cur(String member_pwd_cur) {
		this.member_pwd_cur = member_pwd_cur;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getCre_date() {
		return cre_date;
	}
	public void setCre_date(String cre_date) {
		this.cre_date = cre_date;
	}
	public String getMod_date() {
		return mod_date;
	}
	public void setMod_date(String mod_date) {
		this.mod_date = mod_date;
	}
	public String getUse_yn() {
		return use_yn;
	}
	public void setUse_yn(String use_yn) {
		this.use_yn = use_yn;
	}
	public Integer getMember_no() {
		return member_no;
	}
	public void setMember_no(Integer member_no) {
		this.member_no = member_no;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pwd() {
		return member_pwd;
	}
	public void setMember_pwd(String member_pwd) {
		this.member_pwd = member_pwd;
	}
	public String getMember_role() {
		return member_role;
	}
	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}
	public String getMember_nick() {
		return member_nick;
	}
	public void setMember_nick(String member_nick) {
		this.member_nick = member_nick;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_phone() {
		return member_phone;
	}
	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_addr() {
		return member_addr;
	}
	public void setMember_addr(String member_addr) {
		this.member_addr = member_addr;
	}
	public String getMember_addr_2() {
		return member_addr_2;
	}
	public void setMember_addr_2(String member_addr_2) {
		this.member_addr_2 = member_addr_2;
	}
	public String getMember_eng_name() {
		return member_eng_name;
	}
	public void setMember_eng_name(String member_eng_name) {
		this.member_eng_name = member_eng_name;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}







}
