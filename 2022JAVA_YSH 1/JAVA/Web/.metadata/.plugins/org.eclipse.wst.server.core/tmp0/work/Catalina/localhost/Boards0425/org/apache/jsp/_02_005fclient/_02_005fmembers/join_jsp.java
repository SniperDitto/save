/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.62
 * Generated at: 2022-04-28 06:42:43 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp._02_005fclient._02_005fmembers;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class join_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = null;
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
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>회원가입</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("	<div id=\"wrap\">\r\n");
      out.write("	<form method=\"post\" action=\"./join_ok.jsp\">\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<span>아이디</span>\r\n");
      out.write("			<span>\r\n");
      out.write("				<input type=\"text\" name=\"userID\" id=\"userID\" class=\"\"/>\r\n");
      out.write("			</span>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<span>비밀번호</span>\r\n");
      out.write("			<span>\r\n");
      out.write("				<input type=\"password\" name=\"userPass\" id=\"userPass\" class=\"\"/>\r\n");
      out.write("			</span>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<span>이름</span>\r\n");
      out.write("			<span>\r\n");
      out.write("				<input type=\"text\" name=\"userName\" id=\"userName\" class=\"\"/>\r\n");
      out.write("			</span>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<span>성별</span>\r\n");
      out.write("			<span>\r\n");
      out.write("				<input type=\"radio\" name=\"userGen\" id=\"userGenM\" class=\"\" value=\"M\"/>남자\r\n");
      out.write("				&nbsp;&nbsp;\r\n");
      out.write("				<input type=\"radio\" name=\"userGen\" id=\"userGenF\" class=\"\" value=\"F\"/>여자\r\n");
      out.write("			</span>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<span>취미</span>\r\n");
      out.write("			<span>\r\n");
      out.write("				<input type=\"checkbox\" name=\"userHobby\" id=\"userHobby1\" class=\"\" value=\"Reading\"/>독서\r\n");
      out.write("				&nbsp;&nbsp;\r\n");
      out.write("				<input type=\"checkbox\" name=\"userHobby\" id=\"userHobby2\" class=\"\" value=\"Exercise\"/>운동\r\n");
      out.write("				&nbsp;&nbsp;\r\n");
      out.write("				<input type=\"checkbox\" name=\"userHobby\" id=\"userHobby3\" class=\"\" value=\"Game\"/>게임\r\n");
      out.write("				&nbsp;&nbsp;\r\n");
      out.write("				<input type=\"checkbox\" name=\"userHobby\" id=\"userHobby4\" class=\"\" value=\"Programming\"/>코딩\r\n");
      out.write("				&nbsp;&nbsp;\r\n");
      out.write("			</span>\r\n");
      out.write("		</div>\r\n");
      out.write("		<div class=\"row\">\r\n");
      out.write("			<span>\r\n");
      out.write("				<input type=\"submit\" name=\"btn\" id=\"btn\" class=\"\" value=\"확인\"/>\r\n");
      out.write("			</span>\r\n");
      out.write("		</div>\r\n");
      out.write("	</form>\r\n");
      out.write("	</div>\r\n");
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
