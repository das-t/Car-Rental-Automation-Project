<%-- 
    Document   : addPhone.jsp
    Created on : 23 Oct, 2016, 12:17:06 AM
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
        <title>Add Phone</title>
    </head>
    <body>
        <h1><br/></h1>
        
        
        <br/><br/>
        <div class="container">
    <div class="row">
            <div class="panel panel-primary">
                    <div class="panel-body">
                            <form method="POST" action="addPhoneCheck.jsp" role="form">
                                    <div class="form-group">
                                            <h3>Phone Number</h3>
                                    </div>
                                    
                                    <div class="form-group">
                                            <input name="phone" id="signupEmail" type="text" maxlength="50" class="form-control">
                                    </div>
                                
                                   
                                  
                                    
                                    <div class="form-group">
                                        <button id="signupSubmit" type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-ok"> Add</span></button>
                                    </div>
                            
                                    
                                    <div class="form-group">
                                        <a href="managePhone.jsp" class="btn btn-info btn-block" role="button">
                                        <span class="glyphicon glyphicon-remove"> Back</span>
                                        </a>
                                    </div>
                                    
                            </form>
                          
                    </div>
            </div>
    </div>
</div>
        
    </body>
</html>
