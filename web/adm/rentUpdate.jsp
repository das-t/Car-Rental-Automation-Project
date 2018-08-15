<%-- 
    Document   : rentUpdate
    Created on : 23 Oct, 2016, 4:06:47 PM
    Author     : tisan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rent Update</title>brig
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
        <%
            Connection con = null;
        CallableStatement csmt = null;
        ResultSet rs = null;
        boolean t = true;
        int rentId = Integer.parseInt(request.getParameter("edit"));
        System.out.println("rent id: "+rentId);
        try{
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cras","root","12345");
            csmt = con.prepareCall("{call listRentDetail(?)}");
            csmt.setInt(1, rentId);
            t = csmt.execute();
            rs = csmt.getResultSet();
             if(rs.next()) {
                 String custId = rs.getString("cust_id");
                 String strDateTime = rs.getString("str_datetime");
                 String endDateTime = rs.getString("end_date");
                 String advPaid = rs.getString("adv_paid");
                 Double dist = Double.parseDouble(rs.getString("dist"));
                 System.out.println("CustId: "+custId);
                 String retDateTime = rs.getString("ret_datetime");
                 String carId = rs.getString("car_id");
                 String paid = rs.getString("paid");
                 System.out.println(custId+strDateTime);
                 
                 if(advPaid.equals("NO")){
                     response.sendRedirect("updateAdvPaid.jsp?rentId="+rentId);
                 }
                 else if(retDateTime==null){
                     response.sendRedirect("updateReturn.jsp?rentId="+rentId);
                 }else{
                     response.sendRedirect("updateFee.jsp?rentId="+rentId);
                 }
        %>
        
        
        <%
         }
        }catch(Exception ex){
            ex.getMessage();
        }finally{
            try{
                csmt.close();
                con.close();
            } catch(Exception ex){
                ex.getMessage();
            }
        }
     %>     
        
        
        
    </body>
</html>
