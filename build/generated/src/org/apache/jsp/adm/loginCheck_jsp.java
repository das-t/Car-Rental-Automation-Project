package org.apache.jsp.adm;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class loginCheck_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../bootstrap/css/bootstrap.css\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"../css/loginStyle.css\">\n");
      out.write("        <script src=\"../js/jquery.js\"></script>\n");
      out.write("        <script src=\"../bootstrap/js/bootstrap.min.js\"></script>\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    ");

        String uid = request.getParameter("uid");
        String pwd = request.getParameter("pwd");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        String str = null;
        
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");
            csmt = con.prepareCall("{?= call getAdminPass(?)}");
            csmt.registerOutParameter(1, java.sql.Types.VARCHAR);
            csmt.setString(2, uid);
            csmt.execute();
            str = csmt.getString(1);
            if(pwd.equals(str)){
                session.setAttribute("adminid", uid);
                response.sendRedirect("carDetails.jsp");
            }
            /*else{
                out.println("Invalid Admin Credential!");
            }*/
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally{
            try {
                csmt.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    
      out.write("\n");
      out.write("\n");
      out.write("        <h1>Hello World!</h1>\n");
      out.write("        \n");
      out.write("        <div class=\"container\">\n");
      out.write("        <div class=\"card card-container\">\n");
      out.write("            <!-- <img class=\"profile-img-card\" src=\"//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120\" alt=\"\" /> -->\n");
      out.write("            <!--img id=\"profile-img\" class=\"profile-img-card\" src=\"//ssl.gstatic.com/accounts/ui/avatar_2x.png\" /> -->\n");
      out.write("            <p id=\"profile-name\" class=\"profile-name-card\"></p>\n");
      out.write("            <form class=\"form-signin\" method=\"post\" action=\"login.jsp\">\n");
      out.write("                <p align=\"center\"><h4 align=\"center\">Invalid Credential</h4></p>\n");
      out.write("                <button class=\"btn btn-lg btn-primary btn-block btn-signin\" type=\"submit\">Admin Login</button>\n");
      out.write("            </form><!-- /form -->\n");
      out.write("        </div>\n");
      out.write("    </body>\n");
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
