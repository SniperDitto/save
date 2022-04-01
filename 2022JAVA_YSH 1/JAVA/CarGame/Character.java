
public class Character {
	
	public String cName;
	public String cGender;
	public int cExp = 100;
	
	public void getGun(Gun g) {
		g.gunReload();
		String strMsg = "";
		strMsg += this.cName + " 플레이어";
		strMsg += "(성별 : " + this.cGender;
		strMsg += ", 경험치 : " + this.cExp + ")가 ";
		strMsg += g.gName + " 장착";
		strMsg += " (공격력 " + Integer.toString(g.gForce) + ")";
		
		System.out.println(strMsg);
	}
	
	public void gunShot(Gun g) {
		g.gNowAmmo--;
		if(g.chkAmmo(g.gNowAmmo)) {
			String strMsg = "";
					strMsg += g.gName + "의 총알이 " 
					+ Integer.toString(g.gNowAmmo) 
					+ "/"+ Integer.toString(g.gAmmo) 
					+ " 발 남았습니다.";
			System.out.println(strMsg);
		}
		else {
			System.out.println("남은 총알이 없습니다.");
		}
		
	}
	
	public void eat(String foodName, int exp) {
		this.cExp += exp;
		String strMsg = "";
		strMsg += this.cName + " 플레이어가 ";
		strMsg += foodName + "을 먹고 ";
		strMsg += "경험치를 " + Integer.toString(exp) + " 획득했습니다";
		strMsg += "(현재 경험치 : " + this.cExp + ")";
		System.out.println(strMsg);
	}
	
	
}
