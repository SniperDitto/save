package pkg.Exec;

import pkg.Char.Character;

public class Exec {
	public static void main(String[] args) {
		
		Character player1 = new Character("홍길동");
		player1.showCharInfo();
		player1.cEXP = 550;
		player1.showCharInfo();
		
		player1.exchangeToLV();
		player1.showCharInfo();
		
		
		
	}
}
