package pkg.Equip;

public class Equipment {
	
	public String eName;
	public int eATK;//장비 공격력
	public int eDEF;//장비 공격력
	public int eLV;//착용제한레벨
	
	public Equipment() {}
	public Equipment(String eName) {
		this.eName = eName;
		this.eATK = 0;
		this.eDEF = 0;
		this.eLV = 0;
	}
	public Equipment(String eName, int eATK, int eDEF, int eLV) {
		this.eName = eName;
		this.eATK = eATK;
		this.eDEF = eDEF;
		this.eLV = eLV;
	}
	
	public void showWeaponInfo() {
		System.out.println("---장비 "+this.eName+" 정보---");
		System.out.println("공격력 : "+this.eATK);
		System.out.println("방어력 : "+this.eDEF);
		System.out.println("제한레벨 : "+this.eLV);
	}
	
	public boolean checkLevel(int level) {
		boolean isOK = true;
		if (level<eLV) {
			isOK = false;
		}
		return isOK;
	}
	
}
