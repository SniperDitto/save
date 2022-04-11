package pkg.AirUnit;

import pkg.Commons.IFly;
import pkg.Commons.IUnit;
import pkg.Commons.IZerg;
import pkg.Commons.Races;
import pkg.GroundUnit.GroundUnit;

public class Mutalisk extends AirUnit implements IZerg, IFly{
	
	public Mutalisk(int offence) {
		super(offence, 40, Races.Zerg);
	}

	@Override
	public void fly() {
		System.out.println("-------------날기--------------");
		System.out.println("뮤탈리스크 "+this.unitName+"이(가) 날아갑니다.");
		System.out.println("-------------------------------");
	}

	@Override
	public void shotGun(IUnit unit) {
		//같은편인지 확인
		System.out.println("----------공격-----------");
		if(unit instanceof IZerg) {
			System.out.println("아군을 공격할 수 없습니다.");
		}
		else {
			//지상, 공중 상관없이 공격가능
			if(unit instanceof GroundUnit) {
				GroundUnit enemyG = ((GroundUnit) unit);
				if(enemyG.getHealth()>0) {
					enemyG.setHealth(enemyG.getHealth()-this.offence);
					System.out.println("뮤탈리스크 "+this.unitName+"이(가) "
							+enemyG.unitName+"을(를) 공격해 "
							+this.offence+"의 데미지를 입혔습니다.");
					System.out.println(enemyG.unitName+"HP "+enemyG.getHealth()+"남음");
					if(enemyG.getHealth()<=0) {
						enemyG.die();
					}
				}
				else {
					System.out.println("이미 사망한 유닛입니다.");
				}
			}
			else if(unit instanceof IFly) {
				AirUnit enemyA = ((AirUnit) unit);
				if(enemyA.health>0) {
					enemyA.health-=this.offence;
					System.out.println("뮤탈리스크 "+this.unitName+"이(가) "
							+enemyA.unitName+"을(를) 공격해 "
							+this.offence+"의 데미지를 입혔습니다.");
					System.out.println(enemyA.unitName+"HP "+enemyA.health+"남음");
					if(enemyA.health<=0) {
						enemyA.fall();
					}
				}
				else {
					System.out.println("이미 사망한 유닛입니다.");
				}
			}
		}
		System.out.println("-------------------------------");
	}

	@Override
	public void fall() {
		this.health=0;
		System.out.println("-------------사망--------------");
		System.out.println("뮤탈리스크 "+this.unitName+"이(가) 사망했습니다.");
		System.out.println("-------------------------------");
	}

}
