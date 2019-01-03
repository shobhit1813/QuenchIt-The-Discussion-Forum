<%-- 
    Document   : Home
    Created on : Jan 2, 2019, 7:35:39 PM
    Author     : shobhit
--%>

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
                width: 676px;
                height: 100px;
            }
            .grid{
                width: 676px;
                height: 50px;
            }
            
            .right .grid input[type=button] {
                float: right;
                margin-top: 20px;
                margin-right: 800px;
                height: 30px;
            }
             .right .grid h1 {
                float: left;
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
        </div>
        <div class ="left">
            <div class = "left-top">
                <ol class = "nav-links">
                    <li  class="active">
                        <a href="Home.jsp"><strong>Home</strong></a>
                    </li><br>
                 Public
                    <br>
                    <li>
                        <a href="tags.jsp">Tags</a>
                    </li><br>
                    <li>
                        <a href="users.jsp"><strong>Users</strong></a>
                    </li><br>
                    <li>
                        <a href="jobs.jsp"><strong>Jobs</strong></a>
                    </li>
                </ol>
            </div>
        </div>
        <div class = "right">
            <div class = "grid">
                <h1>Top Questions</h1>
                <input type ="button" value = "Ask Question" name = "askques">
                <div class = "quesdiv">
                    <div class ="ques">

                    </div>
                    <div class ="ques">

                    </div>
                    <div class = "ques">
                    </div>
                </div>
          </div>          
        </div>
        <div>
            
        </div>
    </body>
</html>
