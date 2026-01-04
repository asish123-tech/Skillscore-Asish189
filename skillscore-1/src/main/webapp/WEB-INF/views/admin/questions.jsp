<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Questions | SkillScore Admin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
		input[readonly] {
		    background-color: #f1f1f1;
		}

        body { background:#91C6BC; }
        .question-card { background:#F6F3C2; border-radius:12px; }
        .correct-text { color:green; font-weight:600; }
    </style>
</head>

<body>

<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand">SkillScore Admin</span>
    <a href="/admin/subtopics?topicId=${subtopic.topic.id}" class="btn btn-outline-light">← Back</a>
</nav>

<div class="container mt-4">
    <h4>Subtopic: <b>${subtopic.name}</b></h4>

    <!-- ================= EXISTING QUESTIONS ================= -->
    <c:forEach var="q" items="${questions}">
        <form method="post" action="/admin/questions/update">
            <input type="hidden" name="questionId" value="${q.id}">
            <input type="hidden" name="subtopicId" value="${subtopic.id}">

            <div class="card question-card mb-4 shadow-sm">
                <div class="card-body">

					<input class="form-control mb-3"
					       name="questionText"
					       value="${q.questionText}"
					       readonly>


                    <c:forEach var="opt" items="${q.options}" varStatus="s">
                        <div class="input-group mb-2">
                            <div class="input-group-text">
								<input type="radio"
								       name="correctOption"
								       value="${s.index}"
								       ${opt.correct ? "checked" : ""}
								       disabled>

                                       
                            </div>

                            <input type="hidden" name="optionIds" value="${opt.id}">
							<input class="form-control"
							       name="optionTexts"
							       value="${opt.optionText}"
							       readonly>

                        </div>
                    </c:forEach>

                    <!-- Correct Answer Display -->
                    <p class="mt-2">
                        Correct Answer:
                        <span class="correct-text">
                            <c:forEach var="opt" items="${q.options}">
                                <c:if test="${opt.correct}">
                                    ${opt.optionText}
                                </c:if>
                            </c:forEach>
                        </span>
                    </p>

					<button type="button"
					        class="btn btn-warning edit-btn"
					        onclick="toggleEdit(this)">
					    Edit
					</button>

					<button type="submit"
					        class="btn btn-success d-none save-btn">
					    Save
					</button>

					<button type="button"
					        class="btn btn-danger ms-2"
					        onclick="submitDelete(${q.id}, ${subtopic.id})">
					    Delete
					</button>




					

                </div>
            </div>
        </form>
		

		
    </c:forEach>

    <!-- ================= ADD QUESTION ================= -->
    <div class="card shadow-sm">
        <div class="card-body">
            <h5>Add New Question</h5>

            <form method="post" action="/admin/questions/add">
                <input type="hidden" name="subtopicId" value="${subtopic.id}">

                <input class="form-control mb-3"
                       name="questionText"
                       placeholder="Enter question"
                       required>

                <c:forEach begin="0" end="3" var="i">
                    <div class="input-group mb-2">
                        <div class="input-group-text">
                            <input type="radio" name="correctIndex" value="${i}" required>
                        </div>
                        <input class="form-control"
                               name="optionText"
                               placeholder="Option ${i+1}"
                               required>
                    </div>
                </c:forEach>

                <button class="btn btn-primary mt-2">Add Question</button>
            </form>
        </div>
    </div>

</div>
<script>
function toggleEdit(btn) {
    const card = btn.closest(".card-body");

    // Enable inputs
    card.querySelectorAll("input").forEach(input => {
        if (input.type === "radio") {
            input.disabled = false;
        } else {
            input.readOnly = false;
        }
    });

    // Toggle buttons
    btn.classList.add("d-none");
    card.querySelector(".save-btn").classList.remove("d-none");
	card.style.border = "2px solid #ffc107";

}
</script>
<script>
function submitDelete(questionId, subtopicId) {
    if (!confirm("Delete this question?")) return;

    const form = document.createElement("form");
    form.method = "post";
    form.action = "/admin/questions/delete";

    const q = document.createElement("input");
    q.type = "hidden";
    q.name = "questionId";
    q.value = questionId;

    const s = document.createElement("input");
    s.type = "hidden";
    s.name = "subtopicId";
    s.value = subtopicId;

    form.appendChild(q);
    form.appendChild(s);
    document.body.appendChild(form);
    form.submit();
}
</script>


</body>
</html>
