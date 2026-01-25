<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${subtopic.name} | SkillScore</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Inter', sans-serif;
        }

        body {
            background: #AEDEFC;
        }

        /* NAVBAR */
        .navbar {
            height: 64px;
            background: #0f172a;
            color: #fff;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 32px;
        }

        .navbar a {
            color: #fff;
            text-decoration: none;
            font-weight: 600;
        }

        /* MAIN CONTAINER */
        .container {
            max-width: 900px;
            margin: 30px auto;
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 26px rgba(0,0,0,0.12);
        }

        h1 {
            margin-bottom: 10px;
        }

        .subtitle {
            color: #475569;
            margin-bottom: 24px;
        }

        .question-box {
            margin-bottom: 30px;
            padding: 20px;
            background: #f8fafc;
            border-radius: 12px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.06);
        }

        .option {
            margin: 6px 0;
        }

        .submit-btn {
            width: 100%;
            margin-top: 20px;
            background: #2563eb;
            color: white;
            border: none;
            padding: 14px;
            font-size: 16px;
            border-radius: 10px;
            cursor: pointer;
        }

        .submit-btn:hover {
            background: #1e40af;
        }
    </style>

</head>
<body>

<!-- NAVBAR -->
<header class="navbar">
    <div>SkillScore</div>
    <a href="/aptitude">← Back</a>
</header>

<!-- MAIN CONTENT -->
<div class="container">

    <h1>${subtopic.name}</h1>
    <p class="subtitle">Answer the following questions</p>

    <form id="testForm">

        <c:forEach var="q" items="${questions}" varStatus="loop">
            <div class="question-box">
                <h3>Q${loop.index + 1}. ${q.questionText}</h3>

                <div class="option">
                    <input type="radio" name="q${q.id}" value="${q.optionA}" onchange="saveAnswer(${q.id}, '${q.optionA}')">
                    ${q.optionA}
                </div>

                <div class="option">
                    <input type="radio" name="q${q.id}" value="${q.optionB}" onchange="saveAnswer(${q.id}, '${q.optionB}')">
                    ${q.optionB}
                </div>

                <div class="option">
                    <input type="radio" name="q${q.id}" value="${q.optionC}" onchange="saveAnswer(${q.id}, '${q.optionC}')">
                    ${q.optionC}
                </div>

                <div class="option">
                    <input type="radio" name="q${q.id}" value="${q.optionD}" onchange="saveAnswer(${q.id}, '${q.optionD}')">
                    ${q.optionD}
                </div>
            </div>
        </c:forEach>

        <button type="button" class="submit-btn" onclick="submitTest()">Submit Test</button>

    </form>

</div>

<script>
    // Auto save (calls your controller "/user/test/saveAnswer")
    function saveAnswer(questionId, answer) {
        fetch('/user/test/saveAnswer', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ questionId: questionId, answer: answer })
        });
    }

    // Submit full test
    function submitTest() {
        let formData = {};

        const inputs = document.querySelectorAll("input[type=radio]:checked");
        inputs.forEach(i => {
            formData[i.name.replace('q', '')] = i.value;
        });

        fetch('/user/test/submit', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(formData)
        })
        .then(res => res.json())
        .then(data => {
            window.location.href = "/user/test/review?score=" + data.score;
        });
    }
</script>

</body>
</html>
