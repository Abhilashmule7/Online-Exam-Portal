<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="style.css">
    <title>Login Page</title>
    <style>
        input, select {
            padding: 10px;
        }
    </style>
    <script>
        sessionStorage.setItem("duration", 1210);
    </script>
</head>
<body>
    <span style="color: red">${message}</span>
    <div class="login-page">
        <div class="form">
            <div class="login">
                <div class="login-header">
                    <h3>LOGIN</h3>
                    <p>Please Enter your Credentials to Login</p>
                </div>
            </div>
            <form class="login-form">
                <h1 style="text-align: center; color: red; margin-bottom: 100px">Online Exam Login</h1>

                <input type="text" name="username" placeholder="Enter the Username"><br>

                <input type="password" name="password" placeholder="Enter the Password"><br>

                <select name="subject">
                    <option>select subject</option>
                    <option value="Java">Java</option>
                    <option value="gk">General Knowledge</option>
                    <option value="aj">Advance Java</option>
                </select><br><br>

                <input type="submit" value='Sign in' formaction="validate" formmethod="post" class="btn">

                <input type="submit" value='Sign up' formaction="register" formmethod="post" class="btn">
            </form>
        </div>
    </div>
</body>
</html>
