package pkg.Airs;

import pkg.Commons.IAttack;
import pkg.Commons.IFly;
import pkg.Commons.ITarget;
import pkg.Commons.IZerg;
import pkg.Grounds.GroundUnit;
import pkg.Transport.Transport;

public class Mutalisk extends AirUnit implements IFly, IZerg, IAttack{
	
	public Mutalisk(String unitName, int offense) {
		super();
		this.unitName = unitName;
		this.offense = offense;
		this.health = 40;
	}

	@Override
	public void attack(ITarget unit) {
		System.out.println("----------공격-----------");
		if(unit instanceof IZerg) {
			System.out.println("아군을 공격할 수 없습니다.");
		}
		else {
			unit.hit(this.offense);
		}
	}

	@Override
	public void fly() {
		System.out.println("----------날기-----------");
		System.out.println("뮤탈리스크 "+this.unitName+"이(가) 날아갑니다.");
	}

	@Override
	public void fall() {
		this.health = 0;
		System.out.println("----------추락-----------");
		System.out.println("뮤탈리스크 "+this.unitName+"이(가) 추락해 죽었습니다.");
	}

}
