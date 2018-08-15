<%-- 
    Document   : checkNewBooking.jsp
    Created on : 22 Oct, 2016, 12:32:51 PM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../css/loginStyle.css">
        <script src="../js/jquery.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <title>New Reservation Details</title>
    </head>
    <body>
        <h1><br/></h1>
        <%
            String carId = request.getParameter("carId");
            String strDate = request.getParameter("strDate");
            String strTime = request.getParameter("strTime");
            String endDate = request.getParameter("endDate");
            String endTime = request.getParameter("endTime");
            String custId = (String)session.getAttribute("userid");
            
            System.out.println(carId+" "+strDate+" "+strTime+" "+endDate+" "+endTime);
            
            String strDateTime = strDate+" "+strTime+":00";
            System.out.println("Start Date Time: "+strDateTime);
            String endDateTime = endDate+" "+endTime+":00";
            System.out.println("End Date Time: "+endDateTime);
            System.out.println("custID: "+ custId);
            
            String output = "Success!";
        %>
        <h6><br/></h6>
        
        <jsp:useBean id="calender" class="contoller.CalenderHandler" scope="page"/> 
        <jsp:useBean id="customer" class="contoller.Customer" scope="page" />
        <% if(calender.compareTwoDateTime(strDateTime,endDateTime)!=1){
              output = "Date Time Error!";
        }
        else{
            boolean bool = customer.newReservation(custId, carId, strDateTime, endDateTime);
            if(bool){
                  output = "DB Insertion Error!";
            }
        }
            
        %>
        
        
        <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <!--img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" /> -->
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" method="post" action="rentDetails.jsp">
                <p align="center"><h4 align="center"><%= output %></h4></p>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Car Reservation</button>
            </form><!-- /form -->
        </div>
        
        
        
        
    </body>
</html>
