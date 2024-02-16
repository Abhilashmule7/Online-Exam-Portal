<!DOCTYPE html>
<html>

<head>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <style>
        body {
            background-color: pink; /* Light Pink */
            font-family: 'Arial', sans-serif;
            margin: 20px;
            text-align: center;
        }

        table,
        th,
        td {
            border: 1px solid #4caf50; /* Green */
            border-collapse: collapse;
            width: 70%;
            margin: 20px auto;
        }

        th,
        td {
            padding: 15px;
            text-align: center;
        }

        td {
            color: #1565c0; /* Blue */
        }

        th {
            color: #d32f2f; /* Red */
        }

        h1 {
            color: #d32f2f;
        }

        a {
            text-decoration: none;
            font-size: 20px;
            color: #4caf50;
            padding: 10px 20px;
            border: 2px solid #4caf50;
            border-radius: 5px;
            background-color: #ffffff; /* White */
            transition: background-color 0.3s, color 0.3s;
        }

        a:hover {
            background-color: #4caf50; /* Green */
            color: #ffffff; /* White */
        }
    </style>

</head>

<body>

    <span style="color: #d32f2f; font-size: 30px;"> Your score is ${score} </span>

    <br><br>

    <table>
        <tr>
            <th>qno</th>
            <th>question</th>
            <th>submittedAnswer</th>
            <th>OriginalAnswer</th>
        </tr>

        <c:forEach var="answer" items="${allanswers}">

            <tr>
                <td>${answer.qno}</td>
                <td>${answer.qtext}</td>
                <td>${answer.submittedAnswer}</td>
                <td>${answer.originalAnswer}</td>
            </tr>

        </c:forEach>

    </table>

    <h1>Want to attempt the exam again?</h1>

    <a href="/" style="text-decoration: none;">Go to Login</a>

</body>

</html>
