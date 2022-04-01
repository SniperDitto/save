
public class Customer {
	//속성
	public String cID;
	public String cName;
	public int cAge;
	public Product[] orderProducts;
	public int orderQty=0;//물건산횟수
	
	//생성자(Constructor)
	public Customer() {
		this.orderProducts = new Product[10];
		this.orderQty = 0;
	}
	//생성자 오버로딩(OverLoading)
	public Customer(String cID, String cName, int cAge) {
		this.cID = cID;
		this.cName = cName;
		this.cAge = cAge;
		this.orderProducts = new Product[10];
		this.orderQty = 0;
	}
	public Customer(String cID, String cName, int cAge, int totalProduct) {
		this.cID = cID;
		this.cName = cName;
		this.cAge = cAge;
		this.orderProducts = new Product[totalProduct];
		this.orderQty = 0;
	}
	
	//메서드
		//상품 구매
		//고객이 상품을 몇 개 구매
	public void orderProduct(Product p, int qty) {
		
		//(고객나이)세 (고객이름) 고객이
		//	가격 (상품가격)인 (상품이름)을
		//	(구매갯수)개 구매함.
		String strMsg = "";
		strMsg += this.cAge + "세 ";
		strMsg += this.cName + " 고객이 ";
		strMsg += "가격 " + p.pPrice + "인 ";
		strMsg += p.pName + "을(를) ";
		strMsg += qty + "개 구매";
		
		System.out.println(strMsg);
		
		
		//상품 갯수 확인 위해 상품 클래스에서 메서드 가져와 확인
		//상품에 관련된 내용이므로 상품 클래스에 내용 작성해야 함
		if(p.checkQty(qty)) {
			System.out.println(" -> 구매 완.");
			//장바구니에 상품 추가
			orderProducts[orderQty] = p;
			orderQty++;
			
		}else {
			System.out.println(" -> 구매 쉴패.");
		}
			
	}
	
	//구매한 상품 목록 - 구매한 상품 담을 장바구니 클래스 필요
	public void showOrderList(){
		System.out.println("========================");
		System.out.println("고객 이름 : \t"+this.cName);
		System.out.println("------------------------");
		System.out.println("상품명\t\t가격");
		System.out.println("------------------------");
		for(int i=0;i<orderQty;i++) {
			System.out.println(orderProducts[i].pName+"\t\t"+orderProducts[i].pPrice);
		}
		System.out.println("========================");
	}
	
}
