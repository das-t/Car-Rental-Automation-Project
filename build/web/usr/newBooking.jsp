<%-- 
    Document   : newBooking.jsp
    Created on : 22 Oct, 2016, 8:21:06 AM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import= "java.sql.*"%>
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
        <title>New Reservation</title>
        
        
<script type="text/javascript">
     $(function(){
$('.clockpicker').clockpicker();
     });
</script>

<script>
    $(function(){
        $('.datepicker').datepicker();
    });
    </script>


<script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {
                
                $('.date').datepicker({
                    startView: 1
                });
            
            });
        </script>

    </head>
    <body>
        <h3><br/></h3>
        
        <%
            String carId = request.getParameter("newBook");
            System.out.println(carId);
            
            if(carId!=null && !carId.trim().equals("")){
                
            }
            else{
                response.sendRedirect("../error.jsp");
            }
        %>
            
            
            
            
            
            <div class="container">
    <div class="row">
            <div class="panel panel-primary">
                    <div class="panel-body">
                            <form method="POST" action="checkNewBooking.jsp" role="form">
                                    <div class="form-group">
                                            <h2>Reservation Details</h2>
                                    </div>
                                    <div class="form-group">
                                            
                                            <input id="signupName" type="hidden" name="carId" value="<%= carId%>" maxlength="50" class="form-control">
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupEmail">Car Plate No</label>
                                            <input name="cname" value="<%= carId%>" readonly id="signupEmail" type="text" name="cname" maxlength="50" class="form-control">
                                    </div>
                                    
                                    <div class="form-group">
                                        <div><label class="control-label" for="signupEmail">Departure Date</label></div>
                                        <input  name="strDate" class="datepicker form-control" readonly data-date-format="yyyy-mm-dd" type="text" value="2016-10-22">
                                        
                                    </div>
                                    
                                    <div class="form-group">
                                   <div class="clockpicker" data-placement="bottom" data-autoclose="true">
                                       <label class="control-label" for="signupEmail">Departure Time</label>
                                       <input name="strTime" type="text" readonly class="form-control" value="00:00">
                                    </div>     
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <div><label class="control-label" for="signupEmail">Arrival Date</label></div>
                                        <input name="endDate" readonly class="datepicker form-control" data-date-format="yyyy-mm-dd" type="text" value="2016-10-22">
                                        
                                    </div>
                                    
                                    <div class="form-group">
                                   <div class="clockpicker" data-placement="top" data-autoclose="true">
                                       <label class="control-label" for="signupEmail">Arrival Time</label>
                                       <input name="endTime" readonly type="text" class="form-control" value="00:00">
                                    </div>     
                                    </div>
                                 
                                    
                                    <div class="form-group">
                                        <button id="signupSubmit" type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-ok"> Add Reservation</span></button>
                                    </div>
                            
                                    
                                    <div class="form-group">
                                        <a href="rentDetails.jsp" class="btn btn-info btn-block" role="button">
                                        <span class="glyphicon glyphicon-remove"> Go Back</span>
                                        </a>
                                    </div>
                                    
                            </form>
                          
                    </div>
            </div>
    </div>
</div>

    </body>
</html>
