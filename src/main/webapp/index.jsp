<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration and Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        .form-container {
            display: flex;
            justify-content: space-around;
        }

        .form-box {
            width: 300px;
            margin: 20px;
            padding: 15px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="password"],
        input[type="email"] {
            width: 100%;
            padding: 8px;
            margin: 5px 0;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            background-color: #4caf50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .sign-in-link {
            text-align: center;
            margin-top: 10px;
        }

        .sign-in-link a {
            color: #3498db;
            text-decoration: none;
        }

        .registration-message {
            text-align: center;
            margin-top: 10px;
            color: green;
        }
    </style>
</head>
<body>
    <h2>KNOWLEDGE HUB </h2>
    <h3>Registration</h3>

    <%-- Display registration success message --%>
    <% if (request.getAttribute("registrationSuccess") != null) { %>
        <div class="registration-message">
            <p>Registration successful! You can now <a href="home.jsp">login</a>.</p>
        </div>
    <% } %>
    
    <div class="form-container">
        <!-- Registration Form -->
        <div class="form-box">
            <h3>Register</h3>
            <form action="RegisterServlet" method="post">
                Username: <input type="text" name="username" required><br>
                Password: <input type="password" name="password" required><br>
                Email: <input type="email" name="email" required><br>
                Phone Number: <input type="text" name="phone_number" required><br>
                <input type="submit" value="Register">
            </form>
        </div>
    </div>
</body>
</html>
