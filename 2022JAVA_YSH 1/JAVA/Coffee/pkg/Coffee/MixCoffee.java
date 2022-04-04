package pkg.Coffee;

public class MixCoffee extends Coffee{
	
	public int price;

	public MixCoffee() {super();}
	public MixCoffee(String beansKind, String beansCountry) {
		super(beansKind, beansCountry);
	}
	public MixCoffee(String beansKind, String beansCountry, int price) {
		super(beansKind, beansCountry);
		this.price = price;
	}
	
	public void MakeMixCoffee() {
		System.out.println("믹스커피를 탄다~");
	}
	
	
}
