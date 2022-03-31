
public class Exec {

	public static void main(String[] args) {
		
		/*//------객체지향을 함수처럼 쓰는 경우---------
		Calculator c1 = new Calculator();
		System.out.println(c1.plus(1, 2));
		System.out.println(c1.minus(1, 2));
		*/
		
		
		//손님1
		// C001, 홍길동, 32, M 
		//cus1+주소는 stack에 저장, 값들은 heap에 저장
		Customer cus1 = new Customer();//heap에 인스턴스 생성
		cus1.cID = "C001";//heap에 저장되는 값들
		cus1.cName = "홍길동";
		cus1.cAge = 32;
		cus1.cGender = "M";
		//cus1.buyProduct("새우깡", 500);
		
		//손님2
		// C002, 전우치, 25, M
		Customer cus2 = new Customer();
		cus2.cID = "C002";
		cus2.cName = "전우치";
		cus2.cAge = 25;
		cus2.cGender = "M";
		System.out.println(cus2.getPlus(10, 100));
		//cus2.buyProduct("아이스크림", 1000);
		//cus2.buyProduct("새우깡", 300);
		//cus2.buyProduct("샴푸", 10000);
		
		
		//상품1
		Product prod1 = new Product();
		prod1.pName = "새우깡";
		prod1.pPrice = 500;
		prod1.limitAge = 0;
		//상품2
		Product prod2 = new Product();
		prod2.pName = "담배";
		prod2.pPrice = 5000;
		prod2.limitAge = 20;
		prod2.checkAge(cus1.cAge);
		prod2.checkAge(cus2.cAge);
		
		double[] ds = new double[3];
		
		float[] fs = new float[3];
		//--------------------------
		Car car1 = new Car();
		car1.birthYear= 2021;
		car1.strBrand = "현대";
		car1.strCarName = "SONATA";
		
		car1.carTires = new String[4];
		car1.carTires[0] = "한국타이어";
		car1.carTires[1] = "한국타이어";
		car1.carTires[2] = "금호타이어";
		car1.carTires[3] = "금호타이어";
		car1.carRun();
		
		Car car2 = new Car();
		car2.birthYear= 2020;
		car2.strBrand = "기아";
		car2.strCarName = "K5";
		
		car2.carTires = new String[4];
		car2.carTires[0] = "넥센타이어";
		car2.carTires[1] = "넥센타이어";
		car2.carTires[2] = "금호타이어";
		car2.carTires[3] = "금호타이어";
		car2.carRun();
		
		Car[] cars = new Car[3];
		cars[0] = new Car();
			cars[0].birthYear = 2019;
			cars[0].strBrand = "벤츠";
			cars[0].strCarName = "S_Class";
		cars[1] = new Car();
			cars[1].birthYear = 2020;
			cars[1].strBrand = "기아";
			cars[1].strCarName = "K7";
		cars[2] = new Car();
			cars[2].birthYear = 2021;
			cars[2].strBrand = "VOLVO";
			cars[2].strCarName = "트럭";
			cars[2].carTires = new String[10];
		
		for(int i=0;i<cars.length;i++) {
			cars[i].carRun();
		}
		
		//주차장
		Parks park = new Parks();
		park.parkCars = cars;
		park.showCarList();
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
