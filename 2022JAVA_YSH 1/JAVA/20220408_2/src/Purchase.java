
public class Purchase implements IPurchase{
	private Customer customer;
	private Product product;
	
	public Purchase() {}
	
	//1. 구매
	@Override
	public void buy() {
		System.out.println("구매");
	}
	//2. 반품
	@Override
	public void refund() {
		System.out.println("반품");
	}
	//3. 구매목록
	@Override
	public void showList() {
		System.out.println("구매목록");
	}
	
}	
