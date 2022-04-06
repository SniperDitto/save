package pkg.Team.Exec;

import pkg.Team.Cars.Sedan;

public class Exec {

	public static void main(String[] args) {
		
		Sedan sedan = new Sedan("쏘나타",220);
		
		sedan.carRun();
		
		String sedanName = sedan.getCarName();
		int sedanMaxSpeed = sedan.getMaxSpeed();
		
		sedan.setMaxSpeed(230);
		
		

	}

}
