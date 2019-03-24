package bean.brd;

import java.io.Serializable;


public class BrdVO implements Serializable {


	/**
	 *
	 */
	private static final long serialVersionUID = -3983739258634945356L;
	/**
	 *
	 */

	private Integer rnum = 0;
	private Integer idx = 0;
	private Integer brdidx = 0;

	private String brdid = "";
	private String title= "";
	private String subject= "";
	private String contents= "";
	private Integer hitcnt= 0;
	private String delyn= "";
	private String regdate= "";
	private String moddate= "";
	private String regid= "";
	private String modid= "";
	private String regname= "";

	private Integer start= 0;
	private Integer end= 0;
	private Integer currentPageNo= 0;
	private Integer pagerow= 0;
	private Integer totalcount= 0;
	private Integer paginationInfo= 0;

	private Integer filecount = 0;



	public Integer getFilecount() {
		return filecount;
	}
	public void setFilecount(Integer filecount) {
		this.filecount = filecount;
	}
	public Integer getRnum() {
		return rnum;
	}
	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}
	public Integer getIdx() {
		return idx;
	}
	public void setIdx(Integer idx) {
		this.idx = idx;
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getHitcnt() {
		return hitcnt;
	}
	public void setHitcnt(Integer hitcnt) {
		this.hitcnt = hitcnt;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getModdate() {
		return moddate;
	}
	public void setModdate(String moddate) {
		this.moddate = moddate;
	}
	public String getRegid() {
		return regid;
	}
	public void setRegid(String regid) {
		this.regid = regid;
	}
	public String getModid() {
		return modid;
	}
	public void setModid(String modid) {
		this.modid = modid;
	}
	public String getRegname() {
		return regname;
	}
	public void setRegname(String regname) {
		this.regname = regname;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public Integer getEnd() {
		return end;
	}
	public void setEnd(Integer end) {
		this.end = end;
	}
	public Integer getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(Integer currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	public Integer getPagerow() {
		return pagerow;
	}
	public void setPagerow(Integer pagerow) {
		this.pagerow = pagerow;
	}
	public Integer getTotalcount() {
		return totalcount;
	}
	public void setTotalcount(Integer totalcount) {
		this.totalcount = totalcount;
	}
	public Integer getPaginationInfo() {
		return paginationInfo;
	}
	public void setPaginationInfo(Integer paginationInfo) {
		this.paginationInfo = paginationInfo;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}





}

