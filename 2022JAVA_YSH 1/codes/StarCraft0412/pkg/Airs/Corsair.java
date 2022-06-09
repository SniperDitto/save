package pkg.Airs;

import pkg.Commons.IAttack;
import pkg.Commons.IFly;
import pkg.Commons.IProtoss;
import pkg.Commons.ITarget;
import pkg.Transport.Transport;

public class Corsair extends AirUnit implements IFly, IProtoss, IAttack{
	
	public Corsair(String unitName, int offense) {
		super();
		this.unitName = unitName;
		this.offense = offense;
		this.health = 40;
	}

	@Override
	public void attack(ITarget unit) {
		System.out.println("----------공격-----------");
		if(unit instanceof IProtoss) {
			System.out.println("아군을 공격할 수 없습니다.");
		}
		else {
			unit.hit(this.offense);
		}
	}

	@Override
	public void fly() {
		System.out.println("----------날기-----------");
		System.out.println("커세어 "+this.unitName+"이(가) 날아갑니다.");
	}

	@Override
	public void fall() {
		this.health = 0;
		System.out.println("----------추락-----------");
		System.out.println("커세어 "+this.unitName+"이(가) 추락해 죽었습니다.");
	}
	
}
