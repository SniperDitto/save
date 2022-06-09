package pkg.Grounds;

import pkg.Commons.IAttack;
import pkg.Commons.IFly;
import pkg.Commons.IProtoss;
import pkg.Commons.ITarget;
import pkg.Commons.IZerg;

public class Zealot extends GroundUnit implements IAttack, IProtoss{
	
	public Zealot(String unitName) {
		super();
		this.unitName = unitName;
		this.offense = 3;
		this.health = 20;
	}

	@Override
	public void attack(ITarget unit) {
		System.out.println("----------공격-----------");
		if(unit instanceof IZerg) {
			System.out.println("아군을 공격할 수 없습니다.");
		}
		else {
			if(unit instanceof IFly) {
				System.out.println("질럿은 공중 유닛을 공격할 수 없습니다.");
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
		System.out.println("질럿 "+this.unitName+"이(가) 업그레이드하여 공격력이 1 상승했습니다.");
	}

	@Override
	public void die() {
		this.health = 0;
		System.out.println("----------사망-----------");
		System.out.println("질럿 "+this.unitName+"이(가) 죽었습니다.");
	}
	
	public void walk() {
		System.out.println("----------걷기-----------");
		System.out.println("질럿 "+this.unitName+"이(가) 걸어갑니다.");
	}
	
}
