<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Test Result | SkillScore</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

        body { background: #AEDEFC; }

        .navbar {
            height: 64px;
            background: #0f172a;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 32px;
        }

        .navbar a { color: #fff; text-decoration: none; font-weight: 600; }

        .container {
            max-width: 900px;
            margin: 30px auto;
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 26px rgba(0,0,0,0.12);
        }

        .summary-box {
            background: #f8fafc;
            padding: 20px;
            border-radius: 14px;
            margin-bottom: 24px;
            box-shadow: 0 4px 18px rgba(0,0,0,0.10);
            text-align: center;
        }

        .score { font-size: 35px; font-weight: 700; color: #2563eb; }

        .result-list {
            margin-top: 25px;
        }

        .question-card {
            background: #f8fafc;
            padding: 20px;
            border-radius: 14px;
            margin-bottom: 20px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .correct { color: #16a34a; font-weight: 600; }
        .wrong { color: #dc2626; font-weight: 600; }

        .answer-box {
            padding: 8px 12px;
            border-radius: 8px;
            margin-top: 6px;
        }

        .user-correct { background: #dcfce7; }
        .user-wrong { background: #fee2e2; }

    </style>
</head>

<body>

<header class="navbar">
    <div>SkillScore</div>
    <a href="/aptitude">← Back</a>
</header>

<div class="container">

    <div class="summary-box">
        <h2>Your Test Result</h2>
        <p class="score">${score}/${totalQuestions}</p>

        <p><b>Correct:</b> <span class="correct">${correctCount}</span></p>
        <p><b>Wrong:</b> <span class="wrong">${wrongCount}</span></p>
    </div>

    <h2>Question Review</h2>

    <div class="result-list">
        <c:forEach var="r" items="${results}">
            <div class="question-card">
                <h3>${r.question}</h3>

                <div class="answer-box 
                    ${r.userCorrect ? 'user-correct' : 'user-wrong'}">

                    <p><b>Your Answer:</b> ${r.userAnswer}</p>
                    <p><b>Correct Answer:</b> ${r.correctAnswer}</p>

                    <p class="${r.userCorrect ? 'correct' : 'wrong'}">
                        ${r.userCorrect ? '✔ Correct' : '✖ Wrong'}
                    </p>
                </div>

            </div>
        </c:forEach>
    </div>

</div>

</body>
</html>
