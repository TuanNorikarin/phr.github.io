package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class hahaha_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("\n");
      out.write("\n");
      out.write("    <!-- blog23:34-->\n");
      out.write("    <head>\n");
      out.write("        \n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, user-scalable=0\">\n");
      out.write("\n");
      out.write("        <link rel=\"shortcut icon\" type=\"image/x-icon\" href=\"assets/img/logo-dark.png\">\n");
      out.write("        <title>PHR - Manage Personal Health Record</title>\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/bootstrap.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/font-awesome.min.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/style.css\">\n");
      out.write("        <link rel=\"stylesheet\" type=\"text/css\" href=\"assets/css/customStyle.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            .error {\n");
      out.write("                border-color: #FF0000 !important;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("                                <body>\n");
      out.write("                                   \n");
      out.write("                                    <div class=\"main-wrapper account-wrapper\">\n");
      out.write("                                        <form id=\"form\" action=\"parse\">\n");
      out.write("                                        <textarea name=\"jwt\">eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkrDtGhuIETDs8OoIiwiYWRtaW4iOnRydWV9.469tBeJmYLERjlKi9u6gylb-2NsjHLC_6kZNdtoOGsA</textarea>\n");
      out.write("                                        <textarea name=\"out\"></textarea>\n");
      out.write("                                        <input type=\"submit\" value=\"parse\" />\n");
      out.write("                                    </form>\n");
      out.write("\n");
      out.write("                                    </div>\n");
      out.write("                                    <script src=\"assets/js/jquery-3.2.1.min.js\"></script>\n");
      out.write("                                    <script src=\"assets/js/popper.min.js\"></script>\n");
      out.write("                                    <script src=\"assets/js/bootstrap.min.js\"></script>\n");
      out.write("                                    <script src=\"assets/js/app.js\"></script>\n");
      out.write("                                    <script src=\"http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js\"></script>\n");
      out.write("                                    <script type=\"text/javascript\">\n");
      out.write("                                        $(document).ready(function () {\n");
      out.write("                                                                                            \n");
      out.write("                                            let b64DecodeUnicode = str => decodeURIComponent(\n");
      out.write("                                                      Array.prototype.map.call(atob(str), c =>\n");
      out.write("                                                        '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2)\n");
      out.write("                                                      ).join(''))\n");
      out.write("\n");
      out.write("                                                  let parseJwt = token =>\n");
      out.write("                                                    JSON.parse(\n");
      out.write("                                                      b64DecodeUnicode(\n");
      out.write("                                                        token.split('.')[1].replace('-', '+').replace('_', '/')\n");
      out.write("                                                      )\n");
      out.write("                                                    )\n");
      out.write("\n");
      out.write("\n");
      out.write("                                                  let form = document.getElementById(\"form\")\n");
      out.write("                                                  form.addEventListener(\"submit\", (e) => {\n");
      out.write("                                                     form.out.value = JSON.stringify(\n");
      out.write("                                                        parseJwt(form.jwt.value)\n");
      out.write("                                                     )\n");
      out.write("                                                     e.preventDefault();\n");
      out.write("                                                  })\n");
      out.write("                                        });\n");
      out.write("                                    </script>\n");
      out.write("\n");
      out.write("                                </body>\n");
      out.write("\n");
      out.write("                                <!-- login23:12-->\n");
      out.write("                                </html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
