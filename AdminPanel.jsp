<%-- 
    Document   : AdminPanel
    Created on : 28-Mar-2024, 4:16:37 pm
    Author     : Satyam Thakur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home Page</title>
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
        <a class="navbar-brand" href="AdminPanel.jsp?operation=home"><img src="images/cuimslogo.png" alt="Logo" style="height: 30px; width: 100px"></a>
    </div>
    <div class="collapse navbar-collapse fixed-top" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="AdminPanel.jsp">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Profile</a></li>
        <li><a href="#">Contact</a></li>
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
        <h1>Admin Operations</h1>
      <p><a href="AdminPanel.jsp?operation=register">Register New User</a></p>
      <p><a href="AdminPanel.jsp?operation=modify">Modify Existing User</a></p>
      <p><a href="AdminPanel.jsp?operation=remove">Remove User</a></p>
      <p><a href="AdminPanel.jsp?operation=search">Search User</a></p>
    </div>
      <div class="col-sm-8 text-left satyam" > 
      
       
 <%     
 String operation = request.getParameter("operation");
         %>

<%
 if (operation!= null){
 switch(operation){
 case "home":
 %>
 <h1> Welcome, You're successfully logged in as an Admin</h1>
 <%
 break;
 case "register":
%> 

<h2>Register New User</h2>
    <form action="AdminPanel?Request=register" method="POST">
        ID: <input type="text" name="id" required><br>
        Name: <input type="text" name="name" required><br>
        Username: <input type="text" name="username" required><br>
        Password: <input type="password" name="password" pattern=".{8,}" title="Password must be at least 8 characters long" required><br>
        <input type="submit" value="Register">
    </form>

<%break;
 case "remove":
 %>
  <h2>Remove User</h2>
    <form action="AdminPanel?Request=remove" method="POST">
        Username: <input type="text" name="username" required><br>
        <input type="submit" value="Remove">
    </form>

 <% break;
 case "modify":
 %>
 <h2>Modify User</h2>
    <form action="AdminPanel?Request=modify" method="POST">
        Username: <input type="text" name="username" required><br>
        New Password: <input type="password" name="newPassword" pattern=".{8,}" title="Password must be at least 8 characters long" required><br>
        <input type="submit" value="Modify">
    </form>

 
 <%break;
 case "search":
 %>
 <h2>Search User</h2>
    <form action="AdminPanel?Request=search" method="GET">
        Username: <input type="text" name="searchUsername" required><br>
        <input type="submit" value="Search">
    </form>

 <%break;
 default:
    out.println("Something went wrong! Please try again");
 }
 }
 %>     
      
    
   
   
    <%
String message = request.getParameter("message");
String error = request.getParameter("error");

if (message != null ) {
%>
    <div style="color: green; margin-left: 40%;"><%= message %></div>
    <%
        if (error != null) {
        %>
        <div style="color: red;"><%= error %></div>
        <%}%>
<%
}
%>


    </div>
    <div class="col-sm-2 sidenav">
      <div class="well">
          <a href="AdminPanel.jsp?operation=modify"><p>Modify User</p></a>
      </div>
      <div class="well">
          <a href="AdminPanel.jsp?operation=register"><p>Register New User</p></a>
      </div>
    </div>          
  </div>
</div>

<footer class="container-fluid text-center">
  <p>@Copyright: Satyam Kumar Thakur,
        2024</p>
</footer>
        <script type="text/javascript">
    window.history.forward(); // Disable back button
    function noBack() { window.history.forward(); }
    noBack();
    window.onload = noBack;
    window.onpageshow = function(evt) { if (evt.persisted) noBack(); }
    window.onunload = function() { void (0); }
</script>

</body>
</html>

