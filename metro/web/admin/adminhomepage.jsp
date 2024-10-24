<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color:  #eee;
            color: white;
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
        color: white; /* Change to your desired text color */
        list-style: none;
        display: flex;
        gap: 20px;
        margin: 0;
    }

  nav li {
    text-decoration: none;
    font-weight: bold;
    font-size: 16px;
    color: white !important; /* Set to white and make it !important */
    transition: color 0.3s ease-in-out;
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
            text-align: center;
            color: #333;
            margin: 20px;
        }

        .grid-container {
            padding: 10px 250px;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 5px;
        }

        .grid-item {
            text-align: center;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }

        .grid-item:hover {
            transform: scale(1.05);
        }

        .grid-item img {
            max-width: 100%;
            height: auto;
            margin-bottom: 10px;
        }

        .grid-item a {
            text-decoration: none;
            color: #333;
        }

        .grid-item button {
        background-color: #0096FF;
        color: white;
        width: 100%;
        padding: 10px 20px; /* Adjust the padding as needed */
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s; /* Add color transition for smoother effect */
        font-size: 16px; /* Adjust the font size as needed */
        white-space: nowrap; /* Ensure the text stays on one line */
    }
       

        .grid-item button:hover {
            background-color: #0000FF;
        }
    </style>
</head>
<body>
<header>    
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
    </header>
<div id="content">
    <h2>Welcome to the Admin Page</h2>
    <div class="grid-container">
        <div class="grid-item">
            <a href="trackmanager.html">
                <img src="tracking.png" alt="Image 1">
                <button>Managing Track</button>
            </a>
        </div>
        <div class="grid-item">
            <a href="liveCounter.html">
                <img src="Count.png" alt="Image 2">
                <button>Live Count</button>
            </a>
        </div>
        <div class="grid-item">
            <a href="MetroChart.jsp">
                <img src="chart.png" alt="Image 3">
                <button>Ridership and Revenue Chart</button>
            </a>
        </div>
        <!-- Add more grid items as needed -->
    </div>
</div>
<div class="grid-container">
    <div class="grid-item">
        <a href="displayFeedback.jsp">
            <img src="feedback.png" alt="Image 1">
            <button>Users Feedback</button>
        </a>
    </div>
    <div class="grid-item">
        <a href="complaints.jsp">
            <img src="complaint.png" alt="Image 2">
            <button>Users Complaint</button>
        </a>
    </div>
    <div class="grid-item">
        <a href="Userdata.jsp">
            <img src="Search.png" alt="Image 3">
            <button>Search Users data</button>
        </a>
    </div>
    <!-- Duplicate the following code for additional grid items -->
    <div class="grid-item">
        <a href="adminprofile.jsp">
            <img src="Profile.png" alt="Image 4">
            <button>Admin Profile</button>
        </a>
    </div>
   
    <!-- Add more grid items as needed -->
</</div>
</body>
</html>
