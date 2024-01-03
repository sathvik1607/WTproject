<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Welcome to Knowledge Hub</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        h2 {
            color: #333;
        }

        .welcome-message {
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <h2>Welcome to Knowledge Hub</h2>

    <div class="welcome-message">
        <p>Hello, <strong><%= request.getAttribute("username") %></strong>! You are now logged in to Knowledge Hub.</p>
    </div>
</body>
</html>
