<%-- 
    Document   : users
    Created on : Jan 2, 2019, 6:49:30 PM
    Author     : shobhit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Home Page</title>
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
              float: right;
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
          
        </style>
    </head>
    <body>
        <div class="topnav">
            <a href="#home"><%= request.getSession().getAttribute("uname").toString() %></a>
            <a href="#about">About</a>
            <a href="#contact">Contact</a>
            <div class="search-container">
              <form action="SearchServlet">
                <input type="text" placeholder="Search.." name="search">
                <button type="submit"><i class="fa fa-search"></i></button>
              </form>
            </div>
        </div>
        <div class ="left">
            <div class = "left-top">
                <ol class = "nav-links">
                    <li >
                        <a href="Home.jsp"><strong>Home</strong></a>
                    </li><br>
                 Public
                    <br>
                    <li>
                        <a href="tags.jsp">Tags</a>
                    </li><br>
                    <li class="active">
                        <a href="users.jsp"><strong>Users</strong></a>
                    </li><br>
                    <li>
                        <a href="jobs.jsp"><strong>Jobs</strong></a>
                    </li>
                </ol>
            </div>
        </div>
        <div class = "right">
            
        </div>
        <div>
            
        </div>
    </body>
</html>
