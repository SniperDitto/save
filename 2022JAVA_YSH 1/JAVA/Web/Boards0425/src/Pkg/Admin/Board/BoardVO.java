package Pkg.Admin.Board;

public class BoardVO {
	

	private String idx;
	private String title;
	private String userID;
	private String content;
	private String regdate;
	private String[] idxs;
	private String[] titles;
	private String[] gbns;
	
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String[] getIdxs() {
		return idxs;
	}
	public void setIdxs(String[] idxs) {
		this.idxs = idxs;
	}
	public String[] getTitles() {
		return titles;
	}
	public void setTitles(String[] titles) {
		this.titles = titles;
	}
	public String[] getGbns() {
		return gbns;
	}
	public void setGbns(String[] gbns) {
		this.gbns = gbns;
	}
	
	
}
