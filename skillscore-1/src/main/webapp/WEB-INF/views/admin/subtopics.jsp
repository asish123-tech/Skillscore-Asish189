<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Subtopics | SkillScore Admin</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            background-color: #BBE0EF;
        }

        .subtopic-card {
            border-radius: 14px;
            transition: all 0.25s ease;
            cursor: pointer;
        }

        .subtopic-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
        }

        .subtopic-title {
            font-weight: 600;
            font-size: 1.1rem;
        }

        .page-title {
            font-weight: 700;
        }
		.navbar-back{
			text-decoration: none;
			color: white;
			font-size:17px;
		}
		.navbar-back:hover{
			color: grey;
		}
		
    </style>
</head>

<body>

<!-- NAVBAR -->
<nav class="navbar navbar-dark bg-dark px-4">
    <span class="navbar-brand h4 mb-0">SkillScore Admin</span>
	<a href ="/admin/dashboard" class="navbar-back">← Back to Dashboard</span></a>
</nav>

<div class="container mt-4">

    <!-- PAGE TITLE -->
    <div class="d-flex justify-content-between align-items-center mb-4">
		<h2 class="mb-4">
		    Topic:
		    <span class="text-primary">${topic.name}</span>
		</h2>


        <!-- OPTIONAL BACK BUTTON (if coming from Topics page later) -->
        <a href="javascript:history.back()" class="btn btn-outline-secondary">
            ← Back
        </a>
    </div>

    <!-- SUBTOPICS GRID -->
    <div class="row g-4">

        <c:forEach var="subtopic" items="${subtopics}">
            <div class="col-lg-4 col-md-6">

                <a href="/admin/questions?subtopicId=${subtopic.id}"
                   class="text-decoration-none text-dark">

                    <div class="card subtopic-card shadow-sm p-4 h-100">
                        <div class="d-flex align-items-center justify-content-between">
                            <span class="subtopic-title">
                                ${subtopic.name}
                            </span>

                            <span class="badge bg-primary">
                                View Questions →
                            </span>
                        </div>
                    </div>

                </a>

            </div>
        </c:forEach>

    </div>

</div>

</body>
</html>
