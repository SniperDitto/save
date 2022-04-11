package pkg.GroundUnit;

import pkg.Commons.IUnit;
import pkg.Commons.Races;

public abstract class GroundUnit implements IUnit{
	
	public String unitName;
	protected int offence;
	protected int health;
	protected int grade;
	protected Races race;
	
	
	public GroundUnit() {
		this.grade = 0;
	}
	public GroundUnit(int offence, int health, Races race) {
		if(offence>0 && health>0) {
			this.offence = offence;
			this.health = health;
			this.race = race;
			this.grade = 0;
		}
	}
	
	public int getHealth() {
		return this.health;
	}
	public void setHealth(int health) {
		this.health = health;
	}
	
	public abstract void attack(IUnit unit);
	public abstract void upgrade();
	public abstract void die();
}
