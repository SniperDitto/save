package pkg.Airplane;

import pkg.Commons.Species;

public class Mutal extends Airplane{
	
	public Mutal(int offence) {
		super(offence, 40, Species.Zerg);
	}
	
	//----------------------------------
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
	//------------------------------

	@Override
	public void fly() {
		System.out.println("뮤탈리스크"+this.unitName+"이(가) 날아갑니다.");
	}

	@Override
	public void shotGun(Airplane enemy) {
		//------------------------수정필요
	}

	@Override
	public void fall() {
		this.health = 0;
		this.isAlive = false;
		System.out.println("뮤탈리스크"+this.unitName+"이 사망했습니다.");
	}

	


	
	
	
}
