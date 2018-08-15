<%-- 
    Document   : newCarAction.jsp
    Created on : 22 Oct, 2016, 12:15:06 AM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import= "java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../css/loginStyle.css">
        <script src="../js/jquery.js"></script>
        <title>New Car</title>
    </head>
    <body>
        <%
            String carId = request.getParameter("carId");
            String cname = request.getParameter("cname");
            Double kmCharge = Double.parseDouble(request.getParameter("kmCharge"));
            Double hrCharge = Double.parseDouble(request.getParameter("hrCharge"));
            int acType = 0;
            if(request.getParameter("acType").equals("AC")){
                acType = 1;
            }
            double cost = Double.parseDouble(request.getParameter("cost"));
            
        if(carId.equals("")){
            response.sendRedirect("../error.jsp");
        }else{

        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");
            csmt = con.prepareCall("{call saveCar(?,?,?,?,?,?)}");
            csmt.setString(1, carId);
            csmt.setString(2, cname);
            csmt.setDouble(3, kmCharge);
            csmt.setDouble(4, hrCharge);
            csmt.setInt(5, acType);
            csmt.setDouble(6, cost);
            t = csmt.execute();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally{
            try {
                csmt.close();
                con.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
            if(t){
                response.sendRedirect("../error.jsp");
            }
        }
        %>
        
        <div class="container" >
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <!--img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" /> -->
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" method="post" action="carDetails.jsp">
            <h3 align="center"><span class="label label-success col-sm-12">Car: <%= carId%> Inserted!</span></h3>
            <br/>
            <br/>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Go Back</button>
            </form><!-- /form -->
            <br/>
        </div><!-- /card-container -->
    </div><!-- /container -->
    </body>
</html>
