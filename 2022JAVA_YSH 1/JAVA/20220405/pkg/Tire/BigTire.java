package pkg.Tire;

public class BigTire extends Tire{

	public BigTire() {
		super();
	}
	public BigTire(String tireName, String tireBrand, int tireSize) {
		super(tireName, tireBrand, tireSize);
	}
	
	@Override
	public void tirePunk() {
		System.out.println(this.tireName + " : 쫘아악 찌져졌어요~");
	}

}
