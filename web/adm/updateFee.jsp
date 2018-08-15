<%-- 
    Document   : updateFee
    Created on : 23 Oct, 2016, 7:50:21 PM
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
        <title>Update Fee Payment</title>
    </head>
    <body>
        <h1><br/></h1>
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
                 
                 double kmCharge = Double.parseDouble(rs.getString("charge_per_km"));
                 double hrCharge = Double.parseDouble(rs.getString("charge_per_hr"));
                 System.out.println(kmCharge+" "+hrCharge);
                 double advanceAmount = fare.advancePayment(0, hrCharge, 0, strDateTime, endDateTime);
                 double totalAmount = fare.totalFare(kmCharge, hrCharge, dist, strDateTime, retDateTime);
                 double payableAmount = totalAmount-advanceAmount;
                 
        %>
        
        
     
        <form method="post" action="updateFeeCheck.jsp">
        <div class="container">
    <div class="row">
            <div class="panel panel-primary">
                    <div class="panel-heading"><h4>Update Fee Payment ID: <%= rentId%></h4></div>
                    <div class="panel-body">
                            
                        <input type="hidden" name="endDateTime" value="<%= endDateTime%>">
                        <input type="hidden" name="custId" value="<%= custId%>">
                        <input type="hidden" name="carId" value="<%= carId%>">
                        <input type="hidden" name="rentId" value="<%= rentId%>">
                        <input type="hidden" name="endDateTime" value="<%= endDateTime%>">
                        <input type="hidden" name="strDateTime" value="<%= strDateTime%>">
                                    
                                    <div class="form-group">
                                       <label class="control-label" for="signupEmail">Advance Fare</label>
                                       <input name="advFare" value="<%= advanceAmount%>" type="text" readonly class="form-control">
                                   </div>
                                    
                                    <div class="form-group">
                                        <div><label class="control-label" for="signupEmail">Total Fare</label></div>
                                        <input name="dist" value="<%= totalAmount%>" readonly class="form-control" type="text">
                                        
                                    </div>
                                    
                                        <% if(paid.equals("NO")){%>
                                    <div class="form-group">
                                        <div><label class="control-label" for="signupEmail">Payable Amount</label></div>
                                        <input name="retDate" value="<%= payableAmount%>" readonly class="form-control" type="text">
                                        
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <button name="update" value="<%= rentId%>" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-ok"> Update</span></button>
                                    </div>
                                        <%}%>
                            
                                    
                                    <div class="form-group">
                                        <a href="rentDetails.jsp" class="btn btn-danger btn-block" role="button">
                                        <span class="glyphicon glyphicon-arrow-left"> Go Back</span>
                                        </a>
                                    </div>
                                
                          
                    </div>
            </div>
    </div>
</div>
        </form>
                                    
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
