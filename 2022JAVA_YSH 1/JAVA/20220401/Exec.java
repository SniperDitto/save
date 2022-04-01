
public class Exec {

	public static void main(String[] args) {
		
		//1. 첫번째 고객 생성
		Customer cus1 = new Customer();
		cus1.cID = "C001";
		cus1.cName = "홍길동";
		cus1.cAge = 30;
		
		
		//2. 두번째 고객 생성
		Customer cus2 = new Customer();
		cus2.cID = "C002";
		cus2.cName = "완똥";
		cus2.cAge = 52;
		
		
		//3. 첫번째 상품 생성
		Product p1 = new Product();
		p1.pID = "P001";
		p1.pName = "썀푸";
		p1.pPrice = 10000;
		p1.pMaxQty = 10;
		
		//4. 두번째 상품 생성
		Product p2 = new Product();
		p2.pID = "P002";
		p2.pName = "똥";
		p2.pPrice = 8000;
		p2.pMaxQty = 20;
		
		//고객1이 상품 p1 3개 구매
		cus1.orderProduct(p1, 3);
		cus2.orderProduct(p2, 10);
		cus2.orderProduct(p2, 100);
		cus1.showOrderList();
		cus2.showOrderList();
		
		
		Car car1 = new Car();
		car1.carName = "차1";
		car1.carMaxSpeed = 190;
		car1.carMaxPerson = 5;
		
		Car car2 = new Car("차2",180,6);
		
		
		
		
	}

}
