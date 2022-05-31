package pkg.admin.ErrorHandler;

import java.util.Map;

public class ErrorHandler {
	//db에러처리
	public void goDBErrorPage(Map<String, String[]> map) {
		
		for(String key : map.keySet()) {
			String[] err = map.get(key);
			if(key.equals("errCode")) {
				for(String s : err) {
					if(!s.equals("SUC")) {
						//쉴패~!!~!~!~!
					}
				}
			}
		}
		
	}
}
