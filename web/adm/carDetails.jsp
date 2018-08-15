<%-- 
    Document   : newBooking.jsp
    Created on : 20 Oct, 2016, 6:47:41 AM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import = "java.sql.*"
        import= "java.util.*" %>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../css/loginStyle.css">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <script src="../js/jquery.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <title>Car Details</title>
        
    </head>
    <body>
        <h6><br/></h6>
            
            
<form method="post" action="modifyCar.jsp">
<div class="container">
	<div class="row">
            
            
            
            
            
        
        <div class="col-md-12">
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   <th>Plate Number</th>
                    <th>Car Name</th>
                     <th>Charge Per KM</th>
                     <th>Charge Per Hr</th>
                     <th>AC</th>
                     <th>Cost</th>
                      <th>Edit</th>
                       <th>Delete</th>
                       <th></th>
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
            csmt = con.prepareCall("{call listAllCar()}");
            t = csmt.execute();
            System.out.println(t);
            rs = csmt.getResultSet();
            System.out.println(rs.toString());
//            rsmt = rs.getMetaData();
//            System.out.println(rsmt);
//            System.out.println(rs.getString("plate_no").toString());
//            int cols = rsmt.getColumnCount();
             while(rs.next()) {%>
                <tr>
                    <td name="plate"><%= rs.getString("plate_no")%></td>
                    <td><%= rs.getString("cname")%></td>
                    <td><%= rs.getDouble("charge_per_km")%></td>
                    <td><%= rs.getDouble("charge_per_hr")%></td>
                    <td>
                        <% if(rs.getInt("ac")==0){%>
                        Non AC
                        <%} else{%>
                        AC
                        <%}%>
                    </td>
                    <td><%= rs.getDouble("cost")%></td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button name="edit"  value="<%= rs.getString("plate_no")%>" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-pencil"></span></button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button name="delete"  value="<%= rs.getString("plate_no")%>"class="btn btn-danger btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-trash"></span></button></p></td>
    <td><p data-placement="top" data-toggle="tooltip" title="Delete"><button name="stat"  value="<%= rs.getString("plate_no")%>"class="btn btn-info btn-xs" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="glyphicon glyphicon-cog"></span></button></p></td>
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
  <div class="col-sm-4"></div>
  <div class="col-sm-4"></div>
  <a href="newCar.jsp" class="btn btn-primary" role="button">
      <span class="glyphicon glyphicon-plus"> Add New Car</span>
  </a>
  <a href="rentDetails.jsp" class="btn btn-primary" role="button">
      <span class="glyphicon glyphicon-plus"> Rent Details</span>
  </a>
  <div class="col-sm-4"></div>
</div>
</div>
    
    



      
    </div>
    </body>
   
</html>
