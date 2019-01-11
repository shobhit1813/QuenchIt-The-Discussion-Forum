<%-- 
    Document   : ansreply
    Created on : Jan 11, 2019, 11:06:38 AM
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
                        margin-left: 150px;
                        border-radius: 10px;
                    }

        </style>
    </head>
    <body>
    <center><h1>Reply to  Question</h1></center>
      <form action="ReplyQuestionServlet" method="post">
        <div class="main">
            <br><br>
            
            <br><br> 
            &nbsp;&nbsp;Answer: <textarea rows="8" cols="46" name="ans" ></textarea><br><br>
                    
                    <input type="submit" name="Submit" value="submit" class="btn">
                    </div>
      </form>  
                    
    </body>
</html>

