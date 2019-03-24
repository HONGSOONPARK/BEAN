package bean.brd;

import java.io.Serializable;

public class BrdFileVO implements Serializable{

/**
	 *
	 */
	private static final long serialVersionUID = 8323187657227494729L;
	//	private Integer idx;
	private Integer brdidx=0;
	private String brdid="";

	private String originalfilename="";
	private String storedfilename="";
	private Long filesize=0L;
	private String regdate="";
	private String regid="";
	private String delyn="";

	private Integer fileidx=0;

	private String is_new="";

	private Integer maxidx=0;

	private String fileext="";

	public Integer getBrdidx() {
		return brdidx;
	}

	public void setBrdidx(Integer brdidx) {
		this.brdidx = brdidx;
	}

	public String getBrdid() {
		return brdid;
	}

	public void setBrdid(String brdid) {
		this.brdid = brdid;
	}

	public String getOriginalfilename() {
		return originalfilename;
	}

	public void setOriginalfilename(String originalfilename) {
		this.originalfilename = originalfilename;
	}

	public String getStoredfilename() {
		return storedfilename;
	}

	public void setStoredfilename(String storedfilename) {
		this.storedfilename = storedfilename;
	}

	public Long getFilesize() {
		return filesize;
	}

	public void setFilesize(Long filesize) {
		this.filesize = filesize;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getRegid() {
		return regid;
	}

	public void setRegid(String regid) {
		this.regid = regid;
	}

	public String getDelyn() {
		return delyn;
	}

	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}

	public Integer getFileidx() {
		return fileidx;
	}

	public void setFileidx(Integer fileidx) {
		this.fileidx = fileidx;
	}

	public String getIs_new() {
		return is_new;
	}

	public void setIs_new(String is_new) {
		this.is_new = is_new;
	}

	public Integer getMaxidx() {
		return maxidx;
	}

	public void setMaxidx(Integer maxidx) {
		this.maxidx = maxidx;
	}

	public String getFileext() {
		return fileext;
	}

	public void setFileext(String fileext) {
		this.fileext = fileext;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}











}
