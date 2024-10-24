<%@ page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement,java.sql.ResultSet"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Profiles</title>
      <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
            text-align: center;
        }

        h2 {
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
         body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
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

        #content h2 {
            color: gray;
            margin: 20px;
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
<%
    try {
        // JDBC connection details
        String jdbcUrl = "jdbc:mysql://localhost:3306/admin-registration";
        String jdbcUser = "root";
        String jdbcPassword = "";

        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword);

        // Fetch admin profiles
        String query = "SELECT * FROM admins";
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {

%>

    <h2>Admin Profiles</h2>
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Username</th>
            <th>Password</th>
        </tr>

        <% while (resultSet.next()) { %>
            <tr>
                <td><%= resultSet.getInt("id") %></td>
                <td><%= resultSet.getString("username") %></td>
                <td><%= resultSet.getString("password") %></td>
            </tr>
        <% } %>

    </table>

<%
        } // end try-with-resources

        // Close the connection
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>
