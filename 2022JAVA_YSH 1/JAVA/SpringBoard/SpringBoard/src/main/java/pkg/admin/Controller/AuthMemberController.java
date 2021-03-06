package pkg.admin.Controller;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import pkg.admin.DTO.AuthDTO;
import pkg.admin.DTO.AuthMemberDTO;
import pkg.admin.Service.AuthListService;
import pkg.admin.Service.AuthMemberService;

@Controller
public class AuthMemberController {
	
	@Autowired
	private AuthMemberService authMemberService;
	@Autowired
	private AuthListService authListService;
	@Autowired
	private HttpServletResponse httpServletResponse;
	@Autowired
	private HttpServletRequest httpServletRequest;
	
	@RequestMapping("memberList")
	public String goMemberList() {
		
		
		return "/Admin/authList/memberList";
	}
	
	@ResponseBody
	@RequestMapping("jsonMemberList")
	public void MemberList(String searchText) {
		/*
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		Enumeration eHeader = request.getHeaderNames();
		while (eHeader.hasMoreElements()) {
		    String hName = (String)eHeader.nextElement();
		    String hValue = request.getHeader(hName);
		    System.out.println(hName + " : " + hValue + "");
		}
		*/
		List<AuthMemberDTO> memberList = authMemberService.getAuthMemberList(searchText);
		List<AuthDTO> authList = authListService.getAuthList("");
		
		//json을 담은 배열
		JSONArray jsonArray = new JSONArray();
		
		JSONObject jsonObject0 = new JSONObject();
		jsonObject0.put("authID", "");
		jsonObject0.put("authName", "선택");
		jsonArray.add(jsonObject0);
		
		for(AuthMemberDTO member : memberList) {
			//json 양식으로 만들기
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("mID", member.getmID());
			jsonObject.put("mName", member.getmName());
			jsonObject.put("authID", member.getAuthID());
			jsonObject.put("authName", member.getAuthName());
			jsonObject.put("mthID", member.getMthID());
			//mthid hidden으로 처리하기
			
			//배열에 담기
			jsonArray.add(jsonObject);
		}
		
		JSONArray jsonArray2 = new JSONArray();
		for(AuthDTO auth : authList) {
			//json 양식으로 만들기
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("authID", auth.getAuthID());
			jsonObject.put("authName", auth.getAuthName());
			//배열에 담기
			jsonArray2.add(jsonObject);
		}
		
		
	}

	@ResponseBody //json 사용
	@RequestMapping("jsonAuthList")
	public String JsonAuthList(String authName) {
		
		List<AuthDTO> authList = authListService.getAuthList(authName);
		
		JSONArray jsonArray = new JSONArray();
		for(AuthDTO auth : authList) {
			//json 양식으로 만들기
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("authID", auth.getAuthID());
			jsonObject.put("authName", auth.getAuthName());
			//배열에 담기
			jsonArray.add(jsonObject);
		}
		
		return jsonArray.toString();
		
	}
	
	@RequestMapping("memberSave")
	public String MemberSave(String[] mID, String[] mName, String[] authID, String[] hval, String[] mthID) {
		
		Map<String, String[]> map = new HashMap<String, String[]>();
		map.put("mID", mID);
		map.put("mName", mName);
		map.put("authID", authID);
		map.put("hval", hval);
		map.put("mthID", mthID);
		
		authMemberService.saveMemberList(map);
		
		return "/Admin/authList/memberList";
	}
	
	
	
	
}
