
public class Exec {
	public static void main(String[] args) {
		
		Car car1 = new Car("차1");
		Car car2 = new Car("차2");
		Carpet carpet1 = new Carpet("카펫1");
		
		User user1 = new User("홍길동");
		User user2 = new User("전우치");
		
		Phone h = new Phone();
		
		user1.rideFly(car1);
		user1.carDrive();
		
		user2.rideFly(carpet1);
		user2.carDrive();
		
		if(!(h instanceof IFly)) {
			System.out.println("Phone은 날 수 없습니다.");
		}
		else {
			System.out.println("날 수 있어요");
		}
		
	}
}
