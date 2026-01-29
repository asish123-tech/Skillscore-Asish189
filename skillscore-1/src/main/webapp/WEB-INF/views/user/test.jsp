<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SkillScore Test</title>

    <style>
        body {
            background: #c9eaff;
            font-family: Arial, sans-serif;
            margin: 0;
        }

        .navbar {
            height: 64px;
            background: #0f172a;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 32px;
        }

        .container {
            max-width: 900px;
            margin: 120px auto;
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0px 4px 20px rgba(0,0,0,0.1);
        }

        .option-box {
            padding: 15px;
            margin: 10px 10px 0 0;
            border: 2px solid #dfe7f1;
            border-radius: 12px;
            display: inline-block;
            cursor: pointer;
        }

        .btn {
            padding: 12px 24px;
            border: none;
            background: #2e6bff;
            color: white;
            border-radius: 10px;
            cursor: pointer;
            text-decoration: none;
            font-size: 16px;
        }

        .btn.disabled {
            background: #aab8d6;
            pointer-events: none;
        }

        .question-text {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

<header class="navbar">
    <div>SkillScore</div>
</header>

<div class="container">

    <h2>${subtopicName}</h2>

    <!-- SAVE ANSWER FORM -->
    <form method="post" action="/user/quantitative/save-answer">

        <input type="hidden" name="questionId" value="${question.id}">
        <input type="hidden" name="subtopicId" value="${subtopicId}">
        <input type="hidden" name="index" value="${currentIndex}">

        <div class="question-text">
            Q${currentIndex + 1}. ${question.questionText}
        </div>

        <!-- OPTIONS -->
        <c:forEach var="opt" items="${question.options}">
            <label class="option-box">
                <input type="radio"
                       name="selectedOption"
                       value="${opt.id}"
                       ${savedAnswers[question.id] == opt.id ? "checked" : ""}>
                ${opt.optionText}
            </label>
        </c:forEach>

        <br><br>

        <!-- CONTROLS -->
        <div style="display:flex; justify-content: space-between; align-items:center;">

            <!-- PREVIOUS -->
            <a class="btn ${currentIndex == 0 ? 'disabled' : ''}"
               href="/user/quantitative/test?subtopicId=${subtopicId}&index=${currentIndex - 1}">
                Previous
            </a>

            <!-- SAVE & NEXT -->
            <button class="btn" type="submit">Save & Next</button>

            <!-- SUBMIT TEST -->
            <a class="btn"
               href="#"
               onclick="document.getElementById('submitForm').submit();">
                Submit Test
            </a>
        </div>

    </form>

    <!-- SUBMIT FORM (SEPARATE) -->
    <form id="submitForm" method="post" action="/user/quantitative/submit">
        <input type="hidden" name="subtopicId" value="${subtopicId}">
    </form>

</div>

</body>
</html>
