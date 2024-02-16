<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="file"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            background-color: #fff;
            border-radius: 4px;
            box-sizing: border-box;
            transition: background-color 0.3s, color 0.3s;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>

    <script>
        function change(input) {
            input.style.color = "white";
            input.style.background = "black";
        }
    </script>

</head>

<body>

    <h1>Register Page</h1>

    <form enctype="multipart/form-data">
        <input type="text" name="username" placeholder="Enter username" onfocus="change(this)"><br><br>
        <input type="password" name="password" placeholder="Enter password" onfocus="change(this)"><br><br>
        <input type="text" name="mobileno" placeholder="Enter mobileno" onfocus="change(this)"><br><br>
        <input type="email" name="emailid" placeholder="Enter emailid" onfocus="change(this)"><br><br>
        <input type="file" name="image"><br><br>
        <input type=submit value=register formaction="saveToDB" formmethod=post>
    </form>

</body>

</html>
