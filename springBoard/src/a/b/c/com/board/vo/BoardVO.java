package a.b.c.com.board.vo;

public class BoardVO {
	private String sbnum;
	private String sbsubject;
	private String sbcontent;
	private String sbname;	
	private String sbfile;
	private String sbpw;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	// 페이징 관련 필드
	private String pagesize;
	private String groupsize;
	private String curpage;
	private String totalcount;
	
	public BoardVO() {
		
	}
	
	public BoardVO(String sbnum, String sbsubject, String sbcontent,String sbname, String sbfile, String sbpw, String deleteyn,
			String insertdate, String updatedate) {
		this.sbnum = sbnum;
		this.sbsubject = sbsubject;
		this.sbcontent = sbcontent;
		this.sbfile = sbfile;
		this.sbname = sbname;
		this.sbpw = sbpw;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
	}



	public BoardVO(String sbnum, String sbsubject, String sbcontent, String sbname, String sbfile, String sbpw, String deleteyn,
			String insertdate, String updatedate, String pagesize, String groupsize, String curpage,
			String totalcount) {
		super();
		this.sbnum = sbnum;
		this.sbsubject = sbsubject;
		this.sbcontent = sbcontent;
		this.sbfile = sbfile;		
		this.sbname = sbname;
		this.sbpw = sbpw;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.pagesize = pagesize;
		this.groupsize = groupsize;
		this.curpage = curpage;
		this.totalcount = totalcount;
	}

	public String getSbnum() {
		return sbnum;
	}

	public String getSbsubject() {
		return sbsubject;
	}

	public String getSbcontent() {
		return sbcontent;
	}

	public String getSbname() {
		return sbname;
	}

	public String getSbfile() {
		return sbfile;
	}

	public String getSbpw() {
		return sbpw;
	}

	public String getDeleteyn() {
		return deleteyn;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public String getPagesize() {
		return pagesize;
	}

	public String getGroupsize() {
		return groupsize;
	}

	public String getCurpage() {
		return curpage;
	}

	public String getTotalcount() {
		return totalcount;
	}

	public void setSbnum(String sbnum) {
		this.sbnum = sbnum;
	}

	public void setSbsubject(String sbsubject) {
		this.sbsubject = sbsubject;
	}

	public void setSbcontent(String sbcontent) {
		this.sbcontent = sbcontent;
	}

	public void setSbname(String sbname) {
		this.sbname = sbname;
	}

	public void setSbfile(String sbfile) {
		this.sbfile = sbfile;
	}

	public void setSbpw(String sbpw) {
		this.sbpw = sbpw;
	}

	public void setDeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public void setPagesize(String pagesize) {
		this.pagesize = pagesize;
	}

	public void setGroupsize(String groupsize) {
		this.groupsize = groupsize;
	}

	public void setCurpage(String curpage) {
		this.curpage = curpage;
	}

	public void setTotalcount(String totalcount) {
		this.totalcount = totalcount;
	}


	

	
	
}
