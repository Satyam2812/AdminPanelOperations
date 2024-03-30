/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Satyam Thakur
 */


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection parameters
   String url = "jdbc:mysql://localhost:3306/login?zeroDateTimeBehavior=CONVERT_TO_NULL";
   String uname = "root";
   String pword = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form parameters
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, uname, pword);

            // Prepare the SQL statement for insertion
            String query = "INSERT INTO admin (id, name, username, password) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, username);
            ps.setString(4, password);

       
            int rows = ps.executeUpdate();

            if (rows > 0) {
               
                
                request.setAttribute("message", "Registration successful!");
                request.getRequestDispatcher("f_landing.jsp?option=register").forward(request, response);

            } else {
            
                System.out.println("Either User Admin already exists or wrong Data entered");
            }
        } catch (ClassNotFoundException | SQLException e) {

                        System.out.println("Either User Admin already exists or wrong Data entered");
                        response.sendRedirect("error.html");
        } finally {
       
            try {
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
            }
        }
    }
}