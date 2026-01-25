<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Test Review | SkillScore</title>

    <style>
        body {
            background: #f5f7fa;
            font-family: Arial, sans-serif;
        }

        .container {
            width: 60%;
            margin: 30px auto;
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 15px rgba(0,0,0,0.08);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .summary-box {
            display: flex;
            justify-content: space-between;
            margin-bottom: 25px;
            background: #eef3ff;
            padding: 15px;
            border-radius: 10px;
        }

        .q-card {
            background: #fdfdfd;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 15px;
            border-left: 5px solid #ccc;
        }

        .correct {
            border-left: 5px solid #22c55e;
            background: #dcfce7;
        }

        .wrong {
            border-left: 5px solid #ef4444;
            background: #fee2e2;
        }

        .question {
            font-weight: bold;
        }

        .correct-ans {
            color: #22c55e;
            font-weight: bold;
        }

        .wrong-ans {
            color: #ef4444;
            font-weight: bold;
        }

        .btn {
            display: block;
            width: 200px;
            margin: 25px auto 0;
            padding: 12px;
            text-align: center;
            background: #3b82f6;
            color: #fff;
            border-radius: 8px;
            text-decoration: none;
            font-size: 16px;
        }

        .btn:hover {
            background: #2563eb;
        }
    </style>
</head>
<body>

<div class="container">

    <h2>📝 Test Review</h2>

    <div class="summary-box">
        <div><b>Score:</b> ${score}</div>
        <div><b>Total Questions:</b> ${answers.size()}</div>
        <div>
            <b>Percentage:</b>
            <c:set var="percent" value="${(score * 100) / answers.size()}"/>
            ${percent}%
        </div>
    </div>

    <!-- Loop through all answered questions -->
    <c:forEach var="entry" items="${answers}">
        <c:set var="qId" value="${entry.key}"/>
        <c:set var="userAns" value="${entry.value}"/>

        <!-- Fetch full Question object -->
        <c:set var="q" value="${questionRepository.findById(qId).get()}"/>

        <div class="q-card 
            <c:if test='${userAns == q.correctOption}'>correct</c:if>
            <c:if test='${userAns != q.correctOption}'>wrong</c:if>
        ">
            <div class="question">Q. ${qId}: ${q.text}</div>
            <br>

            <div>
                Your Answer: 
                <span class="${userAns == q.correctOption ? 'correct-ans' : 'wrong-ans'}">
                    ${userAns}
                </span>
            </div>

            <div>
                Correct Answer:
                <span class="correct-ans">${q.correctOption}</span>
            </div>
        </div>

    </c:forEach>

    <a href="/user/dashboard" class="btn">⬅ Back to Dashboard</a>

</div>

</body>
</html>
