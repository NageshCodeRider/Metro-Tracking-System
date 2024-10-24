<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Ridership and Revenue Chart</title>

    <!-- Include Chart.js library -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>

    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            margin: 20px;
            text-align: center; /* Center align content */
        }

        h1 {
            color: #333;
            font-size: 40px;
        }

        canvas {
            display: block;
            margin: 10px 10px;
            width: 10px;
            height: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
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

    <h1>Ridership and Revenue Chart</h1>

    <canvas id="chart"></canvas>

    <script>
        var ctx = document.getElementById('chart').getContext('2d');

        var data = {
            labels: ['Aug 5', 'Aug 6', 'Aug 12', 'Aug 13', 'Aug 15', 'Aug 19', 'Aug 20', 'Aug 26', 'Aug 27'],
            datasets: [
                {
                    label: 'Ridership',
                    data: [57769, 96569, 62044, 92389, 123720, 55297, 76852, 53833, 80682],
                    backgroundColor: '#007bff',
                    borderColor: '#007bff',
                    borderWidth: 1
                },
                {
                    label: 'Revenue (in lakhs)',
                    data: [9.54, 16.43, 10.65, 17.20, 30.63, 9.21, 13.16, 8.96, 13.75],
                    backgroundColor: '#28a745',
                    borderColor: '#28a745',
                    borderWidth: 1
                },
                {
                    label: 'Special Days',
                    data: [0, 0, 0, 0, 169512, 0, 0, 0, 0], // Only Independence Day has a value, rest are 0
                    backgroundColor: '#ffc107',
                    borderColor: '#ffc107',
                    borderWidth: 1
                },
                {
                    label: 'Monthly Revenue (in crores)',
                    data: [0, 0, 0, 0, 0, 0, 0, 0, 0], // Monthly revenue is not daily
                    backgroundColor: '#dc3545',
                    borderColor: '#dc3545',
                    borderWidth: 1
                }
            ]
        };

        var chart = new Chart(ctx, {
            type: 'bar',
            data: data,
            options: {
                title: {
                    display: true,
                    text: 'Ridership and Revenue Data for August',
                    fontSize: 18,
                    fontColor: '#333'
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>

</body>
</html>
