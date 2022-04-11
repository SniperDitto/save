package pkg.Airplane;

import pkg.Commons.Species;

public class Corsair extends Airplane{
	
	public Corsair(int offence) {
		super(offence, 40, Species.Protoss);
	}
	
	//----------------------------
	public int getOffence() {
		return this.offence;
	}
	public void setOffence(int offence) {
		this.offence = offence;
	}
	public int getHealth() {
		return this.health;
	}
	public void setHealth(int health) {
		this.health = health;
	}
	public Species getSpecies() {
		return this.species;
	}
	//----------------------------
	
	@Override
	public void fly() {
		System.out.println("커세어"+this.unitName+"이(가) 날아갑니다.");
	}

	@Override
	public void shotGun(Airplane enemy) {
		//적이 뮤탈이면 공격력 2배로 적용
		//지상유닛공격불가
		
	}

	@Override
	public void fall() {
		this.health = 0;
		this.isAlive = false;
		System.out.println("커세어 "+this.unitName+"이 사망했습니다.");
	}
	
}
