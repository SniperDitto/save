package pkg.Exec;

import pkg.Units.Zealot;
import pkg.Units.Zergling;

public class Exec {

	public static void main(String[] args) {
		
		Zergling zerg1 = new Zergling();
		zerg1.unitName = "저글링 1";
		Zergling zerg2 = new Zergling();
		zerg2.unitName = "저글링 2";
		
		Zealot zeal1 = new Zealot();
		zeal1.unitName = "질럿 1";
		Zealot zeal2 = new Zealot();
		zeal2.unitName = "질럿 2";
		
		zerg1.attack(zeal1);
		zeal1.attack(zerg1);
		
		
		
		
		
		
		
	}

}
