package pkg.Airs;

import pkg.Commons.ITerran;
import pkg.Commons.ITarget;
import pkg.Commons.IZerg;
import pkg.Grounds.GroundUnit;
import pkg.Transport.Transport;

public class ScienceVessel extends AirUnit implements ITerran{
	
	public ScienceVessel(String unitName) {
		super();
		this.unitName = unitName;
		this.health = 30;
		this.offense = 0;
	}

	@Override
	public void fly() {
		System.out.println("----------날기-----------");
		System.out.println("사이언스 베슬 "+this.unitName+"이(가) 날아갑니다.");
	}

	@Override
	public void attack(ITarget unit) {
		System.out.println("----------공격-----------");
		System.out.println("사이언스 베슬은 공격할 수 없습니다.");
	}

	@Override
	public void fall() {
		this.health = 0;
		System.out.println("----------추락-----------");
		System.out.println("사이언스 베슬 "+this.unitName+"이(가) 추락해 죽었습니다.");
	}
	
	public void observe() {
		System.out.println("----------탐지-----------");
		System.out.println("사이언스 베슬 "+this.unitName+"이(가) 은신한 적을 찾았습니다.");
	}
	
	public void Irradiate(ITarget unit) {
		System.out.println("----------방사능-----------");
		System.out.println("사이언스 베슬 "+this.unitName+"이(가) 방사능을 살포합니다.");
		if(unit instanceof IZerg) {
			if(unit instanceof AirUnit) {
				((AirUnit) unit).health -= 5;
			}
			else if(unit instanceof GroundUnit) {
				((GroundUnit) unit).setHealth(((GroundUnit) unit).getHealth()-5);
			}
			else if(unit instanceof Transport) {
				((Transport) unit).setHealth(((Transport) unit).getHealth()-5);
			}
		}
		
	}

}
