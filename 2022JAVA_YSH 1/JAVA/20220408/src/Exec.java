
public class Exec {

	public static void main(String[] args) {
		
		Car car = new Car("차",CarKind.Sonata);
		
		CarKind cK = car.getCarKind();
		System.out.println(cK);
		System.out.println(car.getPrice());
		
	}

}
