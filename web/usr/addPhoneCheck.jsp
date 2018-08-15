<%-- 
    Document   : addPhoneCheck
    Created on : 23 Oct, 2016, 12:33:14 AM
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
        <title>Add Phone</title>
    </head>
    <body>
        <h1><br/></h1>
        <jsp:useBean id="cust" class="contoller.Customer" scope="page"/>
        <%
            String custId = (String) session.getAttribute("userid");
            int phone = Integer.parseInt(request.getParameter("phone"));
            boolean bool = cust.addPhnRecord(custId, phone);
            String message = "Failure!";
            if(!bool){
                message = "Success!";
            }
        %>
        
        <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <!--img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" /> -->
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" method="post" action="managePhone.jsp">
                <p align="center"><h4 align="center"><%= message %></h4></p>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit"> Manage Phones</button>
            </form><!-- /form -->
        </div>
    </body>
</html>
