package pkg.ui;

public class Work {
	public String getWork() {
		String strResult = "";

		Cal cal = new Cal();
		int i1 = cal.plus(1, 2);
		
		DBH db = new DBH();
		String r1 = db.getConn();
		
		strResult = i1 + r1;
		
		return strResult;
	}
	
}
