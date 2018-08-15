<%-- 
    Document   : repair
    Created on : 23 Oct, 2016, 11:11:16 PM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>


<!DOCTYPE html>
<html>
    <head>
        
<script type="text/javascript">
//function getTaskId(){
//var id = document.getElementById('getTaskId').value;
//alert(id);
//}
 </script>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../css/loginStyle.css">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <script src="../js/jquery.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
        
    </head>
    <body>
        <h1>Hello <%= session.getAttribute("userid")%>!</h1>
            
            
<form method="post" action="repairAction.jsp">
<div class="container">
	<div class="row">
            
            <select class="form-control" >
  <option>Mustard</option>
  <option>Ketchup</option>
</select>
            
            
            <div class = "btn-group">
   <button type = "button" class = "btn btn-primary dropdown-toggle" data-toggle = "dropdown">
      Primary 
      <span class = "caret"></span>
   </button>
   
   <ul class = "dropdown-menu" role = "menu">
      <li><a href = "#">Action</a></li>
      <li><a href = "#">Another action</a></li>
      <li><a href = "#">Something else here</a></li>
      
      <li class = "divider"></li>
      <li><a href = "#">Separated link</a></li>
   </ul>
   
</div>
            
            
            
            
            
        
        <div class="col-md-12">
        <h4>AC Car Booking</h4>
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   <th>Plate Number</th>
                    <th>Car Name</th>
                     <th>Charge Per KM</th>
                     <th>Charge Per Hr</th>
                     <th>AC</th>
                     <th>Cost</th>
                      <th>Start<br/>Repair</th>
                   </thead>
    <tbody>
     <%
        out.println(session.getAttribute("userid"));
        Connection con = null;
        CallableStatement csmt = null;
        ResultSet rs = null;
        boolean t = true;
        ResultSetMetaData rsmt = null;
        
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");
            csmt = con.prepareCall("{call listAvailRepPlateNo()}");
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
                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button name="carId"  value="<%= rs.getString("plate_no")%>" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-plus-sign"></span></button></p></td>
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
  <div class="col-sm-4">
      <a href="newCar.jsp" class="btn btn-primary" role="button">
      <span class="glyphicon glyphicon-plus"> Go Back</span>
  </a></div>
  <div class="col-sm-4">
  <a href="repairAction.jsp" class="btn btn-primary" role="button">
      <span class="glyphicon glyphicon-plus"> Start Repair</span>
  </a></div>
  <div class="col-sm-4">
      <a href="repairUpdate.jsp" class="btn btn-primary" role="button">
      <span class="glyphicon glyphicon-plus"> Repair Details</span>
  </a></div>
</div>
</div>
    
    



      
</div></form>
    </body>
   
</html>
