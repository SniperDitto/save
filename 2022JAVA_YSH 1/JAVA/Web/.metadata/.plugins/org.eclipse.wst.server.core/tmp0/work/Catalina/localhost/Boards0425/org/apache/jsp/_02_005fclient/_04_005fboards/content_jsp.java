/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.62
 * Generated at: 2022-05-13 07:22:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp._02_005fclient._04_005fboards;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import Pkg.Client.Boards.BoardVO;

public final class content_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("Pkg.Client.Boards.BoardVO");
    _jspx_imports_classes.add("java.util.ArrayList");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP?????? ?????? GET, POST ?????? HEAD ??????????????? ???????????????. Jasper??? OPTIONS ????????? ?????? ???????????????.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      Pkg.Client.Boards.BoardService bs = null;
      bs = (Pkg.Client.Boards.BoardService) _jspx_page_context.getAttribute("bs", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (bs == null){
        bs = new Pkg.Client.Boards.BoardService();
        _jspx_page_context.setAttribute("bs", bs, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      Pkg.Client.Boards.BoardVO vo = null;
      vo = (Pkg.Client.Boards.BoardVO) _jspx_page_context.getAttribute("vo", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (vo == null){
        vo = new Pkg.Client.Boards.BoardVO();
        _jspx_page_context.setAttribute("vo", vo, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.introspect(_jspx_page_context.findAttribute("vo"), request);
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");

	String loginID = (String)session.getAttribute("userID");
	
	if(loginID==null){
		response.sendRedirect("./list.jsp");
	}
	
	String hMenuID = request.getParameter("hMenuID");
	String lMenuID = vo.getlMenuID();
	out.println(vo.toString() + " hmenuid=" + hMenuID);
	
	
	String writeID = "";
	ArrayList<BoardVO> list = bs.getBoardList(vo.getIdx(), lMenuID);
	for(BoardVO b : list){
		writeID = b.getUserID();
	}

      out.write("\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>?????????</title>\r\n");
      out.write("<script>\r\n");
      out.write("var goWrite = function(){\r\n");
      out.write("	document.getElementById(\"hiddenForm\").submit();\r\n");
      out.write("}\r\n");
      out.write("var goDel = function(){\r\n");
      out.write("	//if(loginID==??????????????? ??? ????????? || loginID==\"ADMIN\"){\r\n");
      out.write("		location.href=\"./delete.jsp?idx=");
      out.print(vo.getIdx());
      out.write("&hMenuID=");
      out.print(hMenuID);
      out.write("&lMenuID=");
      out.print(lMenuID);
      out.write("&combine=");
      out.print(vo.getCombine());
      out.write("\";\r\n");
      out.write("	//}\r\n");
      out.write("	//else{\r\n");
      out.write("	//	alert('????????? ?????? ?????? ???????????????');\r\n");
      out.write("	//}\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<form name=\"hiddenForm\" action=\"./write.jsp\" method=\"post\" id=\"hiddenForm\">\r\n");
      out.write("	<input type=\"hidden\" name=\"idx\" id=\"idx\"/>\r\n");
      out.write("	<input type=\"hidden\" name=\"regnum\" id=\"regnum\"/>\r\n");
      out.write("	<input type=\"hidden\" name=\"lvl\" id=\"lvl\"/>\r\n");
      out.write("	<input type=\"hidden\" name=\"combine\" id=\"combine\"/>\r\n");
      out.write("	<input type=\"hidden\" name=\"ord\" id=\"ord\"/>\r\n");
      out.write("	<input type=\"hidden\" name=\"delnum\" id=\"delnum\"/>\r\n");
      out.write("	<input type=\"hidden\" name=\"hMenuID\" value=\"");
      out.print(hMenuID );
      out.write("\"/>\r\n");
      out.write("	<input type=\"hidden\" name=\"lMenuID\" value=\"");
      out.print(lMenuID );
      out.write("\"/>\r\n");
      out.write("</form>\r\n");
      out.write("<div>\r\n");
      out.write("	<table cellcpacing=\"0\" cellpadding=\"0\" width=\"700px\" border=\"1px\" align=\"center\">\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td width=\"700px\" height=\"30px\">\r\n");
      out.write("				<!-- ???????????? -->\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("		<tr>\r\n");
      out.write("			<td width=\"700px\" height=\"50px\" align=\"center\">\r\n");
      out.write("				<textarea name=\"reply\" id=\"reply\" style='width:600px;height:50px'></textarea>\r\n");
      out.write("				<input type=\"button\" value=\"??????\" style='width:50px;height:50px'/>\r\n");
      out.write("			</td>\r\n");
      out.write("		</tr>\r\n");
      out.write("	</table>\r\n");
      out.write("</div>\r\n");
      out.write("<div>\r\n");
      out.write("<a href=\"./write.jsp?idx=0\">????????????</a>\r\n");
      out.write("<a href=\"javascript:goWrite()\">????????????</a>\r\n");
if(loginID.equals(writeID)){ 
      out.write("\r\n");
      out.write("<a href=\"javascript:goDel()\">??? ??????</a>\r\n");
} 
      out.write("\r\n");
      out.write("<a href=\"./list.jsp?hMenuID=");
      out.print(hMenuID );
      out.write("\">??????</a>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
