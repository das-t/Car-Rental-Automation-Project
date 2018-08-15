<%-- 
    Document   : newUser.jsp
    Created on : 22 Oct, 2016, 9:27:45 PM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
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
        <title>New User</title>
    </head>
    <body>
        
        <br/><br/>
        <div class="container">
    <div class="row">
            <div class="panel panel-primary">
                    <div class="panel-body">
                            <form method="POST" action="newUserCheck.jsp" role="form">
                                    <div class="form-group">
                                            <h2>User Details</h2>
                                    </div>
                                    
                                    <div class="form-group">
                                            <label class="control-label" for="signupEmail">Mail ID</label>
                                            <input name="umail" id="signupEmail" type="text" maxlength="50" class="form-control">
                                    </div>
                                
                                    <div class="form-group">
                                            <label class="control-label" for="signupEmail">Name</label>
                                            <input name="uname"  id="signupEmail" type="text" maxlength="50" class="form-control">
                                    </div>
                                
                                    <div class="form-group">
                                            <label class="control-label" for="signupEmail">Password</label>
                                            <input name="upass" id="signupEmail" type="password" maxlength="50" class="form-control">
                                    </div>
                                    
                                    <div class="form-group">
                                            <label class="control-label" for="signupEmail">Phone Number</label>
                                            <input name="uphone"  id="signupEmail" type="text" maxlength="50" class="form-control">
                                    </div>
                                    
                                    <div class="form-group">
                                        <button id="signupSubmit" type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-ok"> Create Account</span></button>
                                    </div>
                            
                                    
                                    <div class="form-group">
                                        <a href="../index.jsp" class="btn btn-info btn-block" role="button">
                                        <span class="glyphicon glyphicon-remove">User Login</span>
                                        </a>
                                    </div>
                                    
                            </form>
                          
                    </div>
            </div>
    </div>
</div>
                                    
                                    
    </body>
</html>
