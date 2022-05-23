package pkg.test;

import java.util.ArrayList;

import org.json.simple.JSONArray;

public interface TestService {
	public ArrayList<testVO> getTestList(String gbn1, String gbn2);
	public JSONArray getJsonArray(ArrayList<testVO> testList);
}
