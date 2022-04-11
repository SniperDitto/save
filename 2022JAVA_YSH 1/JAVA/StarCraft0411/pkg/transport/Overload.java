package pkg.transport;

import pkg.Commons.Species;
import pkg.Unit.Unit;

public class Overload extends Transport{
	
	public Overload() {
		super(40, 8, Species.Zerg);
	}
	
	public void observe() {
		System.out.println("상대 유닛 탐지");
	}

	@Override
	public void fly() {
		System.out.println("오버로드"+this.unitName+"이(가) 날아갑니다.");
	}

	@Override
	public void pickup(Unit unit) {
		//----------------------같은편만 탑승 추가하기
		if(unit instanceof Unit) {
			if(pickupList.size()<pickupNum) {
				this.pickupList.add(unit);
				System.out.println(unit.unitName+"을(를) 태웠습니다.");
				System.out.println("남은 자리 수 : "
						+Integer.toString(pickupNum-pickupList.size()));
			}
			else {
				System.out.println("더이상 태울 자리가 없습니다.");
			}
		}
		else {
			System.out.println("지상 유닛만 탑승 가능합니다.");
		}
	}

	@Override
	public void fall() {
		this.health = 0;
		this.isAlive = false;
		System.out.println("오버로드 "+this.unitName+"이 사망했습니다.");
		//타고 있던 애들도 사망
		for(Unit u : pickupList) {
			u.die();
		}
	}
	
}
