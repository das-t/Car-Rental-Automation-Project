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
        <script src="../js/jquery.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <title>Edit Booking</title>
        
    </head>
    <body>
        <h1>Hello <%= session.getAttribute("userid")%>!</h1>
        <form method="post" action="editCheck.jsp">
       

<div class="container">
	<div class="row">

            
            
            
            
            
        <div class="col-md-12">
        <h6><br/></h6>
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   <th>Plate Number</th>
                    <th>Start DateTime</th>
                    <th>End DateTime</th>
                    <th>Advance Paid</th>
                     <th>Charge Per KM</th>
                     <th>Charge Per Hr</th>
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
            csmt = con.prepareCall("{call loadAllRentedCustCar(?)}");
            csmt.setString(1, custId); // shows only non-ac cars
            t = csmt.execute();
            rs = csmt.getResultSet();
            System.out.println(rs.toString());
           
             while(rs.next()) {%>
                <tr>
    <input type="hidden" name="bookId" value="<%= rs.getString("id")%>"/>
                    <td><%= rs.getString("car_id")%></td>
                    <td><%= rs.getString("str_datetime")%></td>
                    <td><%= rs.getString("end_date")%></td>
                    <td>
                        <%if(rs.getString("adv_paid").equals("YES")){%>
                        YES
                        <%}else{%>
                        NO
                        <%}%>
                    </td>
                    <td><%= rs.getDouble("charge_per_km")%></td>
                    <td><%= rs.getDouble("charge_per_hr")%></td>
                    
                    <td><button name="delete" value="<%= rs.getString("car_id")%>" class="btn btn-block btn-danger btn-xs"><span class="glyphicon glyphicon-minus"></span></button></td>
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
  <a href="rentDetails.jsp" class="btn btn-primary" role="button">
      <span class="glyphicon glyphicon-plus">New Reservation</span>
  </a>
  <div class="col-sm-4"></div>
</div>
    
    
    </div>
    </body>
   
</html>
