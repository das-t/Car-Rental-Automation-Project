<%-- 
    Document   : rentDetails
    Created on : 23 Oct, 2016, 9:00:24 AM
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
        <title>Rent Details</title>
    </head>
    <body>
                <h1>Hello <%= session.getAttribute("adminid")%>!</h1>

        <h6><br/></h6>
        
        <div class="container">
	<div class="row">
</div>   
        <div class="col-md-12">
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   <th>Rent<br/>ID</th>
                    <th>User<br/>ID</th>
                    <th>Plate<br/>Number</th>
                    <th>Start Date Time</th>
                    <th>End Date Time</th>
                    <th>Advance <br/>Paid</th>
                    <th>Distance</th>
                    <th>Return Date Time</th>
                    <th>Fare<br/>Paid</th>
                   </thead>
    <tbody>
     <%
//        out.println(session.getAttribute("adminid"));
        Connection con = null;
        CallableStatement csmt = null;
        ResultSet rs = null;
        boolean t = true;
        ResultSetMetaData rsmt = null;
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");
            csmt = con.prepareCall("{call listAllRentDetails()}");
            t = csmt.execute();
            rs = csmt.getResultSet();
            System.out.println(rs.toString());
            rsmt = rs.getMetaData();
            System.out.println(rsmt);
            
            int cols = rsmt.getColumnCount();
             while(rs.next()) {%>
                <tr>
                    <td><%= rs.getString("id")%></td>
                    <td><%= rs.getString("cust_id")%></td>
                    <td><%= rs.getString("car_id")%></td>
                    <td><%= rs.getString("str_datetime")%></td>
                    <td><%= rs.getString("end_date")%></td>
                    <td><%= rs.getString("adv_paid")%></td>
                    <td><%= rs.getString("dist")%></td>
                    <td><%= rs.getString("ret_datetime")%></td>
                    <td><%= rs.getString("paid")%></td>
                    <form method="post" action="rentUpdate.jsp">
                    <td><button name="edit" value="<%= rs.getString("id")%>" class="btn btn-primary btn-xs"><span class="glyphicon glyphicon-pencil"></span></button></td>
                    </form>
                    <form method="post" action="rentDelete.jsp">
                    <td><button name="delete" value="<%= rs.getString("id")%>" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span></button></td>
                    </form>
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
        </div>
      
      <div class="row">
  <div class="col-xs-3"></div>
  <a href="carDetails.jsp" class="btn btn-primary" role="button">
      <span class="glyphicon glyphicon-arrow-left"> Car Details</span>
  </a>
  <div class="col-xs-3"></div>
  <div class="col-sm-4"></div>
</div>
    </div>
    </body>
</html>