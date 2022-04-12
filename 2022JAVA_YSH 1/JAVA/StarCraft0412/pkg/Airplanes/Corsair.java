package pkg.Airplanes;

import pkg.Commons.UnitKind;

public class Corsair extends Airplane{
	
	public Corsair(int offence) {
		super();
		this.offence = offence;
		this.health = 40;
		this.unitKind = UnitKind.Protoss;
	}

	@Override
	public void fly() {
		
	}

	@Override
	public void shotGun(Airplane a) {
		
	}

	@Override
	public void fall() {
		
	}

}
