package pkg.Commons;



public abstract class BaseUnit {
	
	public String name;
	protected int health;
	protected int offense;
	protected UnitKind unitKind;
	
	public BaseUnit() {}
	
	public UnitKind getUnitKind() {
		return this.unitKind;
	}
	public int getOffense() {
		return this.offense;
	}
	
	public abstract void attacked(BaseUnit enemy);
	public abstract void die();
	
}
