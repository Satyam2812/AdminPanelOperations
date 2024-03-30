<%-- 
    Document   : logout
    Created on : 28-Mar-2024, 5:00:08 pm
    Author     : Satyam Thakur
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>

<%
    // Invalidate the session if it exists
    HttpSession sessionToInvalidate = request.getSession(false); // Passing false to getSession to avoid creating a new session
    if (sessionToInvalidate != null) {
        sessionToInvalidate.invalidate(); // Invalidate the session
    }

    // Redirect to the login page
    response.sendRedirect("index.html");
%>
