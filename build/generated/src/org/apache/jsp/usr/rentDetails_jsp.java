package org.apache.jsp.usr;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class rentDetails_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("        \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <h1>Hello ");
      out.print( session.getAttribute("userid"));
      out.write("!</h1>\n");
      out.write("        <form method=\"post\" action=\"newBooking.jsp\">\n");
      out.write("       \n");
      out.write("\n");
      out.write("<div class=\"container\">\n");
      out.write("\t<div class=\"row\">\n");
      out.write("\t\t\n");
      out.write("        \n");
      out.write("            \n");
      out.write("            \n");
      out.write("         \n");
      out.write("   \n");
      out.write("</div>\n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("            \n");
      out.write("        <div class=\"col-md-12\">\n");
      out.write("        <h4>AC Car Booking</h4>\n");
      out.write("        <div class=\"table-responsive\">\n");
      out.write("\n");
      out.write("                \n");
      out.write("              <table id=\"mytable\" class=\"table table-bordred table-striped\">\n");
      out.write("                   \n");
      out.write("                   <thead>\n");
      out.write("                   <th>Plate Number</th>\n");
      out.write("                    <th>Car Name</th>\n");
      out.write("                    <th>AC Type</th>\n");
      out.write("                     <th>Charge Per KM</th>\n");
      out.write("                     <th>Charge Per Hr</th>\n");
      out.write("                      <th>Insert</th>\n");
      out.write("                   </thead>\n");
      out.write("    <tbody>\n");
      out.write("     ");

        out.println(session.getAttribute("userid"));
        Connection con = null;
        CallableStatement csmt = null;
        ResultSet rs = null;
        boolean t = true;
        ResultSetMetaData rsmt = null;
        
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");
            csmt = con.prepareCall("{call listAllAvailRentCustCar()}");
//            csmt.setInt(1, 0); // shows only non-ac cars
            t = csmt.execute();
            rs = csmt.getResultSet();
            System.out.println(rs.toString());
            rsmt = rs.getMetaData();
            System.out.println(rsmt);
            
            int cols = rsmt.getColumnCount();
             while(rs.next()) {
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td>");
      out.print( rs.getString("plate_no"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString("cname"));
      out.write("</td>\n");
      out.write("                    <td>\n");
      out.write("                        ");

                            String acType = "Non AC";
                            if(Integer.parseInt(rs.getString("ac"))==1){
                                acType = "AC";
                        }
      out.write("\n");
      out.write("                        ");
      out.print( acType);
      out.write("\n");
      out.write("                    </td>\n");
      out.write("                    <td>");
      out.print( rs.getString("charge_per_km"));
      out.write("</td>\n");
      out.write("                    <td>");
      out.print( rs.getString("charge_per_hr"));
      out.write("</td>\n");
      out.write("                    <td><p data-placement=\"top\" data-toggle=\"tooltip\" title=\"Edit\"><button name=\"newBook\" value=\"");
      out.print( rs.getString("plate_no"));
      out.write("\" class=\"btn btn-primary btn-xs\" data-title=\"Edit\" data-toggle=\"modal\" data-target=\"#edit\" ><span class=\"glyphicon glyphicon-plus\"></span></button></p></td>\n");
      out.write("                </tr>\n");
      out.write("            </tbody>\n");
      out.write("             ");
}} catch(Exception ex){
                ex.getMessage();
                } finally{
                    try{
                        
                        csmt.close();
                        con.close();
                    } catch(Exception ex){
                        ex.getMessage();
                    }
             }
      out.write("  \n");
      out.write("    </tbody>\n");
      out.write("        \n");
      out.write("</table>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("            \n");
      out.write("        </div>\n");
      out.write("\t</div>\n");
      out.write("      \n");
      out.write("      <div class=\"row\">\n");
      out.write("  <div class=\"col-xs-3\"></div>\n");
      out.write("  <a href=\"managePhone.jsp\" class=\"btn btn-primary\" role=\"button\">\n");
      out.write("      <span class=\"glyphicon glyphicon-earphone\">Manage Phones</span>\n");
      out.write("  </a>\n");
      out.write("  <div class=\"col-xs-3\"></div>\n");
      out.write("  <a href=\"editBooking.jsp\" class=\"btn btn-info\" role=\"button\">\n");
      out.write("      <span class=\"glyphicon glyphicon-pencil\">Edit Reservation</span>\n");
      out.write("  </a>\n");
      out.write("  <div class=\"col-sm-4\"></div>\n");
      out.write("</div>\n");
      out.write("    </div>\n");
      out.write("    </body>\n");
      out.write("   \n");
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
