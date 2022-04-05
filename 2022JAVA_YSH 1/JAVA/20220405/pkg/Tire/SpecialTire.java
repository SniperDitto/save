package pkg.Tire;

public class SpecialTire extends Tire {

	public SpecialTire() {
		super();
	}
	public SpecialTire(String tireName, String tireBrand, int tireSize) {
		super(tireName, tireBrand, tireSize);
	}
	
	public void showSpecialTire() {
		System.out.println(this.tireName+" : Special Tire");
	}

}
