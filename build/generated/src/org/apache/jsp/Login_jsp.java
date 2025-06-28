package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"ISO-8859-1\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("    <title>Login | StudyPoint</title>\n");
      out.write("\n");
      out.write("   <link rel=\"stylesheet\" href=\"RegistrationCss.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <!-- Navbar -->\n");
      out.write("    <div class=\"navbar\">\n");
      out.write("        <a href=\"RegistrationUser.jsp\">Registration</a>\n");
      out.write("        <a href=\"Login.jsp\">Login</a>\n");
      out.write("        <a href=\"About.jsp\">About</a>\n");
      out.write("    </div>\n");
      out.write("    \n");
      out.write("\n");
      out.write("    <!-- Logo and Welcome Message Section -->\n");
      out.write("    <div class=\"logo-container\">\n");
      out.write("        <!-- Logo placed here with circular shape -->\n");
      out.write("        <img src=\"logo.jpg\" alt=\"Logo\">\n");
      out.write("        <!-- Welcome message next to logo -->\n");
      out.write("        <div class=\"welcome-message\">\n");
      out.write("            Welcome to Study Point\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("        <form action=\"LoginBackend\" method=\"post\">\n");
      out.write("            <table class=\"table\">\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"text\" placeholder=\"Full Name\" name=\"ID\" class=\"sizetext1\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"text\" placeholder=\"Student_Id Number\" name=\"User_Id\" class=\"sizetext1\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"password\" placeholder=\"Password\" name=\"pass\" class=\"sizetext1\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td><input type=\"password\" placeholder=\"Confirm Password\" name=\"conform_pass\" class=\"sizetext1\"></td>\n");
      out.write("                </tr>\n");
      out.write("                <tr>\n");
      out.write("                    <td style=\"text-align: center;\">\n");
      out.write("                        <input type=\"submit\" value=\"Login\" class=\"button\">\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("            </table>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
