<%-- 
    Document   : repairAction
    Created on : 29 Oct, 2016, 7:59:55 PM
    Author     : tisan
--%>

<%@page import="contoller.Repair"%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../css/loginStyle.css">
        <script src="../js/jquery.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="rep" class="contoller.Repair" scope="page" />
        <%
            String message = "Unable to repair";
            String carId = request.getParameter("carId");
            boolean bool = rep.addRepairCar(carId);
            if(!bool){
                message = carId+" is in repair";
            }
        %>
        
        <div class="container" >
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <!--img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" /> -->
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" method="post" action="repair.jsp">
            <h3 align="center"><span class="label label-success col-sm-12">Car: <%= message%></span></h3>
            <br/>
            <br/>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Go Back</button>
            </form><!-- /form -->
            <br/>
        </div><!-- /card-container -->
    </div><!-- /container -->
    </body>
</html>

