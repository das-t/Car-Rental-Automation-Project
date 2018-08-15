<%-- 
    Document   : modifyCar.jsp
    Created on : 21 Oct, 2016, 12:19:13 AM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../css/editCarStyle.css">
        <script src="../js/jquery.js"></script>
        <title>Car Statistics</title>
    </head>
    
    <jsp:useBean id="stat" class="contoller.Statistics" scope="page"/>
    <body>
        <h4><br/></h4>
        <%
            
            String checkDelete = request.getParameter("delete");
            String checkEdit = request.getParameter("edit");
            String carId = request.getParameter("stat");
            Double cost = stat.getRepairCost(carId);
            double count = stat.getRepairCount(carId);
            double avgCost = 0;
            if(count!=0)
                avgCost = cost/count;
            System.out.println("Cost: "+cost);
            if(checkDelete!=null){
                response.sendRedirect("deleteCar.jsp?carId="+checkDelete);
            }
            else if(checkEdit!=null){
                response.sendRedirect("editCar.jsp?carId="+checkEdit);
            }
        %>
        
        
        
        
        <h1><br/></h1>
        
        <div class="container">
    <div class="row">
            <div class="panel panel-primary">
                    <div class="panel-body">
                        <form method="POST" action="repairUpdateAction.jsp" role="form">
                                    <div class="form-group">
                                            <h2> Car Statistics</h2>
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupName">Plate Number</label>
                                            <input name="carId" value="<%= carId%>" readonly id="signupName" type="text" maxlength="50" class="form-control">
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupName">Total Repair Cost</label>
                                            <input name="repCost" value="<%= cost%>" readonly id="signupName" type="text" maxlength="50" class="form-control">
                                    </div>
                                     <div class="form-group">
                                            <label class="control-label" for="signupName">Total Repair Sessions</label>
                                            <input name="repCost" value="<%= count%>" readonly id="signupName" type="text" maxlength="50" class="form-control">
                                    </div>
                                     <div class="form-group">
                                            <label class="control-label" for="signupName">Average Repair Cost</label>
                                            <input name="repCost" value="<%= avgCost%>" readonly id="signupName" type="text" maxlength="50" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <a href="carDetails.jsp" type="button" class="btn btn-info btn-block"><span class="glyphicon glyphicon-remove"> Go Back</span></a>
                                    </div>
                            </form>
                    </div>
            </div>
    </div>
</div>
    </body>
</html>
