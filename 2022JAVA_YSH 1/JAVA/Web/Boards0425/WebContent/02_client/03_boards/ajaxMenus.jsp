<%@page import="Pkg.Client.Menus.LmenuVO"%>
<%@page import="Pkg.Client.Menus.HmenuVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Pkg.Client.Menus.MenuService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>old Menu</title>
<script type="text/javascript">
	var setLMenus = function(){
		var selHmenu = document.getElementById("hMenus").value;
		
		location.href = "./ajaxMenus.jsp?hMenus="+selHmenu;
		
	}
	

</script>
</head>
<body>
<%	
	String hMenuStr = request.getParameter("hMenus");

	MenuService ms = new MenuService();
	ArrayList<HmenuVO> hMenus = ms.getHmenus();
	ArrayList<LmenuVO> lMenus = ms.getLmenus(hMenuStr);
	
	
	
%>
<div>
	주메뉴 : 
	<select name="hMenus" id="hMenus" onchange="setLMenus()">
		<%for(HmenuVO hm : hMenus){ %>
			<option value="<%=hm.getMenuID()%>" <%if(hm.getMenuID().equals(hMenuStr)){ %>selected="selected"<%} %>><%=hm.getMenuName() %></option>
		<%} %>
	</select>
</div>
<div>
	서브메뉴 : 
	<select name="lMenus" id="lMenus">
		<%for(LmenuVO lm : lMenus){ %>
			<option value="<%=lm.getlMenuID()%>"><%=lm.getlMenuName() %></option>
		<%} %>
	</select>
</div>
</body>
</html>