<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Faculty</title>
    <link rel="stylesheet" href="css/faculty.css">
    <style>
        body {
            margin: 0;
            font-family: 'Arial', sans-serif;
            background-color: #f3f7fa;
        }

        /* Top navigation bar */
        .topnav {
            background-color: #283e4a;
            color: #fff;
            padding: 15px;
            text-align: center;
            font-size: 24px;
            font-weight: 500;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        /* Main container for layout */
        .main-container {
            display: flex;
            height: calc(100vh - 60px);
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background-color: #374956;
            color: #ffffff;
            display: flex;
            flex-direction: column;
            padding: 20px;
            box-shadow: 2px 0px 8px rgba(0, 0, 0, 0.1);
        }

        .sidebar h3 {
            margin-bottom: 30px;
            font-size: 20px;
            border-bottom: 1px solid #ffffff;
            padding-bottom: 10px;
            text-transform: uppercase;
        }

        .sidebar a {
            text-decoration: none;
            color: #ecf0f1;
            padding: 12px 0;
            font-size: 18px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .sidebar a:hover {
            background-color: #16a085;
        }

        /* Content area */
        .content {
            flex-grow: 1;
            padding: 40px;
            background-color: #eef2f5;
            overflow-y: auto;
        }

        /* Form styling */
        #facultyForm {
            display: none;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }

        #facultyForm h4 {
            text-align: center;
            font-size: 22px;
            color: #283e4a;
            margin-bottom: 20px;
            font-weight: 600;
        }

        #facultyForm label {
            font-weight: bold;
            display: block;
            margin-bottom: 10px;
            color: #283e4a;
        }

        #facultyForm input, #facultyForm select {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccd1d9;
            border-radius: 5px;
            background-color: #f5f8fa;
            box-sizing: border-box;
        }

        #facultyForm button {
            background-color: #3498db;
            color: #ffffff;
            padding: 14px 20px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        #facultyForm button:hover {
            background-color: #2980b9;
        }

        #ack {
            margin-top: 15px;
            font-size: 16px;
            text-align: center;
        }
    </style>
</head>
<body>

    <!-- Top navigation bar -->
    <div class="topnav">
        Admin Faculty Dashboard
    </div>

    <!-- Main layout with sidebar and content -->
    <div class="main-container">
        <!-- Sidebar with navigation links -->
        <div class="sidebar">
            <h3>Menu</h3>
            <a href="#dashboard">Dashboard</a>
            <a href="#" onclick="displayFacultyForm()">Register Faculty</a>
            <a href="#" onclick="retrieveAllFaculties()">View All Faculties</a>
            <a href="#" onclick="backToAdminHome()">Admin Home</a>
        </div>

        <!-- Content area -->
        <div class="content">
            <!-- Faculty registration form -->
            <form id="facultyForm">
                <h4>Faculty Registration</h4>

                <label for="facultyid">Faculty ID:</label>
                <input type="text" id="facultyid" name="facultyid" required>

                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>

                <label for="department">Department:</label>
                <select id="department" name="department" required>
                    <option value="">Select Department</option>
                    <option value="BT">Biotechnology (BT)</option>
                    <option value="CSE">Computer Science and Engineering (CSE)</option>
                    <option value="ECE">Electronics and Communication Engineering (ECE)</option>
                    <option value="CE">Civil Engineering (CE)</option>
                    <option value="BCA">Bachelor of Computer Applications (BCA)</option>
                    <option value="BBA">Bachelor of Business Administration (BBA)</option>
                    <option value="MBA">Master of Business Administration (MBA)</option>
                    <option value="M.Tech">Master of Technology (M.Tech)</option>
                </select>

                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <button type="button" onclick="submitFaculty()">Register</button>
            </form>

            <!-- Acknowledgment message -->
            <p id="ack"></p>
        </div>
    </div>

    <script type="text/javascript" src="js/main.js"></script>
    <script type="text/javascript">
        // Function to display Faculty Registration Form
        function displayFacultyForm() {
            document.getElementById('facultyForm').style.display = 'block';
        }

        // Function to handle faculty registration
        function submitFaculty() {
            var data = JSON.stringify({
                facultyid: document.getElementById('facultyid').value,
                name: document.getElementById('name').value,
                department: document.getElementById('department').value,
                email: document.getElementById('email').value,
                password: document.getElementById('password').value
            });

            var url = "http://localhost:8080/faculty/save";
            callApi("POST", url, data, getResponse);
        }

        // Callback for handling API response
        function getResponse(res) {
            var ack = document.getElementById("ack");
            if (res === "401") {
                ack.style.color = "red";
                ack.innerHTML = "Faculty ID already exists!";
            } else if (res === "200") {
                ack.style.color = "green";
                ack.innerHTML = "Faculty registered successfully!";
            } else {
                ack.style.color = "red";
                ack.innerHTML = "Error: " + res;
            }
        }

        function backToAdminHome() {
            location.replace("/AdminHome.jsp");
        }

        function retrieveAllFaculties() {
            location.replace("/AdminAllFaculties.jsp");
        }
    </script>

</body>
</html>
