<%-- 
    Document   : Commuser
    Created on : Jan 8, 2019, 10:32:45 AM
    Author     : shobhit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- 
    Document   : javaCommunity
    Created on : Jan 4, 2019, 11:55:30 AM
    Author     : shobhit
--%>


<!DOCTYPE html>
<html>
    <head>
        <title>Feeds Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            .left{
                width: 200px;
                height: 1000px;
                background: #fff;
                float: left;
                margin-left: -10px;
                border-right: 2px solid grey;
            }
            .right{
                
                height: 1000px;
                background: #fff;
                margin-left: 200px;
                margin-right: 0px;
                
            }
            .navbar{
                width:100vx;
                height: 50px;
                background:#000;
                margin-top: -10px;
                margin-left: -10px;
            }
            .topnav {
              overflow: hidden;
              background-color: #e9e9e9;
            }

            .topnav a {
              float: left;
              display: block;
              color: black;
              text-align: center;
              padding: 14px 16px;
              text-decoration: none;
              font-size: 17px;
            }

            .topnav a:hover {
              background-color: #ddd;
              color: black;
            }

            .topnav a.active , .left .left-top .nav-links li.active{
              background-color: grey;
              color: white;
            }

            .topnav .search-container {
              float: left;
            }

            .topnav input[type=text] {
              padding: 6px;
              margin-top: 8px;
              font-size: 17px;
              border: none;
            }

            .topnav .search-container button {
              float: right;
              padding: 6px 10px;
              margin-top: 8px;
              margin-right: 16px;
              background: #ddd;
              font-size: 17px;
              border: none;
              cursor: pointer;
            }

            .topnav .search-container button:hover {
              background: #ccc;
            }

            @media screen and (max-width: 600px) {
              .topnav .search-container {
                float: none;
              }
              .topnav a, .topnav input[type=text], .topnav .search-container button {
                float: none;
                display: block;
                text-align: left;
                width: 100%;
                margin: 0;
                padding: 14px;
              }
              .topnav input[type=text] {
                border: 1px solid #ccc;  
              }
            }
            .left-top{
                width: 200px;
                height: 400px;
                margin-left: 2px;
                margin-top: 50px;
                
            }
            li{
                height: 30px;
            }
            
            a{
                text-decoration: none;
            }
            .nav-links{
                list-style: none;
            }
            .left .left-top .nav-links li{
                height: 25px;
            }
            .topnav .search-container input[type=text] {
              width: 500px;
              margin-left: 150px;
            }
             .right .grid .comm{
                float: left;
                width: 500px;
                border: 1px solid grey;
                border-radius: 5px;
                height: 150px;
            }
            .right .grid .comm1{
                
                margin-left: 50px;
                float:left;
                width: 500px;
                border: 1px solid grey;
                border-radius: 5px;
                height: 150px;
               
            }
          
        </style>
    </head>
    <body>
        <div class="topnav">
            <a href="#about"></a>
             <a href="#home"><%= request.getSession().getAttribute("uname").toString() %></a>
            <a href="#contact"></a>
            <div class="search-container">
              <form action="SearchServlet">
                <input type="text" placeholder="Search.." name="search">
                <button type="submit"><i class="fa fa-search"></i></button>
              </form>
            </div>
            <a></a><a></a><a></a><a></a><a></a><a></a>
            <a></a><a></a><a></a><a></a><a></a><a></a><a></a><a></a><a></a><a></a><a></a> <a></a><a></a><a></a><a></a><a></a><a></a><a></a><a></a><a></a><a></a><a>
        </div>
        <div class ="left">
            <div class = "left-top">
                <ol class = "nav-links">
                    <li>
                        <a href="communityhome.jsp"><strong>Home</strong></a>
                    </li><br>
                 Public
                 <br>
                    <li>
                        <a href="request.jsp"><strong>Requests</strong></a>
                    </li><br>
                    <li>
                        <a href="Commtags.jsp">Tags</a>
                    </li><br>
                    <li class="active">
                        <a href="Commuser.jsp"><strong>Your Members</strong></a>
                    </li><br>
                    
                     
                </ol>
            </div>
        </div>
        <div class = "right">
            <div class = "grid">
                <h1>Your Users</h1>
                 <%
                     try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Quench?useSSL=true&verifyServerCertificate=false&allowMultiQueries=true","root","1810");
                        PreparedStatement ps = con.prepareStatement("select * from "+request.getSession().getAttribute("uname").toString()+"com where status=?");
                        ps.setString(1,"true");
                        ResultSet rs = ps.executeQuery();
                        while(rs.next()){
                     %>
                    <div class="comm"><br>
                        &nbsp;&nbsp;<span>User Name:<strong><%= rs.getString(1) %></strong></span><br><br>
                    </div>
                    <%  if(rs.next()){%>
                     <div class="comm1"><br>
                        &nbsp;&nbsp;<span>User Name:<strong><%= rs.getString(1) %></strong></span><br><br> 
                    </div>
                    <%}
                          }
                        }
                        catch(Exception e){
                            System.out.println(e);
                        }
                        %>        
                </div>
          </div>
        
    </body>
</html>
