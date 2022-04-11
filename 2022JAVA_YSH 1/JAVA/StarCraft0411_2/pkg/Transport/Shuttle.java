package pkg.Transport;

import pkg.Commons.IFly;
import pkg.Commons.IProtoss;
import pkg.Commons.IUnit;
import pkg.Commons.Races;
import pkg.GroundUnit.GroundUnit;

public class Shuttle extends Transport implements IProtoss, IFly{
	
	public Shuttle() {
		super(30, 8, Races.Protoss);
	}
	

	@Override
	public void fly() {
		System.out.println("-------------날기--------------");
		System.out.println("셔틀 "+this.unitName+"이(가) 날아갑니다.");
		System.out.println("-------------------------------");
	}

	@Override
	public void pickup(IUnit unit) {
		//수송가능수 체크
		if(this.pickupList.size()<pickupNum) {
			//지상유닛인지
			if(unit instanceof GroundUnit) {
				//같은편인지
				if(unit instanceof IProtoss) {
					this.pickupList.add(unit);
				}
				else {
					System.out.println("적 유닛은 탑승 불가합니다.");
				}
			}
			else {
				System.out.println("지상 유닛만 탑승 가능합니다.");
			}
		}
		else {
			System.out.println("더 태울 자리가 없습니다.");
		}
	}

	@Override
	public void getoff(IUnit unit) {
		for(IUnit i :pickupList) {
			if(i.equals(unit)) {
				this.pickupList.remove(unit);
			}
			else {
				System.out.println("탑승하고 있지 않은 유닛입니다.");
			}
		}
	}

	@Override
	public void fall() {
		this.health = 0;
		for(IUnit i : pickupList) {
			((GroundUnit) i).die();
		}
		System.out.println("-------------사망--------------");
		System.out.println("셔틀 "+this.unitName+"이(가) 사망했습니다.");
		System.out.println("탑승한 유닛들이 전부 죽었습니다.");
		System.out.println("-------------------------------");
	}

}
