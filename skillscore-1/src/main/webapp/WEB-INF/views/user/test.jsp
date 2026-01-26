<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Test | SkillScore</title>

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }

        body { background: #AEDEFC; color: #0f172a; }

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
            text-decoration: none;
            color: #fff;
            font-weight: 600;
        }

        .container {
            max-width: 850px;
            margin: 25px auto;
            background: #fff;
            padding: 25px;
            border-radius: 14px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.12);
        }

        .question-box {
            margin-bottom: 20px;
        }

        .options label {
            display: block;
            background: #f1f5f9;
            padding: 12px;
            border-radius: 10px;
            margin-bottom: 10px;
            cursor: pointer;
        }

        .nav-buttons {
            margin-top: 20px;
            display: flex;
            justify-content: space-between;
        }

        button {
            background: #2563eb;
            color: #fff;
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
        }

        button:hover { background: #1d4ed8; }

    </style>
</head>

<body>

<header class="navbar">
    <div>SkillScore</div>
    <a href="/aptitude">← Back</a>
</header>

<div class="container">

    <h2>${subtopic.name}</h2>

    <c:if test="${not empty questions}">
        <div class="question-box">
            <h3>Q${currentIndex + 1}. ${questions[currentIndex].questionText}</h3>

            <div class="options">
                <label>
                    <input type="radio" name="answer" value="${questions[currentIndex].optionA}"
                           ${savedAnswer == questions[currentIndex].optionA ? 'checked' : ''} />
                    ${questions[currentIndex].optionA}
                </label>

                <label>
                    <input type="radio" name="answer" value="${questions[currentIndex].optionB}"
                           ${savedAnswer == questions[currentIndex].optionB ? 'checked' : ''} />
                    ${questions[currentIndex].optionB}
                </label>

                <label>
                    <input type="radio" name="answer" value="${questions[currentIndex].optionC}"
                           ${savedAnswer == questions[currentIndex].optionC ? 'checked' : ''} />
                    ${questions[currentIndex].optionC}
                </label>

                <label>
                    <input type="radio" name="answer" value="${questions[currentIndex].optionD}"
                           ${savedAnswer == questions[currentIndex].optionD ? 'checked' : ''} />
                    ${questions[currentIndex].optionD}
                </label>
            </div>
        </div>
    </c:if>

    <div class="nav-buttons">
        <button onclick="navigate('prev')" ${currentIndex == 0 ? 'disabled' : ''}>Previous</button>
        <button onclick="navigate('next')" ${currentIndex == questionsSize - 1 ? 'disabled' : ''}>Next</button>
        <button onclick="submitTest()">Submit Test</button>
    </div>

</div>

<script>
    function navigate(direction) {
        const selected = document.querySelector('input[name="answer"]:checked');
        const ans = selected ? selected.value : "";

        const payload = {
            questionId: "${questions[currentIndex].id}",
            answer: ans,
            direction: direction
        };

        fetch("/user/test/saveAnswerAndNavigate", {
            method: "POST",
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify(payload)
        })
        .then(resp => window.location.reload());
    }

    function submitTest() {
        fetch("/user/test/submitFinal", { method: "POST" })
            .then(resp => resp.json())
            .then(data => {
                window.location.href = "/user/test/review?score=" + data.score;
            });
    }
</script>

</body>
</html>
