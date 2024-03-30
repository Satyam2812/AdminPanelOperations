<%-- 
    Document   : userOp
    Created on : 29-Mar-2024, 1:57:36 pm
    Author     : Satyam Thakur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Dashboard</title>
     <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/AdminPanelStyle.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
 
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
        <a class="navbar-brand" href="user_home.jsp"><img src="images/cuimslogo.png" alt="Logo" style="height: 30px; width: 100px"></a>
    </div>
    <div class="collapse navbar-collapse fixed-top" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="user_home.jsp">Home</a></li>
        <li><a href="#About">About</a></li>
        <li><a href="#Profile">Profile</a></li>
        <li><a href="#Contact">Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid text-center">    
  <div class="row content">
    <div class="col-sm-2 sidenav">
        <h1>Welcome</h1>
      <p><a href="userOp.jsp?action=internetPass">Change Internet Password</a></p>
      <p><a href="userOp.jsp?action=resetPass">Reset Password</a></p>
      <p><a href="userOp.jsp?action=about">About</a></p>
      <p><a href="userOp.jsp?action=profile">Profile</a></p>
      <p><a href="userOp.jsp?action=contact">Contact Admin</a></p>
    </div>
      
      
      
    <div class="col-sm-8 text-left satyam" > 
    <h2>Welcome to Your User Dashboard</h2>
    <% String action = request.getParameter("action");
    if (action != null){
        if (action.equals("about")){
        %>
        <h1>About</h1>
        <%
        }
        else if (action.equals("internetPass")){
        
        }
        else if (action.equals("resetPass")){
        
        }
        else if (action.equals("profile")){
        
        }
        else{
        
        }
        
    }
%>  
   
  
    <p>Feel free to navigate through the menu on the left or explore the links in the right sidebar.</p>

    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
          <a href="https://www.coursera.com/"><p>VALUE ADDED COURSE </p></a>
      </div>
      <div class="well">
          <a href="https://www.linkedin/login/"><p>CREATE LINKEDIN PROFILE</p></a>
      </div>
        <div class="well">
          <a href="https://www.githup/login/"><p>CREATE GITHUB REPOSITORY</p></a>
      </div>
    </div>          
  </div>
</div>

<footer class="container-fluid text-center">
    <p>&copy; Copyright: Satyam Kumar Thakur,
        2024</p>
</footer>
       

</body>
</html>

