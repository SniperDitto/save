package pkg.Units;

import pkg.Commons.UnitKind;

public class Zergling extends Unit{
	
	public Zergling() {
		super();
		this.offense = 2;
		this.health = 10;
		this.unitKind = UnitKind.Zerg;
	}

	

	@Override
	public void upgrade() {
		
	}

	
	public void run() {
		
	}



	@Override
	public void attack(Unit unit) {
		//종족(아군인지)
		if(unit.unitKind == this.unitKind) {
			System.out.println("아군을 공격할 수 없습니다.");
		}
		else {
			//지상, 공중, 수송유닛 구분
			if(unit.health>0) {
				unit.health -= this.offense;
				System.out.println("------------------");
				System.out.println(this.unitName+"이(가) "+unit.unitName+"을(를) 공격");
				System.out.println(unit.unitName+"의 체력이 "+this.offense+" 감소해 "
									+unit.health+"이(가) 되었습니다");
				System.out.println("------------------");
				if(unit.health<=0) {
					unit.die();
				}
			}
			else {
				System.out.println("체력이 0 이하인 대상입니다.");
			}
		}
	}

}
