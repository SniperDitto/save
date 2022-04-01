
public class Gun {
	
	public String gName;
	public int gForce;
	public int gAmmo;//장전가능한 총알 수
	public int gNowAmmo;//남은총알수
	
	public boolean chkAmmo(int a) {
		boolean isOk = true;
		if (a<=0) {
			isOk = false;
		}
		return isOk;
	}
	public void gunReload() {
		this.gNowAmmo = this.gAmmo;
	}
}
