package pkg.Airs;

import pkg.Commons.IAttack;
import pkg.Commons.IFly;
import pkg.Commons.ITarget;

public abstract class AirUnit implements ITarget, IFly, IAttack{
	protected String unitName;
	protected int offense;
	protected int health;
	
	public AirUnit() {};
	
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
