package pkg.Airs;

import pkg.Commons.BaseUnit;
import pkg.Commons.IAttack;
import pkg.Commons.UnitKind;

public class Mutalisk extends AirUnit implements IAttack{
	
	public Mutalisk(String name, int offense) {
		super();
		this.name = name;
		this.offense = offense;
		this.health = 40;
		this.unitKind = UnitKind.Zerg;
	}

	@Override
	public void fly() {
		System.out.println(this.name+"이(가) 날아갑니다.");
	}

	@Override
	public void attacked(BaseUnit enemy) {
		if(enemy.getUnitKind()==this.unitKind) {
			System.out.println("아군을 공격할 수 없습니다.");
		}
		else {
			
		}
	}

	@Override
	public void die() {
		
	}

	@Override
	public void attack(BaseUnit enemy) {
		
	}
	
}
