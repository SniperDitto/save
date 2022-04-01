
public class Exec {

	public static void main(String[] args) {
		
		//p1
		Character player1 = new Character();
		player1.cName = "최유나";
		player1.cGender = "F";
		
		//p2
		Character player2 = new Character();
		player2.cName = "홍길동";
		player2.cGender = "M";
		
		//g1
		Gun g1 = new Gun();
		g1.gName = "총1";
		g1.gForce = 10;
		g1.gAmmo = 12;
		g1.gNowAmmo = 12;
		
		//g2
		Gun g2 = new Gun();
		g2.gName = "총2";
		g2.gForce = 9;
		g2.gAmmo = 15;
		g2.gNowAmmo = 15;
		
		//p1 -> g1
		player1.getGun(g1);
		for(int i=0;i<15;i++) {
			player1.gunShot(g1);
		}
		player1.eat("라면", 10);
		player1.eat("불닭볶음면", 50);
		player1.eat("라떼", 25);
		player1.eat("아이스크림", 30);
		player1.eat("치즈", 20);

		//p2 -> g1
		player2.getGun(g1);
		player2.gunShot(g1);
		player2.gunShot(g1);
		player2.gunShot(g1);
		//p1 -> g2
		player1.getGun(g2);
		player1.gunShot(g2);
		player1.gunShot(g2);
		player1.gunShot(g2);
		player1.gunShot(g2);
		//p2 -> g2
		player2.getGun(g2);
		player2.gunShot(g2);
		
		
		
		
		
		
		
	}

}
