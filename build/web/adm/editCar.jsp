<%-- 
    Document   : editCar.jsp
    Created on : 21 Oct, 2016, 6:12:29 PM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import = "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../css/editCarStyle.css">
        <script src="../js/jquery.js"></script>
        <title>Car Updation</title>
    </head>
    <body>
        <h3><br/></h3>
    <%
        String carId = request.getParameter("carId");
        if(carId==null){
            response.sendRedirect("error.jsp");
        }
        Connection con = null;
        CallableStatement csmt = null;
        ResultSet rs = null;
        boolean t = true;
        String cname = "asd";
//        ResultSetMetaData rsmt = null;
        double kmCharge = 0;
        double hrCharge = 0;
        String acType = "Non AC";
        double cost = 0;
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");
            csmt = con.prepareCall("{call listCarDetail(?)}");
            csmt.setString(1, carId);
//            csmt.registerOutParameter(1, java.sql.Types.VARCHAR);
            t = csmt.execute();
            
            rs = csmt.getResultSet();
            System.out.println(rs);
            if(rs.next()){
                cname = rs.getString(2);
                System.out.println(cname);
                kmCharge = rs.getDouble(3);
                kmCharge = rs.getDouble(3);
                hrCharge = rs.getDouble(4);
                if(rs.getInt(5)==1){
                    acType = "AC";
                }
                System.out.println("AC Type: "+acType);
                cost = rs.getDouble(6);
            }
        %>    
        
        
        <%} catch(Exception ex){
                ex.getMessage();
                } finally{
                    try{
                        csmt.close()    ;
                        con.close();
                    } catch(Exception ex){
                        ex.getMessage();
                    }
             }%>
        
     
        
<div class="container">
    <div class="row">
            <div class="panel panel-primary">
                    <div class="panel-body">
                            <form method="POST" action="editAction.jsp" role="form">
                                    <div class="form-group">
                                            <h2>Edit <%= carId%> Car Details</h2>
                                    </div>
                                    <div class="form-group">
                                            
                                            <input id="signupName" type="hidden" name="carId" value="<%= carId%>" maxlength="50" class="form-control">
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupEmail">Car Name</label>
                                            <input name="cname" value="<%= cname%>" id="signupEmail" type="text" name="cname"  value="<%= cname%>" maxlength="50" class="form-control">
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupEmailagain">Charge Per KM</label>
                                            <input name="kmCharge" value="<%= kmCharge%>" id="signupEmailagain" type="tect" maxlength="50" class="form-control">
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupPassword">Charge Per Hour</label>
                                            <input name="hrCharge" value="<%= hrCharge%>" id="signupPassword" type="text" maxlength="25" class="form-control" length="40">
                                    </div>
                                    <div class="form-group">
                                            <label class="control-label" for="signupPasswordagain">AC Type</label>
                                            <input name="acType" value="<%= acType%>" id="signupPasswordagain" type="text" maxlength="25" class="form-control">
                                    </div>
                                     <div class="form-group">
                                            <label class="control-label" for="signupPasswordagain">Cost</label>
                                            <input name="cost" value="<%= cost%>" id="signupPasswordagain" type="text" maxlength="25" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <button id="signupSubmit" type="submit" class="btn btn-primary btn-block"><span class="glyphicon glyphicon-plus"> Edit Car</span></button>
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
