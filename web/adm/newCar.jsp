<%-- 
    Document   : newCar.jsp
    Created on : 21 Oct, 2016, 7:05:17 AM
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
        <title>New Car</title>
    </head>
    <body>
        <h4><br/></h4>
        
        
        
        
        <div class="container">
    <div class="row">
            <div class="panel panel-primary">
                    <div class="panel-body">
                            <form method="POST" action="newCarAction.jsp" role="form">
                                    <div class="form-group">
                                            <h2>New Car Details</h2>
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupName">Plate Number</label>
                                            <input name="carId" id="signupName" type="text" maxlength="50" class="form-control">
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupEmail">Car Name</label>
                                            <input name="cname" id="signupEmail" type="text" name="cname"  maxlength="50" class="form-control">
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupEmailagain">Charge Per KM</label>
                                            <input name="kmCharge" id="signupEmailagain" type="tect" maxlength="50" class="form-control">
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupPassword">Charge Per Hour</label>
                                            <input name="hrCharge" id="signupPassword" type="text" maxlength="25" class="form-control" length="40">
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupPasswordagain">AC Type</label>
                                            <input name="acType" id="signupPasswordagain" type="text" maxlength="25" class="form-control">
                                    </div>
                                     <div class="form-group">
                                            <label class="control-label" for="signupPasswordagain">Cost</label>
                                            <input name="cost" id="signupPasswordagain" type="text" maxlength="25" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <button id="signupSubmit" type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus"> Insert Car</span></button>
                                    </div>
                                    <div class="form-group">
                                        <a href="carDetails.jsp" class="btn btn-info btn-block"><span class="glyphicon glyphicon-remove"> Car Details</span></a>
                                    </div>
                            </form>
                    </div>
            </div>
    </div>
</div>
    </body>
</html>
