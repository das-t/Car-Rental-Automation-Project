<%-- 
    Document   : managePhone
    Created on : 22 Oct, 2016, 10:28:30 PM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../css/loginStyle.css">
        <script src="../js/jquery.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <title>Manage Phone</title>
    </head>
    <body>
        
        <form method="post" action="deletePhone.jsp">
        <div class="container">
	<div class="row">
		
        
            
            
         
   
</div>
            
            
            
            
            
        <div class="col-md-12">
        <h4><br/></h4>
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   <th>Phone Number</th>
                    <th>Delete</th>
                   </thead>
    <tbody>
     <%
//        out.println(session.getAttribute("userid"));
        Connection con = null;
        CallableStatement csmt = null;
        ResultSet rs = null;
        boolean t = true;
        ResultSetMetaData rsmt = null;
        String custId = (String) session.getAttribute("userid");
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");
            csmt = con.prepareCall("{call listAllPhoneUser(?)}");
            csmt.setString(1, custId);
            t = csmt.execute();
            rs = csmt.getResultSet();
            System.out.println(rs.toString());
            rsmt = rs.getMetaData();
            System.out.println(rsmt);
            
            int cols = rsmt.getColumnCount();
             while(rs.next()) {%>
                <tr>
                    <td><%= rs.getString("phn_no")%></td>
                    <td><button name="phone_id" value="<%= rs.getString("id")%>" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span></button></td>
                </tr>
            </tbody>
             <%}} catch(Exception ex){
                ex.getMessage();
                } finally{
                    try{
                        
                        csmt.close();
                        con.close();
                    } catch(Exception ex){
                        ex.getMessage();
                    }
             }%>  
    </tbody>
        
</table>
                
            </div>
            
        </div>
        </div></form>
      
      <div class="row">
  <div class="col-xs-3"></div>
  <a href="rentDetails.jsp" class="btn btn-primary" role="button">
      <span class="glyphicon glyphicon-arrow-left"> Rent Details</span>
  </a>
  <div class="col-xs-3"></div>
  <a href="addPhone.jsp" class="btn btn-info" role="button">
      <span class="glyphicon glyphicon-phone-alt"> Add Phone</span>
  </a>
  <div class="col-sm-4"></div>
</div>
    </div>
    
    
    
    </body>
</html>
