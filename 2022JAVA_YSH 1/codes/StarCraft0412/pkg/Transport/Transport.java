package pkg.Transport;

import java.util.ArrayList;

import pkg.Commons.IFly;
import pkg.Commons.ITarget;
import pkg.Grounds.GroundUnit;

public abstract class Transport implements ITarget, IFly{
	protected String unitName;
	protected int offense;
	protected int health;
	protected int pickupNum;
	protected ArrayList<GroundUnit> pickupList;
	
	public Transport() {}
	
	public String getName() {
		return this.unitName;
	}
	public int getHealth() {
		return this.health;
	}
	public void setHealth(int health) {
		this.health = health;
	}
	
	public abstract void load(ITarget unit);
	public void unload(ITarget unit) {
		System.out.println("----------내리기-----------");
		for(ITarget i : pickupList) {
			if(unit.equals(i)) {
				pickupList.remove(unit);
			}
			else {
				System.out.println("탑승하고 있지 않은 유닛입니다.");
			}
		}
	}
	public abstract void fall();
	public void hit(int damage) {
		if (this.health>0) {
			this.health -= damage;
			System.out.println(this.unitName+"의 HP가 "+damage+" 감소. "
					+this.health+"남음");
			if(this.health<=0) {
				this.fall();
			}
		}
	}
}
