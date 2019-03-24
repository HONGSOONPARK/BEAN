package bean.common.common;

import java.io.Serializable;

public class PagingVO implements Serializable{



	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	private Integer page;
	private Integer rnum;

	private Integer start= 0;
	private Integer end= 0;
	private Integer currentPageNo= 0;
	private Integer pagerow= 0;
	private Integer totalcount= 0;
	private Integer paginationInfo= 0;
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getRnum() {
		return rnum;
	}
	public void setRnum(Integer rnum) {
		this.rnum = rnum;
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

