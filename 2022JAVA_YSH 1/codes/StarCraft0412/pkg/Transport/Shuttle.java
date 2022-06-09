package pkg.Transport;

import pkg.Commons.IFly;
import pkg.Commons.IProtoss;
import pkg.Commons.ITerran;
import pkg.Commons.ITarget;
import pkg.Commons.IZerg;
import pkg.Grounds.GroundUnit;

public class Shuttle extends Transport implements IFly, ITerran{
	
	public Shuttle(String unitName) {
		super();
		this.unitName = unitName;
		this.health = 30;
		this.pickupNum = 8;
	}

	@Override
	public void fly() {
		System.out.println("----------날기-----------");
		System.out.println("셔틀 "+this.unitName+"이(가) 날아갑니다.");
	}

	@Override
	public void load(ITarget unit) {
		System.out.println("----------유닛탑승-----------");
		if(unit instanceof IProtoss) {
			if(unit instanceof GroundUnit) {
				if(pickupList.size()<pickupNum) {
					pickupList.add((GroundUnit) unit);
				}
				else {
					System.out.println("더이상 탈 공간이 없습니다.");
				}
			}
			else {
				System.out.println("지상 유닛만 태울 수 있습니다.");
			}
		}
		else {
			System.out.println("아군만 태울 수 있습니다.");
		}
	}

	@Override
	public void fall() {
		this.health = 0;
		System.out.println("----------추락-----------");
		System.out.println("셔틀 "+this.unitName+"이(가) 추락해 죽었습니다.");
		System.out.println("탑승해 있던 유닛들도 모두 죽었습니다.");
		for(GroundUnit i : pickupList) {
			System.out.println(i.getName()+" 사망");
		}
		pickupList.clear();
	}
	
}
