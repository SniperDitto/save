package pkg.Tire;

public class SmallTire extends Tire{
	
	public SmallTire() {
		super();
	}
	public SmallTire(String tireName, String tireBrand, int tireSize) {
		super(tireName, tireBrand, tireSize);
	}
	
	@Override
	public void tirePunk() {
		System.out.println(this.tireName + " : 쪼ㅑㄱ 찌져졌어요~");
	}
	
	public void checkProperty() {
		System.out.println("	타이어 이름 : "+this.tireName);
		System.out.println("	타이어 브랜드 : "+this.tireBrand);
		System.out.println("	타이어 크기 : "+this.tireSize+" inch");
	}
	
}
