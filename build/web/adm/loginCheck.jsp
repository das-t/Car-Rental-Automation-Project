<%-- 
    Document   : loginCheck.jsp
    Created on : 20 Oct, 2016, 5:38:42 PM
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
        <link rel="stylesheet" href="../css/loginStyle.css">
        <script src="../js/jquery.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <title>Check Login</title>
    </head>
    <body>
    <%
        String uid = request.getParameter("uid");
        String pwd = request.getParameter("pwd");
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        String str = null;
        
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");
            csmt = con.prepareCall("{?= call getAdminPass(?)}");
            csmt.registerOutParameter(1, java.sql.Types.VARCHAR);
            csmt.setString(2, uid);
            csmt.execute();
            str = csmt.getString(1);
            if(pwd.equals(str)){
                session.setAttribute("adminid", uid);
                response.sendRedirect("carDetails.jsp");
            }
            /*else{
                out.println("Invalid Admin Credential!");
            }*/
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
    %>

        <h1>Hello World!</h1>
        
        <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <!--img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" /> -->
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" method="post" action="login.jsp">
                <p align="center"><h4 align="center">Invalid Credential</h4></p>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">Admin Login</button>
            </form><!-- /form -->
        </div>
    </body>
</html>
