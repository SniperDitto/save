/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.62
 * Generated at: 2022-06-03 02:16:29 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.Admin.authList;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class memberList_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>members list</title>\r\n");
      out.write("<script\r\n");
      out.write("  src=\"https://code.jquery.com/jquery-3.6.0.js\"\r\n");
      out.write("  integrity=\"sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=\"\r\n");
      out.write("  crossorigin=\"anonymous\"></script>\r\n");
      out.write("<script type=\"text/javascript\" src=\"/jscss/js/common.js\"></script>\r\n");
      out.write("<script>\r\n");
      out.write("var ajaxObj = function(url, type, vars, params, async, dataType, sucFunc, errFunc){\r\n");
      out.write("	this.url = url;\r\n");
      out.write("	this.type = type;\r\n");
      out.write("	this.data = null;\r\n");
      out.write("	this.vars = vars;\r\n");
      out.write("	this.params = params;\r\n");
      out.write("	this.async = async;\r\n");
      out.write("	this.dataType = dataType;\r\n");
      out.write("	this.sucFunc = sucFunc;\r\n");
      out.write("	this.errFunc = errFunc;\r\n");
      out.write("	\r\n");
      out.write("	this.toJson = function(){\r\n");
      out.write("		\r\n");
      out.write("		var strJson = \"\";\r\n");
      out.write("		strJson += \"{\";\r\n");
      out.write("			for(var i=0;i<vars.length;i++){\r\n");
      out.write("				strJson += \"\\\"\" + this.vars[i] + \"\\\"\";\r\n");
      out.write("				strJson += \":\";\r\n");
      out.write("				strJson += \"\\\"\" + this.params[i] + \"\\\"\";\r\n");
      out.write("				if(i != vars.length - 1){\r\n");
      out.write("					strJson += \",\";\r\n");
      out.write("				}\r\n");
      out.write("			}\r\n");
      out.write("		strJson += \"}\";\r\n");
      out.write("		\r\n");
      out.write("		this.data = JSON.parse(strJson);			\r\n");
      out.write("	};\r\n");
      out.write("	\r\n");
      out.write("	this.ajaxExec = function(){\r\n");
      out.write("		$.ajax(\r\n");
      out.write("				{\r\n");
      out.write("					url : this.url,\r\n");
      out.write("					data : this.data,//{sid: \"\", sname:\"\"}\r\n");
      out.write("					type : this.type,\r\n");
      out.write("					async : this.async,\r\n");
      out.write("					dataType : this.dataType,\r\n");
      out.write("					\r\n");
      out.write("					success : this.sucFunc\r\n");
      out.write("					,\r\n");
      out.write("					error : this.errFunc\r\n");
      out.write("					\r\n");
      out.write("				} \r\n");
      out.write("			); \r\n");
      out.write("	};\r\n");
      out.write("	\r\n");
      out.write("};\r\n");
      out.write("	var selectMemberList = function(){\r\n");
      out.write("		var url = \"jsonMemberList\";\r\n");
      out.write("		var type = \"post\";\r\n");
      out.write("		var async = true;\r\n");
      out.write("		var vars = [\"searchText\"];\r\n");
      out.write("		var params = [$(\"#searchText\").val()];\r\n");
      out.write("		var dataType = \"json\";\r\n");
      out.write("		var sucFunc = function(data){\r\n");
      out.write("			$(data).each(function(){\r\n");
      out.write("				alert(this);\r\n");
      out.write("				//html ???????????? ?????????\r\n");
      out.write("			});\r\n");
      out.write("		}\r\n");
      out.write("		var failFunc = function(err){\r\n");
      out.write("			alert(\"??????~~!~!!~!~! : \"+err);\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("		var obj = new ajaxObj(url, type, vars, params, async, dataType);\r\n");
      out.write("		obj.toJson();\r\n");
      out.write("		obj.ajaxExec();\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	var selectAuthList = function(){\r\n");
      out.write("		var url = \"jsonAuthList\";\r\n");
      out.write("		var type = \"post\";\r\n");
      out.write("		var async = true;\r\n");
      out.write("		var vars = [\"authName\"];\r\n");
      out.write("		var params = [\"\"];\r\n");
      out.write("		var dataType = \"json\";\r\n");
      out.write("		var sucFunc = function(data){\r\n");
      out.write("			$.each(data,function(index, item){\r\n");
      out.write("				alert(index+item.authID);\r\n");
      out.write("				//html ?????????\r\n");
      out.write("			});	\r\n");
      out.write("			\r\n");
      out.write("		}\r\n");
      out.write("		var failFunc = function(err){\r\n");
      out.write("			alert(\"??????~~!~!!~!~! : \"+err);\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("		var obj = new ajaxObj(url, type, vars, params, async, dataType);\r\n");
      out.write("		obj.toJson();\r\n");
      out.write("		obj.ajaxExec();\r\n");
      out.write("	}\r\n");
      out.write("	\r\n");
      out.write("	$(document).ready(function(){\r\n");
      out.write("		$(\"#btnSearch\").click(function(){\r\n");
      out.write("			selectMemberList();\r\n");
      out.write("		});\r\n");
      out.write("		\r\n");
      out.write("		$(\"#btnAdd\").click(function(){\r\n");
      out.write("			selectAuthList();\r\n");
      out.write("		});\r\n");
      out.write("		\r\n");
      out.write("		$(\"input[name='mName'],select[name='authID']\").on(\"change\",function(){\r\n");
      out.write("			var chgIndex = $(this).attr(data);\r\n");
      out.write("			$(\"input[name='hval']\").eq();\r\n");
      out.write("		});\r\n");
      out.write("		\r\n");
      out.write("		\r\n");
      out.write("		//?????????????????? ????????? ????????? ???????????? ?????? ?????? mthid??? null????????? ??? ????????????\r\n");
      out.write("		//???????????? ??????(update)??? ????????? mauth??????????????? insert??? ???????\r\n");
      out.write("		//??????????????? ????????????, mauth ????????? ?????? merge ???????\r\n");
      out.write("	});\r\n");
      out.write("</script>\r\n");
      out.write("<style>\r\n");
      out.write("	body{\r\n");
      out.write("		margin:0px;\r\n");
      out.write("		font-size:12px;\r\n");
      out.write("	}\r\n");
      out.write("	#wrap{\r\n");
      out.write("		\r\n");
      out.write("	}\r\n");
      out.write("	.search{\r\n");
      out.write("		width:700px;\r\n");
      out.write("		border:0px solid red;\r\n");
      out.write("		padding:4px 0px 4px 0px;\r\n");
      out.write("		clear:both;\r\n");
      out.write("	}\r\n");
      out.write("	.row{\r\n");
      out.write("		width:700px;\r\n");
      out.write("		border:0px solid red;\r\n");
      out.write("		clear:both;\r\n");
      out.write("	}\r\n");
      out.write("	.col1{\r\n");
      out.write("		border:1px solid #444;\r\n");
      out.write("		width:50px;\r\n");
      out.write("		padding:2px 0px 3px 0px;\r\n");
      out.write("		display:block;\r\n");
      out.write("		text-align:center;\r\n");
      out.write("		float:left;\r\n");
      out.write("	}\r\n");
      out.write("	.col2{\r\n");
      out.write("		border:1px solid #444;\r\n");
      out.write("		width:170px;\r\n");
      out.write("		padding:4px 0px 5px 0px;\r\n");
      out.write("		display:block;\r\n");
      out.write("		text-align:center;\r\n");
      out.write("		float:left;\r\n");
      out.write("	}\r\n");
      out.write("	.col3{\r\n");
      out.write("		border:1px solid #444;\r\n");
      out.write("		width:170px;\r\n");
      out.write("		padding:4px 0px 5px 0px;\r\n");
      out.write("		display:block;\r\n");
      out.write("		text-align:center;\r\n");
      out.write("		float:left;\r\n");
      out.write("	}\r\n");
      out.write("	.col4{\r\n");
      out.write("		border:1px solid #444;\r\n");
      out.write("		width:280px;\r\n");
      out.write("		padding:4px 0px 4px 0px;\r\n");
      out.write("		display:block;\r\n");
      out.write("		text-align:center;\r\n");
      out.write("		float:left;\r\n");
      out.write("	}\r\n");
      out.write("	.col5{\r\n");
      out.write("		border:1px solid #444;\r\n");
      out.write("		width:10px;\r\n");
      out.write("		padding:4px 0px 4px 0px;\r\n");
      out.write("		display:block;\r\n");
      out.write("		text-align:center;\r\n");
      out.write("		float:left;\r\n");
      out.write("	}\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div id=\"wrap\">\r\n");
      out.write("	<div class=\"search\">\r\n");
      out.write("		<input type=\"text\" id=\"searchText\" name=\"searchText\"/>&nbsp;&nbsp;&nbsp;\r\n");
      out.write("		<input type=\"button\" value=\"??????\" id=\"btnSearch\"/>\r\n");
      out.write("		<input type=\"button\" value=\"??????\" id=\"btnAdd\"/>\r\n");
      out.write("		<input type=\"button\" value=\"??????\" id=\"btnSave\"/>\r\n");
      out.write("		<input type=\"button\" value=\"??????\" id=\"btnDelete\"/>\r\n");
      out.write("	</div>\r\n");
      out.write("	<div class=\"title\">\r\n");
      out.write("		\r\n");
      out.write("	</div>\r\n");
      out.write("	<div class=\"row\">\r\n");
      out.write("		<span>\r\n");
      out.write("			<input type=\"checkbox\" name=\"chkT\" value=\"\" class=\"col1\"/>\r\n");
      out.write("		</span>\r\n");
      out.write("		<span class=\"col2\">??????ID</span>\r\n");
      out.write("		<span class=\"col3\">????????????</span>\r\n");
      out.write("		<span class=\"col4\">????????????</span>\r\n");
      out.write("		<span class=\"col5\">&nbsp;</span>\r\n");
      out.write("	</div>\r\n");
      out.write("	<div class=\"row\">\r\n");
      out.write("		<span class=\"col1\">\r\n");
      out.write("			<input type=\"checkbox\" name=\"chk\" value=\"\"/>\r\n");
      out.write("		</span>\r\n");
      out.write("		<span>\r\n");
      out.write("			<input type=\"text\" name=mID value=\"\" class=\"col2\" readonly/>\r\n");
      out.write("		</span>\r\n");
      out.write("		<span>\r\n");
      out.write("			<input type=\"text\" name=\"mName\" value=\"\" class=\"col3\"/>\r\n");
      out.write("		</span>\r\n");
      out.write("		<span>\r\n");
      out.write("			<select name=\"authID\" class=\"col4\">\r\n");
      out.write("				<option value=\"\"></option>\r\n");
      out.write("			</select>\r\n");
      out.write("		</span>\r\n");
      out.write("		<span><!-- i, u -->\r\n");
      out.write("			<input type=\"text\" name=\"hval\" value=\"\" class=\"col5\"/>\r\n");
      out.write("		</span>\r\n");
      out.write("		<span><!-- mthid -->\r\n");
      out.write("			<input type=\"hidden\" name=\"mthID\" value=\"\" class=\"\"/>\r\n");
      out.write("		</span>\r\n");
      out.write("	</div>\r\n");
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
