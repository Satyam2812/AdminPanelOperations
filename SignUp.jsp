<%-- 
    Document   : SignUp
    Created on : 28-Mar-2024, 5:45:38 pm
    Author     : Satyam Thakur
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up</title>
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
        .container {
            width: 100%;
            max-width: 400px;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        button,
        input[type="text"],
        input[type="password"],
        input[type="submit"]{
            display: block;
            width: 100%;
            margin-bottom: 20px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button,
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        button,
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .error-msg {
            color: red;
        }
    </style>
    </head>
    <body>
        <h1>Register</h1>
        <form action="RegisterServlet" method="post" style="display: grid; justify-content: center;
              align-items: center">
            
            <label for="Aid">Admin ID</label>
            <input type="text" id="Aid" placeholder="eg: 10001" name="id" required><br>
            <label for="Aname">Admin Name: </label>
            <input type="text" id="Aname" placeholder="name" name="name" required><br>
            <label for="uname">Username: </label>
            <input type="text" id="uname" placeholder="Username" name="username" required ><br>
            <label for="passwrd">Password: </label>
            <input type="password" id="passwrd" placeholder="Password" name="password" required><br>
           
            <input type="submit" value="Sign up">
            <p>Already have an account:</p>
            <button onclick="document.location='login.jsp?action=admin_login'">login</button>
            <p>By signing up, You accepting <a href="">terms of service</a></p>
            <%
                String errormsg = request.getParameter("error");
                if(errormsg != null){
            %>
            <p style="color: red"><%= errormsg %></p>
            <%
                }
            %>
        </form>
    </body>
</html>