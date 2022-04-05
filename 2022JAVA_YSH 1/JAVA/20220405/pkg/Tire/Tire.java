package pkg.Tire;

public class Tire {
	
	public String tireName;
	public String tireBrand;
	public int tireSize;
	
	public Tire() {}
	public Tire(String tireName, String tireBrand, int tireSize) {
		this.tireName = tireName;
		this.tireBrand = tireBrand;
		this.tireSize = tireSize;
	}
	
	public void tirePunk() {
		System.out.println(this.tireName+"이 짝 찌져졌다.");
	}
	
}
