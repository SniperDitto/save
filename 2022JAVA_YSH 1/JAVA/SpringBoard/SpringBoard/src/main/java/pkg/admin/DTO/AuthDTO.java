package pkg.admin.DTO;

public class AuthDTO {
	//DTO : getter+setter, VO : getter
	public String authID;
	public String authName;
	private String gbn;
	public String getAuthID() {
		return authID;
	}
	public void setAuthID(String authID) {
		this.authID = authID;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}
	public String getGbn() {
		return gbn;
	}
	public void setGbn(String gbn) {
		this.gbn = gbn;
	}
	
	
}
