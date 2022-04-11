package pkg.GroundUnit;

import pkg.Commons.IProtoss;
import pkg.Commons.IUnit;
import pkg.Commons.IZerg;
import pkg.Commons.Races;

public class Zealot extends GroundUnit implements IProtoss{
	
	public  Zealot() {
		super(3, 20, Races.Protoss);
	}

	@Override
	public void attack(IUnit unit) {
		//같은편인지 확인
		System.out.println("----------공격-----------");
		if(unit instanceof IZerg) {
			System.out.println("아군을 공격할 수 없습니다");
		}
		else {
			//지상, 공중유닛 확인
			if(unit instanceof GroundUnit) {
				//체력확인
				GroundUnit enemy = ((GroundUnit) unit);
				if(enemy.health > 0) {
					enemy.health -= this.offence;
					System.out.println("질럿 "+this.unitName+"이(가) "
							+enemy.unitName+"을(를) 공격해 "
							+this.offence+"의 데미지를 입혔습니다.");
					System.out.println(enemy.unitName+"HP "+enemy.health+"남음");
					if(enemy.health<=0) {
						enemy.die();
					}
				}
				else {
					System.out.println("이미 사망한 유닛입니다.");
				}
			}
			else {
				System.out.println("지상 유닛만 공격할 수 있습니다.");
			}
		}
		System.out.println("-------------------------------");
	}

	@Override
	public void upgrade() {
		this.grade++;
		this.offence++;
		System.out.println("----------업그레이드-----------");
		System.out.println(this.unitName+"이 업그레이드되었습니다.");
		System.out.println("공격력이 "+this.offence+"이(가) 되었습니다.");
		System.out.println("-------------------------------");
	}

	@Override
	public void die() {
		this.health=0;
		System.out.println("-------------사망--------------");
		System.out.println("질럿 "+this.unitName+"이(가) 사망했습니다.");
		System.out.println("-------------------------------");
	}
	
	public void walk() {
		System.out.println("-------------걷기--------------");
		System.out.println("질럿 "+this.unitName+"이 걸어갑니다.");
		System.out.println("-------------------------------");
	}

	
}
