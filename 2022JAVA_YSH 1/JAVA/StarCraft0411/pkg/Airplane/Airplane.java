package pkg.Airplane;

import pkg.Commons.Species;

public abstract class Airplane {
	public String unitName;
	protected int offence;
	protected int health;
	protected Species species;
	
	protected boolean isAlive;
	
	public Airplane() {
		this.isAlive = true;
	}
	public Airplane(int offence, int health, Species species) {
		this.offence = offence;
		this.health = health;
		this.species = species;
		this.isAlive = true;
	}
	
	public abstract void fly();
	public abstract void shotGun(Airplane enemy);
	public abstract void fall();
	
}
