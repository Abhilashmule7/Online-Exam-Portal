<!DOCTYPE html>
<html lang="en">

<head>

    <link href="css/common.css" rel="stylesheet">

    <style>
        body
        {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa; /* Light Gray */
            margin: 20px;
            text-align: center;
        }

        #remainingtime {
            color: green;
            font-size: 30px;
            position: absolute;
            top: 0px;
            right: 50px;
        }

        h1 {
            color: red;
            margin-bottom: 100px;
        }

        h2 {
            color: red;
        }

        #maincontent {
            background-color: #ffffff; /* White */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            max-width: 600px;
        }

        img {
            width: 100px;
            height: 100px;
        }

        span {
            margin-left: 10px;
            color: #007bff; /* Blue */
        }

        input[type="text"],
        input[type="radio"] {
            margin: 10px 0;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;
        }

        .btn {
            background-color: #007bff; /* Blue */
            color: #fff; /* White */
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            margin: 10px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #0056b3; /* Darker Blue */
        }
    </style>

    <script>
        function displayTime() {
            sessionStorage.setItem("duration", sessionStorage.getItem("duration") - 1);

            var remainingSeconds = sessionStorage.getItem("duration");

            var minutes = Math.floor(remainingSeconds / 60);
            var seconds = remainingSeconds % 60;

            document.getElementById("remainingtime").innerHTML = " Remaining Time " + minutes + ":" + seconds;

            if (remainingSeconds == 0) {
                location.href = "/endexam";
            }
        }

        setInterval(displayTime, 1000);

        function changeColor()
         {
            var allAnswers = document.getElementsByTagName("span");
            var allRadioButtons = document.getElementsByName("submittedAnswer");
            var previousAnswer = document.getElementById("previousAnswer").value;

            for (var i = 0; i < 4; i++) {
                if (allAnswers[i].innerText.trim() == previousAnswer.trim()) {
                    allAnswers[i].style.color = "red";
                    allRadioButtons[i].checked = true;
                    break;
                }
            }
        }
    </script>

</head>

<body onload="changeColor()">

    <img src="${imagepath}" alt="Exam Image">

    <p id="remainingtime"></p>

    <h1>Questions</h1>

    <h2>${message}</h2>

    <form>

        <div id="maincontent">

            <input type="text" name="qno" value="${question.qno}" style="border: none; background-color: black; color: white;">
            <input type="text" name="qtext" value="${question.qtext}" size="50px" style="border: none; background-color: black; color: white;"><br><br>

            <input type="radio" name="submittedAnswer" value="${question.op1}"><span>${question.op1}</span>
            <input type="radio" name="submittedAnswer" value="${question.op2}"><span>${question.op2}</span>
            <input type="radio" name="submittedAnswer" value="${question.op3}"><span>${question.op3}</span>
            <input type="radio" name="submittedAnswer" value="${question.op4}"><span>${question.op4}</span>

            <input style="display:none" type="text" name="originalAnswer" value="${question.answer}">
            <input style="display:none" id="previousAnswer" value="${previousAnswer}"><br><br>

            <input type="submit" value="Next" formaction="next" class="btn">
            <input type="submit" value="Previous" formaction="previous" class="btn">
            <input type="submit" value="End Exam" formaction="endexam" class="btn">

        </div>

    </form>

</body>

</html>
