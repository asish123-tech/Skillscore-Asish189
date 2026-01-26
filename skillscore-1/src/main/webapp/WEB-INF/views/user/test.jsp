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
            padding: 0;
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

        .container {
            max-width: 900px;
            margin: 120px auto 40px auto;  /* pushed down because navbar */
            background: white;
            border-radius: 20px;
            padding: 40px;
            box-shadow: 0px 4px 20px rgba(0,0,0,0.1);
        }

		.option-box {
		    padding: 15px;
		    margin: 0 10px 10px 0;   /* <-- add this */
		    border: 2px solid #dfe7f1;
		    border-radius: 12px;
		    cursor: pointer;
		    display: inline-block;  /* ensures spacing works */
		}

        .option-box:hover {
            background: #eef5ff;
        }
        .btn {
            padding: 12px 24px;
            margin: 10px;
            border: none;
            background: #2e6bff;
            color: white;
            border-radius: 10px;
            cursor: pointer;
        }
        .btn:disabled {
            background: #aab8d6;
            cursor: not-allowed;
        }
        .header {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 30px;
        }
        .question-text {
            font-size: 20px;
            font-weight: bold;
        }
    </style>

</head>
<body>

<!-- NAVBAR -->
<header class="navbar">
    <div>SkillScore</div>
    <a href="/quantitative">← Back to Quantitative</a>
</header>

<div class="container">

    <!-- SUBTOPIC NAME -->
    <div class="header">${subtopicName}</div>

    <!-- QUESTION -->
    <div class="question-text">
        Q${currentIndex + 1}. ${question.questionText}
    </div>

    <br>

    <!-- OPTIONS -->
    <c:forEach var="opt" items="${question.options}">
        <label class="option-box">
            <input type="radio" name="selectedOption" value="${opt.id}">
            ${opt.optionText}
        </label>
    </c:forEach>

    <br><br>

    <!-- NAVIGATION BUTTONS -->
    <div style="display:flex; justify-content: space-between;">

        <!-- Previous -->
        <form method="get" action="/user/quantitative/test">
            <input type="hidden" name="subtopicId" value="${subtopicId}">
            <input type="hidden" name="index" value="${currentIndex - 1}">
            <button class="btn" ${currentIndex == 0 ? "disabled" : ""}>Previous</button>
        </form>

        <!-- Next -->
        <form method="get" action="/user/quantitative/test">
            <input type="hidden" name="subtopicId" value="${subtopicId}">
            <input type="hidden" name="index" value="${currentIndex + 1}">
            <button class="btn" ${currentIndex + 1 >= totalQuestions ? "disabled" : ""}>Next</button>
        </form>

        <!-- Submit Test -->
        <form method="post" action="/user/quantitative/submit">
            <input type="hidden" name="subtopicId" value="${subtopicId}">
            <button class="btn" type="submit">Submit Test</button>
        </form>

    </div>

</div>

</body>
</html>
