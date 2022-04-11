package pkg.transport;

import java.util.ArrayList;

import pkg.Commons.Species;
import pkg.Unit.Unit;

public abstract class Transport {
	
	public String unitName;
	protected int health;
	protected int pickupNum;
	protected Species species;
	
	protected boolean isAlive;
	protected ArrayList<Unit> pickupList;
	
	public Transport() {
		this.isAlive = true;
	}
	public Transport(int health, int pickupNum, Species species) {
		this.health = health;
		this.pickupNum = pickupNum;
		this.species = species;
		this.isAlive = true;
	}
	
	public abstract void fly();
	public abstract void pickup(Unit unit);
	public abstract void fall();
	
}
