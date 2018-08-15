<%-- 
    Document   : updateRetCheck
    Created on : 23 Oct, 2016, 6:39:38 PM
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
        <title>Update Return</title>
    </head>
    <body>
        <h1><br/></h1>
        <h6><br/></h6>
        <jsp:useBean id="admin" class="contoller.AdminRent" scope="page"/>
        <jsp:useBean id="calender" class="contoller.CalenderHandler" scope="page" />
        <%
            System.out.println("RENT ID: "+request.getParameter("rentId"));
            
            int rentId = Integer.parseInt(request.getParameter("rentId"));
            String retDate = request.getParameter("retDate");
            String retTime = request.getParameter("retTime");
            String startDateTime = request.getParameter("strDateTime");
            String retDateTime = retDate+" "+retTime+":00";
            double dist = Double.parseDouble(request.getParameter("dist"));
            System.out.println(rentId+" "+retDateTime+" "+startDateTime+" "+dist);
            
            String message = "Updated!";
            int compareDate = calender.compareTwoDateTime(startDateTime, retDateTime);
            if(compareDate!=1){
                message = "Return Time should be later than Start Time!";
            }
            else{
                boolean boolDist = admin.updateDistance(rentId, dist);
                boolean boolRet = admin.updateReturnDateTime(rentId, retDateTime);
                if(boolDist || boolRet){
                    message = "DB Insetion Error!";
                }
            }
        %>
        
        
        <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <!--img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" /> -->
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" method="post" action="rentDetails.jsp">
                <p align="center"><h4 align="center"><%= message%></h4></p>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Rent Detail</button>
            </form><!-- /form -->
        </div>
    </body>
</html>
