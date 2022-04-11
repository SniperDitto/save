package pkg.AirUnit;

import pkg.Commons.IFly;
import pkg.Commons.ITerran;
import pkg.Commons.IUnit;
import pkg.Commons.IZerg;
import pkg.Commons.Races;
import pkg.GroundUnit.GroundUnit;

public class ScienceVessel extends AirUnit implements ITerran,IFly{
	
	public  ScienceVessel() {
		super(0, 30, Races.Terran);
	}
	
	@Override
	public void fly() {
		System.out.println("-------------날기--------------");
		System.out.println("사이언스 베슬 "+this.unitName+"이(가) 날아갑니다.");
		System.out.println("-------------------------------");
	}

	@Override
	public void fall() {
		this.health=0;
		System.out.println("-------------사망--------------");
		System.out.println("사이언스 베슬 "+this.unitName+"이(가) 사망했습니다.");
		System.out.println("-------------------------------");
	}

	@Override
	public void shotGun(IUnit unit) {
		//공격계열 메서드 인터페이스로 만들면 얘는 빼기
		System.out.println("이 유닛은 공격할 수 없습니다.");
	}
	
	public void observe() {
		System.out.println("-------------탐지--------------");
		System.out.println("숨은 적 유닛을 탐지합니다.");
		System.out.println("-------------------------------");
	}
	
	public void useMagic(IUnit unit) {
		System.out.println("-------------마법--------------");
		System.out.println("사이언스 베슬 "+this.unitName+"이(가) 마법을 사용합니다.");
		System.out.println("-------------------------------");
		if(unit instanceof IZerg) {
			if(unit instanceof GroundUnit) {
				((GroundUnit) unit).setHealth(((GroundUnit) unit).getHealth()-5);
			}
			if(unit instanceof IFly) {
				((AirUnit) unit).health -= 5;
			}
		}
	}

}
