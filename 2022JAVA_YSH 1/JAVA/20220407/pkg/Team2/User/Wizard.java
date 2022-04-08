package pkg.Team2.User;

import pkg.Commons.IuseMagic;

public class Wizard extends User implements IuseMagic{
	
	public Wizard() {
		super();
	}
	public Wizard(String userName, int userAge) {
		super(userName, userAge);
	}

	@Override
	public void greeting() {
		System.out.println("저는 마법사입니다.");
	}
	
	@Override
	public void useMagic() {
		System.out.println("마법사가 마법을 사용합니다.");
	}
	
	

}
