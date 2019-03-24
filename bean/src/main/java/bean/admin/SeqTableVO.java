package bean.admin;

import java.io.Serializable;

public class SeqTableVO implements Serializable{


	/**
	 *
	 */
	private static final long serialVersionUID = -6442068311266762143L;



	private Integer no = 0;
	private Integer seq_no = 0;
	private String seq_code = "";
	private String seq_name = "";
	private String etc = "";
	private String reg_date = "";


	private String p_seq_code = "";


	public Integer getNo() {
		return no;
	}
	public void setNo(Integer no) {
		this.no = no;
	}
	public Integer getSeq_no() {
		return seq_no;
	}
	public void setSeq_no(Integer seq_no) {
		this.seq_no = seq_no;
	}
	public String getSeq_code() {
		return seq_code;
	}
	public void setSeq_code(String seq_code) {
		this.seq_code = seq_code;
	}
	public String getSeq_name() {
		return seq_name;
	}
	public void setSeq_name(String seq_name) {
		this.seq_name = seq_name;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getP_seq_code() {
		return p_seq_code;
	}
	public void setP_seq_code(String p_seq_code) {
		this.p_seq_code = p_seq_code;
	}


}