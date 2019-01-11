<%-- 
    Document   : askques
    Created on : Jan 10, 2019, 11:01:36 PM
    Author     : shobhit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ask Question</title>
        <style>
                    .main{
                        width:500px;
                        height:500px;
                        margin-left:600px;
                        
                        border: 2px solid black;
                    }
                    .btn{
                        width: 130px;
                        height: 35px;
                        background: green;
                        margin-left: 100px;
                        border-radius: 10px;
                    }

        </style>
    </head>
    <body>
    <center><h1>Put up the Question</h1></center>
      <form action="AskQuestionServlet" method="post">
        <div class="main">
            <br><br>
            &nbsp;&nbsp;Ques: <textarea rows="4" cols="46" name="ques" ></textarea><br><br>
            &nbsp;&nbsp;<strong>Category:</strong><br>
            <%
                try{
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Quench?useSSL=true&verifyServerCertificate=false&allowMultiQueries=true","root","1810");
                    PreparedStatement ps = con.prepareStatement("select * from communities where status=?");
                    ps.setString(1,"true");
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()){
                        System.out.println("chk");
                    
                %>
                &nbsp;&nbsp;<input type="radio" name="communities" value=" <%= rs.getString(1) %>" required><%= rs.getString(1) %><br><br>
                <%}
                    %>
                    <input type="submit" name="Submit" value="submit" class="btn">
                    </div>
      </form>  
                    <%
                    }
                    catch(Exception e){
                        System.out.println(e);
                    }   

                    %>
    </body>
</html>
