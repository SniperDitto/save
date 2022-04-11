package pkg.Unit;

import pkg.Commons.Species;

public class Zealot extends Unit{
	
	public Zealot() {
		super(3, 20, Species.Protoss);
	}
	
	public int getOffence() {
		return this.offence;
	}
	public void setOffence(int offense) {
		this.offence = offense;
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
	
	public void walk() {
		System.out.println("질럿 "+this.unitName+"이(가) 걸어다닌다.");
	}

	@Override
	public void attack(Unit enemy) {
		//------------------------------------수정필요
	}

	@Override
	public void upgrade() {
		this.grade++;
		this.offence++;
		System.out.println("등급이 상승해 공격력이 1 증가합니다");
	}

	@Override
	public void die() {
		this.health = 0;
		this.isAlive = false;
		System.out.println("질럿 "+this.unitName+"이(가) 사망했습니다");
	}
	
}
