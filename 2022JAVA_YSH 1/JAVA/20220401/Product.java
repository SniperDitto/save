
public class Product {
	
	//속성
	public String pID;
	public String pName;
	public int pPrice;
	public int pMaxQty;
	
	//생성자
	public Product() {}
	public Product(String pID, String pName, int pPrice, int pMaxQty) {
		this.pID = pID;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pMaxQty = pMaxQty;
	}
	
	//메서드
	//물건 구매 갯수 제한 체크
	public boolean checkQty(int qty) {
		boolean isOK = true;
		if (qty > pMaxQty) {
			isOK = false;
			
		}
		
		return isOK;
	}
	
}
