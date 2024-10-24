<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Complaints List</title>
    <style>
       body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
             text-align: center;
        }

        header {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }

        h1 {
            color: #333;
            font-size: 40px;
        }

      table {
            border-collapse: collapse;
            width: 70%;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 12px;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
          header {
            background-color: #333;
            color: white;
            padding: 10px;
            text-align: center;
        }

        nav {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            padding: 10px 20px;
            color: white;
        }

        nav img {
            max-width: 100px;
            height: auto;
        }

        nav ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
        }

        nav li {
            margin-right: 20px;
        }
         nav div {
        display: flex;
        align-items: center;
    }

    nav img {
        max-width: 100px;
        height: auto;
        margin-right: 10px;
    }

    nav span {
        font-size: 24px;
        font-weight: bold;
    }
    </style>
</head>
<body>
<nav>
    <div>
        <img src="logo.png" alt="Logo">
        <span>Admin Dashboard</span>
    </div>
    <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Contact</a></li>
    </ul>
</nav>
    <h1>Complaints List</h1>

    <% 
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;

        try {
            // Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish a connection
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/user-complaint", "root", "");

            // Create a statement and execute the query
            statement = connection.createStatement();
            resultSet = statement.executeQuery("SELECT * FROM complaints");
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Message</th>
            <th>Subject</th>
            <th>Timestamp</th>
        </tr>

        <% while (resultSet.next()) { %>
            <tr>
                <td><%= resultSet.getInt("id") %></td>
                <td><%= resultSet.getString("message") %></td>
                <td><%= resultSet.getString("subject") %></td>
                <td><%= resultSet.getTimestamp("timestamp") %></td>
            </tr>
        <% } %>
    </table>

    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (resultSet != null) resultSet.close();
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

</body>
</html>
