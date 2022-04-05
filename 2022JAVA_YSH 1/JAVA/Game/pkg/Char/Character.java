package pkg.Char;

import java.util.Objects;

import pkg.Equip.Armor;
import pkg.Equip.Equipment;
import pkg.Equip.Weapon;

public class Character {
	
	public String cName;
	public int cLV;
	public int cEXP;
	public int cHP;
	public int cMP;
	public int cATK;
	public int cDEF;
	public Armor armor;
	public Weapon weapon;
	
	public Character() {}
	public Character(String cName) {
		this.cName = cName;
		this.cLV = 1;
		this.cHP = 100;
		this.cMP = 50;
		this.cEXP = 0;
		this.cATK = 10;
		this.cDEF = 10;
	}
	public Character(String cName, int cLV, int cEXP,
					int cHP, int cMP, int cATK, int cDEF) {
		this.cName = cName;
		this.cLV = cLV;
		this.cEXP = cEXP;
		this.cHP = cHP;
		this.cMP = cMP;
		this.cATK = cATK;
		this.cDEF = cDEF;
	}
	
	public void showCharInfo() {
		System.out.println("---------------");
		System.out.println("이름 : "+this.cName);
		System.out.println("레벨 : "+this.cLV);
		System.out.println("경험치 : "+this.cEXP);
		System.out.println("HP : "+this.cHP);
		System.out.println("MP : "+this.cMP);
		System.out.println("공격력 : "+this.cATK);
		System.out.println("방어력 : "+this.cDEF);
		System.out.println("---------------");
	}
	
	public void exchangeToLV() {
		//경험치 100당 1레벨로 환산해 레벨 상승
		System.out.println("레벨 환산 전 : "+this.cLV+" / "+this.cEXP);
		this.cLV += this.cEXP / 100;//몫 : 레벨
		this.cEXP = this.cEXP % 100;//나머지 : 경험치
		System.out.println("레벨 환산 후 : "+this.cLV+" / "+this.cEXP);
	}
	
	public void wearEquipment(Equipment e) {
		if(e.checkLevel(this.cLV)) {
			if(e instanceof Armor) {
				this.armor = (Armor) e;
				this.cATK += e.eATK;
				this.cDEF += e.eDEF;
			}
			else if(e instanceof Weapon) {
				this.weapon = (Weapon) e;
				this.cATK += e.eATK;
				this.cDEF += e.eDEF;
			}
			else {
				this.cATK += e.eATK;
				this.cDEF += e.eDEF;
			}
		}
		else {
			System.out.println("레벨이 낮아 장착할 수 없습니다.");
		}
	}
	
	public void takeOffEquipment(String part) {
		if(part.equals("armor")) {
			this.cATK -= armor.eATK;
			this.cDEF -= armor.eDEF;
			this.armor = null;
		}
		else if(part.equals("weapon")) {
			this.cATK -= weapon.eATK;
			this.cDEF -= weapon.eDEF;
			this.weapon = null;
		}
		else {
			this.cATK = 10;
			this.cDEF = 10;
		}
	}
	
	
}
