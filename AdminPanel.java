/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminPanel")
public class AdminPanel extends HttpServlet {
  
    String url = "jdbc:mysql://localhost:3306/login?zeroDateTimeBehavior=CONVERT_TO_NULL";
    String uname = "root";
    String pass = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        
        String Request = request.getParameter("Request");

        if (Request != null) {
            switch (Request) {
                case "register":
                    registerUser(request, response);
                    break;
                case "remove":
                    removeUser(request, response);
                    break;
                case "modify":
                    modifyUser(request, response);
                    break;
                case "search":
                    searchUser(request, response);
                    break;
                default:
                    out.println("Invalid Request.");
            }
        }

        out.close();
    }

    private void registerUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, uname, pass);

            String query = "INSERT INTO users (id, name, username, password) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, username);
            ps.setString(4, password);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("AdminPanel.jsp?message=Registration successful");
            } else {
                response.sendRedirect("AdminPanel.jsp?error=Failed to register user");
            }

            ps.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("AdminPanel.jsp?error=Database error");
        }
    }

    private void removeUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, uname, pass);

            String query = "DELETE FROM users WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("AdminPanel.jsp?message=User removed successfully");
            } else {
                response.sendRedirect("AdminPanel.jsp?error=Failed to remove user");
            }

            ps.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("AdminPanel.jsp?error=Database error");
        }
    }

    private void modifyUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String username = request.getParameter("username");
            String newPassword = request.getParameter("newPassword");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, uname, pass);

            String query = "UPDATE users SET password = ? WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, newPassword);
            ps.setString(2, username);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("AdminPanel.jsp?message=User modified successfully");
            } else {
                response.sendRedirect("AdminPanel.jsp?error=Failed to modify user");
            }

            ps.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("AdminPanel.jsp?error=Database error");
        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String searchUsername = request.getParameter("searchUsername");

            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, uname, pass);

            String query = "SELECT * FROM users WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, searchUsername);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                
                response.sendRedirect("SearchResults.jsp?username=" + searchUsername);
            } else {
                response.sendRedirect("AdminPanel.jsp?error=User not found");
            }

            rs.close();
            ps.close();
            conn.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("AdminPanel.jsp?error=Database error");
        }
    }
}
