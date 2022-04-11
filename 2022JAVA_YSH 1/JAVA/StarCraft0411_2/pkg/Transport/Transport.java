package pkg.Transport;

import java.util.ArrayList;

import pkg.Commons.IFly;
import pkg.Commons.IUnit;
import pkg.Commons.Races;

public abstract class Transport implements IUnit, IFly{
	
	public String unitName;
	protected int health;
	protected int pickupNum;
	protected Races race;
	protected ArrayList<IUnit> pickupList;
	
	public Transport() {}
	public Transport(int health, int pickupNum, Races race) {
		this.health = health;
		this.pickupNum = pickupNum;
		this.race = race;
	}
	
	public abstract void pickup(IUnit unit);
	public abstract void getoff(IUnit unit);
	
}
