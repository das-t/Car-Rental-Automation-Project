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
        <title>Rent Details</title>
        
    </head>
    <body>
                <h1>Hello <%= session.getAttribute("userid")%>!</h1>

        <h6><br/></h6>
        <form method="post" action="newBooking.jsp">
       

<div class="container">
	<div class="row">
		
        
            
            
         
   
</div>
            
            
            
            
            
        <div class="col-md-12">
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   <th>Plate Number</th>
                    <th>Car Name</th>
                    <th>AC Type</th>
                     <th>Charge Per KM</th>
                     <th>Charge Per Hr</th>
                      <th>Insert</th>
                   </thead>
    <tbody>
     <%
//        out.println(session.getAttribute("userid"));
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
             while(rs.next()) {%>
                <tr>
                    <td><%= rs.getString("plate_no")%></td>
                    <td><%= rs.getString("cname")%></td>
                    <td>
                        <%
                            String acType = "Non AC";
                            if(Integer.parseInt(rs.getString("ac"))==1){
                                acType = "AC";
                        }%>
                        <%= acType%>
                    </td>
                    <td><%= rs.getString("charge_per_km")%></td>
                    <td><%= rs.getString("charge_per_hr")%></td>
                    <td><p data-placement="top" data-toggle="tooltip" title="Edit"><button name="newBook" value="<%= rs.getString("plate_no")%>" class="btn btn-primary btn-xs" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="glyphicon glyphicon-plus"></span></button></p></td>
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
  <a href="managePhone.jsp" class="btn btn-primary" role="button">
      <span class="glyphicon glyphicon-earphone"> Manage Phones</span>
  </a>
  <div class="col-xs-3"></div>
  <a href="editBooking.jsp" class="btn btn-info" role="button">
      <span class="glyphicon glyphicon-pencil"> Edit Reservation</span>
  </a>
  <div class="col-sm-4"></div>
</div>
    </div>
    </body>
   
</html>
