package pkg.Coffee;

public class CanCoffee extends Coffee{
	
	public String coffeeBrand;

	public CanCoffee() {super();}
	public CanCoffee(String beansKind, String beansCountry) {
		super(beansKind, beansCountry);
	}
	public CanCoffee(String beansKind, String beansCountry, String coffeeBrand) {
		super(beansKind, beansCountry);
		this.coffeeBrand = coffeeBrand;
	}
	
}
