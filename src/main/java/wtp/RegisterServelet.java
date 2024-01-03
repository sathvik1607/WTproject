package wtp;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletResponseWrapper;

@WebServlet("/RegisterServlet")
public class RegisterServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone_number = request.getParameter("phone_number");

        // Password constraints
        if (!isValidPassword(password)) {
            out.println(
                    "Invalid password. Password should be at least 8 characters long, contain one capital letter, one number, and one special character.");
            return;
        }

        // Email constraints
        if (!isValidEmail(email)) {
            out.println("Invalid email. Email should end with @gmail.com.");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/knowledge_hub", "root",
                    "MYsql@123");

            // Assuming the table name is "users"
            String query = "INSERT INTO users (username, password, email, phone_number) VALUES (?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);

            preparedStatement.setString(1, username);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, phone_number);

            int rowsAffected = preparedStatement.executeUpdate();

            if (rowsAffected > 0) {
            	
            	request.getSession().setAttribute("username", username);

                // Set a request attribute to indicate registration success
                request.setAttribute("registrationSuccess", true);

                // Forward to home.jsp
                RequestDispatcher dispatcher = request.getRequestDispatcher("home.jsp");
                dispatcher.forward(request, response);
            } else {
                out.println("Failed to register user. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error: " + e.getMessage());
        }

        out.close();
    }

    private boolean isValidPassword(String password) {
        // Password should be at least 8 characters long, contain one capital letter, one number, and one special character
        String passwordRegex = "^(?=.*[A-Z])(?=.*\\d)(?=.*[@$!%*?&])[A-Za-z\\d@$!%*?&]{8,}$";
        return password.matches(passwordRegex);
    }

    private boolean isValidEmail(String email) {
        // Email should end with @gmail.com
        String emailRegex = "^.*@gmail\\.com$";
        return email.matches(emailRegex);
    }
}
