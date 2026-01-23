<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>${subtopic.name} Test</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        .question-card { max-width: 850px; margin: auto; }
        .option-box { border: 1px solid #ccc; padding: 10px; border-radius: 8px; cursor: pointer; margin-bottom: 8px; }
        .option-box.selected { background: #d0ebff; border-color: #228be6; }
        .hidden { display: none; }
        .timer { font-size: 20px; font-weight: bold; }
    </style>
</head>

<body class="bg-light">

<div class="container mt-4">
    <div class="d-flex justify-content-between">
        <h3 class="fw-bold">${subtopic.name} Test</h3>
        <div class="timer text-danger" id="timer">10:00</div>
    </div>
    <hr>

    <!-- Progress Bar -->
    <div class="mb-3">
        <div class="d-flex justify-content-between">
            <span id="progressText">Question 1 / ${questions.size()}</span>
        </div>
        <div class="progress">
            <div id="progressBar" class="progress-bar" style="width: 0%;"></div>
        </div>
    </div>
</div>

<div class="card shadow p-4 question-card">

    <c:forEach items="${questions}" var="q" varStatus="i">
        <div class="question-block ${i.index == 0 ? '' : 'hidden'}" id="q${i.index}" data-qid="${q.id}">
            <h5>Q${i.index + 1}. ${q.question}</h5>

            <!-- Options -->
            <div class="mt-3">

                <div class="option-box" onclick="selectOption(${i.index}, 'A')">
                    A. ${q.optionA}
                </div>

                <div class="option-box" onclick="selectOption(${i.index}, 'B')">
                    B. ${q.optionB}
                </div>

                <div class="option-box" onclick="selectOption(${i.index}, 'C')">
                    C. ${q.optionC}
                </div>

                <div class="option-box" onclick="selectOption(${i.index}, 'D')">
                    D. ${q.optionD}
                </div>

            </div>
        </div>
    </c:forEach>

    <!-- Buttons -->
    <div class="d-flex justify-content-between mt-4">
        <button id="prevBtn" class="btn btn-secondary" onclick="prevQ()" disabled>Previous</button>
        <button id="nextBtn" class="btn btn-primary" onclick="nextQ()">Next</button>
        <button id="submitBtn" class="btn btn-success hidden" onclick="submitTest()">Submit</button>
    </div>
</div>

<script>
    let current = 0;
    let total = ${questions.size()};
    let answers = {}; // Stores user answers

    /* ---------------- TIMER 10 MINUTES ---------------- */
    let timeLeft = 600; // seconds

    const timer = setInterval(() => {
        let min = Math.floor(timeLeft / 60);
        let sec = timeLeft % 60;

        document.getElementById("timer").innerHTML =
                `${min}:${sec < 10 ? "0" : ""}${sec}`;

        if (timeLeft <= 0) {
            clearInterval(timer);
            submitTest();
        }
        timeLeft--;
    }, 1000);

    /* ---------------- SHOW QUESTION ---------------- */
    function showQuestion(index) {
        document.querySelectorAll(".question-block").forEach(div => div.classList.add("hidden"));
        document.getElementById("q" + index).classList.remove("hidden");

        document.getElementById("prevBtn").disabled = index === 0;
        document.getElementById("nextBtn").classList.toggle("hidden", index === total - 1);
        document.getElementById("submitBtn").classList.toggle("hidden", index !== total - 1);

        // Progress Update
        document.getElementById("progressText").innerText = `Question ${index + 1} / ${total}`;
        document.getElementById("progressBar").style.width = ((index + 1) / total) * 100 + "%";

        highlightOption(index);
    }

    /* ---------------- NEXT/PREV ---------------- */
    function nextQ() { current++; showQuestion(current); }
    function prevQ() { current--; showQuestion(current); }

    /* ---------------- SELECT OPTION + HIGHLIGHT ---------------- */
    function selectOption(qIndex, option) {
        answers[qIndex] = option;
        highlightOption(qIndex);

        autoSave(qIndex, option);
    }

    function highlightOption(qIndex) {
        let blocks = document.querySelectorAll("#q" + qIndex + " .option-box");
        blocks.forEach(box => box.classList.remove("selected"));

        let selected = answers[qIndex];
        if (!selected) return;

        blocks[selected.charCodeAt(0) - 65].classList.add("selected");
    }

    /* ---------------- AUTO-SAVE (AJAX) ---------------- */
    function autoSave(qIndex, option) {
        const qId = document.getElementById("q" + qIndex).dataset.qid;

        fetch("/user/test/saveAnswer", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
                questionId: qId,
                answer: option
            })
        });
    }

    /* ---------------- SUBMIT TEST ---------------- */
    function submitTest() {
        fetch("/user/test/submit", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(answers)
        })
        .then(res => res.json())
        .then(result => {
            window.location.href = "/user/test/review?score=" + result.score;
        });
    }
</script>

</body>
</html>
