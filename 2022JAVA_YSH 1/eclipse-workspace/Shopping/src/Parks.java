
public class Parks {
	
	public Car[] parkCars;
	
	public void showCarList() {
		for(int i=0;i<parkCars.length;i++) {
			System.out.println(parkCars[i].strCarName+"(이)가 주차되어 있음.");
		}
	}
	
}
