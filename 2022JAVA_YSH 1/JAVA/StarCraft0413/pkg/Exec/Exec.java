package pkg.Exec;

import java.sql.Connection;

import pkg.Grounds.Zealot;
import pkg.Grounds.Zergling;

public class Exec {
	public static void main(String[] args) {
		
		Zergling zergling1 = new Zergling("저글링1");
		Zergling zergling2 = new Zergling("저글링2");
		Zealot zealot1 = new Zealot("질럿1");
		Zealot zealot2 = new Zealot("질럿2");
		
		zealot1.attack(zergling1);
		zealot1.attack(zealot2);
		zealot1.attack(zergling1);
		zealot1.attack(zergling1);
		zealot1.attack(zergling1);
		zealot1.attack(zergling1);
		zealot1.attack(zergling1);
		
		Connection con = null;
	}
}
