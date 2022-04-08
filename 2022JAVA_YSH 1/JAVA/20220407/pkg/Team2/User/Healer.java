package pkg.Team2.User;

public class Healer extends User {

	public Healer() {
		super();
	}

	public Healer(String userName, int userAge) {
		super(userName, userAge);
	}

	@Override
	public void greeting() {
		System.out.println("저는 힐러입니다.");
	}
	
	public void heal() {
		System.out.println("힐러가 치료합니다.");
	}

}
