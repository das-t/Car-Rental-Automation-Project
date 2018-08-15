<%-- 
    Document   : newUserCheck
    Created on : 22 Oct, 2016, 9:47:39 PM
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
        <title>New User</title>
    </head>
    <body>
        <h1><br/></h1>
        <jsp:useBean id="cust" class="contoller.Customer" scope="page" />
        <%
            String uid = (String)request.getParameter("uid").trim();
            String name = (String) request.getParameter("uname").trim();
            String pwd = (String)request.getParameter("upass").trim();
            String message = null;
            if(uid!=null && name!=null && pwd!=null){
                Boolean bool = cust.saveCustomer(uid, name, pwd);
                if(!bool){
                    message = "Account Created!";
                }
                else{
                    message = "User ID already present!";
                }
            }
            else{
                message = "Invalid User Infromation";
            }
        %>
        
        
        <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <!--img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" /> -->
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" method="post" action="../index.jsp">
                <p align="center"><h4 align="center"><%= message %></h4></p>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit" >User Login</button>
            </form><!-- /form -->
        </div>
    </body>
</html>
