<%-- 
    Document   : index.jsp
    Created on : 20 Oct, 2016, 7:59:02 PM
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
        <title>Admin Login</title>
    </head>
    <body>
        <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <!--img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" /> -->
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" method="post" action="loginCheck.jsp">
                <span id="reauth-email" class="reauth-email"></span>
                <input type="text" name="uid" id="inputEmail" class="form-control" placeholder="Admin ID" required autofocus>
                <input type="password" name="pwd" id="inputPassword" class="form-control" placeholder="Password" required>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Sign in</button>
            </form><!-- /form -->
            <br/>
            <a href="../index.jsp" class="forgot-password">
                User Login
            </a>
        </div><!-- /card-container -->
    </div><!-- /container -->
    </body>
</html>
