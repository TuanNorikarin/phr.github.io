package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <!-- login23:11-->\n");
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
      out.write("\n");
      out.write("    <body>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("            \n");
      out.write("            $(document).ready(function () {\n");
      out.write("                \n");
      out.write("                \n");
      out.write("//                                function parseJwt (token) {\n");
      out.write("//                                        var token = localStorage.getItem(\"key\");\n");
      out.write("//                                        \n");
      out.write("//                                        var base64Url = token.split('.')[1];\n");
      out.write("//                                        var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');\n");
      out.write("//                                        var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {\n");
      out.write("//                                            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);\n");
      out.write("//                                        }).join(''));\n");
      out.write("//\n");
      out.write("//                                        var a = JSON.parse(jsonPayload);\n");
      out.write("//                                        console.log(a);\n");
      out.write("//                                    };\n");
      out.write("//                var token = localStorage.getItem(\"key\");\n");
      out.write("//                console.log(token);\n");
      out.write("//                if (token !== \"\") {\n");
      out.write("//                    var role = localStorage.getItem(\"roleIdLogin\");\n");
      out.write("//                    console.log(role);\n");
      out.write("//                    if (role === \"admin\") {\n");
      out.write("//                        window.location.href = \"adminIndex.jsp\";\n");
      out.write("//                    } else if (role === \"receptionist\") {\n");
      out.write("//                        window.location.href = \"receptionistIndex.jsp\";\n");
      out.write("//                    } else if (role === \"doctor\") {\n");
      out.write("//                        window.location.href = \"doctorIndex.jsp\";\n");
      out.write("//                    } else if (role === \"user\") {\n");
      out.write("//                        window.location.href = \"userIndex.jsp\";\n");
      out.write("//                    }\n");
      out.write("//                }\n");
      out.write("//                var val = \"\";\n");
      out.write("                $(\"#login\").click(function (event) {\n");
      out.write("                    event.preventDefault();\n");
      out.write("                    $('#user').removeClass('error');\n");
      out.write("                    $('#password').removeClass('error');\n");
      out.write("                    document.getElementById('messageUsername').innerHTML = \"\";\n");
      out.write("                    document.getElementById('messagePassword').innerHTML = \"\";\n");
      out.write("                    document.getElementById('message').innerHTML = \"\";\n");
      out.write("                    \n");
      out.write("                    var user = $(\"input[name='user']\").val(); //lấy giá trị trong input user\n");
      out.write("                    var password = $(\"input[name='password']\").val();\n");
      out.write("                    \n");
      out.write("                    console.log(user);\n");
      out.write("                    console.log(password);\n");
      out.write("                    \n");
      out.write("                    if (user.length === 0) {\n");
      out.write("                        $('#user').addClass('error');\n");
      out.write("                        document.getElementById('messageUsername').style.color = 'red';\n");
      out.write("                        document.getElementById('messageUsername').innerHTML = 'Phone is empty ✘';\n");
      out.write("                    } else if (password.length === 0) {\n");
      out.write("                        $('#password').addClass('error');\n");
      out.write("                        document.getElementById('messagePassword').style.color = 'red';\n");
      out.write("                        document.getElementById('messagePassword').innerHTML = 'Password is empty ✘';\n");
      out.write("                    } else {\n");
      out.write("                        $.ajax({\n");
      out.write("                            type: \"POST\",\n");
      out.write("                            \n");
      out.write("                            contentType: \"application/json\",\n");
      out.write("                            data: JSON.stringify(\n");
      out.write("                            {\n");
      out.write("                                \"username\": user,\n");
      out.write("                                \"password\": password\n");
      out.write("                            }\n");
      out.write("                            ),\n");
      out.write("                            url: \"http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/authentications/login\",\n");
      out.write("                            success: function (data) {\n");
      out.write("//                                alert(data);\n");
      out.write("//                                localStorage.setItem(\"name\", data.name);\n");
      out.write("//                                localStorage.setItem(\"userInformation\", JSON.stringify(data));\n");
      out.write("//                                localStorage.setItem(\"password\", data.password);\n");
      out.write("//                                localStorage.setItem(\"roleIdLogin\", data.roleId);\n");
      out.write("                                \n");
      out.write("//                                if (data.roleId === \"admin\") {\n");
      out.write("                                    localStorage.setItem(\"key\", data);\n");
      out.write("//                                    localStorage.setItem(\"image\", data.image);\n");
      out.write("//                                    localStorage.setItem(\"userId\", data.id);\n");
      out.write("                                    \n");
      out.write("                                    console.log(data);\n");
      out.write("                                    \n");
      out.write("                                    \n");
      out.write("                                    \n");
      out.write("                                    \n");
      out.write("////                                    \n");
      out.write("                                   \n");
      out.write("                                    \n");
      out.write("                                    \n");
      out.write("                                    \n");
      out.write("                                    \n");
      out.write("//                                    \n");
      out.write("//                                    \n");
      out.write("//                                    window.location.href = \"adminIndex.jsp\";\n");
      out.write("//                                }\n");
      out.write("//                                else if (data.roleId === \"receptionist\") {\n");
      out.write("//                                    localStorage.setItem(\"key\", data.token);\n");
      out.write("//                                    localStorage.setItem(\"image\", data.image);\n");
      out.write("//                                    localStorage.setItem(\"clinicId\", data.clinicId.id);\n");
      out.write("//                                    localStorage.setItem(\"userId\", data.id);\n");
      out.write("//                                    window.location.href = \"receptionistIndex.jsp\";\n");
      out.write("//                                } else if (data.roleId.name === \"doctor\") {\n");
      out.write("//                                    localStorage.setItem(\"key\", data.token);\n");
      out.write("//                                    localStorage.setItem(\"image\", data.image);\n");
      out.write("//                                    localStorage.setItem(\"clinicId\", data.clinicId.id);\n");
      out.write("//                                    localStorage.setItem(\"userId\", data.id);\n");
      out.write("//                                    window.location.href = \"doctorIndex.jsp\";\n");
      out.write("//                                } else if (data.roleId.name === \"user\") {\n");
      out.write("//                                    localStorage.setItem(\"key\", data.token);\n");
      out.write("//                                    localStorage.setItem(\"image\", data.image);\n");
      out.write("//                                    localStorage.setItem(\"user\", JSON.stringify(data));\n");
      out.write("//                                    localStorage.setItem(\"userId\", data.id);\n");
      out.write("//                                    localStorage.setItem(\"phone\", data.phone);\n");
      out.write("//                                    window.location.href = \"userIndex.jsp\";\n");
      out.write("//                                }\n");
      out.write("                            },\n");
      out.write("                            error: function (jqXHR, textStatus, errorThrown) {\n");
      out.write("//                                console.log(data);\n");
      out.write("                                document.getElementById('message').style.color = 'red';\n");
      out.write("                                document.getElementById('message').innerHTML = '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Incorrect phone or password ✘';\n");
      out.write("                            }\n");
      out.write("                        });\n");
      out.write("                    }\n");
      out.write("                });\n");
      out.write("            });\n");
      out.write("        </script>\n");
      out.write("\n");
      out.write("        <div class=\"main-wrapper account-wrapper\">\n");
      out.write("            <div class=\"account-page\">\n");
      out.write("                <div class=\"account-center\">\n");
      out.write("                    <div class=\"account-box\">\n");
      out.write("                        <form id =\"form-signin\" class=\"form-signin\">\n");
      out.write("                            <div class=\"account-logo\">\n");
      out.write("                                <a href=\"#\"><img src=\"assets/img/logo-dark.png\" alt=\"\"></a>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label>Phone</label>\n");
      out.write("                                <input type=\"text\" id=\"user\" name=\"user\" class=\"form-control\"/>\n");
      out.write("                                <span id='messageUsername'></span>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label>Password</label>\n");
      out.write("                                <input class=\"form-control\" id=\"password\" name=\"password\" type=\"password\" />\n");
      out.write("                                <span id='messagePassword'></span>\n");
      out.write("                            </div>\n");
      out.write("                            <span id='message'></span>\n");
      out.write("                            <!--                            <div class=\"form-group text-right\">\n");
      out.write("                                                            <a href=\"forgot-password.html\">Forgot your password?</a>\n");
      out.write("                                                        </div>-->\n");
      out.write("\n");
      out.write("\n");
      out.write("                            <!--                            <div class=\"text-center register-link\">\n");
      out.write("                                                            Don’t have an account? <a href=\"register.html\">Register Now</a>\n");
      out.write("                                                        </div>-->\n");
      out.write("                        </form>\n");
      out.write("                        <div class=\"form-group text-center\">\n");
      out.write("                            <button id=\"login\" type=\"submit\" class=\"btn btn-primary account-btn\">Login</button>\n");
      out.write("                        </div>\n");
      out.write("                        <div id=\"data\"> </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("        </div>\n");
      out.write("        <script src=\"assets/js/jquery-3.2.1.min.js\"></script>\n");
      out.write("        <script src=\"assets/js/popper.min.js\"></script>\n");
      out.write("        <script src=\"assets/js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"assets/js/app.js\"></script>\n");
      out.write("        <script src=\"http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js\"></script>\n");
      out.write("\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("\n");
      out.write("    <!-- login23:12-->\n");
      out.write("</html>");
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
