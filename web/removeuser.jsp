<%-- 
    Document   : removeuser
    Created on : Jan 5, 2019, 3:27:59 PM
    Author     : shobhit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>

<html>
    <head>
        <title>Remove Users</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            .left{
                width: 200px;
                height: 700px;
                background: #fff;
                float: left;
                margin-left: -10px;
                border-right: 2px solid grey;
                position: fixed;
                margin-top: 10px;
            }
            .set{
                margin-top: 60px;
            }
            .grid{
                margin-left: 50px;
                width: 1200px;
                height:500px;
            }
            .right{
                
                height: 700px;
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
              position: fixed;
              width: 100vx;
              margin-left: -10px;
              margin-top: -60px;
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
              height: 50px;
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
            .nav-links ,.list{
                list-style: none;
                margin: 0 0 3px 0;
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
                height: 200px;
            }
            .right .grid .comm1{
                
                margin-left: 50px;
                float:left;
                width: 500px;
                border: 1px solid grey;
                border-radius: 5px;
                height: 200px;
               
            }
            .fixedbutton{
                position: fixed;
                bottom: 0px;
                width: 100px;
                height: 50px;
                color: white;
                background: green;
                margin-left: 700px;
                border-radius: 10px;
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
                        <a href="adminhome.jsp"><strong>Home</strong></a>
                    </li><br>
                 Public
                    <br>
                    <li class="active">
                        <a href="adminremovehome.jsp">Remove user or Community</a>
                    </li><br><br>
                    <li>
                        <a href="users.jsp"><strong>Users</strong></a>
                    </li><br>
                    <li>
                        <a href="communities.jsp"><strong>Communities</strong></a>
                    </li><br>
                </ol>
            </div>
        </div>
            <form method="post" action="removeUserServlet">    
        <div class = "right">
            <div class ="grid">
                <div class="set"><strong>Select Users to Remove</strong></div><br>
                <%
                    try{
                          Class.forName("com.mysql.cj.jdbc.Driver");
                          Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Quench?useSSL=true&verifyServerCertificate=false&allowMultiQueries=true","root","1810");
                          PreparedStatement ps = con.prepareStatement("select * from register where userType=?");
                          ps.setString(1, "user");
                          ResultSet rs = ps.executeQuery();
                          while(rs.next()){
                %>
                <ol class="list">  
                    <div class="comm"><br>
                            &nbsp;&nbsp;<span>User Name: <strong><%= rs.getString(3) %></strong></span><br><br>
                            &nbsp;&nbsp;First Name: <%= rs.getString(1) %><br><br>
                            &nbsp;&nbsp;Last Name:  <%= rs.getString(2) %><br><br>
                            <input type="checkbox" name="user" value="<%=rs.getString(3) %>"><strong>Remove</strong>
                        </div>
                        <%  if(rs.next()){%>
                        <div class="comm1"><br>
                             &nbsp;&nbsp;<span>User Name: <strong><%= rs.getString(3) %></strong></span><br><br>
                            &nbsp;&nbsp;First Name: <%= rs.getString(1) %><br><br>
                            &nbsp;&nbsp;Last Name:  <%= rs.getString(2) %><br><br>
                            <input type="checkbox" name="user" value="<%=rs.getString(3) %>"><strong>Remove</strong>
                        </div>
                    </ol>  
                <%}
                     }
                        }
                    catch(Exception e){
                        System.out.println(e);
                    }
                    %>
            </div> 
        </div>
       <input type="submit" class="fixedbutton" value="Submit" name="submit">
      </form> 
    </body>
</html>
