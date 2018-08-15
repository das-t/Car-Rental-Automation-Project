<%-- 
    Document   : updateAdvPaid
    Created on : 23 Oct, 2016, 12:02:19 PM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../css/loginStyle.css">
        <link rel="stylesheet" href="../css/editCarStyle.css">
        <script src="../js/jquery.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <title>Update Advance Payment</title>
    </head>
    <body>
        <br/>
        <jsp:useBean id="admin" class="contoller.AdminRent" scope="page"/>
        <jsp:useBean id="fare" class="contoller.FareCalculate" scope="page"/>
       <%
            Connection con = null;
        CallableStatement csmt = null;
        ResultSet rs = null;
        boolean t = true;
        int rentId = Integer.parseInt(request.getParameter("rentId"));
        System.out.println("rent id: "+rentId);
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");
            csmt = con.prepareCall("{call listRentDetail(?)}");
            csmt.setInt(1, rentId);
            t = csmt.execute();
            rs = csmt.getResultSet();
            double advanceFee = 0;
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
                 System.out.println("Admin ID: "+session.getAttribute("adminid"));
                 double hrrate= Double.parseDouble(rs.getString("charge_per_hr"));
                 advanceFee = fare.advancePayment(0, hrrate, 0, strDateTime, endDateTime);
        %>
        
        <div class="container">
    <div class="row">
            <div class="panel panel-primary">
                    <div class="panel-heading"><h4>Advance Payment for RentID: <%= rentId%></h4></div>
                    <div class="panel-body">
                                    
                                    <div class="form-group">
                                        <div><label class="control-label" for="signupEmail">Customer ID</label></div>
                                        <input value="<%= custId%>" class="form-control" readonly type="text">
                                    </div>
                                    
                                    <div class="form-group">
                                        <div><label class="control-label" for="signupEmail">Start Date Time</label></div>
                                        <input value="<%= strDateTime%>" class="form-control" readonly type="text">
                                    </div>
                                    
                                    <div class="form-group">
                                        <div><label class="control-label" for="signupEmail">End Date Time</label></div>
                                        <input value="<%= endDateTime%>" class="form-control" readonly type="text">
                                    </div>
                                    
                                    <div class="form-group">
                                        <div><label class="control-label" for="signupEmail">Advance Paid</label></div>
                                        <input value="<%= advPaid%>" class="form-control" readonly type="text">
                                    </div>
                                    
                                    <div class="form-group">
                                       <label class="control-label" for="signupEmail">Advance Fare</label>
                                       <input name="advFare" value="<%= advanceFee%>" type="text" readonly class="form-control">
                                   </div>
                                 
                                        <form method="post" action="updateAdvPaidAction.jsp">
                                    <div class="form-group">
                                        <button name="update" value="<%= rentId%>" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-ok"> Update Advance Payment</span></button>
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
