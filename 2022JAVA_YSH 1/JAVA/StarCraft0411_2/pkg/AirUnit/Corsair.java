package pkg.AirUnit;

import pkg.Commons.IFly;
import pkg.Commons.IProtoss;
import pkg.Commons.IUnit;
import pkg.Commons.IZerg;
import pkg.Commons.Races;

public class Corsair extends AirUnit implements IProtoss, IFly{
	
	public Corsair(int offence) {
		super(offence, 40, Races.Protoss);
	}

	@Override
	public void fly() {
		System.out.println("-------------날기--------------");
		System.out.println("커세어 "+this.unitName+"이(가) 날아갑니다.");
		System.out.println("-------------------------------");
	}

	@Override
	public void shotGun(IUnit unit) {
		System.out.println("----------공격-----------");
		if(unit instanceof IZerg) {
			System.out.println("아군을 공격할 수 없습니다.");
		}
		else {
			//공중유닛만 공격가능
			if(unit instanceof IFly) {
				AirUnit enemyA = ((AirUnit) unit);
				if(enemyA.health>0) {
					if(unit instanceof Mutalisk) {
						//뮤탈은 딜2배
						enemyA.health-=this.offence*2;
					}
					else {
						enemyA.health-=this.offence;
					}
					System.out.println("커세어 "+this.unitName+"이(가) "
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
			else {
				System.out.println("공중 유닛만 공격할 수 있습니다.");
			}
		}
		System.out.println("-------------------------------");
	}

	@Override
	public void fall() {
		this.health=0;
		System.out.println("-------------사망--------------");
		System.out.println("커세어 "+this.unitName+"이(가) 사망했습니다.");
		System.out.println("-------------------------------");
	}

}
