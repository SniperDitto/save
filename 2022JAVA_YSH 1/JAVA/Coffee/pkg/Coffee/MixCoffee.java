package pkg.Coffee;

public class MixCoffee extends Coffee{

	public MixCoffee() {super();}
	public MixCoffee(String beansKind, String beansCountry) {
		super(beansKind, beansCountry);
	}
	
	public void MakeMixCoffee() {
		System.out.println("믹스커피를 탄다~");
	}
	
	
}
