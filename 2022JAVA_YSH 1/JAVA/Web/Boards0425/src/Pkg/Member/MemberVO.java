package Pkg.Member;

public class MemberVO {
	private String userID;
	private String userPass;
	private String userName;
	private String userGen;
	private String[] userHobby;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPW) {
		this.userPass = userPW;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserGen() {
		return userGen;
	}
	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}
	public String[] getUserHobby() {
		return userHobby;
	}
	public void setUserHobby(String[] userHobby) {
		this.userHobby = userHobby;
	}
	
	
	
}
