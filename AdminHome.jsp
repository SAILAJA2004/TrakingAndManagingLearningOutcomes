<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="css/styles.css" />
    <style>
        body {
            margin: 0;
            display: flex;
            height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
        }

        /* Sidebar styling */
        .navbar {
            width: 220px;
            background-color: #2c3e50;
            color: #ecf0f1;
            padding: 20px;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            box-shadow: 3px 0 8px rgba(0, 0, 0, 0.1);
        }

        .navbar h3 {
            font-size: 22px;
            margin-bottom: 30px;
            text-align: left;
            width: 100%;
            border-bottom: 1px solid #ecf0f1;
            padding-bottom: 10px;
        }

        .navbar a, .navbar label {
            font-size: 16px;
            margin-bottom: 15px;
            color: #bdc3c7;
            text-decoration: none;
            cursor: pointer;
            width: 100%;
            padding: 10px;
            background-color: transparent;
            border-radius: 6px;
            text-align: left;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover, .navbar label:hover {
            background-color: #1abc9c;
            color: white;
        }

        /* Main content styling */
        .content {
            flex-grow: 1;
            padding: 40px;
            overflow-y: auto;
            background-color: #ecf0f1;
        }

        /* Registration window */
        .registrationWindow {
            max-width: 500px;
            margin: auto;
            padding: 30px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 2px 15px rgba(0, 0, 0, 0.1);
        }

        .registrationHeader {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            color: #34495e;
        }

        /* Form field styling */
        .registrationContent div {
            margin-bottom: 15px;
            font-size: 14px;
            color: #34495e;
        }

        .registrationContent input[type="text"], 
        .registrationContent input[type="email"],
        .registrationContent input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #bdc3c7;
            border-radius: 8px;
            background-color: #f9f9f9;
            font-size: 16px;
            transition: border 0.3s ease;
        }

        .registrationContent input:focus {
            border: 1px solid #1abc9c;
            outline: none;
        }

        /* Button styling */
        .registerButton {
            background-color: #3498db;
            color: white;
            padding: 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
            width: 100%;
            margin-top: 15px;
        }

        .registerButton:hover {
            background-color: #2980b9;
        }

        /* Acknowledgment label */
        #ack {
            margin-top: 20px;
            font-size: 14px;
            text-align: center;
            height: 40px;
            line-height: 40px;
        }

    </style>
</head>
<body>

    <div class="navbar">
        <h3>Navigation</h3>
        <a href="#" onclick="displayStudentRegistration()">Student Registration</a>
        <label onClick="faculty()">Faculty</label>
        <!-- Add more links here -->
    </div>
    
    <div class="content">
        <div id="registrationForm" class="registrationWindow" style="display:none;">
            <div class="registrationHeader">Register Student</div>
            <div class="registrationContent">
                <div>Username*</div>
                <input type="text" id="username" />
                
                <div>First Name*</div>
                <input type="text" id="firstName" />
                
                <div>Last Name*</div>
                <input type="text" id="lastName" />
                
                <div>Email*</div>
                <input type="email" id="email" />
                
                <div>Password*</div>
                <input type="password" id="password" />
                
                <button class="registerButton" onclick="registerStudent()">Register</button>
                <div>
                    <label id="ack"></label>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        function displayStudentRegistration() {
            document.getElementById('registrationForm').style.display = 'block';
        }

        function registerStudent() {
            var data = JSON.stringify({
                username: document.getElementById('username').value,
                firstName: document.getElementById('firstName').value,
                lastName: document.getElementById('lastName').value,
                email: document.getElementById('email').value,
                password: document.getElementById('password').value
            });

            var url = "http://localhost:8080/student/save";
            callApi("POST", url, data, getResponse);
        }

        function getResponse(res) {
            if (res === "200") {
                document.getElementById('ack').style.color = "green";
                document.getElementById('ack').innerHTML = "Registration successful!";
            } else {
                document.getElementById('ack').style.color = "red";
                document.getElementById('ack').innerHTML = "Registration failed!";
            }
        }

        function faculty() {
            location.replace("/Adminfaculty.jsp");
        }
    </script>
</body>
</html>
