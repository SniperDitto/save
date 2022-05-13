package Pkg.Client.Boards;

public class BoardVO {
	
	private String idx;
	private String title;
	private String content;
	private String userID;//세션에 있음
	private String regnum;
	private String lvl;
	private String combine;
	private String visited;//db에서 처리
	private String regdate;//db에서 처리
	private String lMenuID;
	private String ord;
	private String delnum;
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getRegnum() {
		return regnum;
	}
	public void setRegnum(String regnum) {
		this.regnum = regnum;
	}
	public String getLvl() {
		return lvl;
	}
	public void setLvl(String lvl) {
		this.lvl = lvl;
	}
	public String getCombine() {
		return combine;
	}
	public void setCombine(String combine) {
		this.combine = combine;
	}
	public String getVisited() {
		return visited;
	}
	public void setVisited(String visited) {
		this.visited = visited;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getlMenuID() {
		return lMenuID;
	}
	public void setlMenuID(String lMenuID) {
		this.lMenuID = lMenuID;
	}
	public String getOrd() {
		return ord;
	}
	public void setOrd(String ord) {
		this.ord = ord;
	}
	public String getDelnum() {
		return delnum;
	}
	public void setDelnum(String delnum) {
		this.delnum = delnum;
	}
	
	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", title=" + title + ", content=" + content + ", userID=" + userID + ", regnum="
				+ regnum + ", lvl=" + lvl + ", combine=" + combine + ", visited=" + visited + ", regdate=" + regdate
				+ ", lMenuID=" + lMenuID + ", ord=" + ord + ", delnum=" + delnum + "]";
	}
	
	
	
}
