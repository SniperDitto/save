package pkg.Grounds;

import pkg.Commons.BaseUnit;

public abstract class GroundUnit extends BaseUnit{
	
	public GroundUnit() {
		super();
	}
	
	public void run() {
		System.out.println(this.name+"이(가) 달려갑니다.");
	}
	
}
