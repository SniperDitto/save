package pkg.service;

import java.util.ArrayList;

public class SportsServiceImpl implements SportsService{

	@Override
	public ArrayList<String> getSports() {
		ArrayList<String> sportList = new ArrayList<String>();
		sportList.add("야구");
		sportList.add("축구");
		sportList.add("농구");
		
		
		return sportList;
	}
	
}
