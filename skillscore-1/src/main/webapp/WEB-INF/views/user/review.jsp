<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Test Review - SkillScore</title>

    <style>
        body {
            background: #e8f3ff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .navbar {
            height: 64px;
            background: #0f172a;
            color: white;
            display: flex;
            align-items: center;
            padding: 0 30px;
            font-size: 20px;
            font-weight: bold;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 20px;
            box-shadow: 0px 4px 20px rgba(0,0,0,0.1);
        }
        
        .score-box {
            background: #eef6ff;
            padding: 20px;
            border-radius: 12px;
            font-size: 22px;
            margin-bottom: 25px;
            font-weight: bold;
        }

        .question-block {
            margin-bottom: 35px;
            padding: 20px;
            background: #f8fbff;
            border-radius: 15px;
            border: 1px solid #d7e6ff;
        }

        .question-text {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 12px;
        }

        .opt {
            margin: 6px 0;
            font-size: 18px;
            padding: 8px;
            border-radius: 10px;
        }

        .correct {
            background: #d3ffd9;
            border-left: 6px solid #18b436;
            font-weight: bold;
        }

        .wrong {
            background: #ffe1e1;
            border-left: 6px solid #ff3b3b;
            font-weight: bold;
        }

        .answer-label {
            font-weight: bold;
        }

        .back-btn {
            padding: 12px 22px;
            background: #2e6bff;
            border: none;
            color: white;
            border-radius: 10px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="navbar">SkillScore – Test Review</div>

<div class="container">

    <!-- SCORE SECTION -->
    <div class="score-box">
        Score: ${score} / ${totalQuestions}
    </div>

    <!-- QUESTION WISE REVIEW -->
    <c:forEach var="q" items="${reviewList}" varStatus="loop">

        <div class="question-block">

            <div class="question-text">
                Q${loop.index + 1}. ${q.questionText}
            </div>

            <!-- USER ANSWER -->
            <div class="opt ${q.isCorrect ? 'correct' : (q.selectedOption != null ? 'wrong' : '')}">
                <span class="answer-label">Your Answer:</span>
                <c:choose>
                    <c:when test="${q.selectedOption != null}">
                        ${q.selectedOptionText}
                    </c:when>
                    <c:otherwise>
                        <i>Not Answered</i>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- CORRECT ANSWER -->
            <div class="opt correct">
                <span class="answer-label">Correct Answer:</span>
                ${q.correctOptionText}
            </div>

        </div>
    </c:forEach>

    <!-- BACK BUTTON -->
    <form action="/quantitative">
        <button class="back-btn">Back to Quantitative</button>
    </form>

</div>

</body>
</html>
