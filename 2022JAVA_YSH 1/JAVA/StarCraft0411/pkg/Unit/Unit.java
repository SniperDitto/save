package pkg.Unit;


public abstract class Unit{
	public String unitName;
	protected int offence;
	protected int health;
	protected int grade;
	
	protected boolean isAlive;
	
	public Unit() {
		this.grade = 0;
		isAlive = true;
	}
	public Unit(int offence, int health) {
		this.offence = offence;
		this.health = health;
		this.grade = 0;
		this.isAlive = true;
	}
	
	public abstract void attack(Unit enemy);
	public abstract void upgrade();
	public abstract void die();
	
}
