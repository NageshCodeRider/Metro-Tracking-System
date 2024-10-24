<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User List</title>
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

        .container {
            width: 70%;
            margin: 20px auto;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            overflow: hidden;
        }

        h1 {
            
            text-align: center;
            margin-top: 0;
            padding: 20px;
           color: #333;
            font-size: 40px;
        }

        form {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            background-color: #f2f2f2;
        }

        label {
            margin-right: 10px;
        }

        input[type="text"] {
            padding: 8px 200px ;
            font-size: 16px;
        }

        input[type="submit"] {
            padding: 8px 90px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
             border-radius: 8px;
            
        }

        table {
            border-collapse: collapse;
            width: 100%;
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
        <h1>User List</h1>
        <div class="container">
        <form action="" method="post">
            <label for="mobile">Search by Mobile:</label>
            <input type="text" id="mobile" name="mobile">
            <input type="submit" value="Search">
        </form>

        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Gender</th>
            </tr>

        <% 
            Connection connection = null;
            Statement statement = null;
            ResultSet resultSet = null;

            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/user-registration", "root", "");

                if (request.getParameter("mobile") != null) {
                    String searchMobile = request.getParameter("mobile");
                    String searchQuery = "SELECT * FROM user WHERE mobile LIKE ?";
                    
                    try (PreparedStatement searchStatement = connection.prepareStatement(searchQuery)) {
                        searchStatement.setString(1, "%" + searchMobile + "%");
                        resultSet = searchStatement.executeQuery();
                        
                        while (resultSet.next()) {
                            out.println("<tr>");
                            out.println("<td>" + resultSet.getInt("id") + "</td>");
                            out.println("<td>" + resultSet.getString("name") + "</td>");
                            out.println("<td>" + resultSet.getString("email") + "</td>");
                            out.println("<td>" + resultSet.getString("mobile") + "</td>");
                            out.println("<td>" + resultSet.getString("gender") + "</td>");
                            out.println("</tr>");
                        }
                    }
                } else {
                    statement = connection.createStatement();
                    resultSet = statement.executeQuery("SELECT * FROM user");

                    while (resultSet.next()) {
                        out.println("<tr>");
                        out.println("<td>" + resultSet.getInt("id") + "</td>");
                        out.println("<td>" + resultSet.getString("name") + "</td>");
                        out.println("<td>" + resultSet.getString("email") + "</td>");
                        out.println("<td>" + resultSet.getString("mobile") + "</td>");
                        out.println("<td>" + resultSet.getString("gender") + "</td>");
                        out.println("</tr>");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (resultSet != null) resultSet.close();
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>

      </table>
    </div
</body>
</html>
