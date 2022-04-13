package pkg.Grounds;

import pkg.Commons.BaseUnit;
import pkg.Commons.IAttack;
import pkg.Commons.IFly;
import pkg.Commons.UnitKind;

public class Zergling extends GroundUnit implements IAttack{
	
	public Zergling(String name) {
		super();
		this.name = name;
		this.health = 10;
		this.offense = 2;
		this.unitKind = UnitKind.Zerg;
	}

	@Override
	public void attack(BaseUnit enemy) {
		if(enemy.getUnitKind() == this.unitKind) {
			System.out.println("아군을 공격할 수 없습니다.");
		}
		else {
			if(!(enemy instanceof IFly)) {
				if(this.health>0) {
					enemy.attacked(this);
					System.out.println(enemy.name+" -> "+this.name+" 공격(데미지 "+enemy.getOffense()+")");
					System.out.println(this.name+"의 체력 : "+this.health);
					if(this.health<=0) {
						this.die();
					}
				}
				else {
					System.out.println("이미 죽은 대상입니다.");
				}
			}
			else {
				System.out.println("공중에 있는 유닛을 공격할 수 없습니다.");
			}
		}
		
	}


	@Override
	public void die() {
		this.health = 0;
		System.out.println(this.name + " 죽었습니다.");
	}

	@Override
	public void attacked(BaseUnit enemy) {
		this.health -= enemy.getOffense();
	}
	
}
