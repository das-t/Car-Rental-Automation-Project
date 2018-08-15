<%-- 
    Document   : repairUpdateFill
    Created on : 30 Oct, 2016, 9:19:44 AM
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
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
        <script src="../js/jquery.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1><br/></h1>
        
        <div class="container">
    <div class="row">
            <div class="panel panel-primary">
                    <div class="panel-body">
                        <form method="POST" action="repairUpdateAction.jsp" role="form">
                                    <div class="form-group">
                                            <h2>Repair Car Details</h2>
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupName">Plate Number</label>
                                            <input name="carId" value="<%= request.getParameter("carId")%>" readonly id="signupName" type="text" maxlength="50" class="form-control">
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupName">Repair Cost</label>
                                            <input name="repCost" id="signupName" type="text" maxlength="50" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <button id="signupSubmit" type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus"> End Repair</span></button>
                                    </div>
                                    <div class="form-group">
                                        <a href="repair.jsp" type="button" class="btn btn-info btn-block"><span class="glyphicon glyphicon-remove"> Go Back</span></a>
                                    </div>
                            </form>
                    </div>
            </div>
    </div>
</div>
        
        
        
    </body>
</html>
