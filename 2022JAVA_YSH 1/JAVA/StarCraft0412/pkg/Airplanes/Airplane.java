package pkg.Airplanes;

import pkg.Commons.UnitKind;

public abstract class Airplane {
	protected int offence;
	protected int health;
	protected UnitKind unitKind;
	
	public Airplane() {}
	
	public abstract void fly();
	public abstract void shotGun(Airplane a);
	public abstract void fall();
}
