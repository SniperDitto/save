package pkg.Airplanes;

import pkg.Commons.UnitKind;

public class Mutalisk extends Airplane{
	
	public Mutalisk(int offence) {
		super();
		this.offence = offence;
		this.health = 40;
		this.unitKind = UnitKind.Zerg;
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
