<%-- 
    Document   : rentEdit
    Created on : 23 Oct, 2016, 9:34:01 AM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../css/editCarStyle.css">
        <script src="../js/jquery.js"></script>
        
        
        <link rel="stylesheet" href="../css/bootstrap-clockpicker.css">
        <link rel="stylesheet" href="../css/standalone.css">
        <script src="../js/clockpicker.js"></script>
        
        <script src="../js/bootstrap-datepicker.js"></script>
        <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
        <title>JSP Page</title>
    </head>
    
    <script type="text/javascript">
     $(function(){
$('.clockpicker').clockpicker();
     });
</script>

<script>
    $(function(){
        $('.datepicker').datepicker();
    });
    </script>
    
    <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('.date').datepicker({
                    startView: 1
                });
            
            });
        </script>

        
    <body>
        <%
            Connection con = null;
        CallableStatement csmt = null;
        ResultSet rs = null;
        boolean t = true;
        int rentId = Integer.parseInt(request.getParameter("edit"));
        System.out.println("rent id: "+rentId);
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");
            csmt = con.prepareCall("{call listRentDetail(?)}");
            csmt.setInt(1, rentId);
            t = csmt.execute();
            rs = csmt.getResultSet();
             if(rs.next()) {
                 String custId = rs.getString("cust_id");
                 String strDateTime = rs.getString("str_datetime");
                 String endDateTime = rs.getString("end_date");
                 String advPaid = rs.getString("adv_paid");
                 Double dist = Double.parseDouble(rs.getString("dist"));
                 System.out.println("CustId: "+custId);
                 String retDateTime = rs.getString("ret_datetime");
                 String carId = rs.getString("car_id");
                 String paid = rs.getString("paid");
                 System.out.println(custId+strDateTime);
                 
        %>
        
        <div class="container">
    <div class="row">
            <div class="panel panel-primary">
                    <div class="panel-heading"><h4>Edit Reservation ID: <%= rentId%></h4></div>
                    <div class="panel-body">
                            
                                    
                                    
                                    <div class="form-group">
                                        <div><label class="control-label" for="signupEmail">Advance Paid</label></div>
                                        <input value="<%= advPaid%>" class="form-control" readonly type="text">
                                    </div>
                                    
                                    <div class="form-group">
                                       <label class="control-label" for="signupEmail">Advance Fare</label>
                                       <input name="advFare" type="text" readonly class="form-control">
                                   </div>
                                    
                                    <div class="form-group">
                                        <div><label class="control-label" for="signupEmail">Distance Traveled (KM)</label></div>
                                        <input value="<%= dist%>" class="form-control" type="text">
                                        
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <div><label class="control-label" for="signupEmail">Return Date</label></div>
                                        <input name="retDate" readonly class="datepicker form-control" data-date-format="yyyy-mm-dd" type="text" value="2016-10-22">
                                        
                                    </div>
                                    
                                    <div class="form-group">
                                   <div class="clockpicker" data-placement="top" data-autoclose="true">
                                       <label class="control-label" for="signupEmail">Return Time</label>
                                       <input name="retTime" readonly type="text" class="form-control" value="00:00">
                                    </div>     
                                    </div>
                                 
                                        <form method="post" action="updateAdvPaid.jsp">
                                    <div class="form-group">
                                        <button name="update" value="<%= rentId%>" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-ok"> Update Advance Payment</span></button>
                                    </div>
                                        </form>
                                    
                                    <form method="post" action="updateRet.jsp">
                                    <div class="form-group">
                                        <button name="update" value="<%= rentId%>" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-ok"> Update Return Date Time</span></button>
                                    </div>
                                    </form>
                            
                                    
                                    <div class="form-group">
                                        <a href="rentDetails.jsp" class="btn btn-danger btn-block" role="button">
                                        <span class="glyphicon glyphicon-arrow-left"> Go Back</span>
                                        </a>
                                    </div>
                                
                          
                    </div>
            </div>
    </div>
</div>
                                    
     <%
         }
        }catch(Exception ex){
            ex.getMessage();
        }finally{
            try{
                csmt.close();
                con.close();
            } catch(Exception ex){
                ex.getMessage();
            }
        }
     %>                     
                                    
    </body>
</html>
