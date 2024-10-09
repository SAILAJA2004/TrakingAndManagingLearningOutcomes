<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        /* General styles */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0; /* Keep the original background color */
        }

        /* Login window container */
        .loginWindow {
            width: 350px;
            background-color: white;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 30px;
            box-sizing: border-box;
            text-align: center;
        }

        /* Header styling */
        .loginHeader {
            font-size: 24px;
            font-weight: bold;
            color: #f9f9f9; /* Changed to blue */
            margin-bottom: 20px;
            border-bottom: 2px solid #f9f9f9; /* Changed to blue */
            padding-bottom: 10px;
        }

        /* Input fields styling */
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-top: 10px;
            margin-bottom: 20px;
            border: 1px solid #bdc3c7;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
            background-color: #f9f9f9;
        }

        input:focus {
            outline: none;
            border-color: #3498db; /* Single color for focus */
        }

        /* Sign in button styling */
        .signinButton {
            background-color:#bdc3c7 ; /* Single color for button */
            color: white;
            padding: 12px;
            width: 100%;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .signinButton:hover {
            background-color: #2980b9; /* Slightly darker shade of the same color on hover */
        }

        /* Forgot password styling */
        .forgotPassword {
            text-align: right;
            margin-bottom: 20px;
            font-size: 14px;
            color: #3498db; /* Single color for forgot password */
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .forgotPassword:hover {
            color: #2980b9;
        }

        /* Acknowledgement message */
        #ack {
            font-size: 14px;
            color: red;
        }
    </style>
</head>
<body>
    <!-- Login Window -->
    <div class="loginWindow">
        <div class="loginHeader">Admin Sign In</div>
        <div class="loginContent">
            <div>Username*</div>
            <input type="text" id="T1" placeholder="Enter your username" />
            <div>Password*</div>
            <input type="password" id="T2" placeholder="Enter your password" />
            <div class="forgotPassword">Forgot Password?</div>
            <button class="signinButton" onclick="AdminIn()">Sign In</button>
            <div id="ack"></div>
        </div>
    </div>

    <!-- Scripts -->
    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        function AdminIn() {
            var data = JSON.stringify({
                username: document.getElementById("T1").value,
                password: document.getElementById("T2").value
            });

            var url = "http://localhost:8080/admin/adminlogin";
            callApi("POST", url, data, getResponse);
        }

        function getResponse(res) {
            var ack = document.getElementById("ack");
            if (res == 401) {
                ack.style.color = "red";
                ack.innerHTML = "Invalid Credentials!";
            } else {
                ack.innerHTML = "";
                location.replace("/AdminHome.jsp");
            }
        }
    </script>
</body>
</html>
