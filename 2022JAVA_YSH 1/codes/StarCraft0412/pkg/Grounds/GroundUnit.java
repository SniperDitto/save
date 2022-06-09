package pkg.Grounds;

import pkg.Commons.ITarget;

public abstract class GroundUnit implements ITarget{
	protected String unitName;
	protected int offense;
	protected int health;
	protected int grade;
	
	public GroundUnit() {
		this.grade = 0;
	}
	
	public String getName() {
		return this.unitName;
	}
	public int getHealth() {
		return this.health;
	}
	public void setHealth(int health) {
		this.health = health;
	}
	
	public abstract void upgrade();
	public abstract void die();
	
	public void hit(int damage) {
		if (this.health>0) {
			this.health -= damage;
			System.out.println(this.unitName+"의 HP가 "+damage+" 감소. "
							+this.health+"남음");
			if(this.health<=0) {
				this.die();
			}
		}
	}
}
