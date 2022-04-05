package pkg.Char;

public class Warrior extends Character {
	
	
	
	public Warrior() {
		super();
	}
	public Warrior(String cName) {
		super(cName, 1, 0, 200, 50, 20, 20);
	}
	public Warrior(String cName, int cLV, int cEXP,
			int cHP, int cMP, int cATK, int cDEF) {
		super(cName, cLV, cEXP, cHP, cMP, cATK, cDEF);
	}
	
	

	
}
