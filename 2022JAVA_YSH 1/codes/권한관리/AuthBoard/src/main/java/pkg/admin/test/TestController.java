package pkg.admin.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	
	@ResponseBody
	@RequestMapping(value="test")//ajax url
	public String testFunc(@RequestBody Map<String, Object> map) {
		//하나의 vo만 이 방법으로 받아진다(입력창 여러개 : 배열로는 안됨) 
		//@RequestBody 붙이면 http통신 시 body에서 json형태로 주고받는다


		//List<TestVO> list = (List<TestVO>) map.get("배열이 담긴 객체");
		
		String id = (String) map.get("id");
		String name = (String) map.get("name");
		ArrayList<TestVO> list = (ArrayList<TestVO>) map.get("testData");
		//여러가지 데이터를 ajax + json으로 주고받을 수 있다
		
		return "123";
	}
	
}
