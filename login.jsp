<%-- 
    Document   : login
    Created on : 28-Mar-2024, 3:09:37 pm
    Author     : Satyam Thakur
--%>
<%@page session="true" %>
<%@page import="java.sql.*" %>
<%@page import="jakarta.naming.*, jakarta.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: grid;
            justify-content: center;
            align-items: center;
            
        }
        form{
            box-shadow: 0 5px 8px rgba(0.2, 0.2, 0.2, 0.2);
        }
        input[type="text"],
        input[type="password"],
        button {
            display: block;
            width: 100%;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .error-msg {
            color: red;
        }
    </style>
    </head>
    <body>
        <div><a href="index.html">Home</a></div>
        <%
            String action = request.getParameter("action");
    
            if (action!= null) {
            switch(action){
            case "admin_login":
%>
                <h1>Admin Login</h1>
                <form action="AdminPanel.jsp?operation=home" method="post">
                    Username:
                    <input type="text" name="username" placeholder="e.g. admin" required><br>
                    Password:
                    <input type="password" name="password" placeholder="e.g Admin123" pattern=".{8,}" title="Password must be at least 8 characters long" required><br>
                    <button type="submit">Login</button>
                </form>
        
                <div><p>New admin User: create your ID password</p>
                <button onclick="document.location='SignUp.jsp'">Register</button></div>
<%              break;
            
            case "student_login":%>
                <h1>Student Login</h1>
                <form action="login.jsp?action=studentLoginProcess" method="post">
                    Username:
                    <input type="text" name="user_name" placeholder="e.g. studentID" required><br>
                    Password:
                    <input type="password" name="user_password" placeholder="e.g abc123" pattern=".{8,}" title="Password must be at least 8 characters long" required><br>
                    <button type="submit">Login</button>
                </form>
        
                <div><p>New User: create your ID password</p>
                    <p>Contact any admin to get yourself registered</div>
<%              break;
            
            case "adminLoginProcess":
%>

<%
               
    String url = "jdbc:mysql://localhost:3306/login?zeroDateTimeBehavior=CONVERT_TO_NULL";
    String uname = "root";
    String pass = "";
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
 
    String username = request.getParameter("username");
    session.setAttribute("username", username);
    String password = request.getParameter("password");
    session.setAttribute("password", password);
    
      
    try{
        
        
        conn = DriverManager.getConnection(url, uname, pass);
       
        String admin_query = "SELECT * FROM admin WHERE username = ? AND password = ?";
        ps = conn.prepareStatement(admin_query);
        ps.setString(1, username);
        ps.setString(2, password);
        rs = ps.executeQuery();
        
        if(rs.next()){
            response.sendRedirect("home.jsp");
        }
        else{
            response.sendRedirect("login.jsp?error=inavlid username or password");
        }
    
    }   
    catch(Exception e){
        e.printStackTrace();
    }
    finally{
        try {
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
   
case "studentLoginProcess":

           
    String URL = "jdbc:mysql://localhost:3306/login?zeroDateTimeBehavior=CONVERT_TO_NULL";
    String userName = "root";
    String passWord = "";
    Class.forName("com.mysql.jdbc.Driver");
    
    Connection connection = null;
    PreparedStatement pst = null;
    ResultSet rst = null;
 
    String user_name = request.getParameter("user_name");
    session.setAttribute("user_name", user_name);
    String user_password = request.getParameter("user_password");
    session.setAttribute("user_password", user_password);
    try{
        
        
        connection = DriverManager.getConnection(URL, userName, passWord);
       
        String student_query = "SELECT * FROM users WHERE username = ? AND password = ?";
        pst = connection.prepareStatement(student_query);
        pst.setString(1, user_name);
        pst.setString(2, user_password);
        rst = pst.executeQuery();
        
        if(rst.next()){
            response.sendRedirect("user_home.jsp");
        }
        else{
            response.sendRedirect("login.jsp?error=inavlid username or password");
        }
    
    }
    catch(Exception e){
        e.printStackTrace();
    }
    finally{
        try {
            if(rst != null) rst.close();
            if(pst != null) pst.close();
            if(connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     
            
             break;
            default:
                out.println("Invalid action.");
                break;
        }
    } else {
       
        out.println("Something Went wrong!");
    }

%>
     
        <% 
            String errormsg = request.getParameter("error");
            if(errormsg != null) {
        %>
        <p class="error-msg"><%= errormsg %></p>
        <% }
            %>

            
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
