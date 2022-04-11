package pkg.AirUnit;

import pkg.Commons.IFly;
import pkg.Commons.IUnit;
import pkg.Commons.Races;

public abstract class AirUnit implements IUnit, IFly{
	
	public String unitName;
	protected int offence;
	protected int health;
	protected Races race;
	
	public AirUnit() {}
	public AirUnit(int offence, int health, Races race) {
		if(offence>0 && health>0) {
			this.offence = offence;
			this.health = health;
			this.race = race;
		}
	}
	
	public int getHealth() {
		return this.health;
	}
	public void setHealth(int health) {
		this.health = health;
	}
	
	public abstract void shotGun(IUnit unit);
	
	
}
