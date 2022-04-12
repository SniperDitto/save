package pkg.Units;

import pkg.Commons.IAttack;
import pkg.Commons.UnitKind;

public abstract class Unit implements IAttack{
	public String unitName;
	protected int offense;
	protected int health;
	protected int grade;
	protected UnitKind unitKind;
	
	public Unit() {
		this.grade = 0;
	}
	
	
	public void upgrade() {
		this.grade++;
		this.offense++;
	}
	public void die() {
		this.health = 0;
	}
}
