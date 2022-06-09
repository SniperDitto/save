package pkg.Grounds;

import pkg.Commons.IAttack;
import pkg.Commons.IFly;
import pkg.Commons.ITarget;
import pkg.Commons.IZerg;

public class Zergling extends GroundUnit implements IAttack, IZerg{
	
	public Zergling(String unitName) {
		super();
		this.unitName = unitName;
		this.offense = 2;
		this.health = 10;
	}

	@Override
	public void attack(ITarget unit) {
		System.out.println("----------공격-----------");
		if(unit instanceof IZerg) {
			System.out.println("아군을 공격할 수 없습니다.");
		}
		else {
			if(unit instanceof IFly) {
				System.out.println("저글링은 공중 유닛을 공격할 수 없습니다.");
			}
			else {
				unit.hit(this.offense);
			}
		}
	}

	@Override
	public void upgrade() {
		System.out.println("----------업그레이드-----------");
		this.grade++;
		this.offense++;
		System.out.println("저글링 "+this.unitName+"이(가) 업그레이드하여 공격력이 1 상승했습니다.");
	}

	@Override
	public void die() {
		this.health = 0;
		System.out.println("----------사망-----------");
		System.out.println("저글링 "+this.unitName+"이(가) 죽었습니다.");
	}
	
	public void run() {
		System.out.println("----------달리기-----------");
		System.out.println("저글링 "+this.unitName+"이(가) 달려갑니다.");
	}
	
}
