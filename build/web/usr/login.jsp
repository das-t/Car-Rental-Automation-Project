<%-- 
    Document   : login.jsp
    Created on : 20 Oct, 2016, 6:30:53 AM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"
        import = "java.sql.*"
        %>

<%
    String userid = request.getParameter("uid");
    String pwd = request.getParameter("pwd");
    Class.forName("com.mysql.jdbc.Driver");
        Connection con = null;
        CallableStatement csmt = null;
        boolean t = true;
        String str = null;
        
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");;
            csmt = con.prepareCall("{?= call getCustPass(?)}");
            csmt.registerOutParameter(1, java.sql.Types.VARCHAR);
            csmt.setString(2, userid);
            csmt.execute();
            str = csmt.getString(1);
            System.out.println("str: "+str);
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
        if(str!=null &&str.equals(pwd)){
            out.println("Success!");
            session.setAttribute("userid", userid);
            response.sendRedirect("rentDetails.jsp");
        }
        /*else{
            out.println("Invalid Password <a href='../index.jsp'>try again</a>");
        }*/
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../bootstrap/css/bootstrap.css">
        <link rel="stylesheet" href="../css/loginStyle.css">
        <script src="../js/jquery.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
        <div class="container">
        <div class="card card-container">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <!--img id="profile-img" class="profile-img-card" src="//ssl.gstatic.com/accounts/ui/avatar_2x.png" /> -->
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" method="post" action="../index.jsp">
                <p align="center"><h4 align="center">Invalid Credential</h4></p>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">User Login</button>
            </form><!-- /form -->
        </div>
    </body>
</html>
