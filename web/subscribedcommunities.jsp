<%-- 
    Document   : subscribedcommunities
    Created on : Jan 10, 2019, 6:13:38 PM
    Author     : shobhit
--%>

<%-- 
    Document   : Home
    Created on : Jan 2, 2019, 7:35:39 PM
    Author     : shobhit
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            
            h1{
                font-weight: 200;
            }
            .left{
                position: fixed;
                margin-top: 50px;
                width: 200px;
                height: 700px;
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
              margin-top: -8px;
              margin-left: -10px;
              overflow: hidden;
              background-color: #e9e9e9;
              position: fixed;
              width: 100vx;
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
            .topnav .search-container input[type=text] {
              width: 500px;
              margin-left: 150px;
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
            .ques {
                float: left;
                postion: relative;
                border-bottom: 1px solid grey;
                border-top: 1px solid grey;
                width: 800px;
                height: 100px;
            }
            .grid{
                width: 676px;
                height: 50px;
            }
            .ques-left{
                float: left;
            }
            .ques-left2{
                float: left;
            }
            .ques-left3{
                float: left;
            }
            .ques-left4{
                float: left;
                width: 1500px;
            }
            .right .grid input[type=button] {
                float: left;
                margin-top: 20px;
                height: 30px;
                margin-top: 50px;
            }
             .right .grid h1 {
                float: left;
                width: 400px;
                margin-top: 50px;
            }
            .right .grid .comm{
                float: left;
                width: 400px;
                border: 1px solid grey;
                border-radius: 5px;
                height: 100px;
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
                        <a href="Home.jsp"><strong>Home</strong></a>
                    </li><br>
                 Public
                    <br>
                    <li>
                        <a href="tags.jsp">Tags</a>
                    </li><br>
                    <li class="active">
                        <a href="subscribedcommunities.jsp">Your Communities</a>
                    </li><br>
                    <li>
                        <a href="Uuser.jsp"><strong>Users</strong></a>
                    </li><br>
                    <li>
                        <a href="jobs.jsp"><strong>Jobs</strong></a>
                    </li><br>
                     <li>
                        <a href="joincommunity.jsp"><strong>Join Communities</strong></a>
                    </li>
                </ol>
            </div>
        </div>
        <div class = "right">
            <div class = "grid">
                <h1>Communities You are Member of</h1>
                
                <div class = "quesdiv">
                 <%
                     String comm[]=new String[8];
                     comm[0]="javascript";
                     comm[1]="java";
                     comm[2]="cplusplus";
                     comm[3]="c";
                     comm[4]="node";
                     comm[5]="linux";
                     comm[6]="csharp";
                     comm[7]="python";
                     
                     String username=request.getSession().getAttribute("uname").toString();
                     try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Quench?useSSL=true&verifyServerCertificate=false&allowMultiQueries=true","root","1810");
                        for(int i=0;i < comm.length;i++){
                            PreparedStatement ps = con.prepareStatement("select * from "+comm[i]+"com where user =? and  status=?");
                            ps.setString(1,username);
                            ps.setString(2,"true");
                            ResultSet rs = ps.executeQuery();
                            if(rs.next()){
                     %>
                     <div class="comm">
                         <br>
                         &nbsp; &nbsp;&nbsp;<strong><a href="<%= comm[i]%>quesans.jsp"><%= comm[i] %></a></strong><br><br>
                    </div>
                    <br><br>
                    <%
                          }
                            }
                        }
                        catch(Exception e){
                            System.out.println(e);
                        }
                        %>        
                </div>
          </div>          
        </div>
        <div>
            
        </div>
    </body>
</html>
