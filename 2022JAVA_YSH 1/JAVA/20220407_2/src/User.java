
public class User {
	
	private String userName;
	private IFly userFly;
	
	public User(String userName) {
		this.userName = userName;
	}
	
	public String getUserName() {
		return this.userName;
	}
	
	public void rideFly(IFly userFly) {
		this.userFly = userFly;
		System.out.println(this.userFly+"에 탔습니다.");
	}
	
	public void carDrive() {
		//자동차일 경우 carRun(), fly()
		//양탄자일 경우 fly()
		if(userFly instanceof Car) {
			((Car) this.userFly).carRun();
			this.userFly.fly();
		}
		else if(userFly instanceof Carpet) {
			this.userFly.fly();
		}
	}
	
}
