<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>SkillScore – Test Review</title>

    <script src="https://cdn.jsdelivr.net/npm/canvas-confetti@1.6.0/dist/confetti.browser.min.js"></script>

    <style>
        body {
            background: #e8f3ff;
            font-family: Arial, sans-serif;
            margin: 0;
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
            margin: 30px auto;
            background: white;
            padding: 30px;
            border-radius: 18px;
        }

        .summary {
            display: flex;
            justify-content: space-between;
            background: #eef6ff;
            padding: 20px;
            border-radius: 14px;
            margin-bottom: 25px;
            font-size: 18px;
            font-weight: bold;
        }

        .badge-box {
            text-align: center;
            background: #fff7e6;
            padding: 20px;
            border-radius: 14px;
            margin-bottom: 25px;
            font-size: 22px;
        }

        .question-block {
            margin-bottom: 30px;
            background: #f8fbff;
            padding: 20px;
            border-radius: 15px;
            border: 1px solid #d7e6ff;
        }

        .question-text {
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 12px;
        }

        .opt {
            padding: 10px;
            border-radius: 10px;
            margin-top: 8px;
            font-size: 17px;
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

        .btn {
            padding: 12px 22px;
            background: #2e6bff;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            cursor: pointer;
            margin-right: 10px;
        }
    </style>
</head>

<body>

<div class="navbar">SkillScore – Test Review</div>

<div class="container">

    <!-- CALCULATIONS -->
    <c:set var="accuracy" value="${(score * 100) / totalQuestions}" />

    <c:choose>
        <c:when test="${accuracy >= 80}">
            <c:set var="badge" value="Gold Performer" />
            <c:set var="badgeIcon" value="🏆" />
        </c:when>
        <c:when test="${accuracy >= 50}">
            <c:set var="badge" value="Silver Achiever" />
            <c:set var="badgeIcon" value="🥈" />
        </c:when>
        <c:otherwise>
            <c:set var="badge" value="Keep Practicing" />
            <c:set var="badgeIcon" value="🔥" />
        </c:otherwise>
    </c:choose>

    <!-- SUMMARY -->
    <div class="summary">
        <div>Score: ${score} / ${totalQuestions}</div>
        <div>Accuracy: ${accuracy}%</div>
        <div>Status: ${badge}</div>
    </div>

    <!-- BADGE -->
    <div class="badge-box">
        <h2>${badgeIcon} ${badge}</h2>
        <p>Badge Earned</p>
    </div>

    <!-- QUESTIONS -->
    <c:forEach var="q" items="${reviewList}" varStatus="loop">
        <div class="question-block">

            <div class="question-text">
                Q${loop.index + 1}. ${q.questionText}
            </div>

            <div class="opt ${q.correct ? 'correct' : 'wrong'}">
                Your Answer:
                <c:choose>
                    <c:when test="${q.selectedOptionText != null}">
                        ${q.selectedOptionText}
                    </c:when>
                    <c:otherwise>
                        <i>Not Answered</i>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="opt correct">
                Correct Answer: ${q.correctOptionText}
            </div>

        </div>
    </c:forEach>

    <!-- ACTIONS -->
    <form action="/quantitative">
        <button class="btn">Practice Again</button>
        <button class="btn" formaction="/dashboard">Dashboard</button>
    </form>

</div>

<!-- CONFETTI -->
<script>
    if (${accuracy} >= 80) {
        confetti({
            particleCount: 250,
            spread: 100,
            origin: { y: 0.6 }
        });
    }
</script>

</body>
</html>
